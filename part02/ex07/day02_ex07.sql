SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
INNER JOIN menu ON pizzeria.id = menu.pizzeria_id
INNER JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
INNER JOIN person ON person_visits.person_id = person.id
WHERE person_visits.visit_date = '2022-01-08' AND person.name = 'Dmitriy' AND menu.price < 800;

-- Пожалуйста, найдите название пиццерии, которую Дмитрий посетил 8 января 2022 года 
-- и смог съесть пиццу менее чем за 800 рублей.