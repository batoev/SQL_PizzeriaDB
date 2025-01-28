CREATE VIEW v_price_with_discount AS
SELECT person.name, menu.pizza_name, menu.price, (menu.price - (menu.price * 0.1))::INT as discount_price
FROM menu
INNER JOIN person_order ON menu.id = person_order.menu_id
INNER JOIN person ON person_order.person_id = person.id
ORDER BY 1, 2;

-- SELECT *
-- FROM v_price_with_discount;

-- psql -d day04 -U postgres  -f ex05/day04_ex05.sql

-- Упражнение 05 - Давайте рассчитаем цену со скидкой для каждого человека

-- Please create a Database View v_price_with_discount that returns a person's orders with person names, pizza names, 
-- real price and calculated column discount_price (with applied 10% discount and satisfies formula price - price*0.1). 
-- The result please sort by person name and pizza name and make around for discount_price column to integer type. 
-- Please take a look at a sample result below.

-- Пожалуйста, создайте представление базы данных v_price_with_discount, которое возвращает заказы человека с именами людей, названиями пицц,
-- реальной ценой и рассчитанным столбцом discount_price (с примененной скидкой 10% и удовлетворяет формуле цена - цена*0.1). 
-- Результат, пожалуйста, отсортируйте по имени человека и названию пиццы и преобразуйте столбец discount_price в целочисленный тип. 
-- Пожалуйста, взгляните на пример результата ниже.

-- name	    pizza_name	    price	discount_price
-- Andrey	cheese pizza	800	    720
-- Andrey	mushroom pizza	1100	990
-- ...	    ...	            ...	    ...