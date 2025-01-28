SELECT person.name AS person_name, menu.pizza_name, pizzeria.name AS pizzeria_name
FROM person_order 
JOIN person ON person_order.person_id = person.id
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
ORDER BY person_name, pizza_name, pizzeria_name;

-- SELECT (SELECT person.name FROM person WHERE person_order.person_id = person.id) AS person_name, 
--         (SELECT pizza_name FROM menu WHERE person_order.menu_id= menu.id), 
--         (SELECT pizzeria.name FROM pizzeria WHERE pizzeria.id= menu.pizzeria_id) AS pizzeria_name
-- FROM person_order JOIN menu ON person_order.menu_id = menu.id
-- ORDER BY person_name, pizza_name, pizzeria_name;

-- Пожалуйста, напишите SQL-инструкцию, которая возвращает список имен людей, 
-- сделавших заказ пиццы в соответствующей пиццерии. Пример результата 
-- (с именованными столбцами) приведен ниже, и да... пожалуйста, 
-- оформляйте заказ по 3 столбцам (person_name, pizza_name, pizzeria_name) в порядке возрастания.