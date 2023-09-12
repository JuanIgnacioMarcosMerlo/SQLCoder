CREATE TABLE Tipo_Prenda (
    Id_Prenda VARCHAR(20) NOT NULL,
    Tipo_Prenda VARCHAR(50) NOT NULL,
    FOREIGN KEY (Id_Prenda) REFERENCES Prenda(Id_Prenda)
);


CREATE VIEW tipos_prenda AS
SELECT
    P.Id_Prenda,
    TP.Tipo_Prenda
FROM
    Prenda P
JOIN
    Tipo_Prenda TP ON P.Id_Prenda = TP.Id_Prenda;


CREATE TABLE Transacciones (
    ID_Transaccion INT PRIMARY KEY NOT NULL,
    ID_Cliente INT NOT NULL,
    Monto DECIMAL(10,2) NOT NULL,
    Tipo VARCHAR(10) NOT NULL,
    Fecha DATETIME NOT NULL,
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente),
    FOREIGN KEY (Fecha) REFERENCES Fechas(Fecha)
);
    
CREATE VIEW Vista_Deudores AS
SELECT
    C.ID_Cliente,
    C.Nombre,
    C.Apellido,
    T.Monto AS Saldo_Deudor
FROM
    Clientes C
JOIN
    Transacciones T ON C.ID_Cliente = T.ID_Cliente
WHERE
    T.Monto > 0;
    
CREATE VIEW Vista_Stock_Total AS
SELECT
    Id_Prenda,
    SUM(Stock_Unitario) AS Stock_Total
FROM
    Stock_Unitario
GROUP BY
    Id_Prenda;
    

CREATE TABLE Precio_Mayorista (
    Fecha DATETIME,
    Id_Prenda VARCHAR(20),
    Precio_Mayorista DECIMAL(10, 2),
    FOREIGN KEY (Fecha) REFERENCES Fechas(Fecha),
    FOREIGN KEY (Id_Prenda) REFERENCES Prenda(Id_Prenda)
);

CREATE VIEW Vista_Precio_Minorista AS
SELECT
    PM.Fecha,
    PM.Id_Prenda,
    PM.Precio_Mayorista,
    (PM.Precio_Mayorista * 1.20) AS Precio_Minorista
FROM
    Precio_Mayorista PM;


