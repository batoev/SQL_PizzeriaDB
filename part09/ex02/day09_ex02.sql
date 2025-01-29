-- BEGIN;

CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit() 
RETURNS TRIGGER AS $person_audit$
BEGIN
    IF (TG_OP = 'DELETE') THEN
        INSERT INTO person_audit(created, type_event, row_id, name, age, gender, address)
            SELECT current_timestamp, 'D', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address;
    END IF;
    RETURN NULL;
END;
$person_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_delete_audit 
AFTER DELETE ON person
FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_delete_audit();

DELETE FROM person WHERE id = 10;

-- SELECT *
-- FROM person;

-- SELECT *
-- FROM person_audit;

-- COMMIT;
-- ROLLBACK;

-- psql -d day09 -U postgres -f ex02/day09_ex02.sql

-- Упражнение 02 - Аудит входящих удалений

-- Наконец, нам нужно обработать инструкции DELETE и создать копию СТАРЫХ состояний для всех значений атрибута. 
-- Пожалуйста, создайте триггер trg_person_delete_audit и соответствующую триггерную функцию fnc_trg_person_delete_audit.

-- Когда вы будете готовы, используйте приведенную ниже инструкцию SQL.

-- УДАЛИТЬ ИЗ person, ГДЕ id = 10;

------------

-- Finally, we need to handle DELETE statements and make a copy of the OLD states for all attribute’s values. 
-- Please create a trigger trg_person_delete_audit and corresponding trigger function fnc_trg_person_delete_audit.

-- When you are ready, use the SQL statement below.

-- DELETE FROM person WHERE id = 10;

