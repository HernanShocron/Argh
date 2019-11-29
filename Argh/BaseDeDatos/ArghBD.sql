-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: tparg
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `evento` (
  `idEvento` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `lugar` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`idEvento`),
  UNIQUE KEY `idEvento_UNIQUE` (`idEvento`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
INSERT INTO `evento` VALUES (1,'2019-10-01','El mejor evento de todos'),(2,'2019-10-10','El 2do mejor evento de todos'),(3,'2019-10-20','El 3er mejor evento de todos'),(4,'2019-10-30','El 4to mejor evento de todos'),(5,'2019-11-10','El 5to mejor evento de todos'),(6,'2019-11-20','Este es bien malo'),(7,'2019-11-30','Eventos eran los de antes...');
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lineapedido`
--

DROP TABLE IF EXISTS `lineapedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lineapedido` (
  `nroLinea` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidad` decimal(8,2) NOT NULL,
  `nroPedido` int(11) NOT NULL,
  PRIMARY KEY (`nroLinea`,`idProducto`,`nroPedido`),
  KEY `nroPedido_idx` (`nroPedido`),
  KEY `idProducto_idx` (`idProducto`),
  CONSTRAINT `idProducto` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idproducto`),
  CONSTRAINT `nroPedido` FOREIGN KEY (`nroPedido`) REFERENCES `pedido` (`nropedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lineapedido`
--

LOCK TABLES `lineapedido` WRITE;
/*!40000 ALTER TABLE `lineapedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `lineapedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mesa`
--

DROP TABLE IF EXISTS `mesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mesa` (
  `nroMesa` int(11) NOT NULL,
  `cantidadPersonas` int(11) NOT NULL,
  `estado` varchar(45) NOT NULL DEFAULT 'LIBRE',
  PRIMARY KEY (`nroMesa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesa`
--

LOCK TABLES `mesa` WRITE;
/*!40000 ALTER TABLE `mesa` DISABLE KEYS */;
INSERT INTO `mesa` VALUES (1,4,'LIBRE'),(2,4,'LIBRE'),(3,6,'LIBRE'),(4,6,'LIBRE'),(5,4,'LIBRE'),(6,4,'LIBRE'),(7,8,'LIBRE');
/*!40000 ALTER TABLE `mesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mozo`
--

DROP TABLE IF EXISTS `mozo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mozo` (
  `idMozo` int(11) NOT NULL AUTO_INCREMENT,
  `apellido` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `observacion` varchar(500) DEFAULT 'Sin observaciones',
  PRIMARY KEY (`idMozo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mozo`
--

LOCK TABLES `mozo` WRITE;
/*!40000 ALTER TABLE `mozo` DISABLE KEYS */;
INSERT INTO `mozo` VALUES (1,'Shocron','Hernan','Sin observaciones'),(2,'Sofovich','Gerardo','Sin observaciones'),(3,'Suarez','Miguel','Sin observaciones'),(4,'Del Caño','Nicolas','Sin observaciones'),(5,'Fernandez','Alberto','Sin observaciones');
/*!40000 ALTER TABLE `mozo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pedido` (
  `nroPedido` int(11) NOT NULL AUTO_INCREMENT,
  `estadoPedido` varchar(10) NOT NULL DEFAULT 'PENDIENTE',
  `totalPedido` decimal(8,2) DEFAULT NULL,
  `nroMesa` int(11) DEFAULT NULL,
  PRIMARY KEY (`nroPedido`),
  KEY `MesaPedido_idx` (`nroMesa`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,'COBRADO',327.50,3),(2,'ENTREGADO',486.70,4),(3,'LISTO',534.50,7),(4,'PENDIENTE',110098.60,10),(5,'PENDIENTE',12000.00,12);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL AUTO_INCREMENT,
  `nombreProducto` varchar(45) DEFAULT NULL,
  `cantidadProducto` decimal(8,2) DEFAULT NULL,
  `precioProducto` decimal(8,2) DEFAULT NULL,
  `idEvento` int(11) DEFAULT NULL,
  PRIMARY KEY (`idProducto`),
  KEY `idEvento_idx` (`idEvento`),
  CONSTRAINT `productoEvento` FOREIGN KEY (`idEvento`) REFERENCES `evento` (`idevento`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Coca Cola 1,25L',3000.00,78.50,1),(2,'Pizza',1800.00,55.00,1),(3,'Fideos con salsa',900.00,70.00,1),(4,'Seven Up 1,25L',2000.00,75.00,1),(5,'Hamburguesa',1800.00,85.00,2);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reserva` (
  `idReserva` int(11) NOT NULL AUTO_INCREMENT,
  `cantidadPersonas` int(11) NOT NULL,
  `nombreReserva` varchar(45) NOT NULL,
  `horaReserva` time DEFAULT NULL,
  `idEvento` int(11) DEFAULT NULL,
  PRIMARY KEY (`idReserva`),
  KEY `idEvento_idx` (`idEvento`),
  CONSTRAINT `reservaEvento` FOREIGN KEY (`idEvento`) REFERENCES `evento` (`idEvento`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
INSERT INTO `reserva` VALUES (1,3,'Manuel Perez','20:30:00',NULL),(2,5,'Gabriel Marquez','21:30:00',NULL),(3,8,'Sofía Pachano','21:00:00',NULL),(4,7,'Mercedes Benz','22:30:00',NULL),(5,5,'Joaquín Echeverría','20:30:00',NULL);
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-11 20:26:46
