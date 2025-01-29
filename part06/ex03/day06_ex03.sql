-- DROP INDEX idx_person_discounts_unique;

CREATE UNIQUE INDEX idx_person_discounts_unique ON person_discounts (person_id, pizzeria_id);

SET enable_seqscan = off;
EXPLAIN ANALYZE
SELECT * 
FROM person_discounts
WHERE person_id = 2 AND pizzeria_id = 2;

-- psql -d day05 -U postgres -f ex03/day06_ex03.sql

-- Упражнение 03 - Улучшения в некотором роде есть

-- На самом деле, нам нужно улучшить согласованность данных, 
-- с одной стороны, и настроить производительность, с другой. 
-- Пожалуйста, создайте многоколоночный уникальный индекс 
-- (с именем idx_person_discounts_unique), 
-- который предотвращает дублирование парных значений идентификаторов person и pizzeria.

-- После создания нового индекса, пожалуйста, предоставьте любую простую инструкцию SQL, 
-- которая показывает доказательство использования индекса (с помощью EXPLAIN ANALYZE). 
-- Пример “доказательства” приведен ниже:

-- ...
-- Index Scan using idx_person_discounts_unique on person_discounts
-- ...
------------------

-- Actually, we have to make improvements to data 
-- consistency from one side and performance tuning from the other side. 
-- Please create a multicolumn unique index 
-- (with name idx_person_discounts_unique) 
-- that prevents duplicates of pair values person and pizzeria identifiers.

-- After creation of a new index, please provide any simple SQL statement 
-- that shows proof of index usage (by using EXPLAIN ANALYZE). 
-- The example of “proof” is below