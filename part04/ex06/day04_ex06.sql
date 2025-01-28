CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
INNER JOIN menu ON pizzeria.id = menu.pizzeria_id
INNER JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
INNER JOIN person ON person_visits.person_id = person.id
WHERE person_visits.visit_date = '2022-01-08' AND person.name = 'Dmitriy' AND menu.price < 800;

-- SELECT *
-- FROM mv_dmitriy_visits_and_eats;

-- psql -d day04 -U postgres  -f ex02/day04_ex06.sql

-- Упражнение 06 - Материализация из виртуализации

-- Please create a Materialized View mv_dmitriy_visits_and_eats (with data included) 
-- based on SQL statement that finds the name of pizzeria Dmitriy visited on January 8, 2022 
-- and could eat pizzas for less than 800 rubles (this SQL you can find out at Day #02 Exercise #07).

-- To check yourself you can write SQL to Materialized View mv_dmitriy_visits_and_eats 
-- and compare results with your previous query.


-- Пожалуйста, создайте материализованное представление mv_dmitriy_visits_and_eats (с включенными данными) 
-- на основе SQL-инструкции, которая находит название пиццерии, которую Дмитрий посетил 8 января 2022
-- года и мог съесть пиццу менее чем за 800 рублей (этот SQL вы можете узнать в День #02, упражнение #07).

-- Чтобы проверить себя, вы можете написать SQL в Materialized View mv_dmitriy_visits_and_eats
-- и сравнить результаты с вашим предыдущим запросом.

--Вопрос: INNER JOIN person_visits ON menu.pizzeria_id = person_visits.pizzeria_id - почему так было в чек листе 2го дня?