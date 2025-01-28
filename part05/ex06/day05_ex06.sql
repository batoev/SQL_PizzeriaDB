DROP INDEX idx_1;
CREATE INDEX idx_1 ON pizzeria (rating);
EXPLAIN ANALYZE
SELECT
    m.pizza_name AS pizza_name,
    max(rating) OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
FROM  menu m
INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY 1,2;

-- psql -d day05 -U postgres -f ex06/day05_ex06.sql

-- Упражнение 06 - Давайте улучшим производительность

-- Please take a look at SQL below from a technical perspective 
-- (ignore a logical case of that SQL statement) .

-- SELECT
--     m.pizza_name AS pizza_name,
--     max(rating) OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
-- FROM  menu m
-- INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
-- ORDER BY 1,2;

-- Create a new BTree index with name idx_1 which should improve 
-- the “Execution Time” metric of this SQL. 
-- Please provide proof (EXPLAIN ANALYZE) that SQL was improved.

-- Hint: this exercise looks like a “brute force” task to find 
-- a good covering index therefore before your new test remove idx_1 index.

-- Sample of my improvement:

-- ПЕРЕВОД:

-- Пожалуйста, взгляните на SQL ниже с технической точки зрения
-- (игнорируйте логический случай этого оператора SQL).

-- SELECT
--     m.pizza_name AS pizza_name,
--     max(rating) OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
-- FROM  menu m
-- INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
-- ORDER BY 1,2;

-- Создайте новый индекс BTree с именем idx_1, который должен улучшить
-- показатель “Время выполнения” этого SQL. 
-- Пожалуйста, предоставьте доказательства (ОБЪЯСНИТЕ АНАЛИЗ) того, что SQL был улучшен.

-- Подсказка: это упражнение выглядит как задача “грубой силы”, чтобы найти
-- хороший покрывающий индекс, поэтому перед вашим новым тестом удалите индекс idx_1.

-- Пример моего улучшения:
-- DROP INDEX
-- CREATE INDEX
--                                                              QUERY PLAN                                                             
-- ------------------------------------------------------------------------------------------------------------------------------------
--  Sort  (cost=3.57..3.62 rows=19 width=96) (actual time=0.107..0.109 rows=19 loops=1)
--    Sort Key: m.pizza_name, (max(pz.rating) OVER (?))
--    Sort Method: quicksort  Memory: 26kB
--    ->  WindowAgg  (cost=2.79..3.17 rows=19 width=96) (actual time=0.064..0.074 rows=19 loops=1)
--          ->  Sort  (cost=2.79..2.84 rows=19 width=64) (actual time=0.053..0.055 rows=19 loops=1)
--                Sort Key: pz.rating
--                Sort Method: quicksort  Memory: 26kB
--                ->  Hash Join  (cost=1.14..2.39 rows=19 width=64) (actual time=0.033..0.038 rows=19 loops=1)
--                      Hash Cond: (m.pizzeria_id = pz.id)
--                      ->  Seq Scan on menu m  (cost=0.00..1.19 rows=19 width=40) (actual time=0.005..0.005 rows=19 loops=1)
--                      ->  Hash  (cost=1.06..1.06 rows=6 width=40) (actual time=0.013..0.014 rows=6 loops=1)
--                            Buckets: 1024  Batches: 1  Memory Usage: 9kB
--                            ->  Seq Scan on pizzeria pz  (cost=0.00..1.06 rows=6 width=40) (actual time=0.003..0.004 rows=6 loops=1)
--  Planning Time: 0.540 ms
--  Execution Time: 0.185 ms
-- (15 rows)

-- DROP INDEX
-- CREATE INDEX
--                                                              QUERY PLAN                                                             
-- ------------------------------------------------------------------------------------------------------------------------------------
--  Sort  (cost=3.57..3.62 rows=19 width=96) (actual time=0.079..0.080 rows=19 loops=1)
--    Sort Key: m.pizza_name, (max(pz.rating) OVER (?))
--    Sort Method: quicksort  Memory: 26kB
--    ->  WindowAgg  (cost=2.79..3.17 rows=19 width=96) (actual time=0.057..0.067 rows=19 loops=1)
--          ->  Sort  (cost=2.79..2.84 rows=19 width=64) (actual time=0.049..0.051 rows=19 loops=1)
--                Sort Key: pz.rating
--                Sort Method: quicksort  Memory: 26kB
--                ->  Hash Join  (cost=1.14..2.39 rows=19 width=64) (actual time=0.036..0.040 rows=19 loops=1)
--                      Hash Cond: (m.pizzeria_id = pz.id)
--                      ->  Seq Scan on menu m  (cost=0.00..1.19 rows=19 width=40) (actual time=0.004..0.005 rows=19 loops=1)
--                      ->  Hash  (cost=1.06..1.06 rows=6 width=40) (actual time=0.015..0.016 rows=6 loops=1)
--                            Buckets: 1024  Batches: 1  Memory Usage: 9kB
--                            ->  Seq Scan on pizzeria pz  (cost=0.00..1.06 rows=6 width=40) (actual time=0.004..0.005 rows=6 loops=1)
--  Planning Time: 0.184 ms
--  Execution Time: 0.115 ms
-- (15 rows)