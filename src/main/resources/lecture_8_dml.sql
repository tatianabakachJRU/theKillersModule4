BEGIN;

INSERT INTO users(name, email)
VALUES ('Anna', 'anna.ivanova1@example.com')
RETURNING id;

INSERT INTO profiles(user_id, bio, birth_date, height, avatar)
VALUES (99, 'Java-разработчик, который любит транзакции', '1990-05-15', 180.5, NULL);

COMMIT;
ROLLBACK;

CREATE FUNCTION calculate_age(birth_date DATE)
    RETURNS INTEGER
    LANGUAGE sql
AS
$$
SELECT EXTRACT(YEAR FROM AGE(CURRENT_DATE, birth_date))::INT
$$;

SELECT calculate_age(birth_date) AS age, name
FROM profiles
         JOIN public.users u on u.id = profiles.user_id;

CREATE FUNCTION get_user_info(
    IN p_name VARCHAR,
    OUT p_id INT,
    OUT p_age INT,
    OUT p_bio TEXT
)
    RETURNS RECORD
    LANGUAGE plpgsql
AS
$$
BEGIN
    SELECT u.id,
           EXTRACT(YEAR FROM AGE(CURRENT_DATE, birth_date))::INT,
           p.bio
    INTO p_id, p_age, p_bio
    FROM users u
             JOIN public.profiles p on u.id = p.user_id
    WHERE u.name = p_name;
END;
$$