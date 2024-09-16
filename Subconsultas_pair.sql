USE NORTHWIND;

-- EJERCICIO 1 Extraed los pedidos con el máximo "order_date" para cada empleado.
SELECT order_id, customer_id, employee_id, order_date, required_date
FROM orders AS orders1
WHERE orders1.order_date >= ALL (SELECT MAX(order_date)
									FROM orders AS orders2
									GROUP BY employee_id
                                    HAVING orders1.employee_id = orders2.employee_id);
                                    
                                    
-- EJERCICIO 2 Extraed el precio unitario máximo (unit_price) de cada producto vendido.
SELECT  product_id, unit_price
FROM products AS P1
WHERE P1.unit_price >= ALL (SELECT MAX(unit_price)
							FROM products AS P2
                            WHERE P1.unit_price = P2.unit_price
                            GROUP BY product_id);
                            
                            
-- EJERCICIO 3 Extraed información de los productos "Beverages"
SELECT product_id, product_name, category_id
FROM products AS C1
WHERE C1.category_id IN(
						SELECT category_id
						FROM categories AS C2
						WHERE category_id = 1);
                        
-- EJERCICIO 4  Extraed la lista de países donde viven los clientes, pero no hay ningún proveedor ubicado en ese país
SELECT distinct (country)
FROM customers
WHERE country NOT IN ( SELECT COUNTRY
						FROM suppliers);
                        
-- EJERCICIO 5   Extraer los clientes que compraron mas de 20 articulos "Grandma's Boysenberry Spread"
                

-- EJERCICIO 6   Extraed los 10 productos más caros


-- EJERCICIO 7  Qué producto es más popular              



