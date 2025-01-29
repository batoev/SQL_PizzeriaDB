-- Session #1
--1:
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SHOW TRANSACTION ISOLATION LEVEL;
--3:
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

--5:
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

--  Session #2
--2:
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SHOW TRANSACTION ISOLATION LEVEL;

--4:
UPDATE pizzeria SET rating = 3 WHERE name = 'Pizza Hut';
COMMIT;

--6:
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- psql -d day07 -U postgres -f ex03/day08_ex03.sql

-- Уровень изоляции SERIALIZABLE обеспечивает самый высокий уровень защиты 
-- от конкурентной одновременной записи и чтения в многопоточной среде.

-- Когда уровень изоляции установлен на SERIALIZABLE, 
-- каждая транзакция должна ждать завершения всех предыдущих транзакций перед тем, 
-- как считать или модифицировать данные. Это означает, что данные, заблокированные одной транзакцией, 
-- недоступны для других транзакций до тех пор, пока первая транзакция не завершится.

-- Это свойство гарантирует, что все операции чтения и записи выполняются в полностью изолированном контексте, 
-- эффективно предотвращая возникновение конфликтов и сохраняя целостность данных.

-------------------

-- Упражнение 04 - Неповторяемые считывания для сериализации

-- Пожалуйста, используйте командную строку для базы данных PostgreSQL (psql) для этой задачи. 
-- Вам нужно проверить, как ваши изменения будут опубликованы в базе данных для других пользователей базы данных.

-- На самом деле, нам нужны два активных сеанса (т.е. 2 параллельных сеанса в командной строке).

-- Давайте проверим один из известных шаблонов базы данных "Non-Repeatable Reads" (Неповторяемое чтение), 
-- но с уровнем СЕРИАЛИЗУЕМОЙ изоляции. 
-- Вы можете увидеть графическое представление этой аномалии на рисунке. 
-- Горизонтальная красная линия представляет окончательные результаты после всех последовательных шагов для обоих сеансов.

-- Пожалуйста, проверьте рейтинг "Pizza Hut" в режиме транзакции для сеанса №1,
-- а затем обновите рейтинг до значения 3,0 в сеансе №2 (в том же порядке, что и на картинке).

--------------

-- Please use the command line for PostgreSQL database (psql) for this task. 
-- You need to check how your changes will be published to the database for other database users.

-- Actually, we need two active sessions (i.e. 2 parallel sessions in the command line).

-- Let's check one of the famous "Non-Repeatable Reads" database patterns, 
-- but under the SERIALIZABLE isolation level. 
-- You can see a graphical representation of this anomaly on a picture. 
-- The horizontal red line represents the final results after all sequential steps for both Sessions.

-- Please check a rating for "Pizza Hut" in a transaction mode for Session #1, 
-- and then make an UPDATE of the rating to a value of 3.0 in Session #2 (in the same order as in the picture).