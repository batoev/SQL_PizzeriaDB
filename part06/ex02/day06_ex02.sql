-- SELECT *
-- FROM person_discounts;

SELECT p.name, m.pizza_name, m.price, (m.price*(100-pd.discount)/100)::integer AS discount_price, pz.name AS pizzeria_name
FROM person_order po
INNER JOIN person p ON po.person_id = p.id
INNER JOIN menu m ON po.menu_id = m.id
INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
INNER JOIN person_discounts pd ON po.person_id = pd.person_id AND pz.id = pd.pizzeria_id
ORDER BY 1, 2;

-- SELECT p.name, m.pizza_name, m.price, (m.price*(100-pd.discount)/100)::integer AS discount_price, pz.name AS pizzeria_name
-- FROM person_discounts pd
-- INNER JOIN person p ON pd.person_id = p.id
-- INNER JOIN menu m ON pd.pizzeria_id = m.pizzeria_id
-- INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
-- ORDER BY 1, 2;

-- psql -d day05 -U postgres -f ex02/day06_ex02.sql

-- Упражнение 02 - Давайте пересчитаем историю заказов

-- Пожалуйста, напишите SQL-инструкцию, которая возвращает заказы с фактической ценой 
-- и ценой с примененной скидкой для каждого человека в соответствующей пиццерии-ресторане 
-- и сортирует по имени человека и названию пиццы. 
-- Пожалуйста, взгляните на образец данных ниже.
-----------------
-- Please write a SQL statement that returns orders with actual price 
-- and price with applied discount for each person in the corresponding pizzeria restaurant 
-- and sort by person name, and pizza name. 
-- Please take a look at the sample of data below.

-- name	    pizza_name	    price	    discount_price	pizzeria_name
-- Andrey	cheese pizza	800	        624	            Dominos
-- Andrey	mushroom pizza	1100	    858	            Dominos
-- ...	    ...	            ...	        ...	            ...