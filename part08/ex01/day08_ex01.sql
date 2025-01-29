-- Session #1
--1:
BEGIN;

--3:
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

--5:
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';

--7:
COMMIT;

--9:
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

--  Session #2
--2:
BEGIN;

--4:
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

--6:
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';

--8:
COMMIT;

--10:
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- psql -d day07 -U postgres -f ex01/day08_ex01.sql

-- Упражнение 01 - Аномалия потерянного обновления

-- Пожалуйста, используйте командную строку для базы данных PostgreSQL (psql) для этой задачи. 
-- Вам нужно проверить, как ваши изменения будут опубликованы в базе данных для других пользователей базы данных.

-- На самом деле, нам нужны два активных сеанса (т.е. 2 параллельных сеанса в командной строке).

-- Перед запуском задачи убедитесь, что у вас стандартный уровень изоляции в вашей базе данных. 
-- Просто запустите следующую инструкцию SHOW TRANSACTION ISOLATION LEVEL;
-- и результатом должно быть "read committed".

-- Если нет, пожалуйста, установите уровень изоляции read committed явно на уровне сеанса.

-- Давайте рассмотрим один из известных шаблонов базы данных "Аномалия потерянного обновления". 
-- Вы можете увидеть графическое представление этой аномалии на рисунке. 
-- Горизонтальная красная линия представляет окончательные результаты после
-- всех последовательных шагов для обоих сеансов.

-- Пожалуйста, проверьте рейтинг "Pizza Hut" в режиме транзакции для обоих сеансов, 
-- а затем обновите рейтинг до значения 4 в сеансе №1 и
-- обновите рейтинг до значения 3,6 в сеансе №2 (в том же порядке, что и на картинке).

-- -------------

-- Please use the command line for PostgreSQL database (psql) for this task. 
-- You need to check how your changes will be published to the database for other database users.

-- Actually, we need two active sessions (i.e. 2 parallel sessions in the command line).

-- Before running a task, make sure you are at a standard isolation level in your database. 
-- Just run the following statement SHOW TRANSACTION ISOLATION LEVEL; 
-- and the result should be "read committed".

-- If not, please set the read committed isolation level explicitly on a session level.

-- Let's examine one of the famous "Lost Update Anomaly" database patterns. 
-- You can see a graphical representation of this anomaly on a picture. 
-- The horizontal red line represents the final results after 
-- all  sequential steps for both Sessions.

-- Please check a rating for "Pizza Hut" in a transaction mode for both sessions 
-- and then make an UPDATE of the rating to a value of 4 in Session #1 and make an 
-- UPDATE of the rating to a value of 3.6 in Session #2 (in the same order as in the picture).