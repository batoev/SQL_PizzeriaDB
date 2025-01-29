-- BEGIN;

-- SELECT *
-- FROM person;

-- SELECT *
-- FROM person_audit;
----------------

CREATE OR REPLACE FUNCTION fnc_trg_person_audit() 
RETURNS TRIGGER AS $person_audit$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        INSERT INTO person_audit
            SELECT current_timestamp, 'I', new.id, new.name, new.age, new.gender, new.address;
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO person_audit(created, type_event, row_id, name, age, gender, address)
            SELECT current_timestamp, 'U', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address;
    ELSIF (TG_OP = 'DELETE') THEN
        INSERT INTO person_audit(created, type_event, row_id, name, age, gender, address)
            SELECT current_timestamp, 'D', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address;
    END IF;
    RETURN NULL;
END;
$person_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_audit 
AFTER INSERT OR UPDATE OR DELETE ON person
FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_audit();


DROP TRIGGER IF EXISTS trg_person_insert_audit ON person;
DROP TRIGGER IF EXISTS trg_person_update_audit ON person;
DROP TRIGGER IF EXISTS trg_person_delete_audit ON person;

DROP FUNCTION IF EXISTS fnc_trg_person_insert_audit;
DROP FUNCTION IF EXISTS fnc_trg_person_update_audit;
DROP FUNCTION IF EXISTS fnc_trg_person_delete_audit;

TRUNCATE TABLE person_audit;

INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk'); 
UPDATE person SET name = 'Bulat' WHERE id = 10; 
UPDATE person SET name = 'Damir' WHERE id = 10; 
DELETE FROM person WHERE id = 10;

-------------------
-- SELECT *
-- FROM person;

-- SELECT *
-- FROM person_audit;

-- -- COMMIT;
-- ROLLBACK;

-- psql -d day09 -U postgres -f ex03/day09_ex03.sql

-- Упражнение 03 - Общий аудит

-- На самом деле, есть 3 триггера для одной таблицы person. 
-- Давайте объединим всю нашу логику в один основной триггер с именем
-- trg_person_audit и новую соответствующую триггерную функцию fnc_trg_person_audit.

-- Другими словами, весь трафик DML (ВСТАВКА, ОБНОВЛЕНИЕ, УДАЛЕНИЕ) должен обрабатываться одним функциональным блоком. 
-- Пожалуйста, явно определите отдельный блок IF-ELSE для каждого события (I, U, D)!

-- Дополнительно, пожалуйста, выполните следующие действия.

-- чтобы удалить 3 старых триггера из таблицы person;
-- чтобы удалить 3 старые триггерные функции;
-- чтобы выполнить УСЕЧЕНИЕ (или УДАЛЕНИЕ) всех строк в нашей таблице person_audit.

-- Когда вы будете готовы, повторно примените набор инструкций DML.
-- INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk'); 
-- UPDATE person SET name = 'Bulat' WHERE id = 10; UPDATE person SET name = 'Damir' WHERE id = 10; 
-- DELETE FROM person WHERE id = 10;


-----------------------

-- Actually, there are 3 triggers for one person table. 
-- Let's merge all our logic into one main trigger called 
-- trg_person_audit and a new corresponding trigger function fnc_trg_person_audit.

-- In other words, all DML traffic (INSERT, UPDATE, DELETE) should be handled by the one function block. 
-- Please explicitly define a separate IF-ELSE block for each event (I, U, D)!

-- Additionally, please follow the steps below .

-- to remove 3 old triggers from the person table;
-- to remove 3 old trigger functions;
-- to do a TRUNCATE (or DELETE) of all rows in our person_audit table.

-- When you are ready, reapply the set of DML statements. 
-- INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk'); 
-- UPDATE person SET name = 'Bulat' WHERE id = 10; UPDATE person SET name = 'Damir' WHERE id = 10; 
-- DELETE FROM person WHERE id = 10;