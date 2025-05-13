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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-13 21:25:12
