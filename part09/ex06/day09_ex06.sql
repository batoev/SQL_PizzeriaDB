-- BEGIN;

-- DROP FUNCTION IF EXISTS fnc_person_visits_and_eats_on_date;

CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
    IN pperson varchar DEFAULT 'Dmitriy',
    IN pprice numeric DEFAULT 500,
    IN pdate date DEFAULT '2022-01-08'
    ) 
RETURNS TABLE (
    name varchar
) AS $$
    BEGIN
    RETURN QUERY
    SELECT DISTINCT p.name
    FROM pizzeria p
    INNER JOIN person_visits pv ON p.id = pv.pizzeria_id
    INNER JOIN menu m ON p.id = m.pizzeria_id
    INNER JOIN person ON person.id = pv.person_id
    WHERE person.name = pperson AND m.price < pprice AND pv.visit_date = pdate;
    END;
$$ LANGUAGE plpgsql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');

-- -- COMMIT;
-- ROLLBACK;

-- psql -d day09 -U postgres -f ex06/day09_ex06.sql

-- Упражнение 06 - Функционируйте как функция-оболочка

-- Теперь давайте рассмотрим функции pl/pgsql.

-- Пожалуйста, создайте функцию pl/pgsql
-- fnc_person_visits_and_eats_on_date на основе инструкции SQL, которая будет находить названия пиццерий, 
-- которые посетитель ((В параметре person со значением по умолчанию "Дмитрий") 
-- посетил и где он мог купить пиццу дешевле указанной суммы в рублях 
-- ((В параметре price со значением по умолчанию 500) на указанную дату
-- ((В параметре update со значением по умолчанию 8 января 2022 г.).

-- Чтобы проверить себя и вызвать функцию, вы можете сделать заявление, подобное приведенному ниже.

-- select *
-- from fnc_person_visits_and_eats_on_date(pprice := 800);

-- select *
-- from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');

-----------

-- Now let's look at pl/pgsql functions.

-- Please create a pl/pgsql function fnc_person_visits_and_eats_on_date based 
-- on an SQL statement that will find the names of pizzerias that a person 
-- (IN pperson parameter with default value 'Dmitriy') 
-- visited and where he could buy pizza for less than the given amount in rubles 
-- (IN pprice parameter with default value 500) on the given date 
-- (IN pdate parameter with default value January 8, 2022).

-- To check yourself and call a function, you can make a statement like the one below.

-- select *
-- from fnc_person_visits_and_eats_on_date(pprice := 800);

-- select *
-- from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');