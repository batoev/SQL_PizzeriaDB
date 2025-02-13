# SQL_PizzeriaDB
Учебный проект на основе PostgreSQL

Каждая часть проекта - это решения заданий, которые разделены по темам. Рекомендуемое время выполнения каждой части - 1 день.  

## Part00

Получение необходимых данных, используя базовые конструкции SQL.  
[Перейти к заданиям для Part00](part00/Tasks_for_day00.md)

## Part01

Получение необходимых данных, используя множества и простые JOIN-ы.  
[Перейти к заданиям для Part01](part01/Tasks_for_day01.md)  

## Part02

Получение необходимых данных, используя различные структуры JOIN-ов.  
[Перейти к заданиям для Part02](part02/Tasks_for_day02.md)  

## Part03

Изменение данных с помощью языка DML.  
[Перейти к заданиям для Part03](part03/Tasks_for_day03.md)  

## Part04

Использование виртуальных представлений.  
[Перейти к заданиям для Part04](part04/Tasks_for_day04.md)  

## Part05

Cоздание индексов в базе данных.  
[Перейти к заданиям для Part05](part05/Tasks_for_day05.md)  

## Part06

Добавление новой бизнес-функции в модель данных.  
[Перейти к заданиям для Part06](part06/Tasks_for_day06.md)  

## Part07

Использование специальных OLAP-конструкций.  
[Перейти к заданиям для Part07](part07/Tasks_for_day07.md)  

## Part08

Работа с транзакциями и уровнями изоляции.  
[Перейти к заданиям для Part08](part08/Tasks_for_day08.md)  

## Part09

Использование функциональных блоков в базах данных.  
[Перейти к заданиям для Part09](part09/Tasks_for_day09.md)  

## Общие сведения необходимые для выполнения проекта

- Убедитесь, что у вас есть собственная база данных и доступ к ней в вашем кластере PostgreSQL.
- Пожалуйста, загрузите [скрипт](materials/model.sql) с моделью базы данных здесь и примените его к вашей базе данных (вы можете использовать командную строку с psql или просто запустить его через любую IDE, например DataGrip от JetBrains или pgAdmin от сообщества PostgreSQL).
- Все задания содержат список разрешенных и запрещенных разделов с перечисленными опциями базы данных, типами базы данных, конструкциями SQL и т.д. Пожалуйста, ознакомьтесь с этим разделом, прежде чем начинать.
- Логическое представление нашей модели базы данных.

  ![schema](materials/images/schema.png)  


1. **Таблица pizzeria** (справочная таблица с доступными пиццериями)
- поле id - первичный ключ
- поле name - название пиццерии
- поле rating - средний рейтинг пиццерии (от 0 до 5 баллов)
2. **Таблица person** (справочная таблица с людьми, которые любят пиццу)
- поле id - первичный ключ
- поле name - имя человека
- поле age - возраст человека
- поле gender - пол человека
- поле address - адрес человека
3. **Таблица menu** (справочная таблица с доступным меню и ценами на конкретную пиццу)
- поле id - первичный ключ
- поле pizzeria_id - внешний ключ на piz
zeria
- поле pizza_name - название пиццы в пиццерии
- поле price - цена конкретной пиццы
4. **Таблица person_visits** (операционная таблица с информацией о посещениях пиццерии)
- поле id - первичный ключ
- поле person_id - внешний ключ на person
- поле pizzeria_id - внешний ключ на pizzeria
- поле visit_date - дата (например, 2022-01-01) посещения человеком
5. **Таблица person_order** (операционная таблица с информацией о заказах людей)
- поле id - первичный ключ
- поле person_id - внешний ключ на person
- поле menu_id - внешний ключ на menu
- поле order_date - дата (например, 2022-01-01) заказа человека

Посещение людей и заказы людей - это разные сущности и не содержат никакой корреляции между данными. Например, клиент может быть в одном ресторане (просто просматривая меню) и в это же время сделать заказ в другом по телефону или через мобильное приложение. Или в другом случае, просто быть дома и снова сделать звонок с заказом без каких-либо посещений.