# Day 01 - Piscine SQL

## _Первые шаги по работе с sets and JOINs в SQL_

Резюме: Сегодня вы увидите, как получить необходимые данные на основе конструкций множеств и простых соединений

## Exercise 00 - Let’s make UNION dance

| Exercise 00: Let’s make UNION dance |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex00                                                                                                                     |
| Files to turn-in                      | `day01_ex00.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | ANSI SQL                                                                                              |

Пожалуйста, напишите инструкцию SQL, которая возвращает идентификатор меню и названия пицц из таблицы `menu`, а также идентификатор пользователя и имя пользователя из таблицы `person` в одном глобальном списке (с именами столбцов, как показано в примере ниже), упорядоченных по столбцам object_id, а затем по столбцам object_name.

| object_id | object_name |
| ------ | ------ |
| 1 | Anna |
| 1 | cheese pizza |
| ... | ... |

## Exercise 01 - UNION dance with subquery

| Exercise 01: UNION dance with subquery|                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex01                                                                                                                     |
| Files to turn-in                      | `day01_ex01.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | ANSI SQL                                                                                              |

Пожалуйста, измените инструкцию SQL из “exercise 00”, удалив столбец object_id. Затем измените порядок по object_name для части данных из таблицы `person`, а затем из таблицы `menu` (как показано в примере ниже). Пожалуйста, сохраните дубликаты!

| object_name |
| ------ |
| Andrey |
| Anna |
| ... |
| cheese pizza |
| cheese pizza |
| ... |


## Exercise 02 - Duplicates or not duplicates

| Exercise 02: Duplicates or not duplicates|                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex02                                                                                                                     |
| Files to turn-in                      | `day01_ex02.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | ANSI SQL                                                                                              |
| **Denied**                               |                                                                                                                          |
| SQL Syntax Construction                        | `DISTINCT`, `GROUP BY`, `HAVING`, any type of `JOINs`                                                                                              |

Пожалуйста, напишите инструкцию SQL, которая возвращает уникальные названия пицц из таблицы `menu` и упорядочивает их по столбцу pizza_name в порядке убывания. Пожалуйста, обратите внимание на раздел "Отказано".

## Exercise 03 - “Hidden” Insights

| Exercise 03: “Hidden” Insights |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex03                                                                                                                     |
| Files to turn-in                      | `day01_ex03.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | ANSI SQL                                                                                              |
| **Denied**                               |                                                                                                                          |
| SQL Syntax Construction                        |  any type of `JOINs`                                                                                              |

Пожалуйста, напишите инструкцию SQL, которая возвращает общие строки для атрибутов order_date, person_id из таблицы `person_order` с одной стороны и visit_date, person_id из таблицы `person_visits` с другой стороны (пожалуйста, смотрите пример ниже). Другими словами, давайте найдем идентификаторы людей, которые посетили и заказали пиццу в один и тот же день. На самом деле, пожалуйста, добавьте заказ по дате действия_в порядке возрастания, а затем по идентификатору персонала_в порядке убывания.

| action_date | person_id |
| ------ | ------ |
| 2022-01-01 | 6 |
| 2022-01-01 | 2 |
| 2022-01-01 | 1 |
| 2022-01-03 | 7 |
| 2022-01-04 | 3 |
| ... | ... |

## Exercise 04 - Difference? Yep, let's find the difference between multisets.


| Exercise 04: Difference? Yep, let's find the difference between multisets. |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex04                                                                                                                     |
| Files to turn-in                      | `day01_ex04.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | ANSI SQL                                                                                              |
| **Denied**                               |                                                                                                                          |
| SQL Syntax Construction                        |  any type of `JOINs`                                                                                              |

Пожалуйста, напишите инструкцию SQL, которая возвращает разницу (минус) значений столбца person_id с сохранением дубликатов между таблицами `person_order` и `person_visits` для order_date и visit_date для 7 января 2022 года

## Exercise 05 - Did you hear about Cartesian Product?


| Exercise 05: Did you hear about Cartesian Product? |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex05                                                                                                                     |
| Files to turn-in                      | `day01_ex05.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | ANSI SQL                                                                                              |

