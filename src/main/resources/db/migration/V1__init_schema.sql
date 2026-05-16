-- Admin users
CREATE TABLE admin_user (
    id            BIGSERIAL PRIMARY KEY,
    email         VARCHAR(200) NOT NULL UNIQUE,
    password_hash VARCHAR(200) NOT NULL,
    name          VARCHAR(100) NOT NULL,
    role          VARCHAR(30)  NOT NULL,
    enabled       BOOLEAN      NOT NULL DEFAULT TRUE,
    created_at    TIMESTAMP    NOT NULL DEFAULT NOW(),
    updated_at    TIMESTAMP    NOT NULL DEFAULT NOW()
);

-- Categories
CREATE TABLE category (
    id          BIGSERIAL PRIMARY KEY,
    name        VARCHAR(120) NOT NULL,
    slug        VARCHAR(140) NOT NULL UNIQUE,
    description VARCHAR(1000),
    created_at  TIMESTAMP    NOT NULL DEFAULT NOW(),
    updated_at  TIMESTAMP    NOT NULL DEFAULT NOW()
);

-- Destinations
CREATE TABLE destination (
    id              BIGSERIAL PRIMARY KEY,
    name            VARCHAR(150) NOT NULL,
    slug            VARCHAR(170) NOT NULL UNIQUE,
    country         VARCHAR(100),
    description     VARCHAR(4000),
    cover_image_key VARCHAR(500),
    created_at      TIMESTAMP    NOT NULL DEFAULT NOW(),
    updated_at      TIMESTAMP    NOT NULL DEFAULT NOW()
);

-- Tours
CREATE TABLE tour (
    id              BIGSERIAL PRIMARY KEY,
    slug            VARCHAR(200) NOT NULL UNIQUE,
    title           VARCHAR(200) NOT NULL,
    summary         VARCHAR(500),
    description     TEXT,
    price           NUMERIC(12, 2) NOT NULL,
    duration_days   INTEGER NOT NULL,
    featured        BOOLEAN NOT NULL DEFAULT FALSE,
    status          VARCHAR(20) NOT NULL DEFAULT 'DRAFT',
    cover_image_key VARCHAR(500),
    category_id     BIGINT NOT NULL REFERENCES category (id),
    destination_id  BIGINT NOT NULL REFERENCES destination (id),
    created_at      TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at      TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_tour_status     ON tour (status);
CREATE INDEX idx_tour_featured   ON tour (featured);
CREATE INDEX idx_tour_category   ON tour (category_id);
CREATE INDEX idx_tour_destination ON tour (destination_id);
