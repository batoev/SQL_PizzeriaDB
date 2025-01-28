SELECT COALESCE(person.name, '-') AS person_name, vd.visit_date, COALESCE(pizzeria.name, '-') AS pizzeria_name
FROM (SELECT visit_date, person_id, pizzeria_id FROM person_visits WHERE person_visits.visit_date BETWEEN '2022-01-01' AND '2022-01-03') as vd
FULL JOIN person ON vd.person_id = person.id
FULL JOIN pizzeria ON vd.pizzeria_id = pizzeria.id
ORDER BY 1, 2, 3;

-- SELECT COALESCE(person.name, '-') AS person_name, vd.visit_date, COALESCE(pizzeria.name, '-') AS pizzeria_name
-- FROM person
-- FULL JOIN (SELECT visit_date, person_id, pizzeria_id FROM person_visits WHERE person_visits.visit_date BETWEEN '2022-01-01' AND '2022-01-03') as vd ON vd.person_id = person.id
-- FULL JOIN pizzeria ON pizzeria.id = vd.pizzeria_id
-- ORDER BY 1, 2, 3;

-- Пожалуйста, напишите SQL-инструкцию, которая возвращает полный список имен людей, 
-- посетивших (или не посещенных) пиццерии в период с 1 по 3 января 2022 года, 
-- с одной стороны, и полный список названий пиццерий, которые были посещены (или не посещались), 
-- с другой стороны. Образец данных с необходимыми названиями столбцов представлен ниже. 
-- Пожалуйста, обратите внимание на значение подстановки ‘-’ для нулевых значений 
-- в столбцах person_name и pizzeria_name. Пожалуйста, также добавьте заказ для всех 3 столбцов.

-- person_name	visit_date	pizzeria_name
--          -	null	    DinoPizza
--          -	null	    DoDo Pizza
--      Andrey	2022-01-01	Dominos
--      Andrey	2022-01-02	Pizza Hut
--      Anna	2022-01-01	Pizza Hut
--      Denis	null	    -
--      Dmitriy	null	    -
--      ...	    ...	        ...