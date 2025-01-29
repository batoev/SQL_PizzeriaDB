# Day 09 - Piscine SQL

## _RDBMS - это не просто таблицы_

Резюме: Сегодня вы увидите, как создавать и использовать функциональные блоки в базах данных.

## Rules of the day

- Наш способ получения знаний является постепенным и линейным, поэтому, пожалуйста, имейте в виду, что все изменения, которые вы внесли в День 03 во время упражнений 07-13, должны быть на месте (это похоже на то, что происходит в реальном мире, когда мы применяем релиз и должны быть согласованы с данными для новых изменений).

![schema](../materials/images/schema.png)

## Exercise 00 - Audit of incoming inserts

| Exercise 00: Audit of incoming inserts |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex00                                                                                                                     |
| Files to turn-in                      | `day09_ex00.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | SQL, DDL, DML|

Мы хотим улучшить работу с данными и не хотим потерять ни одного события, связанного с изменениями. Давайте внедрим функцию аудита для входящих изменений INSERT. 
Пожалуйста, создайте таблицу `person_audit` с такой же структурой, как у таблицы person, но, пожалуйста, внесите некоторые дополнительные изменения. Взгляните на приведенную ниже таблицу с описаниями для каждого столбца.

| Column | Type | Description |
| ------ | ------ | ------ |
| created | timestamp with time zone | timestamp when a new event has been created.  Default value is a current timestamp and NOT NULL |
| type_event | char(1) | possible values I (insert), D (delete), U (update). Default value is ‘I’. NOT NULL. Add check constraint `ch_type_event` with possible values ‘I’, ‘U’ and ‘D’ |
| row_id |bigint | copy of person.id. NOT NULL |
| name |varchar | copy of person.name (no any constraints) |
| age |integer | copy of person.age (no any constraints) |
| gender |varchar | copy of person.gender (no any constraints) |
| address |varchar | copy of person.address (no any constraints) |

На самом деле, давайте создадим функцию запуска базы данных с именем `fnc_trg_person_insert_audit`, которая должна обрабатывать `INSERT` DML-трафик и создавать копию новой строки в таблице `person_audit`.

Просто подсказка, если вы хотите реализовать триггер PostgreSQL (пожалуйста, прочтите это в документации по PostgreSQL), вам нужно создать 2 объекта: функцию запуска базы данных и триггер базы данных. 

Итак, пожалуйста, определите триггер базы данных с именем `trg_person_insert_audit` со следующими параметрами:
- триггер с параметром "FOR EACH ROW"(ДЛЯ КАЖДОЙ СТРОКИ);
- триггер с параметром "AFTER INSERT"(ПОСЛЕ ВСТАВКИ);
- триггер вызывает триггерную функцию `fnc_trg_person_insert_audit`.

Когда вы закончите работу с триггерными объектами, пожалуйста, введите инструкцию INSERT в таблицу person.
`INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');`


## Exercise 01 - Audit of incoming updates

| Exercise 01: Audit of incoming updates|                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex01                                                                                                                     |
| Files to turn-in                      | `day09_ex01.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | SQL, DDL, DML                                                                                              |

Давайте продолжим внедрять наш шаблон аудита для таблицы person. Просто определите триггер `trg_person_update_audit` и соответствующую триггерную функцию `fnc_trg_person_update_audit` для обработки всего трафика `UPDATE` в таблице `person`. Мы должны сохранить старые состояния всех значений атрибутов.

Когда вы будете готовы, примените инструкции по обновлению, приведенные ниже.

`UPDATE person SET name = 'Bulat' WHERE id = 10;`
`UPDATE person SET name = 'Damir' WHERE id = 10;`

## Exercise 02 - Audit of incoming deletes

| Exercise 02: Audit of incoming deletes|                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex02                                                                                                                     |
| Files to turn-in                      | `day09_ex02.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | SQL, DDL, DML                                                                                              |

Наконец, нам нужно обработать инструкции `DELETE` и создать копию СТАРЫХ состояний для всех значений атрибута. Пожалуйста, создайте триггер `trg_person_delete_audit` и соответствующую триггерную функцию `fnc_trg_person_delete_audit`. 

Когда вы будете готовы, воспользуйтесь инструкцией SQL, приведенной ниже.

`DELETE FROM person WHERE id = 10;`

## Exercise 03 - Generic Audit

