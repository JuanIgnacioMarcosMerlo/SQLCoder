SELECT * FROM Fechas;

INSERT INTO Fechas (Fecha) VALUES (NOW());

-- Primera Tabla:

-- Iniciar una transacción
START TRANSACTION;

-- Eliminar registros en la tabla Proveedores_Tela
DELETE FROM Proveedores_Tela WHERE factura;

-- Comentada la sentencia rollback para evitar la eliminación permanente
-- ROLLBACK;

-- Comentada la sentencia commit para evitar confirmar la eliminación
-- COMMIT;

-- En caso de que no haya registros para eliminar, se realizara una inserción
-- INSERT INTO Proveedores_Tela (Fecha, Empresa, Direccion, Factura, Id_Tela, Color, Cantidad, PrecioXUnidad, Total)

-- De ejemplo:
-- VALUES (NOW(), 'Nueva Empresa', 'Nueva Dirección', 456, 'NuevaId', 'NuevoColor', 10.0, 20.0, 200.0);


-- Segunda Tabla:
-- Iniciar una transacción
START TRANSACTION;

-- Insertar registros en la tabla Proveedores_Avios
INSERT INTO Proveedores_Avios (Fecha, Empresa, Direccion, Factura, Tipo_Avio, Cantidad, PrecioXUnidad, Total)
VALUES 
    ('2023-10-02 20:46:26', 'Empresa1', 'Dirección1', 123, 'TipoAvio1', 5, 15.0, 75.0),
    ('2023-10-02 20:46:26', 'Empresa2', 'Dirección2', 124, 'TipoAvio2', 7, 12.0, 84.0),
    ('2023-10-02 20:46:26', 'Empresa3', 'Dirección3', 125, 'TipoAvio3', 3, 10.0, 30.0),
    ('2023-10-02 20:46:26', 'Empresa4', 'Dirección4', 126, 'TipoAvio4', 6, 18.0, 108.0);

-- Agregar un savepoint después de la inserción del registro #4
SAVEPOINT sp_after_insert4;

-- Insertar registros adicionales en la tabla Proveedores_Avios
INSERT INTO Proveedores_Avios (Fecha, Empresa, Direccion, Factura, Tipo_Avio, Cantidad, PrecioXUnidad, Total)
VALUES 
    ('2023-10-02 20:46:26', 'Empresa5', 'Dirección5', 127, 'TipoAvio5', 4, 14.0, 56.0),
    ('2023-10-02 20:46:26', 'Empresa6', 'Dirección6', 128, 'TipoAvio6', 8, 20.0, 160.0),
	('2023-10-02 20:46:26', 'Empresa7', 'Dirección7', 129, 'TipoAvio7', 2, 8.0, 16.0),
    ('2023-10-02 20:46:26', 'Empresa8', 'Dirección8', 130, 'TipoAvio8', 9, 22.0, 198.0);
    
-- Agregar un savepoint después de la inserción del registro #8
SAVEPOINT sp_after_insert8;

-- Comentar la sentencia para eliminar el savepoint después de los primeros 4 registros
-- RELEASE SAVEPOINT sp_after_insert4;

-- Comentar la sentencia Rollback para evitar la eliminación permanente
-- ROLLBACK;

-- Comentar la sentencia Commit para evitar confirmar la inserción
-- COMMIT;

