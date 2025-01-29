-- BEGIN;

CREATE OR REPLACE FUNCTION func_minimum (VARIADIC arr NUMERIC[]) 
RETURNS NUMERIC AS $$
    BEGIN
        RETURN (SELECT MIN(i) FROM unnest($1) i);
    END;
$$ LANGUAGE plpgsql;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);

-- -- COMMIT;
-- ROLLBACK;

-- psql -d day09 -U postgres -f ex07/day09_ex07.sql

-- Упражнение 07 - Другой взгляд, чтобы найти минимум

-- Пожалуйста, напишите SQL или pl/pgsql функцию func_minimum (это зависит от вас), которая имеет
-- входной параметр, представляющий собой массив чисел, и функция должна возвращать минимальное значение.

-- Чтобы проверить себя и вызвать функцию, вы можете сделать оператор, подобный приведенному ниже.
-- SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);

------------

-- Please write an SQL or pl/pgsql function func_minimum (it is up to you) that has 
-- an input parameter that is an array of numbers and the function should return a minimum value.

-- To check yourself and call a function, you can make a statement like the one below.
-- SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);