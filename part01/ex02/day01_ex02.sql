SELECT pizza_name
FROM menu
UNION
SELECT pizza_name
FROM menu
ORDER BY pizza_name DESC;

-- Пожалуйста, напишите SQL-инструкцию, которая возвращает уникальные названия пицц 
-- из таблицы меню и упорядочивает их по столбцу pizza_name в порядке убывания. 
-- Пожалуйста, обратите внимание на раздел "Отказано"(DISTINCT, GROUP BY, HAVING, any type of JOINs).
-- psql -d day01 -U postgres  -f ex01/day01_ex01.sql