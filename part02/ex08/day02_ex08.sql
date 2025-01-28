SELECT person.name
FROM person
INNER JOIN person_order ON person.id = person_order.person_id
INNER JOIN menu ON person_order.menu_id = menu.id
WHERE person.gender = 'male' AND person.address IN ('Moscow', 'Samara') AND menu.pizza_name IN ('mushroom pizza', 'pepperoni pizza')
ORDER BY 1 DESC;

-- Упражнение 08 Продолжаем изучать данные
-- Пожалуйста, найдите имена всех мужчин из Москвы или Самары, 
-- которые заказывают пиццу с пепперони или грибами (или и то, и другое). 
-- Пожалуйста, упорядочьте результат по имени человека в порядке убывания. 
-- Пример выходных данных представлен ниже.

-- name
-- Dmitriy
-- ...