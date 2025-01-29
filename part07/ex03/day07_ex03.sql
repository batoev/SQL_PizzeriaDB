SELECT t.name, COUNT(*) AS total_count
FROM (
    (SELECT pz.name, 'visit' as action_type
    FROM person_visits AS pv
    INNER JOIN pizzeria AS pz ON pv.pizzeria_id = pz.id
    )
    UNION ALL
    (SELECT pz.name, 'order' as action_type
    FROM person_order AS po
    INNER JOIN menu AS m ON po.menu_id = m.id
    INNER JOIN pizzeria AS pz ON m.pizzeria_id = pz.id
    )
) AS t
GROUP BY t.name
ORDER BY 2 DESC, 1 ASC;


-- psql -d day07 -U postgres -f ex03/day07_ex03.sql

-- Упражнение 03 - Статистика ресторанов №2

-- Пожалуйста, напишите инструкцию SQL, чтобы увидеть, как рестораны группируются по посещениям
-- и заказам и объединяются друг с другом с помощью названия ресторана.
-- Вы можете использовать внутренний Sql из упражнения 02 (рестораны по посещениям и заказам) 
-- без ограничений по количеству строк.

-- Дополнительно, пожалуйста, добавьте следующие правила.

-- рассчитайте сумму заказов и посещений для соответствующей пиццерии
-- (имейте в виду, не все ключи от пиццерии представлены в обеих таблицах).

-- отсортируйте результаты по столбцу total_count в режиме убывания
-- и по названию в режиме возрастания. Взгляните на образец данных ниже.

-----------------

-- Please write a SQL statement to see restaurants are grouping by visits 
-- and by orders and joined with each other by using restaurant name.
-- You can use internal SQLs from Exercise 02 (restaurants by visits and by orders) 
-- without limitations of amount of rows.

-- Additionally, please add the next rules.

-- calculate a sum of orders and visits for corresponding pizzeria 
-- (be aware, not all pizzeria keys are presented in both tables).

-- sort results by total_count column in descending mode 
-- and by name in ascending mode. Take a look at the data sample below.

-- name	        total_count
-- Dominos	    13
-- DinoPizza	9
-- ...	        ...