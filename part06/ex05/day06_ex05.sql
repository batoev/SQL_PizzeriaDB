COMMENT ON TABLE person_discounts IS 'Information about personal discounts';
COMMENT ON COLUMN person_discounts.id IS 'The unique id of each table entry';
COMMENT ON COLUMN person_discounts.person_id IS 'The unique identifier of a person from order list';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'The unique identifier of the pizzeria where the person placed orders';
COMMENT ON COLUMN person_discounts.discount IS 'The discount amount, which depends on the number of orders(percents)';

-- psql -d day05 -U postgres -f ex05/day06_ex05.sql

-- Упражнение 05 - Правила управления данными
-- Чтобы соответствовать политикам управления данными, необходимо
-- добавить комментарии к таблице и столбцам таблицы. 
-- Давайте применим эту политику к таблице person_discounts. 
-- Пожалуйста, добавьте комментарии на английском  или русском языках (это зависит от вас) 
-- которые объясняют, что является бизнес-целью таблицы и всех включенных атрибутов.
----------------------
-- To satisfy Data Governance Policies need to 
-- add comments for the table and table's columns. 
-- Let’s apply this policy for the person_discounts table. 
-- Please add English or Russian comments (it's up to you) 
-- that explain what is a business goal of a table and all included attributes.