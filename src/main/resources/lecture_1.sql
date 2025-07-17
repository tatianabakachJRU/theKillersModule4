CREATE DATABASE cat;

DROP DATABASE cat;

CREATE TABLE cats
(
    id    BIGSERIAL PRIMARY KEY,
    name  VARCHAR(100) NOT NULL,
    color VARCHAR(50),
    age   INT          NOT NULL
);
CREATE TABLE cat_owners
(
    id    BIGSERIAL PRIMARY KEY,
    name  VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    cat_id BIGINT REFERENCES cats(id)
);

INSERT INTO cats(name, color, age) VALUES
                                       ('Мурзик', 'черный', 3),
                                       ('Барсик', 'белый', 10),
                                       ('Маня', 'рыжий', 5),
                                       ('Пупсик', 'белый', 7);

INSERT INTO cat_owners(name, phone, cat_id) VALUES
                                                ('Иван Иванов', '+645843853408', 1),
                                                ('Ольга Смирнова', '+645843853467', 2),
                                                ('Денис Кравцов', '+645843853490', 3),
                                                ('Светлана Пермякова', '+645843853456',  NULL);

SELECT * FROM cats;
SELECT * FROM cat_owners;

SELECT co.name AS owner_name, c.name AS cat_name
FROM cat_owners co
         JOIN cats c on c.id = co.cat_id;

SELECT name FROM cat_owners
WHERE cat_id IS NULL;

SELECT * FROM cats
WHERE color = 'черный' OR age > 5;

SELECT * FROM cats
WHERE age BETWEEN 2 AND 5;

SELECT * FROM cats
WHERE color IN('черный', 'рыжий');

SELECT * FROM cats
WHERE name LIKE '%ик';

SELECT * FROM cats
WHERE name LIKE '_а%';

SELECT * FROM cats
LIMIT 2 OFFSET 2;

SELECT DISTINCT color FROM cats;

SELECT * FROM cats
ORDER BY age;



