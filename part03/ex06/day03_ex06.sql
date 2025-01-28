SELECT p1.pizza_name, p1.pizzeria_name_1, p2.pizzeria_name_2, p1.price
FROM (
SELECT menu.pizza_name, pizzeria.name AS pizzeria_name_1, menu.price
FROM pizzeria
INNER JOIN menu ON pizzeria.id = menu.pizzeria_id
) AS p1
INNER JOIN (
SELECT menu.pizza_name, pizzeria.name AS pizzeria_name_2, menu.price
FROM pizzeria
INNER JOIN menu ON pizzeria.id = menu.pizzeria_id
) AS p2 ON p1.pizza_name = p2.pizza_name AND p1.price = p2.price
WHERE p1.price = p2.price AND p1.pizzeria_name_1 > p2.pizzeria_name_2
ORDER BY 1;

-- psql -d day03 -U postgres  -f ex02/day03_ex06.sql

-- Пожалуйста, найдите одинаковые названия пиццерий с одинаковой ценой, но из разных пиццерий. 
-- Убедитесь, что результат упорядочен по названию пиццы. Образец данных представлен ниже. 
-- Пожалуйста, убедитесь, что названия ваших столбцов соответствуют названиям столбцов ниже.

-- pizza_name	    pizzeria_name_1	pizzeria_name_2	    price
-- cheese pizza 	Best Pizza	    Papa Johns	        700
-- ...	            ...	            ...	                ...