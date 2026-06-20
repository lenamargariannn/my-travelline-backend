# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Spring Boot 3.5.14 REST API for a travel agency platform (My TravelLine). Serves both public-facing browsing endpoints and admin panel APIs. Built with Java 25, PostgreSQL, Flyway, JWT auth, AWS S3/SES, and SpringDoc OpenAPI.

## Commands

```bash
# Build
mvn clean package

# Run (dev profile active by default in IDE; set profile explicitly otherwise)
mvn spring-boot:run -Dspring-boot.run.profiles=dev

# Run tests
mvn test

# Run a single test class
mvn test -Dtest=BookingServiceTest

# Skip tests during build
mvn clean package -DskipTests
```

Use `mvn`, not `./mvnw` — the wrapper does not exist in this repo.

API docs available at `http://localhost:8080/swagger-ui.html` when running.

## Architecture

### Package structure

Each domain lives in a flat package under `com.mytravelline.<domain>` — entity, repository, service, controller, DTO, and mapper all co-located (not split into layers). Current domains:

| Package | Responsibility |
|---|---|
| `admin` | `AdminUser` entity, `AdminUserRepository`, `AuthController` (login/refresh/signup), `AdminUserController` (user listing/deletion), `AdminDashboardController`, `AdminRole` enum; `dto/` sub-package |
| `currency` | `CurrencyService` (in-memory rates, USD→X conversion), `CurrencyCode` enum, `CurrencyController` (public), `AdminCurrencyController` (admin), `CurrencyInfo` DTO |
| `tour` | Most complex domain — `Tour` with nested `TourImage`, `TourItineraryDay`, and `TourDeparture` collections; `TourStatus` enum (DRAFT/PUBLISHED); `TourImageRepository`; `TourDepartureRepository`; `TourSpecifications` (JPA Specification predicates for filtering); `dto/` sub-package for request/response types |
| `booking` | Customer bookings linked to tours; `BookingStatus` enum |
| `category` | Tour categories with slugs |
| `destination` | Travel destinations with slugs |
| `blog` | Blog posts with publish/unpublish lifecycle |
| `review` | Customer reviews; require approval before surfacing |
| `gallery` | Gallery images stored in S3 |
| `contact` | Contact form submissions; tracked as read/unread |
| `translation` | `Translation` entity, `TranslationRepository`, `TranslationService` (get/saveAll/deleteAll), `LocaleCode` enum (EN/HY/RU) |
| `security` | `JwtService`, `JwtAuthenticationFilter`, `AdminUserDetailsService` |
| `config` | `AppProperties` (typed config), `SecurityConfig`, `CorsConfig`, `OpenApiConfig`, `S3Config`, `StartupLogger` |
| `common` | `BaseEntity`, `GlobalExceptionHandler`, `ApiError`, `PageResponse`, `LocaleResolver`, shared exceptions |
| `storage` | `S3StorageService`, `StorageController` |

### Key patterns

- **MapStruct** is used for DTO↔entity mapping (see `CategoryMapper`, `DestinationMapper`). MapStruct processors run at compile time; annotation processor order matters: Lombok → MapStruct (configured in `pom.xml`).
- **JPA Specifications** (`TourSpecifications`) are used for the public tour listing. `TourRepository` extends `JpaSpecificationExecutor<Tour>`; `TourService.filterTours()` composes predicates dynamically. Do not go back to the old if/else branching — Specifications are the correct extension point for any new tour filter.
- **`BaseEntity`** provides `id`, `createdAt`, `updatedAt` to all entities.
- **`AppProperties`** (`app.*` in `application.yml`) is the single typed config holder for JWT, CORS, S3, and SES settings — prefer injecting this over `@Value`.
- **`GlobalExceptionHandler`** returns `ApiError` for all exceptions. Logging levels: `warn` for 4xx (validation, not found, bad request, bad credentials, access denied); `error` for unhandled 5xx. `ResourceNotFoundException` → 404, `BadRequestException` → 400.
- **`PageResponse<T>`** wraps paginated list responses.
- Images (tour images, gallery) are stored as S3 keys, not URLs. `S3StorageService.getImageUrl()` returns a CDN URL (`{CDN_URL}/{key}`) when the `CDN_URL` env var is set; falls back to a 1-hour presigned S3 URL for local dev. Tour images are stored under `tours/{tourId}/` in S3.
- **`StartupLogger`** fires on `ApplicationReadyEvent` and logs all environment variables (sensitive keys masked with `***`) and the resolved CORS configuration. Useful for diagnosing misconfigured origins in ECS.

