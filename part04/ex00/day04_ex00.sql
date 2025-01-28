CREATE VIEW v_persons_female AS
SELECT *
FROM person
WHERE gender = 'female';

CREATE VIEW v_persons_male AS
SELECT *
FROM person
WHERE gender = 'male';

-- SELECT *
-- FROM v_persons_female
-- ORDER BY 1;

-- SELECT *
-- FROM v_persons_male
-- ORDER BY 1;

-- psql -d day04 -U postgres  -f ex00/day04_ex00.sql

-- Упражнение 00 - Давайте создадим отдельные представления для лиц

-- Please create 2 Database Views 
-- (with similar attributes like the original table) based on simple filtering of gender of persons. 
-- Set the corresponding names for the database views: v_persons_female and v_persons_male.

-- Пожалуйста, создайте 2 представления базы данных 
-- (с аналогичными атрибутами, такими как исходная таблица) на основе простой фильтрации лиц по полу. 
-- Задайте соответствующие имена для представлений базы данных: v_persons_female и v_persons_male.