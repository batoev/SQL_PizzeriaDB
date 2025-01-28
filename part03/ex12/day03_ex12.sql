-- SELECT *
-- FROM person_order
-- ORDER BY 1;

insert into person_order(id, person_id, menu_id, order_date)
    SELECT (gs + (SELECT max(id) + 1 FROM person_order)) AS id,  
        id AS person_id,
        (SELECT id FROM menu WHERE pizza_name = 'greek pizza') AS menu_id, 
        '2022-02-25' AS order_date
    FROM person
    INNER JOIN generate_series(1, (SELECT max(id) FROM person)) AS gs ON gs = person.id;

-- SELECT *
-- FROM person_order
-- ORDER BY 1;

-- psql -d day03 -U postgres  -f ex02/day03_ex12.sql

-- Нужно: Синтаксическая конструкция SQL generate_series(...)

-- Пожалуйста, зарегистрируйте новые заказы от всех пользователей на “греческую пиццу” 25 февраля 2022 года. 
-- Внимание: это упражнение, вероятно, приведет к неправильному изменению данных. 
-- На самом деле, вы можете восстановить исходную модель базы данных 
-- с данными по ссылке в разделе “Правила дня” и воспроизвести сценарий из упражнений 07, 08,09, 10 и 11.

-- Запрещено: 
-- Не используйте прямые цифры для идентификаторов первичного ключа и меню
-- Не используйте оконные функции, такие как ROW_NUMBER( )
-- Не используйте операторы атомарной ВСТАВКИ |