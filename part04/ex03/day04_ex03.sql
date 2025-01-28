SELECT generated_dates AS missing_date
FROM v_generated_dates
EXCEPT
SELECT visit_date 
FROM person_visits
ORDER BY 1;

-- psql -d day04 -U postgres  -f ex03/day04_ex03.sql

-- Упражнение 03 - Поиск пропущенных дней посещения с помощью просмотра базы данных

-- Please write a SQL statement which returns missing days for persons’ visits in January of 2022. 
-- Use v_generated_dates view for that task and sort the result by missing_date column. 
-- The sample of data is presented below.

-- Пожалуйста, напишите SQL-инструкцию, которая возвращает пропущенные дни для посещений людей в январе 2022 года. 
-- Используйте представление v_generated_dates для этой задачи и отсортируйте результат по столбцу missing_data. 
-- Образец данных представлен ниже.

-- missing_date
-- 2022-01-11
-- 2022-01-12
-- ...