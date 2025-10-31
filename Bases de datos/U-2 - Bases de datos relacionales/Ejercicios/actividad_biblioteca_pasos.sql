--Abrimos terminal y entramos y tipeamos sudo mysql -u root -p

--Creamos la base de datos
CREATE DATABASE biblioteca25;
Query OK, 1 row affected (0,01 sec)  --Salida al crear la BD indicando que todo ha ido bien

USE biblioteca25; --Usamos la BD creada recientemente
Database changed --La consola nos indica el cambio de BD

--Verificamos las BD y notamos que efectivamente la de biblioteca25 está creada
SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| Empresadam         |
| QuackAttack        |
| biblioteca25       | --Aqui se encuentra la base de datos
| empresadam         |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
8 rows in set (0,00 sec)

--Creamos las tablas
---Creamos la tabla autores---
CREATE TABLE autores (
	id INT AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	pais VARCHAR(80) NULL
);
Query OK, 0 rows affected (0,06 sec) --Tabla creada, todo OK
--a modo de ejemplo, podemos verificar con un SHOW TABLES para fijarnos que la tabla se haya creado satisfactoriamente
SHOW TABLES;
+------------------------+
| Tables_in_biblioteca25 |
+------------------------+
| autores                |--ahí esta nuestra tabla
+------------------------+
1 row in set (0,00 sec)

--para verificar que los parámetros establecidos sean los correctos, probamos un DESCRIBE autores
DESCRIBE autores;
+--------+--------------+------+-----+---------+----------------+
| Field  | Type         | Null | Key | Default | Extra          |
+--------+--------------+------+-----+---------+----------------+
| id     | int          | NO   | PRI | NULL    | auto_increment |
| nombre | varchar(100) | NO   |     | NULL    |                |
| pais   | varchar(80)  | YES  |     | NULL    |                |
+--------+--------------+------+-----+---------+----------------+
3 rows in set (0,01 sec)
--parámetros comprobados satisfactoriamente


