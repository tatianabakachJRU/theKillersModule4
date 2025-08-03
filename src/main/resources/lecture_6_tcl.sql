BEGIN;

INSERT INTO enrollments(user_id, course_id)
VALUES (4, 1);

INSERT INTO enrollments(user_id, course_id)
VALUES (999, 1);

INSERT INTO enrollments(user_id, course_id)
VALUES (3, 1);

COMMIT;
ROLLBACK;