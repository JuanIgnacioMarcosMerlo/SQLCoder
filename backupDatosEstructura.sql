CREATE DATABASE  IF NOT EXISTS `clauvana` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `clauvana`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: clauvana
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `Fecha_Facturacion` datetime DEFAULT NULL,
  `Id_Cliente` int NOT NULL,
  `Id_Facturacion` int DEFAULT NULL,
  `Nombre` varchar(20) NOT NULL,
  `Apellido` varchar(20) NOT NULL,
  `DNI` varchar(20) NOT NULL,
  `Geolocalizacion` varchar(20) NOT NULL,
  `Celular` varchar(15) DEFAULT NULL,
  `Nombre_Transporte` varchar(20) NOT NULL,
  PRIMARY KEY (`Id_Cliente`),
  KEY `Fecha_Facturacion` (`Fecha_Facturacion`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`Fecha_Facturacion`) REFERENCES `fechas` (`fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fechas`
--

DROP TABLE IF EXISTS `fechas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fechas` (
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fechas`
--

LOCK TABLES `fechas` WRITE;
/*!40000 ALTER TABLE `fechas` DISABLE KEYS */;
INSERT INTO `fechas` VALUES ('2023-09-18 21:19:33'),('2023-10-02 20:42:08'),('2023-10-02 20:43:02'),('2023-10-02 20:46:26');
/*!40000 ALTER TABLE `fechas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_produccion_corte`
--

DROP TABLE IF EXISTS `log_produccion_corte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_produccion_corte` (
  `ID_Log` int NOT NULL AUTO_INCREMENT,
  `Usuario` varchar(50) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Hora` time DEFAULT NULL,
  `Accion` varchar(50) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_Log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_produccion_corte`
--

LOCK TABLES `log_produccion_corte` WRITE;
/*!40000 ALTER TABLE `log_produccion_corte` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_produccion_corte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_proveedores_tela`
--

DROP TABLE IF EXISTS `log_proveedores_tela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_proveedores_tela` (
  `ID_Log` int NOT NULL AUTO_INCREMENT,
  `Usuario` varchar(50) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Hora` time DEFAULT NULL,
  `Accion` varchar(50) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_Log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_proveedores_tela`
--

LOCK TABLES `log_proveedores_tela` WRITE;
/*!40000 ALTER TABLE `log_proveedores_tela` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_proveedores_tela` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `precio_mayorista`
--

DROP TABLE IF EXISTS `precio_mayorista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `precio_mayorista` (
  `Fecha` datetime DEFAULT NULL,
  `Id_Prenda` varchar(20) DEFAULT NULL,
  `Precio_Mayorista` decimal(10,2) DEFAULT NULL,
  KEY `Fecha` (`Fecha`),
  KEY `Id_Prenda` (`Id_Prenda`),
  CONSTRAINT `precio_mayorista_ibfk_1` FOREIGN KEY (`Fecha`) REFERENCES `fechas` (`fecha`),
  CONSTRAINT `precio_mayorista_ibfk_2` FOREIGN KEY (`Id_Prenda`) REFERENCES `prenda` (`Id_Prenda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `precio_mayorista`
--

LOCK TABLES `precio_mayorista` WRITE;
/*!40000 ALTER TABLE `precio_mayorista` DISABLE KEYS */;
/*!40000 ALTER TABLE `precio_mayorista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prenda`
--

DROP TABLE IF EXISTS `prenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prenda` (
  `Fecha` datetime DEFAULT NULL,
  `Id_Prenda` varchar(20) NOT NULL,
  `Stock_total` int NOT NULL,
  PRIMARY KEY (`Id_Prenda`),
  KEY `Fecha` (`Fecha`),
  CONSTRAINT `prenda_ibfk_1` FOREIGN KEY (`Fecha`) REFERENCES `fechas` (`fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prenda`
--

LOCK TABLES `prenda` WRITE;
/*!40000 ALTER TABLE `prenda` DISABLE KEYS */;
/*!40000 ALTER TABLE `prenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produccion_confeccion`
--

DROP TABLE IF EXISTS `produccion_confeccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produccion_confeccion` (
  `Fecha` datetime NOT NULL,
  `Taller_Confeccion` varchar(20) NOT NULL,
  `Direccion` varchar(20) NOT NULL,
  `Id_Prenda` varchar(20) NOT NULL,
  `Tipo_Avio` varchar(20) NOT NULL,
  `PrecioXUnidad` decimal(10,2) NOT NULL,
  `Cantidad` int NOT NULL,
  `Total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Fecha`,`Id_Prenda`,`Tipo_Avio`),
  KEY `Id_Prenda` (`Id_Prenda`),
  KEY `Tipo_Avio` (`Tipo_Avio`),
  CONSTRAINT `produccion_confeccion_ibfk_1` FOREIGN KEY (`Fecha`) REFERENCES `fechas` (`fecha`),
  CONSTRAINT `produccion_confeccion_ibfk_2` FOREIGN KEY (`Id_Prenda`) REFERENCES `prenda` (`Id_Prenda`),
  CONSTRAINT `produccion_confeccion_ibfk_3` FOREIGN KEY (`Tipo_Avio`) REFERENCES `proveedores_avios` (`Tipo_Avio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produccion_confeccion`
--

LOCK TABLES `produccion_confeccion` WRITE;
/*!40000 ALTER TABLE `produccion_confeccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `produccion_confeccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produccion_corte`
--

DROP TABLE IF EXISTS `produccion_corte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produccion_corte` (
  `Fecha` datetime NOT NULL,
  `Taller_Corte` varchar(20) NOT NULL,
  `Direccion` varchar(20) NOT NULL,
  `Id_Tela` varchar(20) NOT NULL,
  `Id_Prenda` varchar(20) NOT NULL,
  `Color` varchar(20) NOT NULL,
  `PrecioXUnidad` decimal(10,2) NOT NULL,
  `Cantidad` int NOT NULL,
  `Total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Fecha`,`Id_Tela`,`Id_Prenda`),
  KEY `Id_Tela` (`Id_Tela`),
  KEY `Id_Prenda` (`Id_Prenda`),
  CONSTRAINT `produccion_corte_ibfk_1` FOREIGN KEY (`Fecha`) REFERENCES `fechas` (`fecha`),
  CONSTRAINT `produccion_corte_ibfk_2` FOREIGN KEY (`Id_Tela`) REFERENCES `proveedores_tela` (`id_Tela`),
  CONSTRAINT `produccion_corte_ibfk_3` FOREIGN KEY (`Id_Prenda`) REFERENCES `prenda` (`Id_Prenda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produccion_corte`
--

LOCK TABLES `produccion_corte` WRITE;
/*!40000 ALTER TABLE `produccion_corte` DISABLE KEYS */;
/*!40000 ALTER TABLE `produccion_corte` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Log_Before_Delete_Produccion_Corte` BEFORE DELETE ON `produccion_corte` FOR EACH ROW BEGIN
    INSERT INTO Log_Produccion_Corte (Usuario, Fecha, Hora, Accion, Descripcion)
    VALUES (USER(), CURDATE(), CURTIME(), 'DELETE', CONCAT('Se eliminará el registro con Fecha: ', OLD.Fecha, ', Id_Tela: ', OLD.Id_Tela, ', Id_Prenda: ', OLD.Id_Prenda));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `proveedores_avios`
--

DROP TABLE IF EXISTS `proveedores_avios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores_avios` (
  `Fecha` datetime DEFAULT NULL,
  `Empresa` varchar(20) NOT NULL,
  `Direccion` varchar(20) NOT NULL,
  `Factura` int NOT NULL,
  `Tipo_Avio` varchar(20) NOT NULL,
  `Cantidad` int NOT NULL,
  `PrecioXUnidad` decimal(10,2) NOT NULL,
  `Total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Tipo_Avio`),
  KEY `Fecha` (`Fecha`),
  CONSTRAINT `proveedores_avios_ibfk_1` FOREIGN KEY (`Fecha`) REFERENCES `fechas` (`fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores_avios`
--

LOCK TABLES `proveedores_avios` WRITE;
/*!40000 ALTER TABLE `proveedores_avios` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedores_avios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores_tela`
--

DROP TABLE IF EXISTS `proveedores_tela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores_tela` (
  `fecha` datetime DEFAULT NULL,
  `empresa` varchar(20) NOT NULL,
  `direccion` varchar(20) NOT NULL,
  `factura` int NOT NULL,
  `id_Tela` varchar(20) NOT NULL,
  `color` varchar(20) NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  `precioXUnidad` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_Tela`),
  KEY `fecha` (`fecha`),
  CONSTRAINT `proveedores_tela_ibfk_1` FOREIGN KEY (`fecha`) REFERENCES `fechas` (`fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores_tela`
--

LOCK TABLES `proveedores_tela` WRITE;
/*!40000 ALTER TABLE `proveedores_tela` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedores_tela` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Log_After_Insert_Proveedores_Tela` AFTER INSERT ON `proveedores_tela` FOR EACH ROW BEGIN
    INSERT INTO Log_Proveedores_Tela (Usuario, Fecha, Hora, Accion, Descripcion)
    VALUES (USER(), CURDATE(), CURTIME(), 'INSERT', 'Se ha insertado un nuevo registro en Proveedores_Tela');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `stock_unitario`
--

DROP TABLE IF EXISTS `stock_unitario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_unitario` (
  `Fecha` datetime NOT NULL,
  `Id_Prenda` varchar(20) NOT NULL,
  `Color` varchar(20) NOT NULL,
  `Stock_Unitario` int NOT NULL,
  PRIMARY KEY (`Fecha`,`Id_Prenda`,`Color`),
  KEY `Id_Prenda` (`Id_Prenda`),
  CONSTRAINT `stock_unitario_ibfk_1` FOREIGN KEY (`Fecha`) REFERENCES `fechas` (`fecha`),
  CONSTRAINT `stock_unitario_ibfk_2` FOREIGN KEY (`Id_Prenda`) REFERENCES `prenda` (`Id_Prenda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_unitario`
--

LOCK TABLES `stock_unitario` WRITE;
/*!40000 ALTER TABLE `stock_unitario` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_unitario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_prenda`
--

DROP TABLE IF EXISTS `tipo_prenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_prenda` (
  `Id_Prenda` varchar(20) NOT NULL,
  `Tipo_Prenda` varchar(50) NOT NULL,
  KEY `Id_Prenda` (`Id_Prenda`),
  CONSTRAINT `tipo_prenda_ibfk_1` FOREIGN KEY (`Id_Prenda`) REFERENCES `prenda` (`Id_Prenda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_prenda`
--

LOCK TABLES `tipo_prenda` WRITE;
/*!40000 ALTER TABLE `tipo_prenda` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_prenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `tipos_prenda`
--

DROP TABLE IF EXISTS `tipos_prenda`;
/*!50001 DROP VIEW IF EXISTS `tipos_prenda`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `tipos_prenda` AS SELECT 
 1 AS `Id_Prenda`,
 1 AS `Tipo_Prenda`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `transacciones`
--

DROP TABLE IF EXISTS `transacciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transacciones` (
  `ID_Transaccion` int NOT NULL,
  `ID_Cliente` int NOT NULL,
  `Monto` decimal(10,2) NOT NULL,
  `Tipo` varchar(10) NOT NULL,
  `Fecha` datetime NOT NULL,
  PRIMARY KEY (`ID_Transaccion`),
  KEY `ID_Cliente` (`ID_Cliente`),
  KEY `Fecha` (`Fecha`),
  CONSTRAINT `transacciones_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `clientes` (`Id_Cliente`),
  CONSTRAINT `transacciones_ibfk_2` FOREIGN KEY (`Fecha`) REFERENCES `fechas` (`fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transacciones`
--

LOCK TABLES `transacciones` WRITE;
/*!40000 ALTER TABLE `transacciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `transacciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_deudores`
--

DROP TABLE IF EXISTS `vista_deudores`;
/*!50001 DROP VIEW IF EXISTS `vista_deudores`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_deudores` AS SELECT 
 1 AS `ID_Cliente`,
 1 AS `Nombre`,
 1 AS `Apellido`,
 1 AS `Saldo_Deudor`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_precio_minorista`
--

DROP TABLE IF EXISTS `vista_precio_minorista`;
/*!50001 DROP VIEW IF EXISTS `vista_precio_minorista`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_precio_minorista` AS SELECT 
 1 AS `Fecha`,
 1 AS `Id_Prenda`,
 1 AS `Precio_Mayorista`,
 1 AS `Precio_Minorista`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_stock_total`
--

DROP TABLE IF EXISTS `vista_stock_total`;
/*!50001 DROP VIEW IF EXISTS `vista_stock_total`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_stock_total` AS SELECT 
 1 AS `Id_Prenda`,
 1 AS `Stock_Total`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'clauvana'
--

--
-- Dumping routines for database 'clauvana'
--
/*!50003 DROP FUNCTION IF EXISTS `ObtenerNombreCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `ObtenerNombreCliente`(cliente_id INT) RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE cliente_nombre VARCHAR(50);
    SELECT CONCAT(Nombre, ' ', Apellido) INTO cliente_nombre
    FROM Clientes
    WHERE Id_Cliente = cliente_id;
    RETURN cliente_nombre;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ObtenerTipoPrenda` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `ObtenerTipoPrenda`(id_prenda VARCHAR(20)) RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE tipo_prenda VARCHAR(50);
    SELECT Tipo_Prenda INTO tipo_prenda
    FROM Tipos_Prenda
    WHERE Id_Prenda = id_prenda;
    RETURN tipo_prenda;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarEliminarRegistroTela` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarEliminarRegistroTela`(IN accion VARCHAR(10), IN id_tela VARCHAR(20), IN empresa VARCHAR(20), IN direccion VARCHAR(20), IN factura INT, IN color VARCHAR(20), IN cantidad DECIMAL(10,2), IN precioXUnidad DECIMAL(10,2), IN total DECIMAL(10,2))
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OrdenarTablaTela` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `OrdenarTablaTela`(IN campo_orden VARCHAR(50), IN orden VARCHAR(5))
BEGIN
    SET @sql = CONCAT('SELECT * FROM Proveedores_Tela ORDER BY ', campo_orden, ' ', orden);
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `tipos_prenda`
--

/*!50001 DROP VIEW IF EXISTS `tipos_prenda`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `tipos_prenda` AS select `p`.`Id_Prenda` AS `Id_Prenda`,`tp`.`Tipo_Prenda` AS `Tipo_Prenda` from (`prenda` `p` join `tipo_prenda` `tp` on((`p`.`Id_Prenda` = `tp`.`Id_Prenda`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_deudores`
--

/*!50001 DROP VIEW IF EXISTS `vista_deudores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_deudores` AS select `c`.`Id_Cliente` AS `ID_Cliente`,`c`.`Nombre` AS `Nombre`,`c`.`Apellido` AS `Apellido`,`t`.`Monto` AS `Saldo_Deudor` from (`clientes` `c` join `transacciones` `t` on((`c`.`Id_Cliente` = `t`.`ID_Cliente`))) where (`t`.`Monto` > 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_precio_minorista`
--

/*!50001 DROP VIEW IF EXISTS `vista_precio_minorista`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_precio_minorista` AS select `pm`.`Fecha` AS `Fecha`,`pm`.`Id_Prenda` AS `Id_Prenda`,`pm`.`Precio_Mayorista` AS `Precio_Mayorista`,(`pm`.`Precio_Mayorista` * 1.20) AS `Precio_Minorista` from `precio_mayorista` `pm` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_stock_total`
--

/*!50001 DROP VIEW IF EXISTS `vista_stock_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_stock_total` AS select `stock_unitario`.`Id_Prenda` AS `Id_Prenda`,sum(`stock_unitario`.`Stock_Unitario`) AS `Stock_Total` from `stock_unitario` group by `stock_unitario`.`Id_Prenda` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-04 20:46:48
