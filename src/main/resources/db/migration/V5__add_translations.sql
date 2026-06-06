CREATE TABLE translations (
    id          BIGSERIAL PRIMARY KEY,
    entity_type VARCHAR(50)  NOT NULL,
    entity_id   BIGINT       NOT NULL,
    locale      VARCHAR(10)  NOT NULL CHECK (locale IN ('en', 'hy', 'ru')),
    field       VARCHAR(100) NOT NULL,
    value       TEXT         NOT NULL,
    created_at  TIMESTAMP    NOT NULL DEFAULT NOW(),
    updated_at  TIMESTAMP    NOT NULL DEFAULT NOW(),
    UNIQUE (entity_type, entity_id, locale, field)
);

CREATE INDEX idx_translations_lookup
    ON translations (entity_type, entity_id, locale);
