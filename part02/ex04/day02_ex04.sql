SELECT menu.pizza_name, pizzeria.name AS pizzeria_name, menu.price
FROM menu
INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
WHERE pizza_name in ('mushroom pizza', 'pepperoni pizza')
ORDER BY 1, 2;

-- Найдите полную информацию обо всех возможных названиях пиццерий и ценах на 
-- пиццу с грибами или пепперони. 
-- Пожалуйста, отсортируйте результат по названию пиццы и названию пиццерии. 
-- Ниже приведены результаты выборки данных 
-- (пожалуйста, используйте те же названия столбцов в вашей инструкции SQL).


-- pizza_name	            pizzeria_name	price
-- mushroom pizza	        Dominos	        1100
-- mushroom pizza	        Papa Johns	    950
-- pepperoni pizza	        Best Pizza	    800
-- ...	        ...	            ...