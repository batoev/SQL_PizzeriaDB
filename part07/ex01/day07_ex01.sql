SELECT p.name, COUNT(*) AS count_of_visits
FROM person_visits AS pv
INNER JOIN person AS p ON pv.person_id = p.id
GROUP BY p.name
ORDER BY 2 DESC, 1 ASC
limit 4;

-- psql -d day07 -U postgres -f ex01/day07_ex01.sql

-- Упражнение 01 - Давайте посмотрим на настоящие имена

-- Пожалуйста, измените инструкцию SQL из упражнения 00 и верните имя пользователя (не идентификатор). 
-- Дополнительное условие - нам нужно видеть только топ-4 пользователей
-- с максимальным количеством посещений в любых пиццериях и отсортированных по имени пользователя. 
-- Пожалуйста, взгляните на пример выходных данных ниже.

-- Please change a SQL statement from Exercise 00 and return a person name (not identifier). 
-- Additional clause is we need to see only top-4 persons 
-- with maximal visits in any pizzerias and sorted by a person name. 
-- Please take a look at the example of output data below.

-- name	    count_of_visits
-- Dmitriy	4
-- Denis	3
-- ...	    ...