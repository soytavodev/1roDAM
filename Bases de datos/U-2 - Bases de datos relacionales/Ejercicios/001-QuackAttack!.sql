CREATE DATABASE QuackAttack; --Creamos la base de datos

USE QuackAttack; --Usamos la base de datos

SHOW TABLES --Mostramos las tablas en esa base de datos

--Creamos una tabla en la base de datos
CREATE TABLE clientes (
--Creamos las columnas y colocamos los tipos de datos y los parametros que éstos deben cumplir
  dni VARCHAR(9),
  nombre VARCHAR(50),
  apellidos VARCHAR(255),
  email VARCHAR(100)
);

--Insertamos la información del cliente
INSERT INTO clientes VALUES (
	'12345678A',
	'Juan',
	'Perez',
	'juan.perez@example.com'
);

--Y ahora leemos la información ingresada anteriormente
SELECT * FROM clientes;

--Actualización de información
UPDATE clientes
SET apellidos = 'Perez'
WHERE nombre = 'Juan';

