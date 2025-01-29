CREATE SEQUENCE seq_person_discounts START WITH 1;

ALTER TABLE person_discounts ALTER COLUMN id SET DEFAULT nextval('seq_person_discounts');

SELECT setval('seq_person_discounts', (SELECT COUNT(*) + 1 FROM person_discounts));


-- psql -d day05 -U postgres -f ex06/day06_ex06.sql

-- Упражнение 06 - Давайте автоматизируем генерацию первичного ключа

-- Давайте создадим последовательность базы данных с именем seq_person_discounts (начиная со значения 1)
-- и установим значение по умолчанию для атрибута id таблицы person_discounts, 
-- чтобы каждый раз автоматически получать значение из seq_person_discounts. 
-- Пожалуйста, имейте в виду, что ваш следующий порядковый номер равен 1, в этом случае, 
-- пожалуйста, установите фактическое значение для последовательности базы данных 
-- на основе формулы “количество строк в таблице person_discounts” + 1. 
-- В противном случае вы получите сообщения об ограничении нарушения первичного ключа.
----------------
-- Let’s create a Database Sequence with the name seq_person_discounts (starting from 1 value) 
-- and set a default value for id attribute of person_discounts table 
-- to take a value from seq_person_discounts each time automatically. 
-- Please be aware that your next sequence number is 1, in this case please set an actual value for database sequence based 
-- on formula “amount of rows in person_discounts table” + 1. 
-- Otherwise you will get errors about Primary Key violation constraint.

-- Данный запрос выполняет три действия:

-- 1. CREATE SEQUENCE seq_person_discounts START WITH 1; 
-- - создает объект в БД под названием "seq_person_discounts", 
-- который генерирует уникальные числовые значения, начиная с 1. 
-- Это базовая функциональность механизма автоинкремента в PostgreSQL.

-- 2. ALTER TABLE person_discounts ALTER COLUMN id SET DEFAULT nextval('seq_person_discounts'); 
-- - изменяет таблицу "person_discounts" таким образом, чтобы ее столбец id 
-- автоматически вызывал функцию nextval('seq_person_discounts') для генерации своего дефолтного значения. 
-- Это означает, что каждый раз, когда в таблицу добавляется новая строка, ей автоматически присваивается новый уникальный ID.

-- 3. SELECT setval('seq_person_discounts', (SELECT COUNT(*) + 1 FROM person_discounts)); 
-- - устанавливает текущее значение последовательности "seq_person_discounts" на число, 
-- равное количеству строк в таблице "person_discounts" плюс единица. 
-- Это необходимо для обеспечения того, чтобы новые строки, добавляемые в таблицу "person_discounts", 
-- получали уникальные ID, не пересекающиеся с уже существующими.