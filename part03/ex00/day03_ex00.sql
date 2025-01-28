SELECT menu.pizza_name, menu.price, pizzeria.name AS pizzeria_name, person_visits.visit_date
FROM pizzeria
INNER JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
INNER JOIN menu ON pizzeria.id = menu.pizzeria_id
INNER JOIN person ON person_visits.person_id = person.id
WHERE person.name = 'Kate' AND (menu.price BETWEEN 800 AND 1000)
ORDER BY 1, 2, 3;

-- psql -d day03 -U postgres  -f ex00/day03_ex00.sql

-- Пожалуйста, напишите SQL-запрос, который вернет список названий пицц, цен на пиццу, 
-- названий пиццерий и дат посещения для Кейт и для цен в диапазоне от 800 до 1000 рублей. 
-- Пожалуйста, отсортируйте по пицце, цене и названиям пиццерий. 
-- Взгляните на приведенную ниже выборку данных.

-- pizza_name	    price	pizzeria_name	visit_date
-- cheese pizza	    950	    DinoPizza	    2022-01-04
-- pepperoni pizza	800	    Best Pizza	    2022-01-03
-- pepperoni pizza	800	    DinoPizza	    2022-01-04
-- ...	            ...	    ...	            ...