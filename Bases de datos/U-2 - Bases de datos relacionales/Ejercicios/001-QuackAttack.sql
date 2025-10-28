--El Modelo de Datos es lo que define la estructura de una base de datos relacional, es decir, como esta estructurada la informacion dentro de dicha base de datos. En el, los datos estan organizados en tablas que poseen columnas y atributos.

--Siguiendo las instrucciones dadas, crearemos una tabla en la base de datos de la empresa QuackAttack, en la tabla almacenaremos información sobre nuestros clientes, para ello:

--1.- Entramos a la base de datos de la empresa QuackAttack:

USE QuackAttack;

--2.- Creamos la tabla:
--Creamos las columnas y colocamos los tipos de datos y los parametros que éstos deben cumplir:

CREATE TABLE clientes (
  dni VARCHAR(9) PRIMARY KEY,
  nombre VARCHAR(50),
  apellidos VARCHAR(255),
  email VARCHAR(100) UNIQUE
);
Query OK, 0 rows affected (0.05 sec)

--a modo de ejemplo, insertamos la información del/los cliente(s):

INSERT INTO clientes VALUES (
	'12345678A',
	'Juan',
	'Perez',
	'juan.perez@example.com'
);

INSERT INTO clientes VALUES (
	'87654321Z',
	'Tom',
	'Riddle',
	'soylordvoldemort@mortifagos.gb'
);

--Visualizamos que los clientes se hayan ingresado correctamente:

SELECT * FROM clientes;
+-----------+--------+-----------+--------------------------------+
| dni       | nombre | apellidos | email                          |
+-----------+--------+-----------+--------------------------------+
| 12345678A | Juan   | Perez     | juan.perez@example.com         |
| 87654321Z | Tom    | Riddle    | soylordvoldemort@mortifagos.gb |
+-----------+--------+-----------+--------------------------------+

---Las instrucciones completas serian asi:

CREATE TABLE clientes (
  dni VARCHAR(9) PRIMARY KEY,
  nombre VARCHAR(50),
  apellidos VARCHAR(255),
  email VARCHAR(100) UNIQUE
);
Query OK, 0 rows affected (0.05 sec)

mysql> SHOW TABLES;
+-----------------------+
| Tables_in_QuackAttack |
+-----------------------+
| clientes              |
+-----------------------+
1 row in set (0,00 sec)

mysql> INSERT INTO clientes VALUES (
    -> '12345678A',
    -> 'Juan',
    -> 'Perez',
    -> 'juan.perez@example.com'
    -> );
Query OK, 1 row affected (0,01 sec)

mysql> INSERT INTO clientes VALUES (
    -> '87654321Z',
    -> 'Tom',
    -> 'Riddle',
    -> 'soylordvoldemort@mortifagos.gb'
    -> );
Query OK, 1 row affected (0,01 sec)

mysql> SELECT * FROM clientes;
+-----------+--------+-----------+--------------------------------+
| dni       | nombre | apellidos | email                          |
+-----------+--------+-----------+--------------------------------+
| 12345678A | Juan   | Perez     | juan.perez@example.com         |
| 87654321Z | Tom    | Riddle    | soylordvoldemort@mortifagos.gb |
+-----------+--------+-----------+--------------------------------+
2 rows in set (0,00 sec)

--Al realizar este ejercicio entendemos como crear una tabla en una base de datos, establecer claves primarias como por ejemplo la Unicidad, que hace que un atributo sea irrepetible bajo ningun concepto, tambien aprendemos a agregar información importante de un cliente, por ejemplo. Asi como la tabla "clientes" podriamos crear infinidades de tablas en las que se necesite almacenar datos y comprendiendo así la importancia de un diseño relacional bien estructurado en la gestión de datos de clientes, productos, entre otros.



ALTER TABLE clientes
ADD CONSTRAINT un_dni PRIMARY KEY (dni);
ADD CONSTRAINT 1_email UNIQUE (email);
