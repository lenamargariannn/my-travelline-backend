-- Default admin user. Password: ChangeMe123!  (BCrypt hash, cost 12)
-- IMPORTANT: change immediately after first login.
INSERT INTO admin_user (email, password_hash, name, role, enabled)
VALUES (
    'admin@mytravelline.com',
    '$2a$12$DfxQ1q9R2Y8cWl0Y6p/8xeM6u3zVQF7m6c5wB0p2gqL4hJjKqJg9G',
    'Site Administrator',
    'ADMIN',
    TRUE
);

-- Sample categories
INSERT INTO category (name, slug, description) VALUES
    ('Adventure',  'adventure',  'Adrenaline-filled journeys for the bold.'),
    ('Honeymoon',  'honeymoon',  'Romantic getaways for unforgettable beginnings.'),
    ('Family',     'family',     'Trips designed with the whole family in mind.'),
    ('Cultural',   'cultural',   'Immerse yourself in heritage and traditions.');

-- Sample destinations
INSERT INTO destination (name, slug, country, description) VALUES
    ('Bali',      'bali',      'Indonesia', 'The Island of Gods - beaches, temples and rice terraces.'),
    ('Santorini', 'santorini', 'Greece',    'Iconic white-washed villages and sunsets over the Aegean.'),
    ('Kyoto',     'kyoto',     'Japan',     'Historic temples, gardens and traditional tea ceremonies.');