| Exercise 03: Generic Audit |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex03                                                                                                                     |
| Files to turn-in                      | `day09_ex03.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | SQL, DDL, DML                                                                                              |

На самом деле, для одной таблицы `person` есть 3 триггера. Давайте объединим всю нашу логику в один основной триггер под названием `trg_person_audit` и новую соответствующую триггерную функцию `fnc_trg_person_audit`.

Другими словами, весь трафик DML (`INSERT`, `UPDATE`, `DELETE`) должен обрабатываться одним функциональным блоком. Пожалуйста, явно укажите отдельный блок IF-ELSE для каждого события (I, U, D)!

Кроме того, пожалуйста, выполните следующие действия.
- удалить 3 старых триггера из таблицы `person`;
- удалить 3 старых триггерных функции;
- выполнить `TRUNCATE` (or `DELETE`) всех строк в нашей таблице `person_audit`.

Когда вы будете готовы, повторно примените набор инструкций DML.
`INSERT INTO person(id, name, age, gender, address)  VALUES (10,'Damir', 22, 'male', 'Irkutsk');`
`UPDATE person SET name = 'Bulat' WHERE id = 10;`
`UPDATE person SET name = 'Damir' WHERE id = 10;`
`DELETE FROM person WHERE id = 10;`

## Exercise 04 - Database View VS Database Function


| Exercise 04: Database View VS Database Function |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex04                                                                                                                     |
| Files to turn-in                      | `day09_ex04.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | SQL, DDL, DML                                                                                              |

Как вы помните, мы создали 2 представления базы данных, чтобы разделить данные из таблиц person по признаку пола. 
Пожалуйста, определите 2 функции SQL (обратите внимание, не функции pl/pgsql) с именами:
- `fnc_persons_female` (должны возвращать данные о лицах женского пола).,
- `fnc_persons_male` (должен возвращать данные о лицах мужского пола).

Чтобы проверить себя и вызвать функцию, вы можете сформулировать следующее утверждение (потрясающе! Вы можете работать с функцией как с виртуальной таблицей!):

    SELECT *
    FROM fnc_persons_male();

    SELECT *
    FROM fnc_persons_female();

## Exercise 05 - Parameterized Database Function


| Exercise 05: Parameterized Database Function|                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex05                                                                                                                     |
| Files to turn-in                      | `day09_ex05.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        |  SQL, DDL, DML                                                                                               |

Похоже, что 2 функции из упражнения 04 нуждаются в более универсальном подходе. Пожалуйста, удалите эти функции из базы данных, прежде чем продолжить. 
Напишите универсальную SQL-функцию (обратите внимание, не pl/pgsql-функцию) с именем `fnc_persons`. У этой функции должен быть параметр `IN` gender со значением по умолчанию(default value) =  'female'. 

Чтобы проверить себя и вызвать функцию, вы можете сделать следующее заявление (Вау! Вы можете работать с функцией, как с виртуальной таблицей, но с большей гибкостью!):

    select *
    from fnc_persons(pgender := 'male');

    select *
    from fnc_persons();

## Exercise 06 - Function like a function-wrapper


| Exercise 06: Function like a function-wrapper|                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex06                                                                                                                     |
| Files to turn-in                      | `day09_ex06.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | SQL, DDL, DML                                                                                              |

Теперь давайте рассмотрим функции pl/pgsql. 

Пожалуйста, создайте функцию pl/pgsql `fnc_person_visits_and_eats_on_date` на основе инструкции SQL, которая будет находить названия пиццерий, которые посещал человек (`IN` параметре person со значением по умолчанию 'Dmitriy') и где он мог купить пиццу дешевле указанной суммы в рублях (`IN` параметре pprice со значением по умолчанию 'Dmitriy'). значение по умолчанию 500) на заданную дату (параметр `IN` pdate со значением по умолчанию 8 января 2022 года).

Чтобы проверить себя и вызвать функцию, вы можете сделать заявление, подобное приведенному ниже.

    select *
    from fnc_person_visits_and_eats_on_date(pprice := 800);

    select *
    from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');


## Exercise 07 - Different view to find a Minimum


| Exercise 07: Different view to find a Minimum|                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex07                                                                                                                     |
| Files to turn-in                      | `day09_ex07.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | SQL, DDL, DML                                                                                              |

Пожалуйста, напишите функцию SQL или pl/pgsql `func_minimum` (это зависит от вас), которая имеет входной параметр, представляющий собой массив чисел, и функция должна возвращать минимальное значение. 

Чтобы проверить себя и вызвать функцию, вы можете сделать заявление, подобное приведенному ниже.

    SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);


## Chapter XII
## Exercise 08 - Fibonacci algorithm is in a function


| Exercise 08: Fibonacci algorithm is in a function|                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex08                                                                                                                     |
| Files to turn-in                      | `day09_ex08.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | SQL, DDL, DML                                                                                              |

Напишите функцию SQL или pl/pgsql `fnc_fibonacci` (это зависит от вас), которая имеет входной параметр pstop типа integer (по умолчанию - 10), а выходные данные функции представляют собой таблицу всех чисел Фибоначчи, меньших, чем pstop.

Чтобы проверить себя и вызвать функцию, вы можете сделать заявление, подобное приведенному ниже.

    select * from fnc_fibonacci(100);
    select * from fnc_fibonacci();

[Вернуться в README.md](../README.md)