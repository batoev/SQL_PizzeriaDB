CREATE INDEX idx_person_order_multi ON person_order (person_id, menu_id, order_date);
SET enable_seqscan = off;
EXPLAIN ANALYZE
SELECT person_id, menu_id, order_date
FROM person_order
WHERE person_id = 8 AND menu_id = 19;

-- psql -d day05 -U postgres -f ex03/day05_ex03.sql

-- Упражнение 03 - Многоколоночный индекс для наших целей

-- Please create a better multicolumn B-Tree index with 
-- the name idx_person_order_multi for the SQL statement below.

-- SELECT person_id, menu_id,order_date
-- FROM person_order
-- WHERE person_id = 8 AND menu_id = 19;

-- The EXPLAIN ANALYZE command should return the next pattern. 
-- Please pay attention to "Index Only Scan" scanning!
-- "Index Only Scan using idx_person_order_multi on person_order ..."

-- Please provide any SQL with proof (EXPLAIN ANALYZE) 
-- that index idx_person_order_multi is working.

-- ПЕРЕВОД:

-- Пожалуйста, создайте лучший многоколоночный индекс B-дерева с
-- именем idx_person_order_multi для приведенной ниже инструкции SQL:

-- SELECT person_id, menu_id,order_date
-- FROM person_order
-- WHERE person_id = 8 AND menu_id = 19;

-- Команда EXPLAIN ANALYZE должна вернуть следующий шаблон. 
-- Пожалуйста, обратите внимание на сканирование "Только по индексу"!
-- "Index Only Scan using idx_person_order_multi on person_order ..."

-- Пожалуйста, предоставьте любой SQL с доказательством (ОБЪЯСНИТЕ АНАЛИЗ) 
-- что индекс idx_person_order_multi работает.

-- CREATE INDEX
-- SET
--                                                                 QUERY PLAN                                                                 
-- -------------------------------------------------------------------------------------------------------------------------------------------
--  Index Only Scan using idx_person_order_multi on person_order  (cost=0.14..8.16 rows=1 width=20) (actual time=0.548..0.548 rows=0 loops=1)
--    Index Cond: ((person_id = 8) AND (menu_id = 19))
--    Heap Fetches: 0
--  Planning Time: 5.127 ms
--  Execution Time: 1.153 ms
-- (5 rows)

-- Данный план запроса показывает информацию о выполнении индексного сканирования 
-- для запроса на таблицу `person_order`.

-- 1. `Index Only Scan using idx_person_order_multi` 
-- - указывает на использование индексного сканирования 
-- с использованием индекса `idx_person_order_multi` на таблице `person_order`. 
-- Индексное сканирование позволяет эффективно извлекать данные, используя индекс, без необходимости обращаться к основной таблице данных.

-- 2. `cost=0.14..8.16` - представляет оценочные затраты на выполнение операции 
-- индексного сканирования. В данном случае, стоимость оценивается в 
-- диапазоне от 0.14 до 8.16.

-- 3. `rows=1` - указывает на оценочное количество строк, которые возвращаются 
-- после выполнения операции индексного сканирования. 
-- В данном случае, ожидается возвращение одной строки.

-- 4. `width=20` - указывает на ожидаемую ширину возвращаемых строк в байтах.

-- 5. `actual time=0.548` - показывает фактическое время выполнения операции 
-- индексного сканирования в миллисекундах.

-- 6. `rows=0` - указывает на фактическое количество строк, выбранных после 
-- применения условий индексного поиска. 
-- В данном случае, ни одна строка не удовлетворяет 
-- условиям `(person_id = 8) AND (menu_id = 19)`.

-- 7. `Heap Fetches: 0` - показывает количество обращений к основной таблице данных, 
-- которые были необходимы для получения данных после индексного сканирования. 
-- В данном случае, не было необходимости обращаться к основной таблице, 
-- так как все данные были доступны в индексе.

-- 8. `Planning Time: 5.127 ms` - представляет время, 
-- затраченное на планирование выполнения запроса.

-- 9. `Execution Time: 1.153 ms` - представляет время, 
-- затраченное на выполнение запроса, включая время планирования.