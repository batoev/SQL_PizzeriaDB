SELECT person_order.order_date AS action_date, person_order.person_id
FROM person_order
INTERSECT ALL
SELECT person_visits.visit_date AS action_date, person_visits.person_id
FROM person_visits
ORDER BY action_date ASC, person_id DESC;

-- Пожалуйста, напишите инструкцию SQL, которая возвращает общие строки для атрибутов order_date, 
-- person_id из таблицы person_order с одной стороны и visit_date, 
-- person_id из таблицы person_visits с другой стороны (пожалуйста, смотрите пример ниже). 
-- Другими словами, давайте найдем идентификаторы людей, которые посетили и заказали пиццу в один и тот же день. 
-- На самом деле, пожалуйста, добавьте заказ по action_date в режиме возрастания, 
-- а затем по person_id в режиме убывания.