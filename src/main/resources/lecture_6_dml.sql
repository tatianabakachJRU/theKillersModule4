UPDATE courses
SET price = 400
WHERE title = 'Java для начинающих';

DELETE
FROM reviews
WHERE user_id = 1
  AND course_id = 5;

SELECT *
FROM public_user
WHERE role = 'teacher';

SELECT *
FROM course_info
WHERE category = 'Java';

INSERT INTO users(email, role)
VALUES ('email@example.com', 'admin');

INSERT INTO users_archive (id, full_name, email)
SELECT id,
       full_name,
       email
FROM users u
WHERE u.role = 'student';

UPDATE users
SET email = 'tatiana@example.com'
WHERE id = 2;

UPDATE courses
SET price = price * 1.1
WHERE price IS NOT NULL;

UPDATE users
    SET role = 'admin';

UPDATE courses
SET paid_count = paid_status.count
    FROM(
        SELECT course_id, COUNT(*) AS count
        FROM payments
        WHERE status = 'completed'
        GROUP BY course_id
        ) AS paid_status
WHERE courses.id = paid_status.course_id;

DELETE FROM reviews
WHERE user_id = 3 AND course_id = 4;

TRUNCATE TABLE reviews;