INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
SELECT
    ROW_NUMBER() OVER (ORDER BY person_id, pizzeria_id) AS id,
    person_order.person_id,
    menu.pizzeria_id,
    CASE
        WHEN COUNT(*) = 1 THEN 10.5
        WHEN COUNT(*) = 2 THEN 22
        ELSE 30
    END as discount
FROM person_order
INNER JOIN menu ON person_order.menu_id = menu.id
GROUP BY person_id, pizzeria_id;

-- SELECT *
-- FROM person_discounts;

-- DROP TABLE person_discounts;

-- psql -d day05 -U postgres -f ex01/day06_ex01.sql

-- Упражнение 01 - Давайте установим персональные скидки

-- Собственно, мы создали структуру для хранения наших скидок и
-- готовы пойти дальше и заполнить нашу таблицу person_discounts новыми записями.

-- Итак, есть таблица person_order, в которой хранится история заказов человека. 
-- Пожалуйста, напишите инструкцию DML (INSERT INTO ... SELECT ...) 
-- , которая вставляет новые записи в таблицу person_discounts на основе следующих правил.

-- возьмите агрегированное состояние по столбцам person_id и pizzeria_id

-- рассчитайте значение персональной скидки по следующему псевдокоду:

-- if “amount of orders” = 1 then “discount” = 10.5 
-- else if “amount of orders” = 2 then “discount” = 22 
-- else “discount” = 300

-- чтобы сгенерировать первичный ключ для таблицы
-- person_discounts, пожалуйста, используйте приведенную ниже конструкцию SQL (эта конструкция взята из области SQL функции WINDOW).

-- ... ROW_NUMBER( ) OVER ( ) AS id ...
-----------------------------------------
-- Actually, we created a structure to store our discounts and we 
-- are ready to go further and fill our person_discounts table with new records.

-- So, there is a table person_order that stores the history of a person's orders. 
-- Please write a DML statement (INSERT INTO ... SELECT ...) 
-- that makes inserts new records into person_discounts table based on the next rules.

-- take aggregated state by person_id and pizzeria_id columns

-- calculate personal discount value by the next pseudo code:

-- if “amount of orders” = 1 then “discount” = 10.5 
-- else if “amount of orders” = 2 then “discount” = 22 
-- else “discount” = 30

-- to generate a primary key for the person_discounts table 
-- please use SQL construction below (this construction is from the WINDOW FUNCTION SQL area).

-- ... ROW_NUMBER( ) OVER ( ) AS id ...