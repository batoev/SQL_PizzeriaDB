SELECT p.name, COUNT(*) AS count_of_visits
FROM person_visits AS pv
INNER JOIN person AS p ON pv.person_id = p.id
GROUP BY p.name
HAVING count(*) > 3
ORDER BY 2 DESC, 1 ASC;

-- psql -d day07 -U postgres -f ex04/day07_ex04.sql

-- Упражнение 04 - Предложение для групп

-- Пожалуйста, напишите SQL-инструкцию, которая возвращает имя
-- пользователя и соответствующее количество посещений в любых пиццериях, 
-- если пользователь посетил их более 3 раз (> 3).
-- Пожалуйста, взгляните на образец данных ниже.

-- Не использовать: WHERE
-----------
-- Please write a SQL statement that returns the person name 
-- and corresponding number of visits in any pizzerias 
-- if the person has visited more than 3 times (> 3).
-- Please take a look at the sample of data below.

-- name	        count_of_visits
-- Dmitriy	    4