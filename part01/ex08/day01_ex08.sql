SELECT person_order.order_date, CONCAT(person.name, ' (age:', person.age, ')') AS person_information
FROM person_order NATURAL JOIN (SELECT id AS person_id, name, age FROM person) AS person
ORDER BY person_order.order_date ASC, person_information ASC;

-- Пожалуйста, перепишите инструкцию SQL из упражнения #07, 
-- используя конструкцию ЕСТЕСТВЕННОГО СОЕДИНЕНИЯ. 
-- Результат должен быть таким же, как в упражнении #07.