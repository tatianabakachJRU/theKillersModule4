-- SELECT название_колонки
-- FROM название_таблицы
-- WHERE условие
-- GROUP BY название_колонки
-- HAVING услование
-- ORDER BY название_колонки

-- 1. Условные операторы

SELECT title,
       price,
       CASE
           WHEN price <= 0 THEN 'Бесплатный'
           WHEN price BETWEEN 1 AND 100.99 THEN 'Дешевый'
           WHEN price BETWEEN 101 AND 200.99 THEN 'Средний'
           ELSE 'Дорогой'
           END AS price_category
FROM courses;

SELECT COUNT(*) FILTER ( WHERE completed = TRUE ) AS completed_count
FROM enrollments;

SELECT title,
       COALESCE(description, 'Описание отсутствует') AS description
FROM courses;

-- 2. Агрегатные функции

SELECT COUNT(*) AS total_cources
FROM courses;

SELECT SUM(price) AS total_price
FROM courses;

SELECT AVG(price) AS avg_price
FROM courses;

SELECT MIN(price) AS min_price, MAX(price) AS max_price
FROM courses;

SELECT c.name             AS category_name,
       COUNT(courses.id)  AS total_cources,
       AVG(courses.price) AS avg_price
FROM courses
         JOIN categories c ON courses.category_id = c.id
GROUP BY c.name
ORDER BY total_cources DESC;


-- 3. GROUP BY

SELECT c.title          AS cource_title,
       COUNT(e.user_id) AS student_count
FROM courses c
         LEFT JOIN enrollments e on c.id = e.course_id
GROUP BY c.title
ORDER BY student_count;


SELECT cat.name                           AS category_name,
       u.first_name || ' ' || u.last_name AS teacher_name,
       COUNT(c.id)                        AS cource_count
FROM courses c
         JOIN public.categories cat on cat.id = c.category_id
         JOIN public.users u on u.id = c.teacher_id
GROUP BY cat.name, u.first_name, u.last_name
ORDER BY cat.name, cource_count DESC;

SELECT cat.name AS category_name,
       c.title  AS cource_title
FROM categories cat
         FULL JOIN public.courses c on cat.id = c.category_id















