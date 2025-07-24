CREATE DATABASE online_school;

DROP DATABASE online_school;

-- Категории курсов
CREATE TABLE categories (
                            id SERIAL PRIMARY KEY,
                            name VARCHAR(100) NOT NULL UNIQUE
);

-- Пользователи (студенты и преподаватели)
CREATE TABLE users (
                       id SERIAL PRIMARY KEY,
                       first_name VARCHAR(100) NOT NULL,
                       last_name VARCHAR(100) NOT NULL,
                       email VARCHAR(255) UNIQUE NOT NULL,
                       role VARCHAR(20) CHECK (role IN ('student', 'teacher', 'admin')) NOT NULL,
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Курсы
CREATE TABLE courses (
                         id SERIAL PRIMARY KEY,
                         title VARCHAR(255) NOT NULL,
                         description TEXT,
                         category_id INT REFERENCES categories(id),
                         teacher_id INT REFERENCES users(id),
                         price NUMERIC(10, 2),
                         created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Уроки
CREATE TABLE lessons (
                         id SERIAL PRIMARY KEY,
                         course_id INT REFERENCES courses(id),
                         title VARCHAR(255) NOT NULL,
                         content TEXT,
                         duration INT -- в минутах
);

-- Запись студентов на курсы
CREATE TABLE enrollments (
                             id SERIAL PRIMARY KEY,
                             user_id INT REFERENCES users(id),
                             course_id INT REFERENCES courses(id),
                             enrolled_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                             completed BOOLEAN DEFAULT FALSE
);

-- Прогресс по урокам
CREATE TABLE progress (
                          id SERIAL PRIMARY KEY,
                          user_id INT REFERENCES users(id),
                          lesson_id INT REFERENCES lessons(id),
                          status VARCHAR(20) CHECK (status IN ('not_started', 'in_progress', 'completed')),
                          last_accessed TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Отзывы на курсы
CREATE TABLE reviews (
                         id SERIAL PRIMARY KEY,
                         user_id INT REFERENCES users(id),
                         course_id INT REFERENCES courses(id),
                         rating INT CHECK (rating BETWEEN 1 AND 5),
                         comment TEXT,
                         created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE user_course_progress(
    user_id INT REFERENCES users(id),
    course_id INT REFERENCES courses(id),
    progress_percent INT CHECK (progress_percent BETWEEN 0 AND 100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, course_id)
);

