-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: euskalrent
-- ------------------------------------------------------
-- Server version	5.6.26-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alojamiento`
--

DROP TABLE IF EXISTS `alojamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alojamiento` (
  `idAlojamiento` int(10) NOT NULL AUTO_INCREMENT,
  `tipoAlojamiento` varchar(255) NOT NULL,
  `numHabitaciones` smallint(5) NOT NULL,
  `barrio` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `fotoAlojamiento` varchar(255) DEFAULT NULL,
  `precioNoche` int(10) NOT NULL,
  `tipoCancelacion` varchar(255) NOT NULL,
  `Comentario` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idAlojamiento`),
  UNIQUE KEY `direccion` (`direccion`),
  UNIQUE KEY `fotoAlojamiento` (`fotoAlojamiento`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alojamiento`
--

LOCK TABLES `alojamiento` WRITE;
/*!40000 ALTER TABLE `alojamiento` DISABLE KEYS */;
INSERT INTO `alojamiento` VALUES (1,'Piso',2,'Barrio1','Direccionprueba1','prueba',4,'Gratuita','Execelente');
/*!40000 ALTER TABLE `alojamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alquiler`
--

DROP TABLE IF EXISTS `alquiler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alquiler` (
  `idAlquiler` int(10) NOT NULL,
  `IdUsuario` int(10) NOT NULL,
  `IdAlojamiento` int(10) NOT NULL,
  `fechaAlquiler` date NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL,
  PRIMARY KEY (`idAlquiler`),
  UNIQUE KEY `IdUsuario` (`IdUsuario`),
  UNIQUE KEY `IdAlojamiento` (`IdAlojamiento`),
  KEY `FKAlquiler497759` (`IdUsuario`),
  KEY `FKAlquiler321815` (`idAlquiler`),
  KEY `FKAlquiler221731` (`IdAlojamiento`),
  CONSTRAINT `FKAlquiler221731` FOREIGN KEY (`IdAlojamiento`) REFERENCES `alojamiento` (`idAlojamiento`),
  CONSTRAINT `FKAlquiler497759` FOREIGN KEY (`IdUsuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alquiler`
--

LOCK TABLES `alquiler` WRITE;
/*!40000 ALTER TABLE `alquiler` DISABLE KEYS */;
INSERT INTO `alquiler` VALUES (1,1,1,'2015-12-27','2015-12-27','2016-01-15');
/*!40000 ALTER TABLE `alquiler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puntuacion`
--

DROP TABLE IF EXISTS `puntuacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `puntuacion` (
  `idPuntuacion` int(10) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(10) NOT NULL,
  `idReserva` int(10) NOT NULL,
  `Nota` int(10) NOT NULL,
  `Comentario` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idPuntuacion`),
  UNIQUE KEY `idUsuario` (`idUsuario`),
  UNIQUE KEY `idReserva` (`idReserva`),
  KEY `FKPuntuacion555531` (`idUsuario`),
  KEY `FKPuntuacion738340` (`idReserva`),
  CONSTRAINT `FKPuntuacion555531` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`),
  CONSTRAINT `FKPuntuacion738340` FOREIGN KEY (`idReserva`) REFERENCES `reservas` (`idReserva`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puntuacion`
--

LOCK TABLES `puntuacion` WRITE;
/*!40000 ALTER TABLE `puntuacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `puntuacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservas`
--

DROP TABLE IF EXISTS `reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservas` (
  `idReserva` int(10) NOT NULL,
  `idUsuario` int(10) NOT NULL,
  `idAlquiler` int(10) NOT NULL,
  `fechaReserva` varchar(100) NOT NULL,
  `fechaEntrada` date NOT NULL,
  `fechaSalida` date NOT NULL,
  PRIMARY KEY (`idReserva`),
  UNIQUE KEY `idUsuario` (`idUsuario`),
  UNIQUE KEY `idAlquiler` (`idAlquiler`),
  KEY `FKReservas702790` (`idUsuario`),
  CONSTRAINT `Reservas_Alquiler` FOREIGN KEY (`idAlquiler`) REFERENCES `alquiler` (`idAlquiler`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Reservas_Usuarios` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservas`
--

LOCK TABLES `reservas` WRITE;
/*!40000 ALTER TABLE `reservas` DISABLE KEYS */;
INSERT INTO `reservas` VALUES (1,2,1,'2015-12-27','2016-01-02','2016-01-06');
/*!40000 ALTER TABLE `reservas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `idUsuario` int(10) NOT NULL AUTO_INCREMENT,
  `nombreCompleto` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fotoPerfil` varchar(255) DEFAULT NULL,
  `telefono` int(9) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `pass` varchar(255) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `telefono` (`telefono`),
  UNIQUE KEY `fotoPerfil` (`fotoPerfil`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Asier Martinez','asmartinez@ehu.eus','prueba',660648606,'El maldito amo.','pass1'),(2,'Joseba Alonso','jalonso@ehu.eus',NULL,666555444,'Un nerd de palo.','pass2');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-27 18:46:05
