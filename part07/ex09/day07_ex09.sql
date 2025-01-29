SELECT address, 
    ROUND((MAX(age) - (MIN(age)/MAX(age::numeric))), 2) AS formula, 
    ROUND(AVG(age), 2) AS average, 
    (ROUND((MAX(age) - (MIN(age)/MAX(age::numeric))), 2) > ROUND(AVG(age), 2)) AS comparison
FROM person
GROUP BY address
ORDER BY 1;

-- psql -d day07 -U postgres -f ex09/day07_ex09.sql

-- Упражнение 09 - Явное преобразование типа

-- Пожалуйста, напишите SQL-инструкцию, которая возвращает агрегированную информацию по адресу человека,
-- результат “Максимальный возраст - (Минимальный возраст / Максимальный возраст максимума)”, 
-- который представлен в виде столбца формулы,
-- следующий - средний возраст по адресу и результат сравнения столбцов формулы
-- и среднего значения (другими словами, если формула больше среднего значения, тогда значение True, 
-- в противном случае значение False).

-- Результат должен быть отсортирован по столбцу адреса. 
-- Пожалуйста, взгляните на образец выходных данных ниже.
----------------------
-- Please write a SQL statement that returns aggregated information by person’s address , 
-- the result of “Maximal Age - (Minimal Age / Maximal Age)” 
-- that is presented as a formula column, 
-- next one is average age per address and the result of comparison between formula 
-- and average columns (other words, if formula is greater than average then True, 
-- otherwise False value).

-- The result should be sorted by address column. 
-- Please take a look at the sample of output data below.

-- address	formula	average	comparison
-- Kazan	44.71	30.33	true
-- Moscow	20.24	18.5	true
-- ...	    ...	    ...	    ...