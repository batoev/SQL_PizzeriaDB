-- BEGIN;

DROP FUNCTION IF EXISTS fnc_persons_male;
DROP FUNCTION IF EXISTS fnc_persons_female;

CREATE OR REPLACE FUNCTION fnc_persons(IN pgender varchar DEFAULT 'female') 
RETURNS TABLE (
    id bigint,
    name varchar,
    age integer,
    gender varchar,
    address varchar
) AS $$
    SELECT *
    FROM person
    WHERE person.gender = pgender;
$$ LANGUAGE sql;

select *
from fnc_persons(pgender := 'male');

select *
from fnc_persons();

-- -- COMMIT;
-- ROLLBACK;

-- psql -d day09 -U postgres -f ex05/day09_ex05.sql

-- Упражнение 05 - Параметризованная функция базы данных

-- Похоже, что 2 функции из упражнения 04 нуждаются в более общем подходе. 
-- Пожалуйста, удалите эти функции из базы данных, прежде чем продолжить. 
-- Напишите универсальную SQL-функцию (обратите внимание, не pl/pgsql-функцию) с именем fnc_persons. 
-- Эта функция должна иметь в параметре gender значение по умолчанию = 'female'.

-- Чтобы проверить себя и вызвать функцию, вы можете сделать заявление, подобное этому 
-- (Вау! Вы можете работать с функцией, как с виртуальной таблицей, но с большей гибкостью!):

-- select *
-- from fnc_persons(pgender := 'male');

-- select *
-- from fnc_persons();

-----------

-- Looks like 2 functions from Exercise 04 need a more generic approach. 
-- Please remove these functions from the database before proceeding. 
-- Write a generic SQL function (note, not pl/pgsql-function) called fnc_persons. 
-- This function should have an IN parameter pgender with the default value = 'female'.

-- To check yourself and call a function, you can make a statement like this 
-- (Wow! You can work with a function like with a virtual table, but with more flexibility!):

-- select *
-- from fnc_persons(pgender := 'male');

-- select *
-- from fnc_persons();