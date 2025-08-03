CREATE DATABASE online_school;

DROP DATABASE online_school;

SET search_path TO public;

-- Категории курсов
CREATE TABLE categories
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- Пользователи (студенты и преподаватели)
CREATE TABLE users
(
    id         SERIAL PRIMARY KEY,
    first_name VARCHAR(100)                                                NOT NULL,
    last_name  VARCHAR(100)                                                NOT NULL,
    email      VARCHAR(255) UNIQUE                                         NOT NULL,
    role       VARCHAR(20) CHECK (role IN ('student', 'teacher', 'admin')) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Курсы
CREATE TABLE courses
(
    id          SERIAL PRIMARY KEY,
    title       VARCHAR(255) NOT NULL,
    description TEXT,
    category_id INT REFERENCES categories (id),
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES users (id),
    price       NUMERIC(10, 2),
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE courses
ADD CONSTRAINT fk_course_teacher
FOREIGN KEY (teacher_id) REFERENCES users(id)
ON DELETE SET NULL
ON UPDATE CASCADE;

-- Уроки
CREATE TABLE lessons
(
    id        SERIAL PRIMARY KEY,
    course_id INT REFERENCES courses (id),
    title     VARCHAR(255) NOT NULL,
    content   TEXT,
    duration  INT -- в минутах
);

-- Запись студентов на курсы
CREATE TABLE enrollments
(
    id          SERIAL PRIMARY KEY,
    user_id     INT REFERENCES users (id),
    course_id   INT REFERENCES courses (id),
    enrolled_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    completed   BOOLEAN   DEFAULT FALSE
);

-- Прогресс по урокам
CREATE TABLE progress
(
    id            SERIAL PRIMARY KEY,
    user_id       INT REFERENCES users (id),
    lesson_id     INT REFERENCES lessons (id),
    status        VARCHAR(20) CHECK (status IN ('not_started', 'in_progress', 'completed')),
    last_accessed TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Отзывы на курсы
CREATE TABLE reviews
(
    id         SERIAL PRIMARY KEY,
    user_id    INT REFERENCES users (id),
    course_id  INT REFERENCES courses (id),
    rating     INT CHECK (rating BETWEEN 1 AND 5),
    comment    TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE user_course_progress
(
    user_id          INT REFERENCES users (id),
    course_id        INT REFERENCES courses (id),
    progress_percent INT CHECK (progress_percent BETWEEN 0 AND 100),
    created_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, course_id)
);

-- Сначала создаём ENUM
CREATE TYPE user_status AS ENUM ('active', 'inactive', 'banned', 'pending');

-- Таблица профиля
CREATE TABLE user_profiles
(
    user_id     INT PRIMARY KEY REFERENCES users (id),
    avatar      BYTEA,                        -- бинарные данные аватарки
    bio         TEXT,
    preferences JSON,                         -- гибкие настройки: {"theme": "dark", "lang": "ru"}
    status      user_status DEFAULT 'active', -- ENUM
    last_seen   TIMESTAMPTZ,                  -- с учётом часового пояса
    updated_at  TIMESTAMPTZ DEFAULT NOW()
);

-- Включаем UUID (если ещё не включён)
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Таблица платежей
CREATE TABLE payments
(
    id               UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id          INT REFERENCES users (id),
    course_id        INT REFERENCES courses (id),
    amount           NUMERIC(12, 2) NOT NULL, -- сумма с копейками (например, 5999.99)
    currency         VARCHAR(3)       DEFAULT 'RUB',
    status           VARCHAR(20) CHECK (status IN ('pending', 'completed', 'failed', 'refunded')),
    transaction_data JSON,                    -- данные от платёжной системы
    paid_at          TIMESTAMPTZ,             -- когда оплачено (с часовым поясом)
    created_at       TIMESTAMPTZ      DEFAULT NOW()
);