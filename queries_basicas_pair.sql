USE northwind;
-- EJERCICIO 4
SELECT `first_name`, `last_name`, `employee_id`
FROM `employees`;

-- EJERCICIO 5
SELECT product_name, unit_price
FROM products
WHERE unit_price < 5;

-- EJERCICIO 6
SELECT product_name, unit_price
FROM products
WHERE unit_price IS NULL;

-- EJERCICIO 7
SELECT product_id, product_name, unit_price
FROM products
WHERE unit_price < 15 AND product_id < 10;

-- EJERCICIO 8
SELECT product_id, product_name, unit_price
FROM products
WHERE unit_price  > 15 AND product_id > 10;

-- EJERCICIO 9
SELECT DISTINCT ship_country
FROM orders;

-- EJERCICIO 10
SELECT product_id, product_name,unit_price
FROM products
LIMIT 10;

-- EJERCICIO 11
SELECT product_id, product_name,unit_price
FROM products
ORDER BY  product_id DESC
LIMIT 10;

-- EJERCICIO 12
SELECT count(DISTINCT order_id)
FROM order_details;

-- EJERCICIO 13
SELECT  unit_price * quantity  AS importe_total
	FROM order_details
	ORDER BY importe_total DESC
	LIMIT 3;
 
-- EJERCICIO 14
SELECT  order_id, unit_price * quantity  AS importe_total
	FROM order_details
	ORDER BY importe_total DESC
	LIMIT 5 OFFSET 5;
    
-- EJERCICIO 15   
SELECT category_name AS "nombre de categoria"
FROM categories;

-- EJERCICIO 16     
SELECT date_add(shipped_date, INTERVAL 5 DAY) AS FechaRetrasada
FROM orders;

-- EJERCICIO 17 
SELECT product_id,product_name
FROM products
WHERE unit_price BETWEEN  15 AND 50;

-- EJERCICIO 18
SELECT product_id,product_name,unit_price
FROM products
WHERE unit_price IN(18,19,20)
    
    


