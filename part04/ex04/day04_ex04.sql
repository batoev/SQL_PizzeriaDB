CREATE VIEW v_symmetric_union AS
(SELECT person_id
FROM person_visits
WHERE visit_date = '2022-01-02'
EXCEPT
SELECT person_id
FROM person_visits
WHERE visit_date = '2022-01-06')
UNION
(SELECT person_id
FROM person_visits
WHERE visit_date = '2022-01-06'
EXCEPT
SELECT person_id
FROM person_visits
WHERE visit_date = '2022-01-02')
ORDER BY 1;

-- SELECT person_id
-- FROM v_symmetric_union;

-- psql -d day04 -U postgres  -f ex04/day04_ex04.sql

-- Упражнение 04 - Давайте найдем что-нибудь из теории множеств

-- Please write a SQL statement which satisfies a formula (R - S)∪(S - R) . 
-- Where R is the person_visits table with filter by 2nd of January 2022, 
-- S is also person_visits table but with a different filter by 6th of January 2022. 
-- Please make your calculations with sets under the person_id column 
-- and this column will be alone in a result. 
-- The result please sort by person_id column 
-- and your final SQL please present in v_symmetric_union (*) database view.

-- (*) to be honest, the definition “symmetric union” doesn’t exist in Set Theory. 
-- This is the author's interpretation, the main idea is based on the existing rule of symmetric difference.

-- Пожалуйста, напишите инструкцию SQL, которая удовлетворяет формуле (R - S)∪(S - R). 
-- Где R - таблица person_visits с фильтром ко 2 января 2022 года, 
-- S - это также таблица person_visits, но с другим фильтром к 6 января 2022 года. 
-- Пожалуйста, произведите свои расчеты с наборами в столбце person_id
-- , и этот столбец будет единственным в результате. 
-- Результат, пожалуйста, отсортируйте по столбцу person_id
-- , а ваш окончательный SQL, пожалуйста, представьте в представлении базы данных v_symmetric_union (*).

-- (*) честно говоря, определения “симметричного объединения” в теории множеств не существует. 
-- Это авторская интерпретация, основная идея основана на существующем правиле симметричного различия.