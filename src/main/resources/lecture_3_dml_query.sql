SELECT *
FROM users,
     courses,
     lessons;

SELECT users.first_name, users.last_name, courses.title
FROM users,
     courses
WHERE role = 'student';

SELECT u.first_name, u.last_name, c.title
FROM users AS u,
     courses c,
     enrollments e
WHERE role = 'student'
  AND u.id = e.user_id
  AND c.id = e.course_id;

SELECT users.first_name AS имя,
       users.last_name  AS фамилия,
       users.email      AS почта
FROM users
WHERE role = 'teacher';

SELECT student_name,
       cource_count
FROM (SELECT u.first_name || ' ' || u.last_name AS student_name,
             COUNT(e.id)                        AS cource_count
      FROM users u
               LEFT JOIN enrollments e ON u.id = e.user_id
      WHERE u.role = 'student'
      GROUP BY u.id, u.first_name, u.last_name) AS student_stat
WHERE cource_count > 0;

SELECT c.title AS cource_title
FROM courses c
WHERE c.teacher_id = 4;

INSERT INTO user_course_progress(user_id, course_id, progress_percent)
VALUES (1, 1, 100),
       (1, 2, 75),
       (2, 1, 100);

-- Запрос упадет с ошибкой
INSERT INTO user_course_progress(user_id, course_id, progress_percent)
VALUES (1, 1, 20);

SELECT email
FROM users
WHERE role = 'student'
UNION
SELECT email
FROM users
WHERE role = 'admin';

SELECT u.first_name, u.last_name, c.title AS cource_title
FROM users u
         INNER JOIN enrollments e ON u.id = e.user_id
         INNER JOIN courses c ON c.id = e.course_id
ORDER BY u.first_name, u.last_name, c.title;

SELECT u.first_name, u.last_name, c.title AS cource_title
FROM users u
         LEFT JOIN enrollments e ON u.id = e.user_id
         LEFT JOIN courses c ON c.id = e.course_id
ORDER BY u.first_name, u.last_name, c.title;

SELECT u.first_name, u.last_name, c.title AS cource_title
FROM users u
         RIGHT JOIN enrollments e ON u.id = e.user_id
         RIGHT JOIN courses c ON c.id = e.course_id
ORDER BY u.first_name, u.last_name, c.title;

SELECT u.first_name, u.last_name, c.title AS cource_title
FROM users u
         FULL JOIN enrollments e ON u.id = e.user_id
         FULL JOIN courses c ON c.id = e.course_id
ORDER BY u.first_name, u.last_name, c.title;

SELECT c.title                                                       AS cource_title,
       u.first_name                                                  AS teacher_first_name,
       u.last_name                                                   AS teacher_last_name,
       (SELECT COUNT(*) FROM enrollments e WHERE c.id = e.course_id) AS total_students
FROM courses c
         JOIN users u ON u.id = c.teacher_id
WHERE u.role = 'teacher'
ORDER BY total_students DESC;

SELECT c.title AS cource_title, COUNT(e.id) AS student_count
FROM courses c
         LEFT JOIN enrollments e ON c.id = e.course_id
GROUP BY c.id, c.title
HAVING COUNT(e.id) > 1
ORDER BY student_count DESC;

SELECT c.title                        AS cource_title,
       (SELECT COUNT(*) FROM courses) AS total_cources
FROM courses c
ORDER BY c.title;

SELECT AVG(price)
FROM courses;

SELECT c.title AS cource_title,
       c.price AS cource_price
FROM courses c
WHERE c.price > (SELECT AVG(price) FROM courses)
ORDER BY c.price;

SELECT u.first_name, u.last_name
FROM users u
WHERE u.role = 'student'
  AND u.id IN (SELECT e.user_id
               FROM enrollments e
                        JOIN courses c ON e.course_id = c.id
               WHERE title = 'Java для начинающих');

WITH student_couces AS (
SELECT u.first_name, u.last_name, COUNT(e.id) AS cource_count
                        FROM users u
                        JOIN enrollments e ON u.id = e.user_id
                        WHERE u.role = 'student'
                        GROUP BY u.first_name, u.last_name )
SELECT  sc.first_name, sc.last_name, sc.cource_count
FROM student_couces sc
WHERE sc.cource_count > 1;













