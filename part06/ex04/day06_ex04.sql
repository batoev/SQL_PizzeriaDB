alter table person_discounts add constraint ch_nn_person_id check (person_id IS not null);
alter table person_discounts add constraint ch_nn_pizzeria_id check (pizzeria_id IS not null);
alter table person_discounts add constraint ch_nn_discount check (discount IS not null);
alter table person_discounts ALTER COLUMN discount SET DEFAULT 0;
alter table person_discounts add constraint ch_range_discount check (discount between 0 and 100);

-- psql -d day05 -U postgres -f ex04/day06_ex04.sql

-- Упражнение 04 - Нам нужно больше согласованности данных

-- Пожалуйста, добавьте следующие правила ограничения 
-- для существующих столбцов таблицы person_discounts.
--------------
-- Please add the following constraint rules 
-- for existing columns of the person_discounts table.

-- person_id column should not be NULL (use constraint name ch_nn_person_id)
-- pizzeria_id column should not be NULL (use constraint name ch_nn_pizzeria_id)
-- discount column should not be NULL (use constraint name ch_nn_discount)
-- discount column should be 0 percent by default
-- discount column should be in a range values from 0 to 100 (use constraint name ch_range_discount)