### Security

- JWT-based. `JwtAuthenticationFilter` validates tokens on every request; logs a `warn` for invalid/expired tokens.
- Admin endpoints require authentication; public browsing endpoints are open.
- `AdminUser` has a `role` field (`AdminRole` enum: `ADMIN`, `EDITOR`) for role-based access control.
- Signup (`POST /api/admin/auth/signup`) is controlled by `SIGNUP_REQUIRE_ADMIN` env var (default `true`). When true, only an existing ADMIN can create users. Set to `false` to allow open signup (useful for initial setup).
- Default seed admin: `admin@mytravelline.com` / `Admin@123` (change in production — see `V2__seed_data.sql`).
- **Login brute-force protection**: `LoginRateLimiter` blocks an IP for 15 minutes after 5 failed attempts within a 15-minute window. Returns **429 Too Many Requests**. In-memory per instance — not shared across ECS tasks.
- **Real client IP**: `server.forward-headers-strategy: native` is set so `request.getRemoteAddr()` returns the actual client IP from `X-Forwarded-For` (not the ALB private IP).

### CORS

- Handled by a standalone `CorsFilter` bean in `CorsConfig` registered at `Ordered.HIGHEST_PRECEDENCE` — runs **before** Spring Security's filter chain.
- Spring Security's CORS is also wired to the same `CorsConfigurationSource` bean (`.cors(cors -> cors.configurationSource(corsConfigurationSource))`), ensuring consistent config across both layers.
- Allowed origins come from the `ALLOWED_ORIGINS` env var (comma-separated, whitespace-trimmed). Supports multiple origins: `https://admin.my-travelline.com,https://other.com`.
- OPTIONS preflight requests return **204** and bypass the rest of the filter chain.
- Allowed methods: `GET POST PUT PATCH DELETE OPTIONS`. Allowed headers: `Content-Type Authorization`. Credentials: `true`. Max-age: 3600 s. Path: `/**`.
- If a deployed instance returns 0 CORS headers, the first thing to check is whether `ALLOWED_ORIGINS` is set correctly in the ECS task definition — an unrecognised origin deliberately returns no headers by spec.

### Tour departures

Tours run on fixed group departure dates. Each tour can have many scheduled departures.

**Schema** — `tour_departure(id, tour_id, departure_date DATE NOT NULL, available_slots INTEGER nullable, created_at, updated_at)`. Cascade-deleted with the parent tour.

**`TourSummaryDto`** includes `nextDeparture` (nearest upcoming `departure_date`, null if none). Batch-loaded in a single query per page — no N+1.

**`TourDto`** (full detail) includes `departures: [{id, departureDate, availableSlots}]` ordered by date ASC.

**Admin departure endpoints** (require authentication):
- `GET /api/admin/tours/{id}/departures` — list all departures for a tour
- `POST /api/admin/tours/{id}/departures` — add a departure; body `{"departureDate": "yyyy-MM-dd", "availableSlots": 12}` (`availableSlots` optional, `departureDate` required)
- `DELETE /api/admin/tours/{tourId}/departures/{departureId}` — remove a departure

### Tour filters (public API)

`GET /api/tours` supports the following optional query params — all combinable with AND, all preserve `?currency=` and pagination:

| Param | Type | Behavior |
|---|---|---|
| `category` | String (slug) | Tours in this category |
| `destination` | String (slug) | Tours for this destination (legacy param) |
| `destinationSlug` | String (slug) | Same as `destination`; takes precedence if both are supplied. Use this for the hero widget. |
| `search` | String | Case-insensitive title/summary match |
| `startDate` | `yyyy-MM-dd` | Tours that have at least one departure on or after this date (EXISTS subquery on `tour_departure`); invalid format → 400 |
| `travelers` | Integer 1–50 | Tours where `max_group_size >= travelers`; out of range → 400; tours with null `max_group_size` are excluded |

The query is built via `TourSpecifications` + `JpaSpecificationExecutor` (no JPQL branching). To add a new filter, add a predicate in `TourSpecifications` and wire it in `TourService.filterTours()`.

