SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
INNER JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
INNER JOIN person ON person_visits.person_id = person.id
WHERE person.name = 'Andrey'
EXCEPT
SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
INNER JOIN menu ON pizzeria.id = menu.pizzeria_id
INNER JOIN person_order ON menu.id = person_order.menu_id
INNER JOIN person ON person_order.person_id = person.id
WHERE person.name = 'Andrey'
ORDER BY 1;

-- psql -d day03 -U postgres  -f ex05/day03_ex05.sql

-- Пожалуйста, напишите SQL-инструкцию, которая возвращает список пиццерий, 
-- которые Андрей посетил, но не сделал ни одного заказа. 
-- Пожалуйста, заказывайте по названию пиццерии. Образец данных приведен ниже.

-- pizzeria_name
-- Pizza Hut