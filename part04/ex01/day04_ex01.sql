SELECT name
FROM v_persons_female
UNION
SELECT name
FROM v_persons_male
ORDER BY 1;


-- psql -d day04 -U postgres  -f ex00/day04_ex01.sql

-- Упражнение 01 - От деталей к общему виду

-- Please use 2 Database Views from Exercise #00 and write SQL 
-- to get female and male person names in one list. 
-- Please set the order by person name. The sample of data is presented below.

-- Пожалуйста, используйте 2 представления базы данных из упражнения № 00 и напишите SQL, 
-- чтобы получить женские и мужские имена в одном списке. 
-- Пожалуйста, установите порядок по имени человека. Образец данных представлен ниже.

-- name
-- Andrey
-- Anna
-- ...