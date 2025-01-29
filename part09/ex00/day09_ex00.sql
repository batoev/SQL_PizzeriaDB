-- BEGIN;

-- SELECT *
-- FROM person;

CREATE TABLE person_audit(
    created timestamp with time zone DEFAULT current_timestamp NOT NULL,
    type_event char(1) DEFAULT 'I' NOT NULL,
    row_id bigint NOT NULL,
    name varchar,
    age integer,
    gender varchar,
    address varchar
    );

ALTER TABLE person_audit ADD CONSTRAINT ch_type_event CHECK (type_event IN ('I', 'U', 'D'));

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit() 
RETURNS TRIGGER AS $person_audit$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        INSERT INTO person_audit
            SELECT current_timestamp, 'I', new.id, new.name, new.age, new.gender, new.address;
    END IF;
    RETURN NULL;
END;
$person_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit 
AFTER INSERT ON person
FOR EACH ROW 
EXECUTE FUNCTION fnc_trg_person_insert_audit();

INSERT INTO person VALUES (10,'Damir', 22, 'male', 'Irkutsk');

-- SELECT *
-- FROM person;

-- SELECT *
-- FROM person_audit;

-- COMMIT;
-- ROLLBACK;

-- psql -d day09 -U postgres -f ex00/day09_ex00.sql

-- Упражнение 00 - Аудит входящих вставок

-- Мы хотим лучше работать с данными и не хотим потерять ни одного события изменения. 
-- Давайте реализуем функцию аудита для входящих изменений INSERT. 
-- Пожалуйста, создайте таблицу person_audit с той же структурой, что и таблица person,
-- но, пожалуйста, добавьте некоторые дополнительные изменения. 
-- Взгляните на приведенную ниже таблицу с описаниями для каждого столбца.

-- На самом деле, давайте создадим функцию запуска базы данных с именем fnc_trg_person_insert_audit, 
-- которая должна обрабатывать трафик INSERT DML и создавать копию новой строки в таблице person_audit.

-- Просто подсказка, если вы хотите реализовать триггер PostgreSQL (пожалуйста, прочтите это в документации по PostgreSQL), 
-- вам нужно создать 2 объекта: 
-- Функция запуска базы данных и триггер базы данных.

-- Итак, пожалуйста, определите триггер базы данных с именем trg_person_insert_audit со следующими параметрами:

-- триггер с параметром "ДЛЯ КАЖДОЙ СТРОКИ";
-- триггер с параметром "ПОСЛЕ ВСТАВКИ";
-- триггер вызывает триггерную функцию fnc_trg_person_insert_audit.
-- Когда вы закончите с объектами триггера, пожалуйста, выполните инструкцию INSERT в таблицу person. 
-- ВСТАВИТЬ В person(id, имя, возраст, пол, адрес) ЗНАЧЕНИЯ (10,'Дамир', 22, 'мужчина', 'Иркутск');

---------------

-- We want to be stronger with data, and we don't want to lose any change events. 
-- Let's implement an audit function for the incoming changes of INSERT. 
-- Please create a table person_audit with the same structure as a person_audit table, 
-- but please add some additional changes. 
-- Take a look at the table below with descriptions for each column.

-- Column	    |   Type                    |   Description
----------------+---------------------------+--------------------------------------------------
-- created	    |timestamp with time zone	|timestamp when a new event has been created. 
--              |                           |Default value is a current timestamp and NOT NULL
----------------+---------------------------+--------------------------------------------------
-- type_event	|char(1)	                |possible values I (insert), D (delete), U (update). 
--              |                           |Default value is ‘I’. NOT NULL. 
--              |                           |Add check constraint ch_type_event with possible values ‘I’, ‘U’ and ‘D’
----------------+---------------------------+--------------------------------------------------
-- row_id	    |bigint	                    |copy of person.id. NOT NULL
----------------+---------------------------+--------------------------------------------------
-- name	        |varchar	                |copy of person.name (no any constraints)
----------------+---------------------------+--------------------------------------------------
-- age	        |integer	                |copy of person.age (no any constraints)
----------------+---------------------------+--------------------------------------------------
-- gender	    |varchar	                |copy of person.gender (no any constraints)
----------------+---------------------------+--------------------------------------------------
-- address	    |varchar	                |copy of person.address (no any constraints)
----------------+---------------------------+--------------------------------------------------

-- Actually, let’s create a Database Trigger Function with the name fnc_trg_person_insert_audit 
-- that should process INSERT DML traffic and make a copy of a new row in the person_audit table.

-- Just a hint, if you want to implement a PostgreSQL trigger (please read it in PostgreSQL documentation), 
-- you need to create 2 objects: 
-- Database Trigger Function and Database Trigger.

-- So, please define a Database Trigger with the name trg_person_insert_audit with the following options:

-- trigger with "FOR EACH ROW" option;
-- trigger with "AFTER INSERT";
-- trigger calls fnc_trg_person_insert_audit trigger function.
-- When you are done with the trigger objects, please issue an INSERT statement into the person_audit table. 
-- INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');