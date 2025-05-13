-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: practica6
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `practica6`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `practica6` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `practica6`;

--
-- Table structure for table `CLIENTES`
--

DROP TABLE IF EXISTS `CLIENTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENTES` (
  `DNI` int(11) NOT NULL,
  `Nombre` varchar(20) DEFAULT NULL,
  `Edad` int(11) DEFAULT NULL,
  PRIMARY KEY (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENTES`
--

LOCK TABLES `CLIENTES` WRITE;
/*!40000 ALTER TABLE `CLIENTES` DISABLE KEYS */;
INSERT INTO `CLIENTES` VALUES (1,'Pepe Lopez',45),(2,'Juan Gonalez',45),(3,'Maria Gomez',33),(4,'Javier Casado',18),(5,'Nuria Sanchez',29),(6,'Antonio Navarro',58);
/*!40000 ALTER TABLE `CLIENTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMERCIOS`
--

DROP TABLE IF EXISTS `COMERCIOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMERCIOS` (
  `CIF` int(11) NOT NULL,
  `Nombre` varchar(20) DEFAULT NULL,
  `Ciudad` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CIF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMERCIOS`
--

LOCK TABLES `COMERCIOS` WRITE;
/*!40000 ALTER TABLE `COMERCIOS` DISABLE KEYS */;
INSERT INTO `COMERCIOS` VALUES (1,'El Corte Ingles','Sevilla'),(2,'El Corte Ingles','Madrid'),(3,'Jump','Valencia'),(4,'Centro Mail','Sevilla'),(5,'FNAC','Barcelona'),(6,'GAME','Jerez');
/*!40000 ALTER TABLE `COMERCIOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DESARROLLA`
--

DROP TABLE IF EXISTS `DESARROLLA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DESARROLLA` (
  `ID_Fab` int(11) NOT NULL,
  `Codigo` int(11) NOT NULL,
  PRIMARY KEY (`ID_Fab`,`Codigo`),
  KEY `FK2` (`Codigo`),
  CONSTRAINT `FK1` FOREIGN KEY (`ID_Fab`) REFERENCES `FABRICANTES` (`ID_Fab`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK2` FOREIGN KEY (`Codigo`) REFERENCES `PROGRAMAS` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DESARROLLA`
--

LOCK TABLES `DESARROLLA` WRITE;
/*!40000 ALTER TABLE `DESARROLLA` DISABLE KEYS */;
INSERT INTO `DESARROLLA` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(2,6),(2,7),(2,8),(2,9),(2,10),(2,11),(2,12),(3,17),(3,18),(4,14),(4,20),(5,15),(5,16),(5,19),(6,13);
/*!40000 ALTER TABLE `DESARROLLA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DISTRIBUYE`
--

DROP TABLE IF EXISTS `DISTRIBUYE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DISTRIBUYE` (
  `CIF` int(11) NOT NULL,
  `Codigo` int(11) NOT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`CIF`,`Codigo`),
  KEY `Codigo` (`Codigo`),
  CONSTRAINT `DISTRIBUYE_ibfk_1` FOREIGN KEY (`CIF`) REFERENCES `COMERCIOS` (`CIF`),
  CONSTRAINT `DISTRIBUYE_ibfk_2` FOREIGN KEY (`Codigo`) REFERENCES `PROGRAMAS` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DISTRIBUYE`
--

LOCK TABLES `DISTRIBUYE` WRITE;
/*!40000 ALTER TABLE `DISTRIBUYE` DISABLE KEYS */;
INSERT INTO `DISTRIBUYE` VALUES (1,1,10),(1,2,11),(1,6,5),(1,7,3),(1,10,5),(1,13,7),(2,1,6),(2,2,6),(2,6,4),(2,7,7),(3,10,8),(3,13,5),(4,14,3),(4,20,6),(5,8,8),(5,15,8),(5,16,2),(5,17,3),(5,19,6);
/*!40000 ALTER TABLE `DISTRIBUYE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FABRICANTES`
--

DROP TABLE IF EXISTS `FABRICANTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FABRICANTES` (
  `ID_Fab` int(11) NOT NULL,
  `Nombre` varchar(20) DEFAULT NULL,
  `Pais` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_Fab`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FABRICANTES`
--

LOCK TABLES `FABRICANTES` WRITE;
/*!40000 ALTER TABLE `FABRICANTES` DISABLE KEYS */;
INSERT INTO `FABRICANTES` VALUES (1,'Oracle','Estados Unidos'),(2,'Microsoft','Estados Unidos'),(3,'IBM','Estados Unidos'),(4,'Dinamic','España'),(5,'Borland','Estados Unidos'),(6,'Symantec','Estados Unidos');
/*!40000 ALTER TABLE `FABRICANTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROGRAMAS`
--

DROP TABLE IF EXISTS `PROGRAMAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROGRAMAS` (
  `Codigo` int(11) NOT NULL,
  `Nombre` varchar(30) DEFAULT NULL,
  `Version` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROGRAMAS`
--

LOCK TABLES `PROGRAMAS` WRITE;
/*!40000 ALTER TABLE `PROGRAMAS` DISABLE KEYS */;
INSERT INTO `PROGRAMAS` VALUES (1,'Application Server','9i'),(2,'Database','8i'),(3,'Database','9i'),(4,'Database','10g'),(5,'Developer','6i'),(6,'Access','97'),(7,'Access','2000'),(8,'Access','XP'),(9,'Windows','98'),(10,'Windows','XP Professional'),(11,'Windows','XP Home Edition'),(12,'Windows','2003 Server'),(13,'Norton Internet Security','2004'),(14,'Freddy Hardest','-'),(15,'Paradox','2'),(16,'C++ Builder','55'),(17,'DB/2','20'),(18,'OS/2','10'),(19,'JBuilder','X'),(20,'La prision','10');
/*!40000 ALTER TABLE `PROGRAMAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REGISTRA`
--

DROP TABLE IF EXISTS `REGISTRA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REGISTRA` (
  `CIF` int(11) NOT NULL,
  `DNI` int(11) NOT NULL,
  `Codigo` int(11) NOT NULL,
  `Medio` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CIF`,`DNI`,`Codigo`),
  KEY `DNI` (`DNI`),
  KEY `Codigo` (`Codigo`),
  CONSTRAINT `REGISTRA_ibfk_1` FOREIGN KEY (`CIF`) REFERENCES `COMERCIOS` (`CIF`),
  CONSTRAINT `REGISTRA_ibfk_2` FOREIGN KEY (`DNI`) REFERENCES `CLIENTES` (`DNI`),
  CONSTRAINT `REGISTRA_ibfk_3` FOREIGN KEY (`Codigo`) REFERENCES `PROGRAMAS` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REGISTRA`
--

LOCK TABLES `REGISTRA` WRITE;
/*!40000 ALTER TABLE `REGISTRA` DISABLE KEYS */;
INSERT INTO `REGISTRA` VALUES (1,1,1,'Internet'),(1,3,4,'Tarjeta Postal'),(2,4,15,'Internet'),(2,6,8,'Internet'),(4,1,10,'Tarjeta Postal'),(4,2,10,'Telefono'),(5,2,12,'Internet');
/*!40000 ALTER TABLE `REGISTRA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `practica8`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `practica8` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `practica8`;

--
-- Table structure for table `ALMACENES`
--

DROP TABLE IF EXISTS `ALMACENES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ALMACENES` (
  `Codigo` int(11) NOT NULL,
  `Lugar` varchar(100) DEFAULT NULL,
  `Capacidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ALMACENES`
--

LOCK TABLES `ALMACENES` WRITE;
/*!40000 ALTER TABLE `ALMACENES` DISABLE KEYS */;
INSERT INTO `ALMACENES` VALUES (1,'Bilbao',1),(2,'Barcelona',3),(3,'Sevilla',1),(4,'Cadiz',2),(5,'Malaga',1),(6,'Huelva',2);
/*!40000 ALTER TABLE `ALMACENES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CAJAS`
--

DROP TABLE IF EXISTS `CAJAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CAJAS` (
  `NumReferencia` char(5) NOT NULL,
  `Contenido` varchar(100) DEFAULT NULL,
  `Valor` int(11) DEFAULT NULL,
  `Almacen` int(11) DEFAULT NULL,
  PRIMARY KEY (`NumReferencia`),
  KEY `Almacen` (`Almacen`),
  CONSTRAINT `CAJAS_ibfk_1` FOREIGN KEY (`Almacen`) REFERENCES `ALMACENES` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CAJAS`
--

LOCK TABLES `CAJAS` WRITE;
/*!40000 ALTER TABLE `CAJAS` DISABLE KEYS */;
INSERT INTO `CAJAS` VALUES ('12ABF','Herramientas',300,4),('17GFV','Televisores',220,2),('20VDJ','Videojuegos',200,2);
/*!40000 ALTER TABLE `CAJAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `practica1`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `practica1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `practica1`;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `cod_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(10) DEFAULT NULL,
  `apellido1` varchar(10) DEFAULT NULL,
  `apellido2` varchar(10) DEFAULT NULL,
  `nif` char(9) DEFAULT NULL,
  `poblacion` varchar(15) DEFAULT NULL,
  `calle` varchar(20) DEFAULT NULL,
  `CP` char(10) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cod_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Pedro','Garcia','Rovira','123456798','Madrid','Las huertas','12345','9112345678'),(2,'Juan','Garriga','Sorlí','987654323','Barcelona','Diagonal 32','234423','93456789'),(3,'Ana','Jacinta','Galdos','847474747','Malaga','Las La paz','836311','67845493'),(4,'Esperanza','Aguirre','Gonzalez','949383838','Cordoba','Julio Romero','848487','57474747');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coches`
--

DROP TABLE IF EXISTS `coches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coches` (
  `modelo` varchar(30) NOT NULL,
  `potencia` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `precio` decimal(7,2) DEFAULT 10000.00,
  `disponible` bit(1) DEFAULT NULL,
  PRIMARY KEY (`modelo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coches`
--

LOCK TABLES `coches` WRITE;
/*!40000 ALTER TABLE `coches` DISABLE KEYS */;
INSERT INTO `coches` VALUES ('afent',100,'1999-12-12',10000.00,NULL),('clio',70,'1999-12-12',10000.00,NULL),('fiat brava',90,'1999-12-12',10000.00,NULL),('fiat punto',70,'1995-09-09',10000.00,NULL),('ford focus',89,'2001-01-01',10000.00,NULL),('Kia Rio',90,'2003-01-03',10000.00,NULL),('laguna',200,'2004-03-01',10000.00,NULL),('marbella',65,'1996-01-05',10000.00,NULL),('megane',100,'2003-03-01',10000.00,NULL),('Mercedes 300',150,'2005-02-10',10000.00,NULL),('Mercedes 500',200,'1999-12-12',10000.00,NULL),('opel kadet',89,'1999-12-12',10000.00,NULL),('r-18',80,'1995-02-10',10000.00,NULL),('Santa fe',150,'1999-12-12',10000.00,NULL),('Santia',200,'2000-02-01',10000.00,NULL),('smart',60,'2002-01-02',10000.00,NULL),('Space',200,'1999-12-12',10000.00,NULL),('toyota corola',100,'1999-12-12',10000.00,NULL);
/*!40000 ALTER TABLE `coches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `codigo_producto` char(5) NOT NULL,
  `mes` varchar(10) NOT NULL,
  `ingresos` int(11) NOT NULL,
  PRIMARY KEY (`codigo_producto`,`mes`,`ingresos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES ('1','abril',900),('1','enero',100),('1','enero',400),('4','enero',2000),('4','febrero',1200),('7','abril',234),('7','marzo',230),('7','mayo',500),('7','mayo',600),('7','mayo',1000),('8','enero',600),('8','enero',1290),('9','marzo',2400);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-13 20:40:49
