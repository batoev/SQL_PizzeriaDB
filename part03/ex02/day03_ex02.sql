SELECT menu.pizza_name, menu.price, pizzeria.name AS pizzeria_name
FROM menu
INNER JOIN pizzeria ON  menu.pizzeria_id = pizzeria.id
WHERE menu.id IN (SELECT menu.id AS menu_id
FROM menu
EXCEPT (SELECT menu_id FROM person_order)
ORDER BY 1)
ORDER BY 1, 2;

-- psql -d day03 -U postgres  -f ex02/day03_ex02.sql

-- Пожалуйста, используйте инструкцию SQL из упражнения # 01 и покажите названия пицц из пиццерии, 
-- которые никто не заказывал, включая также соответствующие цены. 
-- Результат должен быть отсортирован по названию пиццы и цене. 
-- Образец выходных данных представлен ниже.

-- pizza_name	price	pizzeria_name
-- cheese pizza	700	    Papa Johns
-- cheese pizza	780	    DoDo Pizza
-- ...	        ...	    ...