**Hero widget helper endpoints** (public, no auth):
- `GET /api/tours/available-dates?destination={slug}` — returns future departure months as `["yyyy-MM-01", …]` (month keys). Only published tours, only `departure_date >= today`.
- `GET /api/tours/available-destinations?startDate=yyyy-MM-01` — returns destination slugs that have at least one published tour departing in the given month. Invalid date → 400.

### Tour images

- `Tour.coverImage` (S3 key) is the main/cover image — shown in listings and as the hero.
- `TourImage` rows are the gallery images for a tour, ordered by `sortOrder`.
- `POST /api/admin/tours/{id}/images` uploads a file to `tours/{id}/` in S3 and creates a `TourImage` row. Pass `main=true` to also set `tour.coverImage`.
- `DELETE /api/admin/tours/{tourId}/images/{imageId}` deletes from S3 and DB; clears `tour.coverImage` automatically if the deleted image was the main one.
- `TourImageDto` includes `url` (CDN URL or presigned S3 URL, depending on `CDN_URL` env var) and `main` (true if `s3Key` matches `tour.coverImage`).

### Multilingual / i18n

Supported locales: **EN** (default/fallback), **HY** (Armenian), **RU** (Russian).

**Storage** — single `translations` table: `(entity_type, entity_id, locale, field, value)` with a unique constraint on the four key columns. No locale columns are added to domain tables.

**Translatable domains and their field keys:**

| Domain | `entity_type` | Translated fields |
|---|---|---|
| Tour | `tour` | `name` (→ `title`), `description`, `itinerary_day_{dayNumber}_title`, `itinerary_day_{dayNumber}_description` |
| Destination | `destination` | `name`, `description` |
| Category | `category` | `name` |
| Blog post | `blog` | `title`, `content`, `excerpt` (→ `summary`) |
| Gallery image | `gallery` | `caption` |

**Locale resolution** (`LocaleResolver`) — precedence:
1. `?lang=hy` query param
2. `Accept-Language` request header (first two-char tag only)
3. Falls back to `EN`

**Public API behaviour** — every public GET endpoint resolves the locale from the request and overlays translated values on top of base entity fields. Missing translations fall back to English silently.

**Admin translation endpoints** (require `isAuthenticated()`):
- `GET /api/admin/{domain}/{id}/translations` — returns `{ "en": {…}, "hy": {…}, "ru": {…} }` (only locales that have rows)
- `PUT /api/admin/{domain}/{id}/translations` — same shape, partial updates are fine; missing keys are left unchanged

**Cascade delete** — every domain delete method calls `translationService.deleteAll(entityType, id)` before deleting the entity, preventing orphan rows.

**NOT translated:** Booking, Contact, Review, AdminUser, tour image filenames/S3 keys, TourDeparture fields.

### Multi-currency

- All tour prices are stored in **USD** in the DB. The `tour.currency` column is always `'USD'`; it documents the storage currency and must not be set to anything else.
- On-the-fly conversion is triggered by `?currency=EUR` (or any supported code) on `GET /api/tours`, `GET /api/tours/{slug}`, `GET /api/tours/featured`.
- Response includes `price` (USD), `currency` (`"USD"`), `convertedPrice` (nullable), `convertedCurrency` (nullable — only set when conversion is requested).
- Conversion uses in-memory rates seeded from `EXCHANGE_RATE_*` env vars at startup. Rates survive the process lifetime only; restart reloads from env vars. Rates can be updated at runtime via `PUT /api/admin/currencies/rates/{code}`.
- Supported currencies: `USD EUR GBP AMD RUB AED` (defined in `CurrencyCode` enum). Requesting an unsupported code returns **400** with the list of supported codes in the error message.
- `GET /api/currencies` — public, returns all supported codes with symbols and current rates.
- `GET /api/admin/currencies/rates` — ADMIN only, returns raw rates map.
- `PUT /api/admin/currencies/rates/{code}` — ADMIN only, body `{"rate": 0.95}`, updates in-memory only.

### Database