Пожалуйста, напишите инструкцию SQL, которая возвращает все возможные комбинации между таблицами `person` и `pizzeria`, и, пожалуйста, установите порядок по идентификатору пользователя, а затем по столбцам идентификатора пиццерии. Пожалуйста, ознакомьтесь с приведенным ниже примером результатов. Имейте в виду, что названия столбцов могут отличаться для вас.

| person.id | person.name | age | gender | address | pizzeria.id | pizzeria.name | rating |
| ------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ |
| 1 | Anna | 16 | female | Moscow | 1 | Pizza Hut | 4.6 |
| 1 | Anna | 16 | female | Moscow | 2 | Dominos | 4.3 |
| ... | ... | ... | ... | ... | ... | ... | ... |


## Exercise 06 - Lets see on “Hidden” Insights


| Exercise 06: Lets see on “Hidden” Insights |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex06                                                                                                                     |
| Files to turn-in                      | `day01_ex06.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | ANSI SQL                                                                                              |

Let's return our mind back to exercise #03 and change our SQL statement to return person names instead of person identifiers and change ordering by action_date in ascending mode and then by person_name in descending mode. Please take a look at a data sample below.

| action_date | person_name |
| ------ | ------ |
| 2022-01-01 | Irina |
| 2022-01-01 | Anna |
| 2022-01-01 | Andrey |
| ... | ... |

## Exercise 07 - Just make a JOIN


| Exercise 07: Just make a JOIN |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex07                                                                                                                     |
| Files to turn-in                      | `day01_ex07.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | ANSI SQL                                                                                              |

Давайте вернемся к упражнению № 03 и изменим нашу инструкцию SQL, чтобы она возвращала имена людей вместо идентификаторов лиц, и изменим порядок по action_date в режиме возрастания, а затем по person_name в режиме убывания. Пожалуйста, взгляните на образец данных ниже.

| order_date | person_information |
| ------ | ------ |
| 2022-01-01 | Andrey (age:21) |
| 2022-01-01 | Andrey (age:21) |
| 2022-01-01 | Anna (age:16) |
| ... | ... |

## Exercise 08 - Migrate JOIN to NATURAL JOIN


| Exercise 08: Migrate JOIN to NATURAL JOIN |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex08                                                                                                                     |
| Files to turn-in                      | `day01_ex08.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | ANSI SQL                                                                                              |
| SQL Syntax Construction                        | `NATURAL JOIN`                                                                                              |
| **Denied**                               |                                                                                                                          |
| SQL Syntax Construction                        | other type of  `JOINs`                                                                                              |

Пожалуйста, перепишите инструкцию SQL из упражнения №07, используя конструкцию ЕСТЕСТВЕННОГО СОЕДИНЕНИЯ. Результат должен быть таким же, как в упражнении №07.  

## Exercise 09 - IN versus EXISTS


| Exercise 09: IN versus EXISTS |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex09                                                                                                                     |
| Files to turn-in                      | `day01_ex09.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | ANSI SQL                                                                                              |

Пожалуйста, напишите 2 инструкции SQL, которые возвращают список названий пиццерий, которые не посещались людьми, используя IN для 1-й и EXISTS для 2-й.

## Exercise 10 - Global JOIN


| Exercise 10: Global JOIN |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex10                                                                                                                     |
| Files to turn-in                      | `day01_ex10.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | ANSI SQL                                                                                              |

Пожалуйста, напишите инструкцию SQL, которая возвращает список имен пользователей, которые сделали заказ пиццы в соответствующей пиццерии. 
Пример результата (с именованными столбцами) приведен ниже, и да ... пожалуйста, оформляйте заказ по 3 столбцам (`person_name`, `pizza_name`, `pizzeria_name`) в порядке возрастания.  

| person_name | pizza_name | pizzeria_name | 
| ------ | ------ | ------ |
| Andrey | cheese pizza | Dominos |
| Andrey | mushroom pizza | Dominos |
| Anna | cheese pizza | Pizza Hut |
| ... | ... | ... |

