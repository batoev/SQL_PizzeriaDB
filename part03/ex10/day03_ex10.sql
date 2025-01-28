insert into person_order(id, person_id, menu_id, order_date) values (
    (SELECT max(id) + 1 FROM person_order),  
    (SELECT id FROM person WHERE name = 'Denis'),
    (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'), 
    '2022-02-24');

insert into person_order(id, person_id, menu_id, order_date) values (
    (SELECT max(id) + 1 FROM person_order),  
    (SELECT id FROM person WHERE name = 'Irina'),
    (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'), 
    '2022-02-24');

-- SELECT *
-- FROM person_order
-- ORDER BY 1;

-- БЫЛО: max(id) = 20,
-- СТАЛО(добавилось):
--  id | person_id | menu_id | order_date 
-------+-----------+---------+------------
--  21 |         4 |      20 | 2022-02-24
--  22 |         6 |      20 | 2022-02-24

-- psql -d day03 -U postgres  -f ex10/day03_ex10.sql

-- Please register new orders from Denis and Irina on 24th of February 2022
-- for the new menu with “sicilian pizza”. 
-- Warning: this exercise will probably be the cause of changing data in the wrong way. 
-- Actually, you can restore the initial database model with data 
-- from the link in the “Rules of the day” section and replay script from Exercises 07 , 08 and 09.

-- Пожалуйста, зарегистрируйте новые заказы от Дениса и Ирины на 24 февраля 2022 года для нового меню с “сицилийской пиццей”. 
-- Внимание: это упражнение, вероятно, приведет к неправильному изменению данных. 
-- На самом деле, вы можете восстановить исходную модель базы данных 
-- с помощью данных по ссылке в разделе “Правила дня” и воспроизвести сценарий из упражнений 07, 08 и 09.

-- Запрещено: Не используйте прямые номера для идентификаторов первичного ключа и пиццерии