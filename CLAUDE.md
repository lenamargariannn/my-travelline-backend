# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Spring Boot 3.5.14 REST API for a travel agency platform (My TravelLine). Serves both public-facing browsing endpoints and admin panel APIs. Built with Java 25, PostgreSQL, Flyway, JWT auth, AWS S3/SES, and SpringDoc OpenAPI.

## Commands

```bash
# Build
./mvnw clean package

# Run (dev profile active by default in IDE; set profile explicitly otherwise)
./mvnw spring-boot:run -Dspring-boot.run.profiles=dev

# Run tests
./mvnw test

# Run a single test class
./mvnw test -Dtest=BookingServiceTest

# Skip tests during build
./mvnw clean package -DskipTests
```

API docs available at `http://localhost:8080/swagger-ui.html` when running.

## Architecture

### Package structure

Each domain lives in a flat package under `com.mytravelline.<domain>` — entity, repository, service, controller, DTO, and mapper all co-located (not split into layers). Current domains:

| Package | Responsibility |
|---|---|
| `admin` | `AdminUser` entity, `AuthController` (login/refresh), `AdminDashboardController`, `AdminRole` enum |
| `tour` | Most complex domain — `Tour` with nested `TourImage` and `TourItineraryDay` collections; `TourStatus` enum (DRAFT/PUBLISHED); `dto/` sub-package for request/response types |
| `booking` | Customer bookings linked to tours; `BookingStatus` enum |
| `category` | Tour categories with slugs |
| `destination` | Travel destinations with slugs |
| `blog` | Blog posts with publish/unpublish lifecycle |
| `review` | Customer reviews; require approval before surfacing |
| `gallery` | Gallery images stored in S3 |
| `contact` | Contact form submissions; tracked as read/unread |
| `security` | `JwtService`, `JwtAuthenticationFilter`, `AdminUserDetailsService` |
| `config` | `AppProperties` (typed config), `SecurityConfig`, `CorsConfig`, `OpenApiConfig`, `S3Config` |
| `common` | `BaseEntity`, `GlobalExceptionHandler`, `ApiError`, `PageResponse`, shared exceptions |
| `storage` | `S3StorageService`, `StorageController` |

### Key patterns

- **MapStruct** is used for DTO↔entity mapping (see `CategoryMapper`, `DestinationMapper`). MapStruct processors run at compile time; annotation processor order matters: Lombok → MapStruct (configured in `pom.xml`).
- **`BaseEntity`** provides `id`, `createdAt`, `updatedAt` to all entities.
- **`AppProperties`** (`app.*` in `application.yml`) is the single typed config holder for JWT, CORS, S3, and SES settings — prefer injecting this over `@Value`.
- **`GlobalExceptionHandler`** returns `ApiError` for all exceptions. `ResourceNotFoundException` → 404, `BadRequestException` → 400.
- **`PageResponse<T>`** wraps paginated list responses.
- Images (tour images, gallery) are stored as S3 keys, not URLs; the `S3StorageService` handles presigning.

### Security

- JWT-based. `JwtAuthenticationFilter` validates tokens on every request.
- Admin endpoints require authentication; public browsing endpoints are open.
- `AdminUser` has a `role` field (`AdminRole` enum) for role-based access control.
- Default seed admin: `admin@mytravelline.com` / `Admin@123` (change in production — see `V2__seed_data.sql`).

### Database

- Flyway migrations in `src/main/resources/db/migration/` — versioned `V{n}__description.sql`.
- `ddl-auto: validate` in all non-test profiles; Flyway owns the schema.
- Test profile (`application-test.yml`) disables Flyway and uses `create-drop`. Tests use Testcontainers for a real PostgreSQL instance.

### Environment variables

| Variable | Default | Purpose |
|---|---|---|
| `DB_URL` | `jdbc:postgresql://localhost:5432/mytravelline` | Database |
| `DB_USER` | `mytravelline` | Database user |
| `DB_PASSWORD` | `localpassword` | Database password |
| `JWT_SECRET` | (dev default) | Must be ≥256 bits for HS256 |
| `ALLOWED_ORIGINS` | `http://localhost:5173` | CORS |
| `MEDIA_BUCKET` | `mytravelline-media-dev` | S3 bucket |
| `AWS_REGION` | `us-east-1` | AWS region for S3 and SES |
| `SES_FROM_EMAIL` | `noreply@mytravelline.com` | SES sender address |

## Related Projects

This backend works together with the frontend project located at:

```text

~/WebstormProjects/my-travelline-frontend
```
