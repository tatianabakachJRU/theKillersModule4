ALTER TABLE users
    ADD COLUMN phone VARCHAR(20);
ALTER TABLE users
    DROP COLUMN phone;

DROP TABLE payments;

CREATE SCHEMA temp;
SET search_path TO temp;
DROP SCHEMA IF EXISTS temp CASCADE;

CREATE VIEW public_user AS
SELECT id,
       first_name,
       last_name,
       role
FROM users;

CREATE VIEW course_info AS
SELECT c.id,
       c.title,
       c.price,
       cat.name                           AS category,
       u.first_name || ' ' || u.last_name AS teacher_name,
       u.email                            AS teacher_email
FROM courses c
JOIN categories cat ON c.category_id = cat.id
JOIN users u ON c.teacher_id = u.id;

ALTER TABLE users
ADD COLUMN full_name TEXT
GENERATED ALWAYS AS ( first_name || ' ' || last_name ) STORED;

COMMENT ON COLUMN courses.price IS 'Цена курса';

CREATE TABLE users_archive(
    id INT,
    full_name TEXT,
    email TEXT,
    archived_at TIMESTAMPTZ DEFAULT NOW()
);

ALTER TABLE courses
    ADD COLUMN paid_count INT;

ALTER TABLE courses
    DROP COLUMN students_count;

ALTER TABLE courses ALTER COLUMN description TYPE VARCHAR(1000);

ALTER TABLE users ALTER COLUMN role SET DEFAULT 'student';

ALTER TABLE users ALTER COLUMN role DROP DEFAULT;

CREATE INDEX idx_user_email ON users(email);