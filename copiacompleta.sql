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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-13 18:22:50
