DROP DATABASE IF EXISTS dbGamarraMarket;
CREATE DATABASE dbGamarraMarket
DEFAULT CHARACTER SET utf8;

USE dbGamarraMarket;
CREATE TABLE CLIENTE (
    id int  NOT NULL auto_increment,
    tipo_documento char(3)  NOT NULL,
    numero_documento char(15)  NOT NULL,
    nombres varchar(60)  NOT NULL,
    apellidos varchar(90)  NOT NULL,
    email varchar(80)  NULL,
    celular char(9)  NULL,
    fecha_nacimiento date  NOT NULL,
    activo bool DEFAULT '1' NOT NULL,
    CONSTRAINT CLIENTE_pk PRIMARY KEY (id)
);

CREATE TABLE PRENDA (
    id int  NOT NULL auto_increment,
    descripcion varchar(90)  NOT NULL,
    marca varchar(60)  NOT NULL,
    cantidad int  NOT NULL,
    talla varchar(10)  NOT NULL,
    precio decimal(8,2)  NOT NULL,
    activo bool DEFAULT '1' NOT NULL,
    CONSTRAINT PRENDA_pk PRIMARY KEY (id)
);

CREATE TABLE VENDEDOR (
    id int  NOT NULL auto_increment,
    tipo_documento char(3)  NOT NULL,
    numero_documento char(15)  NOT NULL,
    nombres varchar(60)  NOT NULL,
    apellidos varchar(90)  NOT NULL,
    salario decimal(8,2)  NOT NULL,
    celular char(9)  NULL,
    email varchar(80)  NULL,
    activo bool DEFAULT '1' NOT NULL,
    CONSTRAINT VENDEDOR_pk PRIMARY KEY (id)
);

CREATE TABLE VENTA (
    id int  NOT NULL auto_increment,
    fecha_hora timestamp  NOT NULL,
    activo bool DEFAULT '1' NOT NULL,
    cliente_id int  NOT NULL,
    vendedor_id int  NOT NULL,
    CONSTRAINT VENTA_pk PRIMARY KEY (id)
);

CREATE TABLE VENTA_DETALLE (
   id int  NOT NULL auto_increment,
    cantidad int  NOT NULL,
    venta_id int  NOT NULL,
    prenda_id int  NOT NULL,
    CONSTRAINT VENTA_DETALLE_pk PRIMARY KEY (id)
);
SHOW COLUMNS IN VENTA_DETALLE;
SHOW TABLES;

ALTER TABLE VENTA ADD CONSTRAINT VENTA_CLIENTE FOREIGN KEY VENTA_CLIENTE (cliente_id)
    REFERENCES CLIENTE (id);

ALTER TABLE VENTA_DETALLE ADD CONSTRAINT VENTA_DETALLE_PRENDA FOREIGN KEY VENTA_DETALLE_PRENDA (prenda_id)
    REFERENCES PRENDA (id);

ALTER TABLE VENTA_DETALLE ADD CONSTRAINT VENTA_DETALLE_VENTA FOREIGN KEY VENTA_DETALLE_VENTA (venta_id)
    REFERENCES VENTA (id);

ALTER TABLE VENTA ADD CONSTRAINT VENTA_VENDEDOR FOREIGN KEY VENTA_VENDEDOR (vendedor_id)
    REFERENCES VENDEDOR (id);
/* Listar relaciones de tablas de la base de datos activa */
SELECT 
    i.constraint_name, k.table_name, k.column_name, 
    k.referenced_table_name, k.referenced_column_name
FROM 
    information_schema.TABLE_CONSTRAINTS i 
LEFT JOIN information_schema.KEY_COLUMN_USAGE k 
ON i.CONSTRAINT_NAME = k.CONSTRAINT_NAME 
WHERE i.CONSTRAINT_TYPE = 'FOREIGN KEY' 
AND i.TABLE_SCHEMA = DATABASE();

-- Datos en la tabla CLIENTE --
INSERT INTO CLIENTE 
	(tipo_documento, numero_documento, nombres, apellidos, email, celular, fecha_nacimiento)
