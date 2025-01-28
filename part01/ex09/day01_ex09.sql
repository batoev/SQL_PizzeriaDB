SELECT name
FROM pizzeria
WHERE pizzeria.id NOT IN (SELECT person_visits.pizzeria_id FROM person_visits);

SELECT name
FROM pizzeria
WHERE NOT EXISTS (SELECT person_visits.pizzeria_id FROM person_visits WHERE person_visits.pizzeria_id = pizzeria.id);



-- SELECT name
-- FROM pizzeria
-- WHERE pizzeria.id = (SELECT pizzeria.id FROM pizzeria EXCEPT SELECT person_visits.pizzeria_id FROM person_visits);

-- SELECT (SELECT name FROM pizzeria WHERE pizzeria.id = pv.id)
-- FROM (SELECT pizzeria.id FROM pizzeria EXCEPT SELECT person_visits.pizzeria_id FROM person_visits) AS pv;

-- Пожалуйста, напишите 2 инструкции SQL, 
-- которые возвращают список названий пиццерий, 
-- которые не посещались людьми, используя IN для 1-й и EXISTS для 2-й.

-- EXISTS существует
-- EXCEPT кроме