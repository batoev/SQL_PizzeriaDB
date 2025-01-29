-- DROP TABLE person_discounts;

create table person_discounts (
    id bigint primary key ,
    person_id bigint not null ,
    pizzeria_id bigint not null ,
    constraint fk_person_discounts_person_id foreign key  (person_id) references person(id),
    constraint fk_person_discounts_pizzeria_id foreign key  (pizzeria_id) references pizzeria(id),
    discount numeric not null default 0
);

-- alter table person_discounts add constraint ch_discount check ( discount between 0 and 100);

-- insert into person_discounts values (1, 1, 1, 0);
-- insert into person_discounts values (2, 1, 1, 0);



-- psql -d day05 -U postgres -f ex00/day06_ex00.sql

-- Упражнение 00 - Скидки, дисконты, все любят скидки

-- Давайте расширим нашу модель данных, включив в нее новую бизнес-функцию. 
-- Каждый человек хочет получить персональную скидку, и каждый бизнес хочет быть ближе к клиентам.

-- Пожалуйста, подумайте о персональных скидках для посетителей с одной стороны и
-- ресторанов-пиццерий с другой. Необходимо создать новую реляционную таблицу
-- (пожалуйста, задайте имя person_discounts) со следующими правилами.

-- установите атрибут id как первичный ключ
-- (пожалуйста, взгляните на столбец id в существующих таблицах и выберите тот же тип данных).

-- установите для атрибутов person_id и pizzeria_id внешние ключи для соответствующих таблиц 
-- (типы данных должны быть такими же, как для столбцов id в соответствующих родительских таблицах)

-- пожалуйста, задайте явные имена для ограничений внешних ключей по шаблону fk_{имя_таблицы}_{имя_колонки},
-- например fk_person_discounts_person_id

-- добавьте атрибут discount, чтобы сохранить значение скидки в процентах. 
-- Помните, что значением скидки может быть число с плавающей точкой 
-- (пожалуйста, просто используйте тип данных numeric). 
-- Поэтому, пожалуйста, выберите соответствующий тип данных, чтобы учесть эту возможность.
------------------------------------------------
-- Let’s expand our data model to involve a new business feature. 
-- Every person wants to see a personal discount and every business wants to be closer for clients.

-- Please think about personal discounts for people from one side and 
-- pizzeria restaurants from other. Need to create a new relational table 
-- (please set a name person_discounts) with the next rules.

-- set id attribute like a Primary Key 
-- (please take a look on id column in existing tables and choose the same data type)

-- set for attributes person_id and pizzeria_id foreign keys for corresponding tables 
-- (data types should be the same like for id columns in corresponding parent tables)

-- please set explicit names for foreign keys constraints by pattern fk_{table_name}_{column_name}, 
-- for example fk_person_discounts_person_id

-- add a discount attribute to store a value of discount in percent. 
-- Remember, discount value can be a number with floats 
-- (please just use numeric data type). 
-- So, please choose the corresponding data type to cover this possibility.