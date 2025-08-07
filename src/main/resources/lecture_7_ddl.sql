CREATE TABLE users
(
    id    SERIAL PRIMARY KEY,
    name  VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE profiles
(
    id         SERIAL PRIMARY KEY,
    user_id    INT UNIQUE NOT NULL,
    bio        TEXT,
    birth_date DATE,
    create_at  TIMESTAMP DEFAULT NOW(),
    is_active  BOOLEAN   DEFAULT TRUE,
    height     DECIMAL(5, 2),
    avatar     BYTEA,
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

ALTER TABLE users
    ADD CONSTRAINT uk_users_email UNIQUE (email);

ALTER TABLE profiles
    ADD COLUMN created_date          DATE,
    ADD COLUMN created_time          TIME,
    ADD COLUMN created_timestamp     TIMESTAMP,
    ADD COLUMN created_with_timezone TIMESTAMP WITH TIME ZONE;

SHOW time zone;

SET TIME ZONE 'Europe/Paris';

ALTER SEQUENCE users_id_seq RESTART WITH 1;

ALTER SEQUENCE profiles_id_seq RESTART WITH 1;