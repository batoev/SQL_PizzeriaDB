WITH cte_name AS (
    SELECT date_trunc('day', generate_series('2022-01-01'::timestamp, '2022-01-10'::timestamp, '1 day'::interval))::date AS missing_date
)
SELECT cte_name.missing_date
FROM cte_name
LEFT JOIN (SELECT person_id, visit_date FROM person_visits WHERE person_id = 1 OR person_id = 2) AS pv ON cte_name.missing_date = pv.visit_date
WHERE pv.visit_date IS NULL;

-- Давайте вернемся к упражнению #01, пожалуйста, перепишите свой SQL, 
-- используя шаблон CTE (Common Table Expression). 
-- Пожалуйста, перейдите к части CTE вашего "генератора дня". 
-- Результат должен быть таким же, как в упражнении #01

-- missing_date
-- 2022-01-03
-- 2022-01-04
-- 2022-01-05
-- ...