VALUES
    ("DNI", "77889955", "Alberto", "Solano Pariona", "alberto.pariona@gmail.com", "998456323", str_to_date("10/02/1970", "%d/%m/%Y")),
    ("DNI", "45781233", "Alicia", "García Campos", "", "", str_to_date("20/03/1980", "%d/%m/%Y")),
    ("CNE", "315487922", "Juana", "Avila Chumpitaz", "juana.avila@gmail.com", "923568741", str_to_date("06/06/1986", "%d/%m/%Y")),
    ("CNE", "122116633", "Ana", "Enriquez Flores", "ana.enriquez@empresa.com", "", str_to_date("10/02/1970", "%d/%m/%Y")),
    ("CNE", "088741589", "Claudia", "Perales Ortiz", "claudia.perales@yahoo.com", "997845263", str_to_date("25/07/1981", "%d/%m/%Y")),
    ("DNI", "45122587", "Mario", "Barrios Martinez", "mario.barrios@outlook.com", "986525871", str_to_date("10/10/1987", "%d/%m/%Y")),
    ("CNE", "175258564", "Brunela", "Tarazona Guerra", "brunela.tarazona@gmail.com", "995236741", str_to_date("06/06/1990", "%d/%m/%Y")),
    ("DNI", "47142536", "Alejandro", "Jimenes Huapaya", "", "941525365", str_to_date("01/06/1989", "%d/%m/%Y")),
    ("DNI", "15352585", "Claudia", "Marquez Litano", "claudia.marquez@gmail.com", "985814723", str_to_date("01/10/1991", "%d/%m/%Y")),
    ("CNE", "465772587", "Mario", "Rodriguez Mayo", "mario.rodriguez@outlook.com", "912662587", str_to_date("10/11/1987", "%d/%m/%Y")),
    ("CNE", "837952514", "Luisa", "Guerra Ibarra", "luisa.guerra@yahoo.com", "974422136", str_to_date("21/12/1988", "%d/%m/%Y")),
    ("DNI", "74142585", "Pedro Alberto", "Candela Valenzuela", "pedro.candela@gmail.com", "94148525", str_to_date("30/06/1995", "%d/%m/%Y")),
    ("DNI", "53298147", "Angel Manuel", "Rojas Avila", "angel.rojas@outlook.com", "", str_to_date("02/03/1975", "%d/%m/%Y")),
    ("DNI", "11453265", "Hilario Fabiano", "Avila Huapaya", "", "985514326", str_to_date("02/05/2000", "%d/%m/%Y")),
    ("CNE", "757472186", "Octavio", "Marquez Osorio", "octavio.marquez@yahoo.es", "966223141", str_to_date("22/09/2000", "%d/%m/%Y")),
    ("CNE", "558693219", "Manolo", "Vasquez Saravia", "manolo.vasquez@outlook.es", "966223141", str_to_date("22/09/2000", "%d/%m/%Y")),
    ("DNI", "41552567", "Genoveva Pilar", "Ortiz Quispe", "genoveva.ortiz@outlook.es", "92564137", str_to_date("12/04/2003", "%d/%m/%Y")),
    ("DNI", "49985471", "Oscar César", "Quiroz Zavala", "", "988223145", str_to_date("12/10/2004", "%d/%m/%Y")),
    ("DNI", "44992217", "Verónica", "Romero Vargas", "veronica.romero@yahoo.com", "", str_to_date("25/08/2002", "%d/%m/%Y")),
    ("DNI", "00253641", "Eliseo", "Prada Ortiz", "elseo.prada@yahoo.com", "", str_to_date("15/09/2004", "%d/%m/%Y"));
    
SELECT * FROM CLIENTE;


INSERT INTO VENDEDOR
	(tipo_documento, numero_documento, nombres, apellidos, salario, celular, email)
VALUES
	("DNI", "85471236", "Enrique", "Pérez Manco", "1500.00", "96521873", "enrique.perez@outlook.com"),
    ("DNI", "47259136", "Sofía", "Ávila Solis", "1350.00", "", ""),
    ("DNI", "61542280", "Marcela", "Napaico Cama", "1600.00", "965874357", "marcela.napaico@gmail.com"),
    ("CNE", "742536140", "Carmelo", "Rodríguez Chauca", "1550.00", "", "carmelo.rodriguez@yahoo.com");

SELECT * FROM VENDEDOR;


INSERT INTO PRENDA
	(descripcion, marca, cantidad, talla, precio)
VALUES
	("Pantalon Jeans","Levis", 60, 28, 65.80),
	("Camisa manga corta","Adams", 75, 16, 55.00),
	("Polo sport","Australia", 100, 16, 40.00),
	("Camisa manga larga","Newport", 150, 16, 42.50),
	("Pijama para caballero","Adams", 180, 28, 79.50),
	("Corbata","Maxwell", 85, 16, 14.50),
	("Pijama para dama","Adams", 170, 24, 55.50),
	("Pantalon Jeans","Australia", 200, 28, 68.50),
	("Camisa Sport","John Holden", 85, 16, 88.50),
	("Short Jeans","Pepe Jeans", 185, 28, 77.20);
SELECT * FROM PRENDA;

INSERT INTO VENTA
	(fecha_hora, cliente_id, vendedor_id)
VALUES
	(now(), 4, 1),
	(now(), 6, 3),
	(now(), 10, 1),
	(now(), 18, 4);
SELECT * FROM VENTA;


INSERT INTO VENTA_DETALLE
	(venta_id, prenda_id, cantidad)
VALUES
	(1, 6, 3),
	(1, 3, 5),
	(1, 2, 7),
	(2, 2, 3),
	(3, 7, 4),
	(3, 10, 6),
	(3, 2, 6),
	(3, 5, 7),
	(4, 2, 4),
	(4, 5, 3);
    
SELECT * FROM VENTA_DETALLE;

UPDATE cliente
	set apeellidos = 'Mendez Vera',
        email = 'alicia.mendez@gmail.com'
	WHERE nombres = 'Alicia' AND apellidos = 'García Campos'
    
    

