SELECT person.name
FROM person
INNER JOIN person_order ON person.id = person_order.person_id
INNER JOIN menu ON person_order.menu_id = menu.id
WHERE person.gender = 'female' AND menu.pizza_name = 'pepperoni pizza'
INTERSECT
SELECT person.name
FROM person
INNER JOIN person_order ON person.id = person_order.person_id
INNER JOIN menu ON person_order.menu_id = menu.id
WHERE person.gender = 'female' AND menu.pizza_name = 'cheese pizza'
ORDER BY 1;

-- Упражнение 09 - Кто любит сыр и пепперони?

-- Пожалуйста, найдите имена всех женщин, 
-- которые заказывали пиццу с пепперони и сыром (в любое время и в любых пиццериях). 
-- Убедитесь, что результат заказан по имени человека. 
-- Выборка данных представлена ниже.

-- name
-- Anna
-- ...