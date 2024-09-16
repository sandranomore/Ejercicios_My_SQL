
-- En este ejercicio vamos a corregir los errores que hemos encontrado en nuestras tablas.

USE tienda_zapatillas;

-- Tabla Zapatillas:
-- Se nos ha olvidado introducir la marca y la talla de las zapatillas que tenemos en nuestra BBDD. Por lo tanto, debemos incluir:
-- marca: es una cadena de caracteres de longitud máxima de 45 caracteres, no nula.
-- talla: es un entero, no nulo.
ALTER TABLE Zapatillas
  ADD COLUMN (marca VARCHAR (45) NOT NULL, 
			  talla INT NOT NULL
			 );
             
-- Comprobamos el resultado             
SHOW COLUMNS from Zapatillas;

-- 
ALTER TABLE Empleados
 ADD COLUMN salario FLOAT NOT NULL;
 
--
ALTER TABLE Empleados
 MODIFY COLUMN salario FLOAT;

-- 
ALTER TABLE Clientes 
  DROP COLUMN pais;

--
ALTER TABLE Facturas
 ADD COLUMN total FLOAT;
 
 --
INSERT INTO Zapatillas
 VALUES (1, 'XQYUN', 'negro', 'Nike', 42),
		(2, 'UOPMN', 'rosas', 'Nike', 39),
        (3, 'OPNYT', 'verdes', 'Adidas', 35);
	
SELECT * from Facturas;

INSERT INTO Empleados
 VALUES (1, 'Laura', 'Alcobendas', 25987, '2010-09-03'),
		(2, 'Maria', 'Sevilla', NULL, '2001-04-11'),
        (3, 'Ester', 'Oviedo', 30165.98, '2000-11-29');
       
INSERT INTO Clientes
 VALUES (1, 'Monica', 1234567289, 'monica@email.com', 'Calle Felicidad', 'Mostoles', 'Madrid', 28176),
		(2, 'Lorena', 289345678, 'lorena@email.com', 'Calle Alegria', 'Barcelona', 'Barcelona', 12346),
        (3, 'Carmen', 298463759, 'carmen@email.com', 'Calle del Color', 'Vigo', 'Pontevedra', 23456);       
        
INSERT INTO Facturas
  VALUES (1, 123, '2001-12-11', 1, 2, 1, 54.98), 
         (2, 1234, '2005-05-23', 1, 1, 3, 89.91), 
         (3, 12345, '2015-09-18', 2, 3, 3, 76.23);      
         
         
-- Tabla zapatillas
-- En nuestra tienda no vendemos zapatillas Rosas... 
-- ¿Cómo es posible que tengamos zapatillas de color rosa? 🤔 En realidad esas zapatillas son amarillas.
UPDATE Zapatillas
  SET color = 'amarillas'
 WHERE color = 'rosas';

-- Comprobamos el resultado
SELECT color FROM Zapatillas;

-- Tabla empleados
-- Laura se ha cambiado de ciudad y ya no vive en Alcobendas, se fue cerquita del mar, ahora vive en A Coruña. 
UPDATE Empleados
  SET tienda = 'A Coruña'
  WHERE tienda = 'Alcobendas';

-- Comprobamos el resultado
SELECT tienda FROM empleados;
  
-- Tabla clientes
-- El Numero de telefono de Monica esta mal!!! Metimos un digito de más. En realidad su número es: 123456728  
UPDATE Clientes
  SET telefono = '123456728'
  WHERE telefono = '1234567289';

-- Comprobamos el resultado
SELECT telefono FROM clientes;

-- Tabla facturas
-- El total de la factura de la zapatilla cuyo id es 2 es incorrecto. En realidad es: 89,91.
UPDATE Facturas
  SET total = '89.91'
  WHERE id_factura = 2;

-- Comprobamos el resultado
SELECT total FROM facturas;