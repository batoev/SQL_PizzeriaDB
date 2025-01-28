SELECT person.id AS "person.id", person.name AS "person.name", age, gender, address, pizzeria.id AS "pizzeria.id", pizzeria.name AS "pizzeria.name", rating
FROM person CROSS JOIN pizzeria
ORDER BY person.id ASC, pizzeria.id ASC;

-- Пожалуйста, напишите SQL-инструкцию, которая возвращает все возможные комбинации между
-- таблицами person и pizzeria, и, пожалуйста, установите порядок по идентификатору пользователя, 
-- а затем по столбцам идентификатора пиццерии. Пожалуйста, взгляните на пример результата ниже. 
-- Пожалуйста, имейте в виду, что названия столбцов могут отличаться для вас.