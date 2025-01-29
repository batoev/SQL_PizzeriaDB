-- BEGIN;

CREATE OR REPLACE FUNCTION fnc_persons_male() 
RETURNS TABLE (
    id bigint,
    name varchar,
    age integer,
    gender varchar,
    address varchar
) AS $$
    SELECT *
    FROM person
    WHERE person.gender = 'male';
$$ LANGUAGE sql;

CREATE OR REPLACE FUNCTION fnc_persons_female() 
RETURNS TABLE (
    id bigint,
    name varchar,
    age integer,
    gender varchar,
    address varchar
) AS $$
    SELECT *
    FROM person
    WHERE person.gender = 'female';
$$ LANGUAGE sql;

SELECT *
FROM fnc_persons_male();

SELECT *
FROM fnc_persons_female();

-- -- COMMIT;
-- ROLLBACK;

-- psql -d day09 -U postgres -f ex04/day09_ex04.sql

-- Упражнение 04 - Представление базы данных В СРАВНЕНИИ с функцией базы данных

-- Как вы помните, мы создали 2 представления базы данных, чтобы отделить данные из таблиц person по признаку пола. 
-- Пожалуйста, определите 2 функции SQL (обратите внимание, не функции pl/pgsql) с именами:

-- fnc_persons_female (должен возвращать лиц женского пола),
-- fnc_persons_male (должен возвращать лиц мужского пола).
-- Чтобы проверить себя и вызвать функцию, вы можете сделать заявление, подобное этому 
-- (Удивительно! Вы можете работать с такой функцией, как виртуальная таблица!):

-- SELECT *
-- FROM fnc_persons_male();

-- SELECT *
-- FROM fnc_persons_female();

-----------

-- As you recall, we created 2 database views to separate data from the person tables by gender attribute. 
-- Please define 2 SQL functions (note, not pl/pgsql functions) with the names:

-- fnc_persons_female (should return female persons),
-- fnc_persons_male (should return male persons).
-- To check yourself and call a function, you can make a statement like this 
-- (Amazing! You can work with a function like a virtual table!):

-- SELECT *
-- FROM fnc_persons_male();

-- SELECT *
-- FROM fnc_persons_female();