USE northwind;

-- EJERCICIO 1 Extraer en una CTE todos los nombres de las compañias y los id de los clientes.
WITH CUSTOMER_CTE AS 
		(SELECT customer_id AS 'Custid', company_name AS 'CompanyName'
		  FROM customers)
          
SELECT Custid , CompanyName
FROM CUSTOMER_CTE;

-- EJERCICIO 2 Selecciona solo los de que vengan de "Germany"
WITH CUSTOMER_CTE AS 
		(SELECT customer_id AS 'Custid', company_name AS 'CompanyName'
		  FROM customers
          WHERE country = 'Germany')
          
SELECT Custid , CompanyName
FROM CUSTOMER_CTE;

-- EJERCICIO 3 Extraed el id de las facturas y su fecha de cada cliente.
WITH CUSTOMER_CTE AS 
		(SELECT customer_id AS 'Custid', company_name AS 'CompanyName'
		  FROM customers)
          
SELECT Custid, CompanyName, order_id, order_date
FROM orders
INNER JOIN CUSTOMER_CTE
	ON CUSTOMER_CTE.Custid = orders.customer_id;
    
    
-- EJERCICIO 4 Contad el número de facturas por cliente
 WITH CUSTOMER_CTE AS 
		(SELECT customer_id AS 'Custid', company_name AS 'CompanyName'
		  FROM customers)
          
SELECT Custid, CompanyName, COUNT(order_id)
FROM orders
INNER JOIN CUSTOMER_CTE
	ON CUSTOMER_CTE.Custid = orders.customer_id
group by customer_id;


-- EJERCICIO 5  Cuál la cantidad media pedida de todos los productos ProductID.
WITH producto_CTE  AS 
					(SELECT product_id AS ID_PROD, product_name as PRODUCTO
					 FROM products)

SELECT producto_CTE.PRODUCTO, AVG(quantity) AS Total
FROM order_details
INNER JOIN producto_CTE
ON order_details.product_id = producto_CTE.ID_PROD
GROUP BY  product_id;                
    

-- EJERCICIO 6 Usando una CTE, extraer el nombre de las diferentes categorías de productos, con su precio medio, máximo y mínimo.
WITH CATEGORIA_CTE AS 
					(SELECT category_id as id_categoria, category_name as nombre_categoria
					FROM categories)
                    
SELECT CATEGORIA_CTE.nombre_categoria AS CATEGORIA, category_id, MAX(unit_price) AS MAXIMO, min(unit_price) AS MINIMO, AVG(unit_price) AS MINIMO
FROM products
INNER JOIN CATEGORIA_CTE
ON CATEGORIA_CTE.id_categoria = products.category_id
GROUP BY products.category_id;
 
-- EJERCICIO 7 La empresa nos ha pedido que busquemos el nombre de cliente, su teléfono y el número de pedidos que ha hecho cada uno de ellos.
WITH CLIENTES AS
				(SELECT customer_id, company_name AS NOMBRE_CLIENTE, phone AS TELEFONO
                FROM customers)
                
SELECT CLIENTES.NOMBRE_CLIENTE , CLIENTES.TELEFONO, COUNT(orders.order_id)
FROM orders
INNER JOIN CLIENTES
on orders.customer_id = CLIENTES.customer_id
GROUP BY orders.customer_id; 

-- EJERCICIO 8 Modifica la consulta anterior para obtener los mismos resultados pero con los pedidos por año que ha hecho cada cliente.
WITH CLIENTES AS
				(SELECT customer_id, company_name AS NOMBRE_CLIENTE, phone AS TELEFONO
                FROM customers)
                
SELECT CLIENTES.NOMBRE_CLIENTE , CLIENTES.TELEFONO, YEAR(order_date) AS ANIO ,COUNT(orders.order_id)
FROM orders
INNER JOIN CLIENTES
on orders.customer_id = CLIENTES.customer_id
GROUP BY orders.customer_id, ANIO;


-- EJERCICIO 9 Modifica la cte del ejercicio anterior, úsala en una subconsulta para saber el nombre del cliente y su teléfono, para aquellos clientes que hayan hecho más de 6 pedidos en el año 1998.
WITH CLIENTES AS
				(SELECT customer_id, company_name AS NOMBRE_CLIENTE, phone AS TELEFONO
                FROM customers)
                
SELECT CLIENTES.NOMBRE_CLIENTE , CLIENTES.TELEFONO, YEAR(order_date) AS ANIO ,COUNT(orders.order_id)
FROM orders
INNER JOIN CLIENTES
on orders.customer_id = CLIENTES.customer_id
GROUP BY orders.customer_id, ANIO
HAVING ANIO = 1998 AND COUNT(orders.order_id) > 6;

-- EJERCICIO 10 Nos piden que obtengamos el importe total (teniendo en cuenta los descuentos) de cada pedido de la tabla orders y el customer_id asociado a cada pedido.
WITH  CLIENTE AS(
					SELECT customer_id,  order_id
                    FROM orders)

SELECT CLIENTE.customer_id AS ID_Cliente, order_details.order_id, SUM(unit_price*quantity) AS TOTAL_PEDIDO
FROM order_details
INNER JOIN CLIENTE
ON CLIENTE.order_id = order_details.order_id
GROUP BY order_details.order_id;