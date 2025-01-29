SELECT DISTINCT p.name
FROM person_order AS por
INNER JOIN person AS p ON por.person_id = p.id
ORDER BY 1 ASC;

-- psql -d day07 -U postgres -f ex05/day07_ex05.sql

-- Упражнение 05 - Уникальность человека

-- Пожалуйста, напишите простой SQL-запрос, который возвращает
-- список уникальных имен людей, которые делали заказы в любых пиццериях. 
-- Результат должен быть отсортирован по имени человека. 
-- Пожалуйста, взгляните на пример ниже.

-- Не использовать: GROUP BY, any type (UNION,...) working with sets
-------------
-- Please write a simple SQL query that returns 
-- a list of unique person names who made orders in any pizzerias. 
-- The result should be sorted by person name. 
-- Please take a look at the sample below.

-- name
-- Andrey
-- Anna
-- ...