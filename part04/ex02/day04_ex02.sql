CREATE VIEW v_generated_dates AS
SELECT generate_series('2022-01-01', '2022-01-31', interval '1 day')::date AS generated_dates
ORDER BY 1;

-- SELECT *
-- FROM v_generated_dates
-- ORDER BY 1;

-- SELECT temp::date AS generated_date
-- FROM generate_series('2022-01-01', '2022-01-31', interval '1 day') AS temp
-- ORDER BY 1;

-- psql -d day04 -U postgres  -f ex02/day04_ex02.sql

-- Упражнение 02 - “Хранить” сгенерированные даты в одном месте

-- Please create a Database View (with name v_generated_dates) 
-- which should be “store” generated dates from 1st to 31th of January 2022 in DATE type. 
-- Don’t forget about order for the generated_date column.

-- Пожалуйста, создайте представление базы данных (с именем v_generated_dates) 
-- которое должно “хранить” сгенерированные даты с 1 по 31 января 2022 года в типе ДАТЫ. 
-- Не забудьте о порядке для столбца generated_date.

-- generated_date
-- 2022-01-01
-- 2022-01-02
-- ...

-- Требуется: SQL Syntax Construction	generate_series(...)