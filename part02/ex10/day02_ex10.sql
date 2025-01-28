SELECT p1.name AS person_name1, p2.name AS person_name2, p1.address AS common_address
FROM (SELECT * FROM person) AS p1
INNER JOIN (SELECT * FROM person) AS p2 ON p1.address = p2.address
WHERE p1.id > p2.id
ORDER BY 1, 2, 3;

-- Упражнение 10 - Найдите людей из одного города

-- Пожалуйста, найдите имена людей, проживающих по одному и тому же адресу. 
-- Убедитесь, что результат упорядочен по имени 1-го человека, имени 2-го человека и общему адресу. 
-- Образец данных представлен ниже. 
-- Пожалуйста, убедитесь, что названия ваших столбцов соответствуют названиям столбцов ниже.

-- person_name1	person_name2	common_address
-- Andrey		Anna		    Moscow
-- Denis		Kate		    Kazan
-- Elvira		Denis		    Kazan
-- ...		    ...		        ...