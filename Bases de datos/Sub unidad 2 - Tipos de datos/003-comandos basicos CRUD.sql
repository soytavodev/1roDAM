-- Create
INSERT INTO clientes VALUES(
	'12345678A',
	'Gustavo',
	'Delnardo',
	'gustavo@mail.com'
);

Query OK, 1 row affected (0,00 sec)

-- Read

SELECT * FROM clientes;

+-----------+---------+-----------+------------------+
| dni       | nombre  | apellidos | email            |
+-----------+---------+-----------+------------------+
| 12345678A | Gustavo | Delnardo  | gustavo@mail.com |
+-----------+---------+-----------+------------------+
1 row in set (0,00 sec)


-- Update

UPDATE clientes
SET dni = '11111111A'
WHERE nombre = 'Gustavo';

+-----------+---------+-----------+------------------+
| dni       | nombre  | apellidos | email            |
+-----------+---------+-----------+------------------+
| 11111111A | Gustavo | Delnardo  | gustavo@mail.com |
+-----------+---------+-----------+------------------+
1 row in set (0,00 sec)

-- Delete 

DELETE FROM clientes
WHERE dni = '1111111A';