- Flyway migrations in `src/main/resources/db/migration/` — versioned `V{n}__description.sql`. Current migrations: V1 (schema), V2 (seed admin), V3 (seed content), V4 (currency column), V5 (translations table), V6 (fix translations locale check constraint to uppercase EN/HY/RU), V7 (reseed production data), V8 (HY/RU translations for V7 content), V9 (fix Armenian translations), V10 (fix Armenian and Russian translations), V11 (adds `departure_date DATE` to `tour`), V12 (creates `tour_departure` table; drops `departure_date` from `tour`). Note: V11 and V12 both run on a fresh DB — V11 adds the column and V12 immediately replaces it with the proper one-to-many table.
- `ddl-auto: validate` in all non-test profiles; Flyway owns the schema.
- Test profile (`application-test.yml`) disables Flyway and uses `create-drop`. It connects directly to a local PostgreSQL at `localhost:5432/mytravelline_test` (user `test` / password `test`) — **not** Testcontainers. The CI workflow provides a PostgreSQL service container for this.

### Environment variables

| Variable | Default | Purpose |
|---|---|---|
| `SERVER_ADDRESS` | `localhost` | Bind address — **must be `0.0.0.0` in ECS** or the app is unreachable from the ALB |
| `SERVER_PORT` | `8080` | HTTP port |
| `DB_URL` | `jdbc:postgresql://localhost:5432/mytravelline` | Database |
| `DB_USER` | `mytravelline` | Database user |
| `DB_PASSWORD` | `localpassword` | Database password |
| `JWT_SECRET` | (dev default) | Must be ≥256 bits for HS256 |
| `ALLOWED_ORIGINS` | `http://localhost:5173,http://localhost:5174` | CORS — comma-separated, no spaces required but trimmed |
| `SIGNUP_REQUIRE_ADMIN` | `true` | When `true`, `POST /api/admin/auth/signup` requires `ADMIN` role. Set `false` only for initial setup. |
| `MEDIA_BUCKET` | `mytravelline-media-dev` | S3 bucket |
| `CDN_URL` | *(empty)* | CloudFront base URL — when set, images are served as `{CDN_URL}/{s3Key}` instead of presigned URLs |
| `AWS_REGION` | `us-east-1` | AWS region for S3 and SES |
| `SES_FROM_EMAIL` | `noreply@mytravelline.com` | SES sender address |
| `EXCHANGE_RATE_EUR` | `0.92` | 1 USD → EUR rate (in-memory, overrideable via admin API) |
| `EXCHANGE_RATE_GBP` | `0.79` | 1 USD → GBP rate |
| `EXCHANGE_RATE_AMD` | `388.0` | 1 USD → AMD rate |
| `EXCHANGE_RATE_RUB` | `90.0` | 1 USD → RUB rate |
| `EXCHANGE_RATE_AED` | `3.67` | 1 USD → AED rate |

## CI/CD

Backend CI/CD uses GitHub Actions.

**Workflow file:** `.github/workflows/ci-cd.yml`

**Trigger:** push to any branch; ECR push and ECS deployment only on `main`.

### What the workflow does

1. Checks out the repository.
2. Sets up Java 25.
3. Runs `mvn clean verify -B` with a real PostgreSQL service container (Testcontainers-compatible).
4. Authenticates to AWS via GitHub OIDC (no long-lived credentials — `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` must not be used).
5. Logs in to Amazon ECR.
6. Builds and pushes a Docker image with two tags: `latest` and `${GITHUB_SHA}`.
7. Runs `aws ecs update-service --force-new-deployment` to deploy the new image.

> ECS deployment runs on every push to `main`. Do not gate it further unless explicitly requested.

### Required permissions

```yaml
permissions:
  id-token: write
  contents: read
```

### AWS configuration

| Value | Setting |
|---|---|
| AWS region | `eu-north-1` |
| AWS account ID | `947927347939` |
| ECR repository | `mytravelline-backend` |
| ECR image URI | `947927347939.dkr.ecr.eu-north-1.amazonaws.com/mytravelline-backend` |
| ECS cluster | `mytravelline-prod` |
| ECS service | `my-travelline-backend-service` |
| GitHub Actions IAM role | `arn:aws:iam::947927347939:role/github-actions-mytravelline-backend-prod` |

### Official actions

| Step | Action |
|---|---|
| Checkout | `actions/checkout@v4` |
| Java setup | `actions/setup-java@v4` |
| AWS credentials | `aws-actions/configure-aws-credentials@v4` |
| ECR login | `aws-actions/amazon-ecr-login@v2` |

## Related Projects

This backend works together with the frontend project located at:

```text
~/WebstormProjects/my-travelline-frontend
```
