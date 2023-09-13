DELIMITER //
CREATE FUNCTION ObtenerTipoPrenda(id_prenda VARCHAR(20)) RETURNS VARCHAR(50) DETERMINISTIC
BEGIN
    DECLARE tipo_prenda VARCHAR(50);
    SELECT Tipo_Prenda INTO tipo_prenda
    FROM Tipos_Prenda
    WHERE Id_Prenda = id_prenda;
    RETURN tipo_prenda;
END //
DELIMITER ;
ObtenerTipoPrenda

SELECT ObtenerTipoPrenda() AS TipoDePrenda;



DELIMITER //
CREATE FUNCTION ObtenerNombreCliente(cliente_id INT) RETURNS VARCHAR(50) DETERMINISTIC
BEGIN
    DECLARE cliente_nombre VARCHAR(50);
    SELECT CONCAT(Nombre, ' ', Apellido) INTO cliente_nombre
    FROM Clientes
    WHERE Id_Cliente = cliente_id;
    RETURN cliente_nombre;
END //
DELIMITER ;

SELECT ObtenerNombreCliente() AS NombreCompletoCliente;
