insert into person_visits(id, person_id, pizzeria_id, visit_date) values (
    (SELECT max(id) + 1 FROM person_visits),  
    (SELECT id FROM person WHERE name = 'Dmitriy'),
    (SELECT id FROM pizzeria WHERE name = 'Best Pizza'), 
    '2022-01-08');

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;

-- SELECT *
-- FROM mv_dmitriy_visits_and_eats;

-- SELECT *
-- FROM menu
-- WHERE menu.price < 800;

-- SELECT *
-- FROM person_visits;

-- SELECT *
-- FROM pizzeria;

-- psql -d day04 -U postgres  -f ex07/day05_ex07.sql

-- Упражнение 07 - Освежите наше состояние

-- Let's refresh data in our Materialized View mv_dmitriy_visits_and_eats from exercise #06. 
-- Before this action, please generate one more Dmitriy visit 
-- that satisfies the SQL clause of Materialized View except pizzeria 
-- that we can see in a result from exercise #06. 
-- After adding a new visit please refresh a state of data for mv_dmitriy_visits_and_eats.

-- Давайте обновим данные в нашем материализованном представлении mv_dmitriy_visits_and_eats из упражнения #06. 
-- Перед этим действием, пожалуйста, сгенерируйте еще один визит Дмитрия
-- , который удовлетворяет SQL-предложению Materialized View, за исключением пиццерии
-- , которую мы можем видеть в результате упражнения #06. 
-- После добавления нового посещения, пожалуйста, обновите состояние данных для mv_dmitriy_visits_and_eats.

-- Не используйте прямые номера для идентификаторов первичного ключа, персоны и пиццерии