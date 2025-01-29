-- BEGIN;

CREATE OR REPLACE FUNCTION fnc_trg_person_update_audit() 
RETURNS TRIGGER AS $person_audit$
BEGIN
    IF (TG_OP = 'UPDATE') THEN
        INSERT INTO person_audit(created, type_event, row_id, name, age, gender, address)
            SELECT current_timestamp, 'U', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address;
    END IF;
    RETURN NULL;
END;
$person_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_update_audit 
AFTER UPDATE ON person
FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_update_audit();

UPDATE person SET name = 'Bulat' WHERE id = 10; 
UPDATE person SET name = 'Damir' WHERE id = 10;

-- SELECT *
-- FROM person;

-- SELECT *
-- FROM person_audit;

-- COMMIT;
-- ROLLBACK;

-- psql -d day09 -U postgres -f ex01/day09_ex01.sql

-- Упражнение 01 - Аудит входящих обновлений

-- Давайте продолжим внедрять наш шаблон аудита для таблицы person. 
-- Просто определите триггер trg_person_update_audit и
-- соответствующую триггерную функцию fnc_trg_person_update_audit для обработки всего трафика обновлений в таблице person. 
-- Мы должны сохранить старые состояния всех значений атрибутов.

-- Когда вы будете готовы, примените инструкции ОБНОВЛЕНИЯ, приведенные ниже.

-- ОБНОВИТЕ имя пользователя = 'Булат', ГДЕ id = 10; ОБНОВИТЕ имя пользователя = 'Дамир', ГДЕ id = 10;

----------

-- Let’s continue to implement our audit pattern for the person table. 
-- Just define a trigger trg_person_update_audit and 
-- corresponding trigger function fnc_trg_person_update_audit to handle all UPDATE traffic on the person table. 
-- We should save the COLD states of all attribute values.

-- When you are ready, apply the UPDATE statements below.

-- UPDATE person SET name = 'Bulat' WHERE id = 10; UPDATE person SET name = 'Damir' WHERE id = 10;