-- cree el usuario solo con permisos de lectura.
CREATE USER 'usuario_lectura'@'localhost' IDENTIFIED BY 'contrasena_lectura';

-- cree el usuario con permisos de lectura, inserción y modificación.
CREATE USER 'usuario_modificacion'@'localhost' IDENTIFIED BY 'contrasena_modificacion';

-- le concedi los permisos para la lectura de tablas.
GRANT SELECT ON clauvana.* TO 'usuario_lectura'@'localhost';

-- le concedi los permisos de lectura, inserción y modificación de tablas.
GRANT SELECT, INSERT, UPDATE ON clauvana.* TO 'usuario_modificacion'@'localhost';

-- por defecto los usuarios no podran eliminar registros de ninguna tabla.

