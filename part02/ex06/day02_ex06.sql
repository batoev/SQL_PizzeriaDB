SELECT menu.pizza_name, pizzeria.name AS pizzeria_name
FROM menu
INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
WHERE menu.id IN (SELECT menu_id FROM person_order WHERE person_id IN (SELECT id FROM person WHERE name in ('Denis', 'Anna')))
ORDER BY 1, 2;

-- Пожалуйста, найдите все названия пиццы (и соответствующие названия пиццерий, 
-- используя таблицу меню), которые заказывали Денис или Анна. 
-- Отсортируйте результат по обоим столбцам. Пример вывода представлен ниже.

-- pizza_name	    pizzeria_name
-- cheese pizza	    Best Pizza
-- cheese pizza	    Pizza Hut
-- ...	            ...