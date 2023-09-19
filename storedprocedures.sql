DELIMITER //
	-- ordena la tabla de forma ascendete o descendente por algun parametro
CREATE PROCEDURE OrdenarTablaTela(IN campo_orden VARCHAR(50), IN orden VARCHAR(5))
BEGIN
    SET @sql = CONCAT('SELECT * FROM Proveedores_Tela ORDER BY ', campo_orden, ' ', orden);
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END;
//

DELIMITER ;


CALL OrdenarTablaTela('PrecioXUnidad', 'DESC');



DELIMITER //

CREATE PROCEDURE InsertarEliminarRegistroTela(IN accion VARCHAR(10), IN id_tela VARCHAR(20), IN empresa VARCHAR(20), IN direccion VARCHAR(20), IN factura INT, IN color VARCHAR(20), IN cantidad DECIMAL(10,2), IN precioXUnidad DECIMAL(10,2), IN total DECIMAL(10,2))
BEGIN
    IF accion = 'INSERT' THEN
        -- agrega un nuevo registro en proveedores_tela
        INSERT INTO Proveedores_Tela (Fecha, Empresa, Direccion, Factura, Id_Tela, Color, Cantidad, PrecioXUnidad, Total)
        VALUES (NOW(), empresa, direccion, factura, id_tela, color, cantidad, precioXUnidad, total);
    ELSEIF accion = 'DELETE' THEN
        -- elimina el registro en proveedores_tela con el id_tela
        DELETE FROM Proveedores_Tela WHERE Id_Tela = id_tela;
    ELSE
        SELECT 'Acción no válida';
    END IF;
END;
//

DELIMITER ;

INSERT INTO Fechas (Fecha) VALUES (NOW());

CALL InsertarEliminarRegistroTela('INSERT', 'ABC123', 'Mi Empresa', 'Mi Dirección', 123, 'Azul', 10.5, 25.0, 250.0);

CALL InsertarEliminarRegistroTela('DELETE', 'ABC123', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
