SELECT title,
       price,
       price * 0.1         AS discount,
       price - price * 0.1 AS final_price
FROM courses
WHERE price > 0;

SELECT title,
       price,
       ROUND(price) AS price_round
FROM courses
WHERE price > 0;

SELECT title,
       duration,
       FLOOR(duration / 60.0) AS full_hours,
       CEIL(duration / 60.0)  AS hours_ceil
FROM lessons;

WITH course_avg AS (SELECT course_id,
                           AVG(rating) AS avg_raiting
                    FROM reviews
                    GROUP BY course_id)
SELECT r.user_id,
       c.title,
       r.rating,
       ROUND(ca.avg_raiting, 2)       AS couse_avg,
       ABS(r.rating - ca.avg_raiting) AS diff_from_avg
FROM reviews r
         JOIN courses c ON c.id = r.course_id
         JOIN course_avg ca ON c.id = ca.course_id
ORDER BY diff_from_avg DESC;

SELECT id,
       first_name,
       last_name,
       id % 3 AS groip_id
FROM users
ORDER BY groip_id;

SELECT NOW();

SELECT CURRENT_DATE;

SELECT CURRENT_TIME;

SELECT CURRENT_TIMESTAMP;

SELECT u.first_name,
       u.last_name,
       c.title,
       e.enrolled_at,
       EXTRACT(YEAR FROM e.enrolled_at)  AS year,
       EXTRACT(MONTH FROM e.enrolled_at) AS month,
       EXTRACT(DOW FROM e.enrolled_at)   AS day_of_week,
       TO_CHAR(e.enrolled_at, 'Day')     AS weekday_name
FROM enrollments e
         JOIN users u on e.user_id = u.id
         JOIN courses c ON c.id = e.course_id
ORDER BY e.enrolled_at;


SELECT u.first_name,
       u.last_name,
       c.title,
       e.enrolled_at,
       AGE(NOW(), e.enrolled_at) AS time_since_enrollment
FROM enrollments e
         JOIN users u on e.user_id = u.id
         JOIN courses c ON c.id = e.course_id
ORDER BY e.enrolled_at;

SHOW TIMEZONE;

SET TIMEZONE = 'America/New_York';

SET TIMEZONE = 'UTC';

SELECT user_id,
       enrolled_at,
       enrolled_at AT TIME ZONE 'America/New_York' AS ny_time
FROM enrollments;

SELECT TO_TIMESTAMP('February 15, 2025', 'Month DD, YYYY');

SELECT TO_CHAR(users.created_at, 'DD.MM.YYYY')
FROM users;

SELECT u.first_name,
       u.last_name,
       c.title,
       e.enrolled_at,
       TO_CHAR(e.enrolled_at, 'DD.MM.YYYY')    AS simple_date,
       TO_CHAR(e.enrolled_at, 'HH24.MI')       AS time_24,
       TO_CHAR(e.enrolled_at, 'Day, DD Month') AS readable_date
FROM enrollments e
         JOIN users u on e.user_id = u.id
         JOIN courses c ON c.id = e.course_id
ORDER BY e.enrolled_at;

SELECT first_name,
       last_name,
       CONCAT(first_name, ' ', last_name)               AS full_name,
       (first_name || ' ' || last_name)                 AS second_full_name,
       CONCAT(first_name, ' учится на курсе ', c.title) AS activity
FROM users u
         JOIN enrollments e on u.id = e.user_id
         JOIN courses c ON c.id = e.course_id;

SELECT title,
       LENGTH(title) AS length_title
FROM courses
UNION
SELECT email,
       LENGTH(email)
FROM users;

SELECT title,
       SUBSTRING(title FROM 1 FOR 10) AS short_title
FROM courses;

SELECT
    email,
    POSITION('@' IN email) AS position
FROM users;

SELECT
    title,
    POSITION('Java' IN title) AS position
FROM courses
WHERE POSITION('Java' IN title) > 0;

SELECT
    title,
    REPLACE(title, 'Java', 'JAVA') AS title_modified
FROM courses
WHERE POSITION('Java' IN title) > 0;

SELECT
    email,
    REVERSE(email) AS reverse_email
FROM users;










