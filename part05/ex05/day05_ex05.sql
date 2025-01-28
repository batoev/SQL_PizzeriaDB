-- DROP INDEX idx_person_order_order_date;
CREATE UNIQUE INDEX idx_person_order_order_date ON person_order (person_id, menu_id)
WHERE order_date = '2022-01-01';

SET enable_seqscan = off;
EXPLAIN ANALYZE
SELECT person_id, menu_id, order_date
FROM person_order
WHERE person_id = 1 AND order_date = '2022-01-01';

-- psql -d day05 -U postgres -f ex05/day05_ex05.sql

-- Упражнение 05 - Частичная уникальность данных

-- Please create a partial unique BTree index with 
-- the name idx_person_order_order_date on the person_order table 
-- for person_id and menu_id attributes with partial uniqueness 
-- for order_date column for date ‘2022-01-01’.

-- The EXPLAIN ANALYZE command should return the next pattern:
-- "Index Only Scan using idx_person_order_order_date on person_order …"

-- ПЕРЕВОД:

-- Пожалуйста, создайте частичный уникальный индекс BTree с
-- именем idx_person_order_order_date в таблице
-- person_order для атрибутов person_id и menu_id с частичной уникальностью
-- для столбца order_date для даты ‘2022-01-01’.

-- Команда EXPLAIN ANALYZE должна возвращать следующий шаблон:
-- "Index Only Scan using idx_person_order_order_date on person_order …"

-- DROP INDEX
-- CREATE INDEX
-- SET
--                                                                 QUERY PLAN                                                                 
-- -------------------------------------------------------------------------------------------------------------------------------------------
--  Index Scan using idx_person_order_order_date on person_order  (cost=0.13..8.15 rows=1 width=20) (actual time=0.046..0.047 rows=2 loops=1)
--    Index Cond: (person_id = 1)
--  Planning Time: 0.322 ms
--  Execution Time: 0.062 ms
-- (4 rows)

-- В данном случае выполняется запрос, который использует индекс для выполнения операции сканирования. 
-- Используется индекс `idx_person_order_order_date`, 
-- который связан с таблицей `person_order`. Строка `Index Cond: (person_id = 1)` указывает на условие, 
-- которое ограничивает сканирование только на записи, где `person_id` равно 1. 
-- Этот индексной поиск выполняется с низкой стоимостью (0.13), и в данный момент этот запрос вернул 2 строки. 
-- Время планирования составило 0.322 мс, а время выполнения - 0.062 мс.


-- SELECT *
-- FROM person_order
-- WHERE order_date = '2022-01-01';
