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
| `tour` | Most complex domain — `Tour` with nested `TourImage` and `TourItineraryDay` collections; `TourStatus` enum (DRAFT/PUBLISHED); `TourImageRepository`; `dto/` sub-package for request/response types |
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
- Signup (`POST /api/admin/auth/signup`) is protected with `@PreAuthorize("hasRole('ADMIN')")` — only existing admins can create new users.
- Default seed admin: `admin@mytravelline.com` / `Admin@123` (change in production — see `V2__seed_data.sql`).

### CORS

- Handled by a standalone `CorsFilter` bean in `CorsConfig` registered at `Ordered.HIGHEST_PRECEDENCE` — runs **before** Spring Security's filter chain.
- Spring Security's CORS is also wired to the same `CorsConfigurationSource` bean (`.cors(cors -> cors.configurationSource(corsConfigurationSource))`), ensuring consistent config across both layers.
- Allowed origins come from the `ALLOWED_ORIGINS` env var (comma-separated, whitespace-trimmed). Supports multiple origins: `https://admin.my-travelline.com,https://other.com`.
- OPTIONS preflight requests return **204** and bypass the rest of the filter chain.
- Allowed methods: `GET POST PUT PATCH DELETE OPTIONS`. Allowed headers: `Content-Type Authorization`. Credentials: `true`. Max-age: 3600 s. Path: `/**`.
- If a deployed instance returns 0 CORS headers, the first thing to check is whether `ALLOWED_ORIGINS` is set correctly in the ECS task definition — an unrecognised origin deliberately returns no headers by spec.

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

**NOT translated:** Booking, Contact, Review, AdminUser, tour image filenames/S3 keys.

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

- Flyway migrations in `src/main/resources/db/migration/` — versioned `V{n}__description.sql`. Current migrations: V1 (schema), V2 (seed admin), V3 (seed content), V4 (currency column), V5 (translations table).
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
