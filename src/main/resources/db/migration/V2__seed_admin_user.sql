-- V2__seed_admin_user.sql
-- Default admin user (password: admin123 — CHANGE IN PRODUCTION)
-- BCrypt hash for 'admin123' with cost 12

INSERT INTO admin_user (id, email, password_hash, name, role, active, created_at)
VALUES (
    gen_random_uuid(),
    'admin@mytravelline.com',
    '$2a$12$LQv3c1yqBo9SkvXS7QTJeOJV0z/5vC3J7i2xOcS1pNq7FhF1Cm6dO',
    'Admin',
    'ADMIN',
    true,
    NOW()
);
