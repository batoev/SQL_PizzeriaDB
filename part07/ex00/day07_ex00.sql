SELECT person_id, COUNT(*) AS count_of_visits
FROM person_visits
GROUP BY person_id
ORDER BY 2 DESC, 1 ASC;

-- SELECT *
-- FROM person_visits;

-- psql -d day07 -U postgres -f ex00/day07_ex00.sql

-- Упражнение 00 - Простая агрегированная информация

-- Давайте сделаем простую агрегацию, пожалуйста, напишите SQL-инструкцию, 
-- которая возвращает идентификаторы пользователей и соответствующее количество посещений в любых пиццериях
-- и сортировку по количеству посещений в режиме убывания и сортировку по person_id в режиме возрастания. 
-- Пожалуйста, взгляните на образец данных ниже.
------------
-- Let’s make a simple aggregation, please write a SQL statement 
-- that returns person identifiers and corresponding number of visits in any pizzerias 
-- and sorting by count of visits in descending mode and sorting in person_id in ascending mode. 
-- Please take a look at the sample of data below.

-- person_id	count_of_visits
-- 9	        4
-- 4	        3
-- ...	        ...