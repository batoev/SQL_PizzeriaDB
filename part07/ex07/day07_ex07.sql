SELECT ROUND(AVG(pizzeria.rating), 4) AS global_rating
FROM pizzeria;

-- psql -d day07 -U postgres -f ex07/day07_ex07.sql

-- Упражнение 07 - Средний глобальный рейтинг

-- Пожалуйста, напишите SQL-инструкцию, которая возвращает общий средний рейтинг
-- (имя выходного атрибута - global_rating) для всех ресторанов. 
-- Округлите ваш средний рейтинг до 4 чисел с плавающей запятой.
----------
-- Please write a SQL statement that returns a common average rating 
-- (the output attribute name is global_rating) for all restaurants. 
-- Round your average rating to 4 floating numbers.