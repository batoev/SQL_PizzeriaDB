SELECT temp.missing_date
FROM (SELECT date_trunc('day', generate_series('2022-01-01'::timestamp, '2022-01-10'::timestamp, '1 day'::interval))::date AS missing_date) AS temp
LEFT JOIN (SELECT person_id, visit_date FROM person_visits WHERE person_id = 1 OR person_id = 2) AS pv ON temp.missing_date = pv.visit_date
WHERE pv.visit_date IS NULL;

-- SELECT date_trunc('day', generate_series('2022-01-01'::timestamp, '2022-01-10'::timestamp, '1 day'::interval))::date AS missing_date;

-- SELECT person_id, visit_date
-- FROM person_visits
-- WHERE person_id = 1 OR person_id = 2
-- ORDER BY 2;

-- Пожалуйста, напишите SQL-запрос, который возвращает пропущенные дни 
-- с 1 по 10 января 2022 года (включая все дни) 
-- для посещений лиц с идентификаторами 1 или 2 (это означает дни, пропущенные обоими). 
-- Пожалуйста, упорядочивайте по дням посещения в порядке возрастания. 
-- Ниже представлен образец данных с названием столбца.
-- Запрещены: NOT IN, IN, NOT EXISTS, EXISTS, UNION, EXCEPT, INTERSECT 

-- |missing_date
-- +------------
-- |2022-01-03
-- |2022-01-04
-- |2022-01-05
-- |...