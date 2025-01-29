 -- Session #1
BEGIN;

UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

COMMIT;

--  Session #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- psql -d day07 -U postgres -f ex00/day08_ex00.sql

-- Упражнение 00 - Простая транзакция

-- Пожалуйста, используйте командную строку для базы данных PostgreSQL (psql) для этой задачи. 
-- Вам нужно проверить, как ваши изменения будут опубликованы в базе данных для других пользователей базы данных.

-- На самом деле, нам нужны два активных сеанса (т.е. 2 параллельных сеанса в командной строке).

-- Пожалуйста, предоставьте подтверждение того, 
-- что ваша параллельная сессия не сможет увидеть ваши изменения, пока вы не сделаете ФИКСАЦИЮ;

-- Смотрите шаги ниже.

-- Сессия №1

-- Рейтинг "Pizza Hut" обновлен до 5 баллов в режиме транзакции.
-- Убедитесь, что вы можете видеть изменения в сессии №1.
-- Сессия #2

-- Убедитесь, что вы не видите изменений в сессии #2.
-- Сессия #1

-- Опубликуйте свои изменения для всех параллельных сеансов.
-- Сеанс №2

-- Убедитесь, что вы можете видеть изменения в сеансе №2.
-- Итак, взгляните на пример наших выходных данных для сеанса №2.

-- -------------

-- Please use the command line for PostgreSQL database (psql) for this task. 
-- You need to check how your changes will be published to the database for other database users.

-- Actually, we need two active sessions (i.e. 2 parallel sessions in the command line).

-- Please provide a proof 
-- that your parallel session can’t see your changes until you will make a COMMIT;

-- See the steps below.

-- Session #1

-- Update of rating for "Pizza Hut" to 5 points in a transaction mode.
-- Check that you can see a changes in session #1.
-- Session #2

-- Check that you can’t see a changes in session #2.
-- Session #1

-- Publish your changes for all parallel sessions.
-- Session #2

-- Check that you can see a changes in session #2.
-- So, take a look on example of our output for Session #2.