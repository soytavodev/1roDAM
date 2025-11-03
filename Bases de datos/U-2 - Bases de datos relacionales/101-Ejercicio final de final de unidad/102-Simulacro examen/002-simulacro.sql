Iniciando sesión en MySQL
sudo mysql -u root -p

Creo la base de datos
CREATE DATABASE blog2;

Nos aseguramos de que se ha creado:
SHOW DATABASES;

Nos tenemos que meter en la base de datos:
USE blog2;

Creamos una tabla
CREATE TABLE autores(
	Identificador INT(10),
	nombre VARCHAR(100),
	apellidos VARCHAR (100),
	email VARCHAR(100)	
);

O bien sin identificador:
Creamos una tabla
CREATE TABLE autores(
	nombre VARCHAR(100),
	apellidos VARCHAR (100),
	email VARCHAR(100)	
);

Miramos que hemos creado bien
SHOW TABLES;

Quiero tirar la columna Idenficador para crearla bien
ALTER TABLE autores DROP Identificador;

Ahora creo columna
ALTER TABLE autores ADD COLUMN Identificador INT auto_increment PRIMARY KEY FIRST;


