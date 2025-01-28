-- SELECT *
-- FROM menu
-- WHERE pizza_name ='greek pizza';
-- ORDER BY 1;

UPDATE menu
SET price = (1-0.1)*price
WHERE pizza_name ='greek pizza';

-- SELECT *
-- FROM menu
-- WHERE pizza_name ='greek pizza';
-- ORDER BY 1;

-- psql -d day03 -U postgres  -f ex11/day03_ex11.sql

-- Пожалуйста, измените цену на “греческую пиццу” на -10% от текущей стоимости. 
-- Внимание: это упражнение, вероятно, приведет к неправильному изменению данных. 
-- На самом деле, вы можете восстановить исходную модель базы данных 
-- с помощью данных по ссылке в разделе “Правила дня” и воспроизвести сценарий из упражнений 07, 08,09 и 10.