SET enable_seqscan = off;
EXPLAIN ANALYZE
SELECT menu.pizza_name, pizzeria.name AS pizzeria_name
FROM pizzeria
INNER JOIN menu ON pizzeria.id = menu.pizzeria_id;

-- psql -d day05 -U postgres -f ex01/day05_ex01.sql

-- Упражнение 01 - Как убедиться, что индекс работает?

-- Before further steps please write 
-- a SQL statement that returns pizzas’ and corresponding pizzeria names. 
-- Please take a look at the sample result below (no sort needed).

-- pizza_name	    pizzeria_name
-- cheese pizza	    Pizza Hut
-- ...	            ...

-- Let’s provide proof that your indexes are working for your SQL. 
-- The sample of proof is the output of the EXPLAIN ANALYZE command. 
-- Please take a look at the sample output command.

-- Hint: please think why your indexes are not working 
-- in a direct way and what should we do to enable it?

-- ПЕРЕВОД:

-- Перед дальнейшими действиями, пожалуйста, напишите 
-- инструкцию SQL, которая возвращает названия пицц и соответствующих пиццерий. 
-- Пожалуйста, взгляните на пример результата ниже (сортировка не требуется).

-- pizza_name	    pizzeria_name
-- cheese pizza	    Pizza Hut
-- ...	            ...

-- Давайте предоставим доказательство того, что ваши индексы работают для вашего SQL. 
-- Примером доказательства является вывод команды EXPLAIN ANALYZE. 
-- Пожалуйста, взгляните на пример команды вывода.

-- Подсказка: пожалуйста, подумайте, почему ваши индексы не работают
-- напрямую и что мы должны сделать, чтобы это включить?