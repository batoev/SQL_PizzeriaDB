-- Session #1
--1:
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

--3:
UPDATE pizzeria SET rating = 3.14 WHERE id = 1;

--5:
UPDATE pizzeria SET rating = 4.2 WHERE id = 2;

--7:
COMMIT;

--9:
-- SELECT * FROM pizzeria WHERE id = 1;

--  Session #2
--2:
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

--4:
UPDATE pizzeria SET rating = 4.1 WHERE id = 2;

--6:
UPDATE pizzeria SET rating = 5 WHERE id = 1;

--8:
COMMIT;

--10:
-- SELECT * FROM pizzeria WHERE id = 2;

-- psql -d day07 -U postgres -f ex07/day08_ex07.sql

-- Упражнение 07 - Тупик

-- Пожалуйста, используйте командную строку для базы данных PostgreSQL (psql) для этой задачи. 
-- Вам нужно проверить, как ваши изменения будут опубликованы в базе данных для других пользователей базы данных.
-- На самом деле, нам нужны два активных сеанса (т.е. 2 параллельных сеанса в командной строке).
-- Давайте воспроизведем тупиковую ситуацию в нашей базе данных.

-- Вы можете увидеть графическое представление ситуации взаимоблокировки на рисунке. 
-- Это выглядит как "взаимоблокировка" между параллельными сеансами.

-- Пожалуйста, напишите любую инструкцию SQL с любым уровнем изоляции (вы можете использовать настройку по умолчанию) 
-- в таблице pizzeria, чтобы воспроизвести эту тупиковую ситуацию.

---------------------

-- Please use the command line for PostgreSQL database (psql) for this task. 
-- You need to check how your changes will be published to the database for other database users.
-- Actually, we need two active sessions (i.e. 2 parallel sessions in the command line).
-- Let’s reproduce a deadlock situation in our database.

-- You can see a graphical representation of the deadlock situation in a picture. 
-- It looks like a "Christ-lock" between parallel sessions.

-- Please write any SQL statement with any isolation level (you can use the default setting) 
-- on the table pizzeria to reproduce this deadlock situation.



