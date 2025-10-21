DELETE FROM clientes; --lo borra todo

INSERT INTO clientes VALUES(
  NULL,
  '12345678A',
  'Gustavo',
  'Delnardo',
  'info@gustavo.com'
);

SELECT * FROM clientes;

TRUNCATE TABLE clientes;

INSERT INTO clientes VALUES(
  NULL,
  '12345678A',
  'Gustavo',
  'Delnardo',
  'info@gustavo.com'
);

SELECT * FROM clientes;
