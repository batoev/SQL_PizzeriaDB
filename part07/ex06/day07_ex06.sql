SELECT pz.name, COUNT(*) AS count_of_orders, ROUND(AVG(m.price), 2) AS average_price, MAX(m.price) AS max_price, MIN(m.price) AS min_price
FROM person_order AS po
INNER JOIN menu AS m ON po.menu_id = m.id
INNER JOIN pizzeria AS pz ON m.pizzeria_id = pz.id
GROUP BY pz.name
ORDER BY 1;

-- psql -d day07 -U postgres -f ex06/day07_ex06.sql

-- Упражнение 06 - Показатели ресторана

-- Пожалуйста, напишите SQL-запрос, который возвращает количество заказов,
-- среднее значение цены, максимальную и минимальную цены
-- на проданную пиццу в соответствующем ресторане-пиццерии. 
-- Результат должен быть отсортирован по названию пиццерии. 
-- Пожалуйста, взгляните на образец данных ниже. 
-- Округлите вашу среднюю цену до 2 чисел с плавающей запятой.
-------------
-- Please write a SQL statement that returns the amount of orders, 
-- average of price, maximum and minimum prices 
-- for sold pizza by corresponding pizzeria restaurant. 
-- The result should be sorted by pizzeria name. 
-- Please take a look at the data sample below. 
-- Round your average price to 2 floating numbers.

-- name	        count_of_orders	    average_price	max_price	min_price
-- Best Pizza	5	                780	            850	        700
-- DinoPizza	5	                880	            1000	    800
-- ...	        ...	                ...	            ...	        ...