--ЗАПОЛНЕНИЕ ТАБЛИЦ

-- Категории
INSERT INTO categories (name) VALUES
                                  ('Java'),
                                  ('Python'),
                                  ('Frontend'),
                                  ('Data Science'),
                                  ('DevOps');

-- Пользователи
INSERT INTO users (first_name, last_name, email, role) VALUES
                                                           ('Алексей', 'Иванов', 'alex@example.com', 'student'),
                                                           ('Мария', 'Петрова', 'maria@example.com', 'student'),
                                                           ('Иван', 'Смирнов', 'ivan@example.com', 'student'),
                                                           ('Ольга', 'Кузнецова', 'olga@example.com', 'teacher'),
                                                           ('Дмитрий', 'Федоров', 'dmitry@example.com', 'teacher'),
                                                           ('Админ', 'Админов', 'admin@example.com', 'admin');

-- Курсы
INSERT INTO courses (title, description, category_id, teacher_id, price) VALUES
                                                                             ('Java для начинающих', 'Изучи Java с нуля', 1, 4, 199.99),
                                                                             ('Python для анализа данных', 'Pandas, NumPy и визуализация', 2, 5, 249.99),
                                                                             ('JavaScript и React', 'Создание интерфейсов с нуля', 3, 4, 149.99),
                                                                             ('Машинное обучение на Python', 'Теория и практика ML', 4, 5, 399.99),
                                                                             ('Docker и Kubernetes', 'DevOps инструменты', 5, 5, 299.99);

-- Уроки
INSERT INTO lessons (course_id, title, content, duration) VALUES
-- Java для начинающих
(1, 'Введение в Java', 'Установка JDK, первая программа', 30),
(1, 'Переменные и типы данных', 'int, double, String', 45),
-- Python для анализа данных
(2, 'Введение в Python', 'Синтаксис, переменные', 25),
(2, 'Pandas: Series и DataFrame', 'Работа с таблицами', 60),
-- JavaScript и React
(3, 'Основы JavaScript', 'Функции, объекты, DOM', 50),
(3, 'React: основы', 'Компоненты, JSX', 55),
-- Машинное обучение
(4, 'Введение в машинное обучение', 'Теория и библиотеки', 40),
-- Docker и Kubernetes
(5, 'Docker: основы', 'Контейнеры и образы', 45);

-- Запись на курсы
INSERT INTO enrollments (user_id, course_id, completed) VALUES
                                                            (1, 1, TRUE),
                                                            (1, 2, FALSE),
                                                            (2, 1, TRUE),
                                                            (2, 3, TRUE),
                                                            (3, 4, TRUE),
                                                            (3, 5, TRUE);

-- Прогресс по урокам
INSERT INTO progress (user_id, lesson_id, status) VALUES
                                                      (1, 1, 'completed'),
                                                      (1, 2, 'completed'),
                                                      (1, 3, 'in_progress'),
                                                      (2, 1, 'completed'),
                                                      (2, 3, 'completed'),
                                                      (2, 5, 'completed'),
                                                      (3, 7, 'completed'),
                                                      (3, 8, 'completed');

-- Отзывы
INSERT INTO reviews (user_id, course_id, rating, comment) VALUES
                                                              (1, 1, 5, 'Отличный курс для новичков!'),
                                                              (2, 1, 4, 'Хорошо объясняют, но мало практики'),
                                                              (2, 3, 5, 'React объяснили проще, чем на других курсах'),
                                                              (3, 4, 5, 'Очень полезный курс по ML'),
                                                              (1, 5, 3, 'Хороший, но сложноват для новичков');

-- Добавим курсы с NULL в описании и бесплатные (цена = 0)
INSERT INTO courses (title, description, category_id, teacher_id, price) VALUES
                                                                             ('Основы HTML и CSS', NULL, 3, 4, 0.00),
                                                                             ('Английский для программистов', 'Учим технический английский', 1, 5, 0.00),
                                                                             ('Git и GitHub', NULL, 5, 5, 99.99);

-- Добавляем курс, который НЕ связан ни с одной категорией
INSERT INTO courses (title, description, teacher_id, price)
VALUES ('Курс без категории', 'Этот курс не имеет категории', 4, 100.00);

-- Категория, к которой не привязан ни один курс
INSERT INTO categories (name) VALUES ('Аналитика');