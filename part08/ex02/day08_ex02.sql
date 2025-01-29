-- Session #1
--1:
BEGIN;
SHOW TRANSACTION ISOLATION LEVEL;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SHOW TRANSACTION ISOLATION LEVEL;

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
SHOW TRANSACTION ISOLATION LEVEL;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SHOW TRANSACTION ISOLATION LEVEL;

--4:
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

--6:
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';

--8:
COMMIT;

--10:
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- # запуска интерактивного клиента командной строки PostgreSQL(psql) под пользователем postgres:
-- sudo -u postgres psql
--#подключение к БД Day07
--\c day07
--команда для начала новой транзакции (см. п.1):
-- BEGIN;
--#Посмотреть стандартный уровень изоляции в вашей базе данных:
--SHOW TRANSACTION ISOLATION LEVEL;
--#Установитьь стандартный уровень изоляции в вашей базе данных REPEATABLE READ:
--SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
--далеее по пунктам, для каждой сессии:

-- psql -d day07 -U postgres -f ex02/day08_ex02.sql

-- Упражнение 02 - Потерянное обновление для повторного чтения

-- Пожалуйста, используйте командную строку для базы данных PostgreSQL (psql) для этой задачи. 
-- Вам нужно проверить, как ваши изменения будут опубликованы в базе
-- данных для других пользователей базы данных.
-- На самом деле, нам нужны два активных сеанса (т.е. 2 параллельных сеанса в командной строке).

-- Давайте рассмотрим один из известных шаблонов базы данных "Аномалия потерянного обновления",
-- но с уровнем изоляции ПОВТОРЯЕМОГО чтения. 
-- Вы можете увидеть графическое представление этой аномалии на рисунке. 
-- Горизонтальная красная линия означает окончательные результаты после всех последовательных шагов для обоих сеансов.

-- Пожалуйста, проверьте рейтинг "Pizza Hut" в режиме транзакции для обоих сеансов, 
-- а затем обновите рейтинг до значения 4 в сеансе №1
-- и обновите рейтинг до значения 3,6 в сеансе №2
-- (в том же порядке, что и на картинке).

---------------

-- Please use the command line for PostgreSQL database (psql) for this task. 
-- You need to check how your changes will be published to the database 
-- for other database users.
-- Actually, we need two active sessions (i.e. 2 parallel sessions in the command line).

-- Let's examine one of the famous "Lost Update Anomaly" database patterns, 
-- but under the REPEATABLE READ isolation level. 
-- You can see a graphical representation of this anomaly on a picture. 
-- Horizontal red line means the final results after all sequential steps for both Sessions.

-- Please check a rating for "Pizza Hut" in a transaction mode for both sessions 
-- and then make an UPDATE of the rating to a value of 4 in Session #1 
-- and make an UPDATE of the rating to a value of 3.6 in Session #2 
-- (in the same order as in the picture).