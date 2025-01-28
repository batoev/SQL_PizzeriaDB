(SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
INNER JOIN menu ON pizzeria.id = menu.pizzeria_id
INNER JOIN person_order ON menu.id = person_order.menu_id
INNER JOIN person ON person_order.person_id = person.id
WHERE person.gender = 'female'
EXCEPT
SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
INNER JOIN menu ON pizzeria.id = menu.pizzeria_id
INNER JOIN person_order ON menu.id = person_order.menu_id
INNER JOIN person ON person_order.person_id = person.id
WHERE person.gender = 'male'
)
UNION
(SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
INNER JOIN menu ON pizzeria.id = menu.pizzeria_id
INNER JOIN person_order ON menu.id = person_order.menu_id
INNER JOIN person ON person_order.person_id = person.id
WHERE person.gender = 'male'
EXCEPT
SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
INNER JOIN menu ON pizzeria.id = menu.pizzeria_id
INNER JOIN person_order ON menu.id = person_order.menu_id
INNER JOIN person ON person_order.person_id = person.id
WHERE person.gender = 'female'
)
ORDER BY 1;


-- psql -d day03 -U postgres  -f ex04/day03_ex04.sql

-- Пожалуйста, найдите объединение пиццерий, у которых есть заказы либо от женщин, либо от мужчин. 
-- Другими словами, вы должны найти набор названий пиццерий, 
-- которые были заказаны только женщинами, и выполнить операцию "ОБЪЕДИНЕНИЕ" с набором названий пиццерий, 
-- которые были заказаны только мужчинами. 
-- Пожалуйста, обратите внимание на слово “только” для обоих полов. 
-- Для любых SQL-операторов с наборами не сохраняйте дубликаты (UNION, EXCEPT, INTERSECT). 
-- Пожалуйста, отсортируйте результат по названию пиццерии. Образец данных приведен ниже.

-- pizzeria_name
-- Papa Johns