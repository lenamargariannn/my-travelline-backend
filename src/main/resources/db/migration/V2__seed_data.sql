-- V2__seed_data.sql
-- Default admin user (password: Admin@123) - BCrypt hash with cost 12
-- IMPORTANT: Change this password in production!

INSERT INTO admin_user (email, password_hash, name, role, active)
VALUES ('admin@mytravelline.com', '$2a$12$8WgYQ5M8kZ0OxG3b.f5LF.3fN0JH4Jz3zE7y6sW2n.YkZq1L0g5uq', 'Super Admin', 'ADMIN', true);

-- Sample categories
INSERT INTO category (name, slug, description, active) VALUES
('Adventure', 'adventure', 'Thrilling adventure tours for adrenaline seekers', true),
('Honeymoon', 'honeymoon', 'Romantic getaways for couples', true),
('Family', 'family', 'Fun-filled family vacations for all ages', true),
('Cultural', 'cultural', 'Immersive cultural experiences and heritage tours', true),
('Wildlife', 'wildlife', 'Wildlife safaris and nature expeditions', true),
('Beach', 'beach', 'Relaxing beach holidays and island escapes', true);

-- Sample destinations
INSERT INTO destination (name, slug, country, description, active) VALUES
('Bali', 'bali', 'Indonesia', 'Island of the Gods with stunning temples, rice terraces, and beaches', true),
('Maldives', 'maldives', 'Maldives', 'Paradise islands with crystal clear waters and luxury resorts', true),
('Swiss Alps', 'swiss-alps', 'Switzerland', 'Majestic mountain scenery with skiing and hiking trails', true),
('Kyoto', 'kyoto', 'Japan', 'Ancient capital with thousand temples, geisha districts, and zen gardens', true),
('Santorini', 'santorini', 'Greece', 'Iconic white-washed buildings with stunning sunset views', true),
('Serengeti', 'serengeti', 'Tanzania', 'Endless plains with the greatest wildlife spectacle on earth', true);
