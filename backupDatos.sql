-- Las tablas incluidas son:
-- clientes,transacciones,fechas,proveedores_tela,proveedores_avios,
-- tipo_prenda,prenda,stock_unitario,produccion_corte,produccion_confeccion,
-- precio_mayorista





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
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fechas`
--

LOCK TABLES `fechas` WRITE;
/*!40000 ALTER TABLE `fechas` DISABLE KEYS */;
INSERT INTO `fechas` VALUES ('2023-09-18 21:19:33'),('2023-10-02 20:42:08'),('2023-10-02 20:43:02'),('2023-10-02 20:46:26');
/*!40000 ALTER TABLE `fechas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `log_produccion_corte`
--

LOCK TABLES `log_produccion_corte` WRITE;
/*!40000 ALTER TABLE `log_produccion_corte` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_produccion_corte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `log_proveedores_tela`
--

LOCK TABLES `log_proveedores_tela` WRITE;
/*!40000 ALTER TABLE `log_proveedores_tela` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_proveedores_tela` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `precio_mayorista`
--

LOCK TABLES `precio_mayorista` WRITE;
/*!40000 ALTER TABLE `precio_mayorista` DISABLE KEYS */;
/*!40000 ALTER TABLE `precio_mayorista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `prenda`
--

LOCK TABLES `prenda` WRITE;
/*!40000 ALTER TABLE `prenda` DISABLE KEYS */;
/*!40000 ALTER TABLE `prenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `produccion_confeccion`
--

LOCK TABLES `produccion_confeccion` WRITE;
/*!40000 ALTER TABLE `produccion_confeccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `produccion_confeccion` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `proveedores_avios`
--

LOCK TABLES `proveedores_avios` WRITE;
/*!40000 ALTER TABLE `proveedores_avios` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedores_avios` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `stock_unitario`
--

LOCK TABLES `stock_unitario` WRITE;
/*!40000 ALTER TABLE `stock_unitario` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_unitario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tipo_prenda`
--

LOCK TABLES `tipo_prenda` WRITE;
/*!40000 ALTER TABLE `tipo_prenda` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_prenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `transacciones`
--

LOCK TABLES `transacciones` WRITE;
/*!40000 ALTER TABLE `transacciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `transacciones` ENABLE KEYS */;
UNLOCK TABLES;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-04 20:53:31
