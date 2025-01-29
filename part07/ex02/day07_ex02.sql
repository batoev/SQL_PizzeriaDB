(SELECT pz.name, COUNT(*) AS count, 'visit' as action_type
FROM person_visits AS pv
INNER JOIN pizzeria AS pz ON pv.pizzeria_id = pz.id
GROUP BY pz.name
ORDER BY 2 DESC
limit 3)
UNION
(SELECT pz.name, COUNT(*) AS count, 'order' as action_type
FROM person_order AS po
INNER JOIN menu AS m ON po.menu_id = m.id
INNER JOIN pizzeria AS pz ON m.pizzeria_id = pz.id
GROUP BY pz.name
ORDER BY 2 DESC
limit 3)
ORDER BY 3 ASC, 2 DESC;


-- psql -d day07 -U postgres -f ex02/day07_ex02.sql

-- Упражнение 02 - Статистика ресторанов

-- Пожалуйста, напишите SQL-запрос, чтобы увидеть 3 любимых ресторана по посещениям и заказам в одном списке
-- (пожалуйста, добавьте столбец action_type со значениями "заказать" 
-- или "посетить", это зависит от данных из соответствующей таблицы). 
-- Пожалуйста, взгляните на образец данных ниже. 
-- Результат должен быть отсортирован по столбцу action_type в режиме возрастания и по столбцу count в режиме убывания.

-- Please write a SQL statement to see 3 favorite restaurants by visits and by orders in one list 
-- (please add an action_type column with values ‘order’ 
-- or ‘visit’, it depends on data from the corresponding table). 
-- Please take a look at the sample of data below. 
-- The result should be sorted by action_type column in ascending mode and by count column in descending mode.

-- name	    count	action_type
-- Dominos	6	    order
-- ...	    ...	    ...
-- Dominos	7	    visit
-- ...	    ...	    ...