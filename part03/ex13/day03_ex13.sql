-- SELECT *
-- FROM person_order
-- ORDER BY 1;

DELETE FROM person_order
WHERE order_date = '2022-02-25';

-- SELECT *
-- FROM person_order
-- ORDER BY 1;

-- psql -d day03 -U postgres  -f ex02/day03_ex13.sql

-- Пожалуйста, напишите 2 инструкции SQL (DML), которые удаляют все новые заказы из упражнения № 12 на основе даты заказа. 
-- Затем удалите “греческую пиццу” из меню. 
-- Предупреждение: это упражнение, вероятно, приведет к неправильному изменению данных. 
-- На самом деле, вы можете восстановить исходную модель базы данных 
-- с данными по ссылке в разделе “Правила дня” и воспроизвести сценарий из упражнений 07 , 08 ,09 , 10 , 11, 12 и 13.