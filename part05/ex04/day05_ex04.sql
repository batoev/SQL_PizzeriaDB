-- DROP INDEX idx_menu_unique;

CREATE UNIQUE INDEX idx_menu_unique ON menu (pizzeria_id, pizza_name);

SET enable_seqscan = off;
EXPLAIN ANALYZE
SELECT *
FROM menu
WHERE pizzeria_id = 2 AND pizza_name = 'mushroom pizza';

-- psql -d day05 -U postgres -f ex04/day05_ex04.sql

-- Упражнение 04 - Уникальность данных

-- Please create a unique BTree index with the name idx_menu_unique 
-- on the menu table for pizzeria_id and pizza_name columns. 
-- Please write and provide any SQL with proof (EXPLAIN ANALYZE) 
-- that index idx_menu_unique is working.

-- ПЕРЕВОД:

-- Пожалуйста, создайте уникальный индекс BTree с именем idx_menu_unique
-- в таблице меню для столбцов pizzeria_id и pizza_name. 
-- Пожалуйста, напишите и предоставьте любой SQL с доказательством (ОБЪЯСНИТЕ, ПРОАНАЛИЗИРУЙТЕ) 
-- этот индекс idx_menu_unique работает.

-- CREATE INDEX (использовался обычный CREATE INDEX)
-- SET
--                                                       QUERY PLAN                                                       
-- -----------------------------------------------------------------------------------------------------------------------
--  Index Scan using idx_menu_unique on menu  (cost=0.14..8.16 rows=1 width=80) (actual time=0.090..0.091 rows=1 loops=1)
--    Index Cond: ((pizzeria_id = 2) AND ((pizza_name)::text = 'mushroom pizza'::text))
--  Planning Time: 0.268 ms
--  Execution Time: 0.120 ms
-- (4 rows)

-- DROP INDEX
-- CREATE INDEX (использовался CREATE UNIQUE INDEX)
-- SET
--                                                       QUERY PLAN                                                       
-- -----------------------------------------------------------------------------------------------------------------------
--  Index Scan using idx_menu_unique on menu  (cost=0.14..8.16 rows=1 width=80) (actual time=0.059..0.059 rows=1 loops=1)
--    Index Cond: ((pizzeria_id = 2) AND ((pizza_name)::text = 'mushroom pizza'::text))
--  Planning Time: 0.241 ms
--  Execution Time: 0.080 ms
-- (4 rows)

-- План запроса показывает, как будет выполнена операция индексного сканирования на таблице menu. 
-- Используется индекс idx_menu_unique для извлечения данных из таблицы. 
-- Стоимость выполнения оценивается в диапазоне от 0.14 до 8.16, 
-- ожидается возвращение одной строки и ширина строк составляет 80 байт. 
-- Фактическое время выполнения операции составляет 0.059-0.059 миллисекунд, возвращается одна строка, 
-- операция будет выполнена один раз. Время планирования запроса составляет 0.241 миллисекунд, 
-- а общее время выполнения запроса - 0.080 миллисекунды.