--################################################################
---Creamos tabla libros---
CREATE TABLE libros (
  id INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(200) NOT NULL,
  isbn VARCHAR(20) NOT NULL,
  precio DECIMAL(8,2) NOT NULL CHECK (precio >= 0),
  autor_id INT NOT NULL,
  CONSTRAINT uq_libros_isbn UNIQUE (isbn),
  CONSTRAINT fk_libros_autor FOREIGN KEY (autor_id) REFERENCES autores(id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
  INDEX idx_libros_titulo (titulo)
);
Query OK, 0 rows affected (0,10 sec)

---Evidencia---
DESCRIBE libros;
+----------+--------------+------+-----+---------+----------------+
| Field    | Type         | Null | Key | Default | Extra          |
+----------+--------------+------+-----+---------+----------------+
| id       | int          | NO   | PRI | NULL    | auto_increment |
| titulo   | varchar(200) | NO   | MUL | NULL    |                |
| isbn     | varchar(20)  | NO   | UNI | NULL    |                |
| precio   | decimal(8,2) | NO   |     | NULL    |                |
| autor_id | int          | NO   | MUL | NULL    |                |
+----------+--------------+------+-----+---------+----------------+
5 rows in set (0,00 sec)

SHOW INDEX FROM libros;
+--------+------------+-------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table  | Non_unique | Key_name          | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+--------+------------+-------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| libros |          0 | PRIMARY           |            1 | id          | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| libros |          0 | uq_libros_isbn    |            1 | isbn        | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| libros |          1 | fk_libros_autor   |            1 | autor_id    | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| libros |          1 | idx_libros_titulo |            1 | titulo      | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+--------+------------+-------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
4 rows in set (0,02 sec)

--#################################################################
---creamos tabla préstamos--- con FKs y CHECK de fechas
CREATE TABLE prestamos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  libro_id INT NOT NULL,
  fecha_prestamo DATE NOT NULL DEFAULT (CURRENT_DATE),
  fecha_devolucion DATE NULL,
  CONSTRAINT fk_prestamos_libro FOREIGN KEY (libro_id)
    REFERENCES libros(id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
  CONSTRAINT chk_fechas CHECK (
    fecha_devolucion IS NULL OR fecha_devolucion >= fecha_prestamo
  ),
  INDEX idx_prestamos_libro (libro_id)
);
Query OK, 0 rows affected (0,06 sec)

---Evidencia---
DESCRIBE prestamos;
+------------------+------+------+-----+-----------+-------------------+
| Field            | Type | Null | Key | Default   | Extra             |
+------------------+------+------+-----+-----------+-------------------+
| id               | int  | NO   | PRI | NULL      | auto_increment    |
| libro_id         | int  | NO   | MUL | NULL      |                   |
| fecha_prestamo   | date | NO   |     | curdate() | DEFAULT_GENERATED |
| fecha_devolucion | date | YES  |     | NULL      |                   |
+------------------+------+------+-----+-----------+-------------------+
4 rows in set (0,01 sec)

SHOW INDEX FROM prestamos;
+-----------+------------+---------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table     | Non_unique | Key_name            | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+-----------+------------+---------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| prestamos |          0 | PRIMARY             |            1 | id          | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| prestamos |          1 | idx_prestamos_libro |            1 | libro_id    | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+-----------+------------+---------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
2 rows in set (0,01 sec)

---probamos con un libro sin devolver---
mysql> INSERT INTO prestamos VALUES (
    NULL,
    1,
    '2025-10-31',
    NULL
);
Query OK, 1 row affected (0,01 sec)

---ahora con uno devuelto---
INSERT INTO prestamos VALUES (
    NULL,
    2,
    '2025-10-20',
    '2025-10-25'
);
Query OK, 1 row affected (0,02 sec)


---------------------Ahora ingresamos información--------------------------------

INSERT INTO autores VALUES (
	NULL,
	'Agatha Christie',
	'Reino Unido'
);
Query OK, 1 row affected (0,02 sec)

---verificamos que las entradas sean correctas con un SELECT---

-----------AUTORES-----------------------
SELECT * FROM autores;
+----+-----------------+-------------+
| id | nombre          | pais        |
+----+-----------------+-------------+
|  1 | Agatha Christie | Reino Unido |
+----+-----------------+-------------+
1 row in set (0,00 sec)
---segundo dato---
INSERT INTO autores VALUES (
	NULL,
	'J.K Rowling',
	'Reino Unido'
);
--- revisamos la segunda entrada---
SELECT * FROM autores;
+----+-----------------+-------------+
| id | nombre          | pais        |
+----+-----------------+-------------+
|  1 | Agatha Christie | Reino Unido |
|  2 | J.K Rowling     | Reino Unido |
+----+-----------------+-------------+
2 rows in set (0,00 sec)

---tercer dato---
INSERT INTO autores VALUES (
	NULL,
	'James Clear',
	'Estados Unidos'
);
Query OK, 1 row affected (0,01 sec)
---revisamos la tercera entrada---
SELECT * FROM autores;
+----+-----------------+----------------+
| id | nombre          | pais           |
+----+-----------------+----------------+
|  1 | Agatha Christie | Reino Unido    |
|  2 | J.K Rowling     | Reino Unido    |
|  3 | James Clear     | Estados Unidos |
+----+-----------------+----------------+
3 rows in set (0,01 sec)

---######################################################---

-------LIBROS------------

--libro 1---
INSERT INTO libros VALUES (
    NULL,
    'Tragedia en tres actos',
    '9788401352836',
    23.76,
    1
);
Query OK, 1 row affected (0,01 sec)

---libro 2---
INSERT INTO libros VALUES (
    NULL,
    'Harry Potter y la piedra Filosofal',
    '9780307474728',
    37.95,
    2
);
Query OK, 1 row affected (0,04 sec)

---libro 3---
INSERT INTO libros VALUES (
    NULL,
    'Hábitos Atómicos',
    '9788499082478',
    17.57,
    3
);
Query OK, 1 row affected (0,00 sec)

---VERIFICAMOS LOS INGRESOS---
+----+------------------------------------+---------------+--------+----------+
| id | titulo                             | isbn          | precio | autor_id |
+----+------------------------------------+---------------+--------+----------+
|  1 | Harry Potter y la piedra Filosofal | 9780307474728 |  37.95 |        2 |
|  2 | Tragedia en tres actos             | 9788401352836 |  23.76 |        1 |
|  4 | Hábitos Atómicos                   | 9788499082478 |  17.57 |        3 |
+----+------------------------------------+---------------+--------+----------+
3 rows in set (0,01 sec)






















