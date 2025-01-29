SELECT p.address, pz.name, COUNT(*) AS count_of_orders
FROM person_order AS po
INNER JOIN menu AS m ON po.menu_id = m.id
INNER JOIN pizzeria AS pz ON m.pizzeria_id = pz.id
INNER JOIN person p ON po.person_id = p.id
GROUP BY p.address, pz.name
ORDER BY 1, 2;

-- psql -d day07 -U postgres -f ex08/day07_ex08.sql

-- Упражнение 08 - Найдите расположение ресторанов пиццерии

-- Мы знаем о личных адресах из наших данных. 
-- Давайте представим, что конкретный человек посещает пиццерии только в своем городе. 
-- Пожалуйста, напишите SQL-запрос, который возвращает адрес,
-- название пиццерии и количество заказов людей. 
-- Результат должен быть отсортирован по адресу, а затем по названию ресторана. 
-- Пожалуйста, взгляните на образец выходных данных ниже.
--------------
-- We know about personal addresses from our data. 
-- Let’s imagine, that particular person visits pizzerias in his/her city only. 
-- Please write a SQL statement that returns address, 
-- pizzeria name and amount of persons’ orders. 
-- The result should be sorted by address and then by restaurant name. 
-- Please take a look at the sample of output data below.

-- address	    name	    count_of_orders
-- Kazan	    Best Pizza	4
-- Kazan	    DinoPizza	4
-- ...	        ...	        ...