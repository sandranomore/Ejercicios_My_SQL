 CREATE SCHEMA `tienda_zapatillas`;
 USE `tienda_zapatillas`;
 
CREATE TABLE Zapatillas (
 id_zapatillas INT NOT NULL,
 modelo VARCHAR(45) NOT NULL,
 color VARCHAR(45) NOT NULL,
 PRIMARY KEY (id_zapatillas)
);
Drop table Cliente;
CREATE TABLE Clientes (
 id_cliente INT NOT NULL AUTO_INCREMENT,
 nombre VARCHAR(45) NOT NULL,
 telefono INT NOT NULL,
 email VARCHAR(45) NOT NULL,
 direccion VARCHAR(45) NOT NULL,
 ciudad VARCHAR(45) NULL,
 provincia VARCHAR(45) NOT NULL,
 pais VARCHAR(45) NOT NULL,
 codigo_postal VARCHAR(45) NOT NULL,
 PRIMARY KEY (id_cliente)
 );
 
 CREATE TABLE Empleados (
  id_empleado INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(45) NOT NULL,
  tienda VARCHAR(45) NOT NULL,
  salario INT NULL,
  fecha_incorporacion DATE NOT NULL,
  PRIMARY KEY (id_empleado)
  );
  Drop table Facturas;
  CREATE TABLE Facturas(
   id_factura INT NOT NULL AUTO_INCREMENT,
   numero_factura VARCHAR(45) NOT NULL,
   fecha DATE NOT NULL,
   id_zapatillas INT,
   id_empleado INT,
   id_cliente INT,
   PRIMARY KEY (id_factura),
   FOREIGN KEY (id_zapatillas)
       REFERENCES Zapatillas (id_zapatillas) ON DELETE CASCADE,
   FOREIGN KEY (id_empleado)
       REFERENCES Empleados (id_empleado) ON DELETE CASCADE,
   FOREIGN KEY (id_cliente)
       REFERENCES Cliente (id_cliente) ON DELETE CASCADE
       );
       
CREATE TABLE IF NOT EXISTS `Facturas` (
  `id_factura` INT NOT NULL AUTO_INCREMENT,
  `numero_factura` VARCHAR(45) NOT NULL,
  `fecha` DATE NOT NULL,
  `id_zapatillas` INT,
  `id_empleado` INT,
  `id_cliente` INT,
  PRIMARY KEY (`id_factura`),
  CONSTRAINT `fk_facturas_zapatillas`
    FOREIGN KEY (`id_zapatillas`)
    REFERENCES `Zapatillas` (`id_zapatillas`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_facturas_empleados`
    FOREIGN KEY (`id_empleado`)
    REFERENCES `Empleados` (`id_empleado`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_facturas_clientes`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `Clientes` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE
);

SHOW TABLES;
SHOW columns FROM Empleados;
SHOW columns FROM Zapatillas;
SHOW columns FROM facturas;
SELECT * from Empleados;
