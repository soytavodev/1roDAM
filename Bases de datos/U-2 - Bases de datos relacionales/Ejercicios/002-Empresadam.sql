--La base de datos Empresadam servirá para almacenar información organizada y estructurada.
--Permitirá gestionar datos de manera eficiente, ya sea información de clientes, música o videojuegos.
--Aprender a crear y configurar la base de datos es el primer paso para aplicar modelos de datos relacionales en un proyecto real.

--Creamos la base de datos
CREATE DATABASE Empresadam;
Query OK, 1 row affected (0,01 sec)
--Al aplicar el comando notamos que nos muestra un "OK" indicando que todo
--ha salido bien.

--Miramos las bases de datos creadas para corroborar que
--ha sido creada satisfactoriamente.
-- "Empresadam" (con la E mayúscula) es la base de datos que hemos creado específicamente para este ejercicio, siguiendo las instrucciones dadas.

SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| Empresadam         |
| QuackAttack        |
| empresadam         |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
7 rows in set (0,00 sec)

--Una vez creada la base de datos, ya podemos ingresar datos para guardar.
USE Empresadam;
Database changed

--La instalación y configuración de MySQL, junto con la creación de la base de datos empresadam, sienta las bases para trabajar con modelos de datos relacionales. Esto permite aplicar más adelante conceptos como tablas, claves primarias y relaciones entre entidades. Entender como funciona es esencial para gestionar información de clientes, videojuegos o música de manera eficiente en proyectos reales.
