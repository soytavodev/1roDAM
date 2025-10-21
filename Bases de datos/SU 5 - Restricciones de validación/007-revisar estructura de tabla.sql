DESCRIBE clientes;

ALTER TABLE clientes
ADD COLUMN direccion VARCHAR(255);

DESCRIBE clientes;

ALTER TABLE clientes
DROP COLUMN direccion;

DESCRIBE clientes;

ALTER TABLE clientes
RENAME COLUMN dni TO dninie;

ALTER TABLE clientes
DROOPY CONSTRAINT dni;

ALTER TABLE clientes
RENAME COLUMN dni TO dninie;
