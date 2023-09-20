-- tabla de registro para proveedores de tela
CREATE TABLE Log_Proveedores_Tela (
    ID_Log INT AUTO_INCREMENT PRIMARY KEY,
    Usuario VARCHAR(50),
    Fecha DATE,
    Hora TIME,
    Accion VARCHAR(50),
    Descripcion VARCHAR(255)
);

-- tabla de registro para produccion de corte
CREATE TABLE Log_Produccion_Corte (
    ID_Log INT AUTO_INCREMENT PRIMARY KEY,
    Usuario VARCHAR(50),
    Fecha DATE,
    Hora TIME,
    Accion VARCHAR(50),
    Descripcion VARCHAR(255)
);

DELIMITER //
CREATE TRIGGER Log_After_Insert_Proveedores_Tela
AFTER INSERT ON Proveedores_Tela
FOR EACH ROW
BEGIN
    INSERT INTO Log_Proveedores_Tela (Usuario, Fecha, Hora, Accion, Descripcion)
    VALUES (USER(), CURDATE(), CURTIME(), 'INSERT', 'Se ha insertado un nuevo registro en Proveedores_Tela');
END;
//
DELIMITER ;



DELIMITER //
CREATE TRIGGER Log_Before_Delete_Produccion_Corte
BEFORE DELETE ON Produccion_corte
FOR EACH ROW
BEGIN
    INSERT INTO Log_Produccion_Corte (Usuario, Fecha, Hora, Accion, Descripcion)
    VALUES (USER(), CURDATE(), CURTIME(), 'DELETE', CONCAT('Se eliminará el registro con Fecha: ', OLD.Fecha, ', Id_Tela: ', OLD.Id_Tela, ', Id_Prenda: ', OLD.Id_Prenda));
END;
//
DELIMITER ;
