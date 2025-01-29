-- BEGIN;

CREATE OR REPLACE FUNCTION fnc_fibonacci(IN pstop INTEGER DEFAULT 10)
RETURNS TABLE (num INTEGER)
LANGUAGE plpgsql
AS $$
DECLARE
    fib1 INTEGER := 0;
    fib2 INTEGER := 1;
    fib3 INTEGER := 1;  
BEGIN
    WHILE fib1 < pstop LOOP
        num := fib1;
        RETURN NEXT;
        fib1 := fib2;
        fib2 := fib3;
        fib3 := fib1 + fib2;
    END LOOP;
END;
$$;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();

-- ROLLBACK;
-- -- COMMIT;

-- BEGIN;

-- CREATE OR REPLACE FUNCTION fnc_fibonacci(IN pstop INTEGER DEFAULT 10)
-- RETURNS TABLE(num INTEGER) AS $$
--     WITH RECURSIVE cte_fibonacci(num1, num2) AS (
--         VALUES (0, 1)
--         UNION ALL
--             SELECT
--             GREATEST(num1, num2), num1 + num2
--         FROM cte_fibonacci
--             WHERE num2 < pstop
--     )
--     SELECT num1 FROM cte_fibonacci;
-- $$ LANGUAGE sql;

-- select * from fnc_fibonacci(100);
-- select * from fnc_fibonacci();

-- ROLLBACK;
-- -- COMMIT;

-- psql -d day09 -U postgres -f ex08/day09_ex08.sql

-- Упражнение 08 - Алгоритм Фибоначчи находится в функции

-- Напишите SQL или pl/pgsql функцию func_fibonacci (это зависит от вас), 
-- которая имеет входной параметр stop типа INTEGER (по умолчанию - 10), 
-- а выходные данные функции представляют собой таблицу всех чисел Фибоначчи, меньших stop.

-- Чтобы проверить себя и вызвать функцию, вы можете сделать оператор, подобный приведенному ниже.

-- select * from fnc_fibonacci(100);
-- select * from fnc_fibonacci();

--------------

-- Write an SQL or pl/pgsql function fnc_fibonacci (it's up to you) 
-- that has an input parameter pstop of type INTEGER (default is 10) 
-- and the function output is a table of all Fibonacci numbers less than pstop.

-- To check yourself and call a function, you can make a statement like the one below.

-- select * from fnc_fibonacci(100);
-- select * from fnc_fibonacci();

