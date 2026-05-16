-- V1__init_schema.sql
-- My TravelLine - Initial Database Schema

-- Admin users table
CREATE TABLE admin_user (
    id BIGSERIAL PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL DEFAULT 'ADMIN',
    active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- Categories table
CREATE TABLE category (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    slug VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    cover_image VARCHAR(500),
    active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- Destinations table
CREATE TABLE destination (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    slug VARCHAR(255) NOT NULL UNIQUE,
    country VARCHAR(255),
    description TEXT,
    cover_image VARCHAR(500),
    active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- Tours table
CREATE TABLE tour (
    id BIGSERIAL PRIMARY KEY,
    slug VARCHAR(255) NOT NULL UNIQUE,
    title VARCHAR(255) NOT NULL,
    summary TEXT,
    description TEXT,
    price NUMERIC(10, 2) NOT NULL,
    duration_days INTEGER,
    max_group_size INTEGER,
    cover_image VARCHAR(500),
    featured BOOLEAN NOT NULL DEFAULT FALSE,
    status VARCHAR(50) NOT NULL DEFAULT 'DRAFT',
    category_id BIGINT REFERENCES category(id) ON DELETE SET NULL,
    destination_id BIGINT REFERENCES destination(id) ON DELETE SET NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- Tour images table
CREATE TABLE tour_image (
    id BIGSERIAL PRIMARY KEY,
    s3_key VARCHAR(500) NOT NULL,
    caption VARCHAR(255),
    sort_order INTEGER DEFAULT 0,
    tour_id BIGINT NOT NULL REFERENCES tour(id) ON DELETE CASCADE,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- Tour itinerary days table
CREATE TABLE tour_itinerary_day (
    id BIGSERIAL PRIMARY KEY,
    day_number INTEGER NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    tour_id BIGINT NOT NULL REFERENCES tour(id) ON DELETE CASCADE,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- Blog posts table
CREATE TABLE blog_post (
    id BIGSERIAL PRIMARY KEY,
    slug VARCHAR(255) NOT NULL UNIQUE,
    title VARCHAR(255) NOT NULL,
    summary TEXT,
    content TEXT NOT NULL,
    cover_image VARCHAR(500),
    author VARCHAR(255),
    tags VARCHAR(500),
    published BOOLEAN NOT NULL DEFAULT FALSE,
    published_at TIMESTAMP,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- Reviews table
CREATE TABLE review (
    id BIGSERIAL PRIMARY KEY,
    author_name VARCHAR(255) NOT NULL,
    author_location VARCHAR(255),
    rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
    content TEXT NOT NULL,
    approved BOOLEAN NOT NULL DEFAULT FALSE,
    tour_id BIGINT REFERENCES tour(id) ON DELETE SET NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- Gallery images table
CREATE TABLE gallery_image (
    id BIGSERIAL PRIMARY KEY,
    s3_key VARCHAR(500) NOT NULL,
    caption VARCHAR(255),
    sort_order INTEGER DEFAULT 0,
    destination_id BIGINT REFERENCES destination(id) ON DELETE SET NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- Bookings table
CREATE TABLE booking (
    id BIGSERIAL PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(50),
    travel_date DATE,
    guests INTEGER NOT NULL DEFAULT 1,
    message TEXT,
    status VARCHAR(50) NOT NULL DEFAULT 'NEW',
    tour_id BIGINT REFERENCES tour(id) ON DELETE SET NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- Contact messages table
CREATE TABLE contact_message (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    subject VARCHAR(255),
    message TEXT NOT NULL,
    read BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- Indexes
CREATE INDEX idx_tour_slug ON tour(slug);
CREATE INDEX idx_tour_status ON tour(status);
CREATE INDEX idx_tour_featured ON tour(featured);
CREATE INDEX idx_tour_category ON tour(category_id);
CREATE INDEX idx_tour_destination ON tour(destination_id);
CREATE INDEX idx_category_slug ON category(slug);
CREATE INDEX idx_destination_slug ON destination(slug);
CREATE INDEX idx_blog_post_slug ON blog_post(slug);
CREATE INDEX idx_blog_post_published ON blog_post(published);
CREATE INDEX idx_review_approved ON review(approved);
CREATE INDEX idx_review_tour ON review(tour_id);
CREATE INDEX idx_booking_status ON booking(status);
CREATE INDEX idx_booking_created_at ON booking(created_at);
CREATE INDEX idx_contact_message_read ON contact_message(read);
CREATE INDEX idx_gallery_destination ON gallery_image(destination_id);
