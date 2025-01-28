CREATE INDEX idx_person_visits_person_id ON person_visits (person_id);
CREATE INDEX idx_person_visits_pizzeria_id ON person_visits (pizzeria_id);
CREATE INDEX idx_person_order_person_id ON person_order (person_id);
CREATE INDEX idx_person_order_menu_id ON person_order (menu_id);
CREATE INDEX idx_menu_pizzeria_id ON menu (pizzeria_id);

-- psql -d day05 -U postgres -f ex00/day05_ex00.sql

-- Упражнение 00 - Давайте создадим индексы для каждого внешнего ключа

-- Please create a simple BTree index for every foreign key in our database. 
-- The name pattern should satisfy the next rule “idx_{table_name}_{column_name}”. 
-- For example, the name BTree index for the pizzeria_id column 
-- in the menu table is idx_menu_pizzeria_id.

-- ПЕРЕВОД:

-- Пожалуйста, создайте простой индекс дерева B для каждого внешнего ключа в нашей базе данных. 
-- Шаблон имени должен удовлетворять следующему правилу “idx_{имя_таблицы}_{имя_колонки}”. 
-- Например, индекс дерева имен B для столбца
-- pizzeria_id в таблице меню равен idx_menu_pizzeria_id.