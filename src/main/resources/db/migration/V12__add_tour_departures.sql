CREATE TABLE tour_departure (
    id          BIGSERIAL PRIMARY KEY,
    tour_id     BIGINT NOT NULL REFERENCES tour(id) ON DELETE CASCADE,
    departure_date DATE NOT NULL,
    available_slots INTEGER,
    created_at  TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at  TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_tour_departure_tour_id ON tour_departure(tour_id);
CREATE INDEX idx_tour_departure_date   ON tour_departure(departure_date);

ALTER TABLE tour DROP COLUMN departure_date;
