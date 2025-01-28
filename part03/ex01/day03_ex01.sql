SELECT menu.id AS menu_id
FROM menu
EXCEPT (SELECT menu_id FROM person_order)
ORDER BY 1;

-- SELECT menu.id AS menu_id
-- FROM menu
-- WHERE id  NOT IN (
--     SELECT menu_id
--     FROM person_order
-- )
-- ORDER BY 1;

-- psql -d day03 -U postgres  -f ex01/day03_ex01.sql

-- Пожалуйста, найдите все идентификаторы меню, 
-- которые никем не заказывались. 
-- Результат должен быть отсортирован по идентификаторам. 
-- Образец выходных данных представлен ниже.
-- Запрещены: any type of JOINs

-- menu_id ( идентификатор меню )
-- 5
-- 10
-- ...