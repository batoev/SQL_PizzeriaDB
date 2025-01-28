SELECT temp.pizzeria_name
FROM (
SELECT pizzeria.name AS pizzeria_name, COUNT(CASE WHEN person.gender = 'female' THEN 1 END) AS female_count, COUNT(CASE WHEN person.gender = 'male' THEN 1 END) AS male_count
FROM pizzeria
INNER JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
INNER JOIN person ON person_visits.person_id = person.id
GROUP BY pizzeria.name
) AS temp
WHERE temp.female_count != temp.male_count
ORDER BY 1;

-- psql -d day03 -U postgres  -f ex03/day03_ex03.sql

-- Пожалуйста, найдите пиццерии, которые чаще посещали женщины или мужчины. 
-- Для любых SQL-операторов с наборами сохраняйте дубликаты (ОБЪЕДИНЯТЬ ВСЕ, КРОМЕ ВСЕХ, ПЕРЕСЕКАТЬ ВСЕ конструкции). 
-- Пожалуйста, отсортируйте результат по названию пиццерии. Образец данных приведен ниже.

-- pizzeria_name
-- Best Pizza
-- Dominos
-- ...