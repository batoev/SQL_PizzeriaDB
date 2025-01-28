SELECT person_order.order_date, CONCAT(person.name, ' (age:', person.age, ')') AS person_information
FROM person_order JOIN person ON person_order.person_id = person.id
ORDER BY person_order.order_date ASC, person_information ASC;

-- Пожалуйста, напишите SQL-инструкцию, которая возвращает дату заказа из таблицы person_order 
-- и соответствующее имя человека (имя и возраст отформатированы, как в примере данных ниже), 
-- который сделал заказ из таблицы person. Добавьте сортировку по обоим столбцам в режиме возрастания.