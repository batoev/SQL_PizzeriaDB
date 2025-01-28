SELECT name, rating
    FROM pizzeria LEFT JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
WHERE pizzeria_id IS NULL;


-- Пожалуйста, напишите SQL-инструкцию, которая возвращает список названий 
-- пиццерий с соответствующим значением рейтинга, которые не посещались 
-- посетителями.
-- Запрещены: NOT IN, IN, NOT EXISTS, EXISTS, UNION, EXCEPT, INTERSECT 