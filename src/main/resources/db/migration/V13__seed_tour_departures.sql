-- Seed upcoming group departure dates for all published tours.
-- Today: 2026-06-21. Dates run Jul 2026 – Feb 2027.

INSERT INTO tour_departure (tour_id, departure_date, available_slots) VALUES

-- Maldives Honeymoon Escape (6 days)
((SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape'), '2026-07-12', 8),
((SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape'), '2026-09-06', 8),
((SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape'), '2026-11-08', 10),
((SELECT id FROM tour WHERE slug = 'maldives-honeymoon-escape'), '2027-01-17', 8),

-- Bali Complete Experience (8 days)
((SELECT id FROM tour WHERE slug = 'bali-complete-experience'), '2026-07-19', 12),
((SELECT id FROM tour WHERE slug = 'bali-complete-experience'), '2026-08-30', 12),
((SELECT id FROM tour WHERE slug = 'bali-complete-experience'), '2026-10-11', 14),
((SELECT id FROM tour WHERE slug = 'bali-complete-experience'), '2027-01-10', 12),

-- Dubai City & Desert (5 days)
((SELECT id FROM tour WHERE slug = 'dubai-city-desert'), '2026-07-05', 16),
((SELECT id FROM tour WHERE slug = 'dubai-city-desert'), '2026-09-20', 16),
((SELECT id FROM tour WHERE slug = 'dubai-city-desert'), '2026-11-15', 18),
((SELECT id FROM tour WHERE slug = 'dubai-city-desert'), '2027-02-01', 16),

-- Santorini Dream (7 days)
((SELECT id FROM tour WHERE slug = 'santorini-dream'), '2026-07-26', 10),
((SELECT id FROM tour WHERE slug = 'santorini-dream'), '2026-08-23', 10),
((SELECT id FROM tour WHERE slug = 'santorini-dream'), '2026-09-13', 12),
((SELECT id FROM tour WHERE slug = 'santorini-dream'), '2026-10-04', 10),

-- Paris Romantic Escape (5 days)
((SELECT id FROM tour WHERE slug = 'paris-romantic-escape'), '2026-07-18', 12),
((SELECT id FROM tour WHERE slug = 'paris-romantic-escape'), '2026-09-05', 12),
((SELECT id FROM tour WHERE slug = 'paris-romantic-escape'), '2026-10-17', 14),
((SELECT id FROM tour WHERE slug = 'paris-romantic-escape'), '2026-12-06', 12),

-- Phuket Family Beach (8 days)
((SELECT id FROM tour WHERE slug = 'phuket-family-beach'), '2026-07-11', 20),
((SELECT id FROM tour WHERE slug = 'phuket-family-beach'), '2026-08-08', 20),
((SELECT id FROM tour WHERE slug = 'phuket-family-beach'), '2026-10-24', 20),
((SELECT id FROM tour WHERE slug = 'phuket-family-beach'), '2026-12-20', 20),

-- Georgia & Caucasus Discovery (6 days)
((SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery'), '2026-08-01', 14),
((SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery'), '2026-09-12', 14),
((SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery'), '2026-10-03', 16),
((SELECT id FROM tour WHERE slug = 'georgia-caucasus-discovery'), '2026-11-07', 14),

-- Kyoto Cultural Immersion (7 days)
((SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion'), '2026-08-15', 10),
((SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion'), '2026-10-10', 10),
((SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion'), '2026-11-21', 12),
((SELECT id FROM tour WHERE slug = 'kyoto-cultural-immersion'), '2027-02-14', 10);
