insert into person_visits(id, person_id, pizzeria_id, visit_date) values (
    (SELECT max(id) + 1 FROM person_visits),  
    (SELECT id FROM person WHERE name = 'Denis'),
    (SELECT id FROM pizzeria WHERE name = 'Dominos'), 
    '2022-02-24');
    
insert into person_visits(id, person_id, pizzeria_id, visit_date) values (
    (SELECT max(id) + 1 FROM person_visits),  
    (SELECT id FROM person WHERE name = 'Irina'),
    (SELECT id FROM pizzeria WHERE name = 'Dominos'), 
    '2022-02-24');

-- SELECT *
-- FROM person_visits
-- ORDER BY 1;

-- psql -d day03 -U postgres  -f ex09/day03_ex09.sql

-- Please register new visits into Dominos restaurant from Denis and Irina on 24th of February 2022. 
-- Warning: this exercise will probably be the cause of changing data in the wrong way. 
-- Actually, you can restore the initial database model with data from the link 
-- in the “Rules of the day” section and replay script from Exercises 07 and 08..

-- Пожалуйста, зарегистрируйте новые посещения ресторана Dominos 
-- Денисом и Ириной 24 февраля 2022 года. 
-- Внимание: это упражнение, вероятно, приведет к неправильному изменению данных. 
-- На самом деле, вы можете восстановить исходную модель базы данных 
-- с помощью данных по ссылке в разделе “Правила дня” и воспроизвести сценарий из упражнений 07 и 08..

-- Запрещено: Не используйте прямые номера для идентификаторов первичного ключа и пиццерии