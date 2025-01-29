-- Session #1
--1:
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SHOW TRANSACTION ISOLATION LEVEL;
--3:
SELECT SUM(rating) FROM pizzeria;

--5:
SELECT SUM(rating) FROM pizzeria;
COMMIT;
SELECT SUM(rating) FROM pizzeria;

--  Session #2
--2:
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SHOW TRANSACTION ISOLATION LEVEL;

--4:
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
COMMIT;

--6:
SELECT SUM(rating) FROM pizzeria;

-- psql -d day07 -U postgres -f ex06/day08_ex06.sql

-- Упражнение 06 - Фантомные считывания для повторяемого считывания

-- Пожалуйста, используйте командную строку для базы данных PostgreSQL (psql) для этой задачи. 
-- Вам нужно проверить, как ваши изменения будут опубликованы в базе данных для других пользователей базы данных.
-- На самом деле, нам нужны два активных сеанса (т.е. 2 параллельных сеанса в командной строке).

-- Давайте проверим один из известных шаблонов базы данных "фантомного чтения", но с уровнем изоляции ПОВТОРЯЕМОЕ ЧТЕНИЕ. 
-- Вы можете увидеть графическое представление этой аномалии на рисунке. 
-- Горизонтальная красная линия представляет окончательные результаты после всех последовательных шагов для обоих сеансов

-- Пожалуйста, суммируйте все оценки для всех пиццерий в режиме одной транзакции для сеанса №1, 
-- а затем ОБНОВИТЕ рейтинг до 5 для ресторана "Pizza Hut" в сеансе №2 (в том же порядке, что и на картинке).

----------------

-- Please use the command line for PostgreSQL database (psql) for this task. 
-- You need to check how your changes will be published to the database for other database users.
-- Actually, we need two active sessions (i.e. 2 parallel sessions in the command line).

-- Let's check one of the famous "Phantom Reads" database patterns, but under the isolation level REPEATABLE READ. 
-- You can see a graphical representation of this anomaly on a picture. 
-- The horizontal red line represents the final results after all sequential steps for both Sessions.

-- Please summarize all ratings for all pizzerias in one transaction mode for Session #1 
-- and then UPDATE the rating to 5 value for "Pizza Hut" restaurant in Session #2 (in the same order as in the picture).