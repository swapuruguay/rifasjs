-- MySQL dump 10.16  Distrib 10.1.9-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: rifas
-- ------------------------------------------------------
-- Server version	10.1.9-MariaDB

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
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estados` (
  `id_estado` tinyint(4) NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
INSERT INTO `estados` VALUES (1,'Entregado'),(2,'Pago parcial'),(3,'Pagado'),(4,'Devuelto');
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nros`
--

DROP TABLE IF EXISTS `nros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nros` (
  `id_nro` int(11) NOT NULL AUTO_INCREMENT,
  `vendedor` int(11) NOT NULL,
  `nro` int(11) NOT NULL,
  `estado` tinyint(4) NOT NULL,
  `anio` int(11) NOT NULL,
  `valor` int(11) NOT NULL,
  `reasignado` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_nro`),
  UNIQUE KEY `nro` (`nro`),
  KEY `FK_nros_estados` (`estado`),
  CONSTRAINT `FK_nros_estados` FOREIGN KEY (`estado`) REFERENCES `estados` (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nros`
--

LOCK TABLES `nros` WRITE;
/*!40000 ALTER TABLE `nros` DISABLE KEYS */;
INSERT INTO `nros` VALUES (1,1,0,1,2016,500,0),(2,1,1,2,2016,500,0),(3,1,2,1,2016,500,0),(4,1,3,1,2016,500,0),(5,1,4,1,2016,500,0),(6,1,5,1,2016,500,1),(7,1,6,4,2016,500,0),(8,1,7,1,2016,500,0),(9,1,8,1,2016,500,0),(10,1,9,3,2016,500,0),(11,3,10,1,2016,500,0),(12,3,11,1,2016,500,0),(13,3,12,1,2016,500,0),(14,3,13,1,2016,500,0),(15,3,14,1,2016,500,0),(16,3,15,1,2016,500,0),(17,3,16,1,2016,500,0),(18,3,17,1,2016,500,0),(19,3,18,1,2016,500,0),(20,3,19,1,2016,500,0),(21,2,20,1,2016,500,0),(22,2,21,1,2016,500,0),(23,2,22,1,2016,500,0),(24,2,23,1,2016,500,0),(25,2,24,1,2016,500,0),(26,2,25,1,2016,500,0),(27,2,26,1,2016,500,0),(28,2,27,1,2016,500,0),(29,2,28,1,2016,500,0),(30,2,29,1,2016,500,0);
/*!40000 ALTER TABLE `nros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reasigna`
--

DROP TABLE IF EXISTS `reasigna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reasigna` (
  `id_reasigna` int(11) NOT NULL AUTO_INCREMENT,
  `flia` int(11) NOT NULL DEFAULT '0',
  `nro` int(11) NOT NULL DEFAULT '0',
  `anio` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_reasigna`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reasigna`
--

LOCK TABLES `reasigna` WRITE;
/*!40000 ALTER TABLE `reasigna` DISABLE KEYS */;
/*!40000 ALTER TABLE `reasigna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedores`
--

DROP TABLE IF EXISTS `vendedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendedores` (
  `id_vendedor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id_vendedor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedores`
--

LOCK TABLES `vendedores` WRITE;
/*!40000 ALTER TABLE `vendedores` DISABLE KEYS */;
INSERT INTO `vendedores` VALUES (1,'SOSA WALTER'),(2,'MARIA LUISA'),(3,'MARIA AROCENA');
/*!40000 ALTER TABLE `vendedores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-07 13:27:02
