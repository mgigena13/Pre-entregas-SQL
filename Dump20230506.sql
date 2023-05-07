CREATE DATABASE  IF NOT EXISTS `universidad_privada` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `universidad_privada`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: universidad_privada
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Temporary view structure for view `alumnos_deudores`
--

DROP TABLE IF EXISTS `alumnos_deudores`;
/*!50001 DROP VIEW IF EXISTS `alumnos_deudores`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `alumnos_deudores` AS SELECT 
 1 AS `dni`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `nombre_carrera`,
 1 AS `anio`,
 1 AS `mes`,
 1 AS `vencimiento`,
 1 AS `importe`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `anio_cursado`
--

DROP TABLE IF EXISTS `anio_cursado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anio_cursado` (
  `anio_cursado` int NOT NULL,
  `nombre_anio` varchar(50) NOT NULL,
  PRIMARY KEY (`anio_cursado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anio_cursado`
--

LOCK TABLES `anio_cursado` WRITE;
/*!40000 ALTER TABLE `anio_cursado` DISABLE KEYS */;
INSERT INTO `anio_cursado` VALUES (1,'Primer año'),(2,'Segundo año'),(3,'Tercer año'),(4,'Cuarto año'),(5,'Quinto año'),(6,'Sexto año');
/*!40000 ALTER TABLE `anio_cursado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audits`
--

DROP TABLE IF EXISTS `audits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audits` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `entity` varchar(100) DEFAULT NULL,
  `entity_id` int DEFAULT NULL,
  `insert_dt` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `last_update_dt` datetime DEFAULT NULL,
  `last_updated_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audits`
--

LOCK TABLES `audits` WRITE;
/*!40000 ALTER TABLE `audits` DISABLE KEYS */;
INSERT INTO `audits` VALUES (1,'inscripciones',103,'2023-05-06 22:16:30','root@localhost','2023-05-06 22:16:30','root@localhost'),(2,'inscripciones',104,'2023-05-06 22:16:30','root@localhost','2023-05-06 22:16:30','root@localhost'),(3,'inscripciones',105,'2023-05-06 22:16:30','root@localhost','2023-05-06 22:16:30','root@localhost'),(4,'inscripciones',106,'2023-05-06 22:16:30','root@localhost','2023-05-06 22:16:30','root@localhost');
/*!40000 ALTER TABLE `audits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `autoridades_facultad`
--

DROP TABLE IF EXISTS `autoridades_facultad`;
/*!50001 DROP VIEW IF EXISTS `autoridades_facultad`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `autoridades_facultad` AS SELECT 
 1 AS `Apellido`,
 1 AS `Nombre`,
 1 AS `rol`,
 1 AS `Facultad`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `cargos_docentes`
--

DROP TABLE IF EXISTS `cargos_docentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargos_docentes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_cargo` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargos_docentes`
--

LOCK TABLES `cargos_docentes` WRITE;
/*!40000 ALTER TABLE `cargos_docentes` DISABLE KEYS */;
INSERT INTO `cargos_docentes` VALUES (1,'Titular'),(2,'Adjunto'),(3,'JTP');
/*!40000 ALTER TABLE `cargos_docentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carreras`
--

DROP TABLE IF EXISTS `carreras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carreras` (
  `id` int NOT NULL AUTO_INCREMENT,
  `facultadID` int NOT NULL,
  `nombre_carrera` varchar(50) NOT NULL,
  `sigla` varchar(50) NOT NULL,
  `grado` set('pregrado','grado','posgrado','diplomatura','cursos cortos') NOT NULL,
  `fecha_de_creacion_carrera` date NOT NULL,
  `duracion` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `facultadID` (`facultadID`),
  CONSTRAINT `carreras_ibfk_1` FOREIGN KEY (`facultadID`) REFERENCES `facultades` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carreras`
--

LOCK TABLES `carreras` WRITE;
/*!40000 ALTER TABLE `carreras` DISABLE KEYS */;
INSERT INTO `carreras` VALUES (1,1,'Licenciatura en Kinesiologia','ki','grado','1982-02-01',4),(2,1,'Licenciatura en Psicologia','psi','grado','1982-02-01',5),(3,1,'Licenciatura en Nutricion','nu','grado','1982-02-01',5),(4,1,'Técnico en Radiología','rad','pregrado','1982-02-01',3),(5,1,'Técnico en Instrumentación Quirúrgica','iq','pregrado','1982-02-01',3),(6,1,'Técnico en Higiene y Seguridad Laboral','hys','pregrado','1982-02-01',3),(7,2,'Arquitectura','arq','grado','1990-02-01',5),(8,2,'Licenciatura en Diseño Gráfico','gra','grado','1990-02-01',4),(9,2,'Licenciatura en Diseño de Indumentaria','ind','grado','1990-02-01',4),(10,2,'Licenciatura en Diseño de Interiores','int','grado','1990-02-01',4),(11,2,'Corredor Inmobiliario','ci','pregrado','1990-02-01',3),(12,2,'Martillero Público','ma','pregrado','1990-02-01',3),(13,3,'Ingenieria en Sistemas','is','grado','1979-02-01',5),(14,3,'Ingenieria Industrial','ii','grado','1979-02-01',5),(15,3,'Ingenieria Electrónica','ie','grado','1979-02-01',5);
/*!40000 ALTER TABLE `carreras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuotas`
--

DROP TABLE IF EXISTS `cuotas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuotas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `anio` int NOT NULL,
  `mes` int NOT NULL,
  `vencimiento` date NOT NULL,
  `pagado` tinyint(1) NOT NULL,
  `id_persona` int NOT NULL,
  `id_carrera` int NOT NULL,
  `importe` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_persona` (`id_persona`),
  KEY `id_carrera` (`id_carrera`),
  CONSTRAINT `cuotas_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`dni`),
  CONSTRAINT `cuotas_ibfk_2` FOREIGN KEY (`id_carrera`) REFERENCES `carreras` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuotas`
--

LOCK TABLES `cuotas` WRITE;
/*!40000 ALTER TABLE `cuotas` DISABLE KEYS */;
INSERT INTO `cuotas` VALUES (1,2023,1,'2023-01-10',1,41377834,2,41500),(2,2023,2,'2023-02-10',1,41377834,2,41500),(3,2023,3,'2023-03-10',1,41377834,2,41500),(4,2023,4,'2023-04-10',1,41377834,2,41500),(5,2023,5,'2023-05-10',1,41377834,2,41500),(6,2023,6,'2023-06-12',0,41377834,2,41500),(7,2023,7,'2023-07-10',0,41377834,2,41500),(8,2023,8,'2023-08-10',0,41377834,2,41500),(9,2023,9,'2023-09-11',0,41377834,2,41500),(10,2023,10,'2023-10-10',0,41377834,2,41500),(11,2023,11,'2023-11-10',0,41377834,2,41500),(12,2023,12,'2023-12-11',0,41377834,2,41500),(13,2023,1,'2023-01-10',1,39967940,2,41500),(14,2023,2,'2023-02-10',0,39967940,2,41500),(15,2023,3,'2023-03-10',1,39967940,2,41500),(16,2023,4,'2023-04-10',1,39967940,2,41500),(17,2023,5,'2023-05-10',1,39967940,2,41500),(18,2023,6,'2023-06-12',0,39967940,2,41500),(19,2023,7,'2023-07-10',0,39967940,2,41500),(20,2023,8,'2023-08-10',0,39967940,2,41500),(21,2023,9,'2023-09-11',0,39967940,2,41500),(22,2023,10,'2023-10-10',0,39967940,2,41500),(23,2023,11,'2023-11-10',0,39967940,2,41500),(24,2023,12,'2023-12-11',0,39967940,2,41500),(25,2023,1,'2023-01-10',0,42162232,2,41500),(26,2023,2,'2023-02-10',0,42162232,2,41500),(27,2023,3,'2023-03-10',0,42162232,2,41500),(28,2023,4,'2023-04-10',0,42162232,2,41500),(29,2023,5,'2023-05-10',0,42162232,2,41500),(30,2023,6,'2023-06-12',0,42162232,2,41500),(31,2023,7,'2023-07-10',0,42162232,2,41500),(32,2023,8,'2023-08-10',0,42162232,2,41500),(33,2023,9,'2023-09-11',0,42162232,2,41500),(34,2023,10,'2023-10-10',0,42162232,2,41500),(35,2023,11,'2023-11-10',0,42162232,2,41500),(36,2023,12,'2023-12-11',0,42162232,2,41500),(37,2023,1,'2023-01-10',1,41378892,2,41500),(38,2023,2,'2023-02-10',0,41378892,2,41500),(39,2023,3,'2023-03-10',0,41378892,2,41500),(40,2023,4,'2023-04-10',1,41378892,2,41500),(41,2023,5,'2023-05-10',1,41378892,2,41500),(42,2023,6,'2023-06-12',0,41378892,2,41500),(43,2023,7,'2023-07-10',0,41378892,2,41500),(44,2023,8,'2023-08-10',0,41378892,2,41500),(45,2023,9,'2023-09-11',0,41378892,2,41500),(46,2023,10,'2023-10-10',0,41378892,2,41500),(47,2023,11,'2023-11-10',0,41378892,2,41500),(48,2023,12,'2023-12-11',0,41378892,2,41500),(49,2023,1,'2023-01-10',1,41116768,2,41500),(50,2023,2,'2023-02-10',1,41116768,2,41500),(51,2023,3,'2023-03-10',1,41116768,2,41500),(52,2023,4,'2023-04-10',1,41116768,2,41500),(53,2023,5,'2023-05-10',1,41116768,2,41500),(54,2023,6,'2023-06-12',0,41116768,2,41500),(55,2023,7,'2023-07-10',0,41116768,2,41500),(56,2023,8,'2023-08-10',0,41116768,2,41500),(57,2023,9,'2023-09-11',0,41116768,2,41500),(58,2023,10,'2023-10-10',0,41116768,2,41500),(59,2023,11,'2023-11-10',0,41116768,2,41500),(60,2023,12,'2023-12-11',0,41116768,2,41500),(61,2023,1,'2023-01-10',1,38731632,7,46500),(62,2023,2,'2023-02-10',1,38731632,7,46500),(63,2023,3,'2023-03-10',0,38731632,7,46500),(64,2023,4,'2023-04-10',1,38731632,7,46500),(65,2023,5,'2023-05-10',0,38731632,7,46500),(66,2023,6,'2023-06-12',0,38731632,7,46500),(67,2023,7,'2023-07-10',0,38731632,7,46500),(68,2023,8,'2023-08-10',0,38731632,7,46500),(69,2023,9,'2023-09-11',0,38731632,7,46500),(70,2023,10,'2023-10-10',0,38731632,7,46500),(71,2023,11,'2023-11-10',0,38731632,7,46500),(72,2023,12,'2023-12-11',1,38731632,7,46500),(73,2023,1,'2023-01-10',1,39172939,7,46500),(74,2023,2,'2023-02-10',1,39172939,7,46500),(75,2023,3,'2023-03-10',1,39172939,7,46500),(76,2023,4,'2023-04-10',1,39172939,7,46500),(77,2023,5,'2023-05-10',1,39172939,7,46500),(78,2023,6,'2023-06-12',0,39172939,7,46500),(79,2023,7,'2023-07-10',0,39172939,7,46500),(80,2023,8,'2023-08-10',0,39172939,7,46500),(81,2023,9,'2023-09-11',0,39172939,7,46500),(82,2023,10,'2023-10-10',0,39172939,7,46500),(83,2023,11,'2023-11-10',0,39172939,7,46500),(84,2023,12,'2023-12-11',0,39172939,7,46500),(85,2023,1,'2023-01-10',1,39423175,7,46500),(86,2023,2,'2023-02-10',1,39423175,7,46500),(87,2023,3,'2023-03-10',1,39423175,7,46500),(88,2023,4,'2023-04-10',0,39423175,7,46500),(89,2023,5,'2023-05-10',0,39423175,7,46500),(90,2023,6,'2023-06-12',0,39423175,7,46500),(91,2023,7,'2023-07-10',0,39423175,7,46500),(92,2023,8,'2023-08-10',0,39423175,7,46500),(93,2023,9,'2023-09-11',0,39423175,7,46500),(94,2023,10,'2023-10-10',0,39423175,7,46500),(95,2023,11,'2023-11-10',0,39423175,7,46500),(96,2023,12,'2023-12-11',0,39423175,7,46500),(97,2023,1,'2023-01-10',1,39475125,7,46500),(98,2023,2,'2023-02-10',1,39475125,7,46500),(99,2023,3,'2023-03-10',1,39475125,7,46500),(100,2023,4,'2023-04-10',0,39475125,7,46500),(101,2023,5,'2023-05-10',0,39475125,7,46500),(102,2023,6,'2023-06-12',0,39475125,7,46500),(103,2023,7,'2023-07-10',0,39475125,7,46500),(104,2023,8,'2023-08-10',0,39475125,7,46500),(105,2023,9,'2023-09-11',0,39475125,7,46500),(106,2023,10,'2023-10-10',0,39475125,7,46500),(107,2023,11,'2023-11-10',0,39475125,7,46500),(108,2023,12,'2023-12-11',0,39475125,7,46500),(109,2023,1,'2023-01-10',1,39543352,7,46500),(110,2023,2,'2023-02-10',1,39543352,7,46500),(111,2023,3,'2023-03-10',1,39543352,7,46500),(112,2023,4,'2023-04-10',1,39543352,7,46500),(113,2023,5,'2023-05-10',1,39543352,7,46500),(114,2023,6,'2023-06-12',0,39543352,7,46500),(115,2023,7,'2023-07-10',0,39543352,7,46500),(116,2023,8,'2023-08-10',0,39543352,7,46500),(117,2023,9,'2023-09-11',0,39543352,7,46500),(118,2023,10,'2023-10-10',0,39543352,7,46500),(119,2023,11,'2023-11-10',0,39543352,7,46500),(120,2023,12,'2023-12-11',0,39543352,7,46500),(121,2023,1,'2023-01-10',1,39546128,7,46500),(122,2023,2,'2023-02-10',1,39546128,7,46500),(123,2023,3,'2023-03-10',1,39546128,7,46500),(124,2023,4,'2023-04-10',1,39546128,7,46500),(125,2023,5,'2023-05-10',1,39546128,7,46500),(126,2023,6,'2023-06-12',1,39546128,7,46500),(127,2023,7,'2023-07-10',1,39546128,7,46500),(128,2023,8,'2023-08-10',1,39546128,7,46500),(129,2023,9,'2023-09-11',1,39546128,7,46500),(130,2023,10,'2023-10-10',1,39546128,7,46500),(131,2023,11,'2023-11-10',1,39546128,7,46500),(132,2023,12,'2023-12-11',1,39546128,7,46500),(133,2023,1,'2023-01-10',0,39546153,7,46500),(134,2023,2,'2023-02-10',0,39546153,7,46500),(135,2023,3,'2023-03-10',0,39546153,7,46500),(136,2023,4,'2023-04-10',0,39546153,7,46500),(137,2023,5,'2023-05-10',0,39546153,7,46500),(138,2023,6,'2023-06-12',0,39546153,7,46500),(139,2023,7,'2023-07-10',0,39546153,7,46500),(140,2023,8,'2023-08-10',0,39546153,7,46500),(141,2023,9,'2023-09-11',0,39546153,7,46500),(142,2023,10,'2023-10-10',0,39546153,7,46500),(143,2023,11,'2023-11-10',0,39546153,7,46500),(144,2023,12,'2023-12-11',0,39546153,7,46500);
/*!40000 ALTER TABLE `cuotas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dedicacion_docente`
--

DROP TABLE IF EXISTS `dedicacion_docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dedicacion_docente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_dedicacion` varchar(20) NOT NULL,
  `carga_horaria` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dedicacion_docente`
--

LOCK TABLES `dedicacion_docente` WRITE;
/*!40000 ALTER TABLE `dedicacion_docente` DISABLE KEYS */;
INSERT INTO `dedicacion_docente` VALUES (1,'Simple','hasta 5 horas'),(2,'Intermedia','de 6 a 9 horas'),(3,'Especial','de 10 a 15 horas'),(4,'Extraordinaria','mas de 15 horas');
/*!40000 ALTER TABLE `dedicacion_docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `docentes_con_sueldo`
--

DROP TABLE IF EXISTS `docentes_con_sueldo`;
/*!50001 DROP VIEW IF EXISTS `docentes_con_sueldo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `docentes_con_sueldo` AS SELECT 
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `materia`,
 1 AS `cargo`,
 1 AS `dedicacion`,
 1 AS `monto_a_abonar`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `facultades`
--

DROP TABLE IF EXISTS `facultades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facultades` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_facultad` varchar(50) NOT NULL,
  `sigla` varchar(50) NOT NULL,
  `fecha_de_creacion_facultad` date NOT NULL,
  `personaID` int NOT NULL,
  `rolID` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `personaID` (`personaID`),
  KEY `rolID` (`rolID`),
  CONSTRAINT `facultades_ibfk_1` FOREIGN KEY (`personaID`) REFERENCES `personas` (`dni`),
  CONSTRAINT `facultades_ibfk_2` FOREIGN KEY (`rolID`) REFERENCES `rol` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facultades`
--

LOCK TABLES `facultades` WRITE;
/*!40000 ALTER TABLE `facultades` DISABLE KEYS */;
INSERT INTO `facultades` VALUES (1,'Facultad de Ciencias de la Salud','fcs','1981-02-01',35145692,1),(2,'Facultad de Arquitectura, Urbanismo y Diseño','faud','1989-02-01',21407119,1),(3,'Facultad de Ingenieria','fi','1979-02-01',36354265,1);
/*!40000 ALTER TABLE `facultades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscripciones`
--

DROP TABLE IF EXISTS `inscripciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inscripciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `personaID` int NOT NULL,
  `rolID` int NOT NULL,
  `materiaID` int NOT NULL,
  `fecha_hora_inscripcion` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `personaID` (`personaID`),
  KEY `rolID` (`rolID`),
  KEY `materiaID` (`materiaID`),
  CONSTRAINT `inscripciones_ibfk_1` FOREIGN KEY (`personaID`) REFERENCES `personas` (`dni`),
  CONSTRAINT `inscripciones_ibfk_2` FOREIGN KEY (`rolID`) REFERENCES `rol` (`id`),
  CONSTRAINT `inscripciones_ibfk_3` FOREIGN KEY (`materiaID`) REFERENCES `materias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscripciones`
--

LOCK TABLES `inscripciones` WRITE;
/*!40000 ALTER TABLE `inscripciones` DISABLE KEYS */;
INSERT INTO `inscripciones` VALUES (1,29581911,3,1,'2023-03-01 09:00:24'),(2,41377834,4,1,'2023-03-01 09:01:26'),(3,42981383,4,1,'2023-03-01 09:02:24'),(4,39967940,4,1,'2023-03-01 09:04:38'),(5,43474407,4,1,'2023-03-01 09:05:05'),(6,42892973,4,1,'2023-03-01 09:06:16'),(7,45420870,4,1,'2023-03-01 09:06:23'),(8,44975185,4,1,'2023-03-01 09:06:54'),(9,45593830,4,1,'2023-03-01 09:07:01'),(10,43190470,4,1,'2023-03-01 09:07:15'),(11,41116768,4,1,'2023-03-01 09:07:28'),(12,41378892,4,1,'2023-03-01 09:05:35'),(13,42162232,4,1,'2023-03-01 09:06:16'),(14,32500594,3,2,'2023-03-01 09:00:24'),(15,41377834,4,2,'2023-03-01 09:01:26'),(16,42981383,4,2,'2023-03-01 09:02:24'),(17,39967940,4,2,'2023-03-01 09:04:38'),(18,43474407,4,2,'2023-03-01 09:05:05'),(19,42892973,4,2,'2023-03-01 09:06:16'),(20,45420870,4,2,'2023-03-01 09:06:23'),(21,44975185,4,2,'2023-03-01 09:06:54'),(22,45593830,4,2,'2023-03-01 09:07:01'),(23,43190470,4,2,'2023-03-01 09:07:15'),(24,41116768,4,2,'2023-03-01 09:07:28'),(25,41378892,4,2,'2023-03-01 09:05:35'),(26,42162232,4,2,'2023-03-01 09:06:16'),(27,39738049,3,3,'2023-03-01 09:05:01'),(28,41377834,4,3,'2023-03-01 09:01:26'),(29,42981383,4,3,'2023-03-01 09:02:24'),(30,39967940,4,3,'2023-03-01 09:04:38'),(31,43474407,4,3,'2023-03-01 09:05:05'),(32,42892973,4,3,'2023-03-01 09:06:16'),(33,45420870,4,3,'2023-03-01 09:06:23'),(34,44975185,4,3,'2023-03-01 09:06:54'),(35,45593830,4,3,'2023-03-01 09:07:01'),(36,43190470,4,3,'2023-03-01 09:07:15'),(37,41116768,4,3,'2023-03-01 09:07:28'),(38,41378892,4,3,'2023-03-01 09:05:35'),(39,42162232,4,3,'2023-03-01 09:06:16'),(40,94308151,3,4,'2023-03-01 09:05:01'),(41,41377834,4,4,'2023-03-01 09:01:26'),(42,42981383,4,4,'2023-03-01 09:02:24'),(43,39967940,4,4,'2023-03-01 09:04:38'),(44,43474407,4,4,'2023-03-01 09:05:05'),(45,42892973,4,4,'2023-03-01 09:06:16'),(46,45420870,4,4,'2023-03-01 09:06:23'),(47,44975185,4,4,'2023-03-01 09:06:54'),(48,45593830,4,4,'2023-03-01 09:07:01'),(49,43190470,4,4,'2023-03-01 09:07:15'),(50,41116768,4,4,'2023-03-01 09:07:28'),(51,41378892,4,4,'2023-03-01 09:05:35'),(52,42162232,4,4,'2023-03-01 09:06:16'),(53,94308151,3,5,'2023-03-01 09:05:01'),(54,41377834,4,5,'2023-03-01 09:01:26'),(55,42981383,4,5,'2023-03-01 09:02:24'),(56,39967940,4,5,'2023-03-01 09:04:38'),(57,43474407,4,5,'2023-03-01 09:05:05'),(58,42892973,4,5,'2023-03-01 09:06:16'),(59,45420870,4,5,'2023-03-01 09:06:23'),(60,44975185,4,5,'2023-03-01 09:06:54'),(61,45593830,4,5,'2023-03-01 09:07:01'),(62,43190470,4,5,'2023-03-01 09:07:15'),(63,41116768,4,5,'2023-03-01 09:07:28'),(64,41378892,4,5,'2023-03-01 09:05:35'),(65,42162232,4,5,'2023-03-01 09:06:16'),(66,39175096,3,6,'2023-03-01 09:05:01'),(67,41377834,4,6,'2023-03-01 09:01:26'),(68,42981383,4,6,'2023-03-01 09:02:24'),(69,39967940,4,6,'2023-03-01 09:04:38'),(70,43474407,4,6,'2023-03-01 09:05:05'),(71,42892973,4,6,'2023-03-01 09:06:16'),(72,45420870,4,6,'2023-03-01 09:06:23'),(73,44975185,4,6,'2023-03-01 09:06:54'),(74,45593830,4,6,'2023-03-01 09:07:01'),(75,43190470,4,6,'2023-03-01 09:07:15'),(76,41116768,4,6,'2023-03-01 09:07:28'),(77,41378892,4,6,'2023-03-01 09:05:35'),(78,42162232,4,6,'2023-03-01 09:06:16'),(79,38731487,3,203,'2023-03-01 09:00:24'),(80,38731632,4,203,'2023-03-01 10:01:27'),(81,39172939,4,203,'2023-03-01 09:32:40'),(82,39423175,4,203,'2023-03-01 09:14:54'),(83,39475125,4,203,'2023-03-01 18:01:10'),(84,39543352,4,203,'2023-03-01 19:32:24'),(85,39546128,4,203,'2023-03-01 22:41:23'),(86,39546153,4,203,'2023-03-01 09:18:44'),(87,39546271,3,198,'2023-03-01 09:00:24'),(88,38731632,4,198,'2023-03-01 10:03:28'),(89,39172939,4,198,'2023-03-01 09:35:10'),(90,39423175,4,198,'2023-03-01 09:16:34'),(91,39475125,4,198,'2023-03-01 17:59:46'),(92,39543352,4,198,'2023-03-01 19:34:29'),(93,39546128,4,198,'2023-03-01 22:51:24'),(94,39546153,4,198,'2023-03-01 09:19:54'),(95,39546271,3,194,'2023-03-01 09:15:14'),(96,38731632,4,194,'2023-03-01 10:57:28'),(97,39172939,4,194,'2023-03-01 11:40:10'),(98,39423175,4,194,'2023-03-01 13:16:34'),(99,39475125,4,194,'2023-03-01 14:59:46'),(100,39543352,4,194,'2023-03-01 10:34:29'),(101,39546128,4,194,'2023-03-01 17:51:24'),(102,39546153,4,194,'2023-03-01 16:19:54'),(103,44296778,4,1,'2023-03-16 09:00:24'),(104,40456738,4,1,'2023-03-16 09:00:24'),(105,40503573,4,1,'2023-03-16 09:00:24'),(106,42991413,4,1,'2023-03-16 09:00:24');
/*!40000 ALTER TABLE `inscripciones` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_insert_inscripcion_aud` AFTER INSERT ON `inscripciones` FOR EACH ROW INSERT INTO `audits`(entity, entity_id, insert_dt, created_by, last_update_dt, last_updated_by) 
VALUES ('inscripciones', NEW.id, CURRENT_TIMESTAMP(), USER(), CURRENT_TIMESTAMP(), USER()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `inscriptos`
--

DROP TABLE IF EXISTS `inscriptos`;
/*!50001 DROP VIEW IF EXISTS `inscriptos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `inscriptos` AS SELECT 
 1 AS `documento`,
 1 AS `idm`,
 1 AS `nombre_asignatura`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `idrol`,
 1 AS `funcion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `materia_por_anio_semestre`
--

DROP TABLE IF EXISTS `materia_por_anio_semestre`;
/*!50001 DROP VIEW IF EXISTS `materia_por_anio_semestre`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `materia_por_anio_semestre` AS SELECT 
 1 AS `materia`,
 1 AS `carrera`,
 1 AS `año`,
 1 AS `semestre`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `materias`
--

DROP TABLE IF EXISTS `materias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `carreraID` int NOT NULL,
  `asignatura` varchar(50) NOT NULL,
  `anio_cursado` int NOT NULL,
  `tipo_duracion` set('anual','primer semestre','segundo semestre') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `carreraID` (`carreraID`),
  KEY `anio_cursado` (`anio_cursado`),
  CONSTRAINT `materias_ibfk_1` FOREIGN KEY (`carreraID`) REFERENCES `carreras` (`id`),
  CONSTRAINT `materias_ibfk_2` FOREIGN KEY (`anio_cursado`) REFERENCES `anio_cursado` (`anio_cursado`)
) ENGINE=InnoDB AUTO_INCREMENT=451 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materias`
--

LOCK TABLES `materias` WRITE;
/*!40000 ALTER TABLE `materias` DISABLE KEYS */;
INSERT INTO `materias` VALUES (1,2,'Historia de la Psicologia',1,'primer semestre'),(2,2,'Biologia General y Humana',1,'primer semestre'),(3,2,'Psicologia General',1,'primer semestre'),(4,2,'Informatica Aplicada',1,'primer semestre'),(5,2,'Ingles I',1,'primer semestre'),(6,2,'Perspetivas Antropologicas',1,'primer semestre'),(7,2,'Corrientes Actuales en Psicologia',1,'segundo semestre'),(8,2,'Neutobiologia I',1,'segundo semestre'),(9,2,'Sociologia Enfoque en Redes',1,'segundo semestre'),(10,2,'Ingles II',1,'segundo semestre'),(11,2,'Psicologia y Problematica Socio-Cultural Actual.',1,'segundo semestre'),(12,2,'Psicologia Social',2,'primer semestre'),(13,2,'Neutobiologia II',2,'primer semestre'),(14,2,'Psicologia del Desarrollo I (infancia-adolecencia)',2,'primer semestre'),(15,2,'Psicologia de la Personalidad',2,'primer semestre'),(16,2,'Problemas Filosoficos en Psicologia',2,'primer semestre'),(17,2,'Psicoestadistica',2,'segundo semestre'),(18,2,'Psicologia del Desarrollo II (adultez-senectud)',2,'segundo semestre'),(19,2,'Psicopatologia I',2,'segundo semestre'),(20,2,'Integracion Practica I',2,'segundo semestre'),(21,2,'Psicologia Humanistica y Existencial',3,'primer semestre'),(22,2,'Metodos de Investigacion I',3,'primer semestre'),(23,2,'Psicologia Sistemico Comunicacional',3,'segundo semestre'),(24,2,'Psicologia Cognitivo Conductual',3,'primer semestre'),(25,2,'Metodos de Investigacion II',3,'segundo semestre'),(26,2,'Psicopatologia II',3,'segundo semestre'),(27,2,'Teoria Psicoanalitica',3,'segundo semestre'),(28,2,'Integracion Practica II',3,'segundo semestre'),(29,2,'Salud Mental Comunitaria',3,'segundo semestre'),(30,2,'Optativa IV - Gestion Colaborativa de Conflictos',3,'segundo semestre'),(31,2,'Psicologia de las Organizaciones',4,'primer semestre'),(32,2,'Evaluacion y Diagnostico Psicologico I',4,'primer semestre'),(33,2,'Psicologia Educacional',4,'primer semestre'),(34,2,'Orientacion y Terapia Familiar',4,'primer semestre'),(35,2,'Evaluacion y Diagnostico Psicologico II',4,'segundo semestre'),(36,2,'Integracion Practica III',4,'segundo semestre'),(37,2,'Psicofarmacologia',4,'segundo semestre'),(38,2,'PPS-Salud Mental Comunitaria',4,'primer semestre'),(39,2,'PPS-Psicologia Organizacional',4,'segundo semestre'),(40,2,'PPS-Psicologia Eduacional',4,'segundo semestre'),(41,2,'Abordaje Integrado del Paciente Cronico',5,'primer semestre'),(42,2,'Psicologia Juridico Forense',5,'primer semestre'),(43,2,'Principios de Intervencion Clinica',5,'anual'),(44,2,'Seminario Trabajo Integrador Final-TIF',5,'anual'),(45,2,'PPS-Clinica Psicoanalitica-Psicodinamica',5,'anual'),(46,2,'PPS-Clinico Humanistico Existencial',5,'anual'),(47,2,'PPS-Clinica Cognitivo Conductual',5,'anual'),(48,2,'PPS-Clinica Sistemico Comunicacional',5,'anual'),(49,2,'PPS-Orientacion Juridico Forense',5,'segundo semestre'),(50,1,'Anatomia',1,'anual'),(51,1,'Fisiologia',1,'anual'),(52,1,'Histologia',1,'anual'),(53,1,'Fisica Biologica',1,'anual'),(54,1,'Psicologia Medica',1,'segundo semestre'),(55,1,'Ingles I',1,'primer semestre'),(56,1,'Seminario I (Bioquimica)',1,'anual'),(57,1,'Biomecanica',2,'anual'),(58,1,'Tecnicas Kinesicas I',2,'anual'),(59,1,'Semiopatologia Medico Kinesica',2,'anual'),(60,1,'Kinefilaxia',2,'anual'),(61,1,'Ingles II (promocional)',2,'segundo semestre'),(62,1,'ortesis y Protesis',2,'primer semestre'),(63,1,'Psicomotricidad',2,'anual'),(64,1,'Tecnicas Kinesicas II',3,'anual'),(65,1,'Semiopatologia Quirurgico Kinesica',3,'anual'),(66,1,'Kinesiologia Medica',3,'anual'),(67,1,'Fisioterapia',3,'anual'),(68,1,'Ingles III (promocional)',3,'primer semestre'),(69,1,'Kinefisiatria Estetica',3,'segundo semestre'),(70,1,'Bioinformatica y Rehabilitacion Computacional',3,'anual'),(71,1,'Kinesiologia Quirurgica',4,'anual'),(72,1,'Kinesiologia Legal',4,'primer semestre'),(73,1,'Deportismo',4,'anual'),(74,1,'Ingles IV',4,'segundo semestre'),(75,1,'Farmacologia Electrofisiokinesica',4,'anual'),(76,1,'Kinefisiatria Ocupacional y Laboral',4,'anual'),(77,1,'Metodologia de la Investigacion',4,'anual'),(78,3,'Fisico-Quimica',1,'primer semestre'),(79,3,'Bioquimica',1,'segundo semestre'),(80,3,'Anatomia I',1,'primer semestre'),(81,3,'Anatomia II',1,'segundo semestre'),(82,3,'Fundamentos de Alimentacion I',1,'primer semestre'),(83,3,'Fundamentos de Alimentacion II',1,'segundo semestre'),(84,3,'Nutricion Normal I',1,'segundo semestre'),(85,3,'Saneamiento Ambiental',1,'primer semestre'),(86,3,'Informatica I',1,'segundo semestre'),(87,3,'Ingles I',1,'primer semestre'),(88,3,'Antropologia Social',2,'segundo semestre'),(89,3,'Fisiologia I',2,'primer semestre'),(90,3,'Fisiologia II',2,'segundo semestre'),(91,3,'Bromatologia',2,'primer semestre'),(92,3,'Tecnologia Alimentaria',2,'segundo semestre'),(93,3,'Microbiologia y Parasitologia',2,'segundo semestre'),(94,3,'Ingles II',2,'primer semestre'),(95,3,'Informatica II',2,'primer semestre'),(96,3,'Estadistica y Bioestadistica',2,'segundo semestre'),(97,3,'Nutricion Normal II',2,'primer semestre'),(98,3,'Nutricion Materno Infantil',2,'segundo semestre'),(99,3,'Fisiopatologia y Dietoterapia del Ninio I',3,'primer semestre'),(100,3,'Fisiopatologia y Dietoterapia del Adulto I',3,'primer semestre'),(101,3,'Fisiopatologia y Dietoterapia del Ninio II',3,'segundo semestre'),(102,3,'Fisiopatologia y Dietoterapia del Adulto II',3,'segundo semestre'),(103,3,'Tecnica Dietetica y Analisis Sensorial',3,'primer semestre'),(104,3,'Tecnica Dietoterapica',3,'segundo semestre'),(105,3,'Evaluacion Nutricional I',3,'segundo semestre'),(106,3,'Economia Familia',3,'segundo semestre'),(107,3,'Psicologia',3,'primer semestre'),(108,3,'Evaluacion Nutricional II',4,'primer semestre'),(109,3,'Educacion Alimentaria Nutricional',4,'segundo semestre'),(110,3,'Nutricion en Salud Publica',4,'primer semestre'),(111,3,'Epidemiologia Nutricional',4,'segundo semestre'),(112,3,'Normas de Calidad y Formulaion de Alimentos',4,'primer semestre'),(113,3,'Planificacion y Alimentacion Institucional',4,'segundo semestre'),(114,3,'Gestion Alimentaria',4,'segundo semestre'),(115,3,'Fisiologia de Deporte',4,'primer semestre'),(116,3,'Metodologia de la Investigacion',4,'segundo semestre'),(117,3,'Informatica III',4,'primer semestre'),(118,3,'Comunicacion Nutricional',5,'segundo semestre'),(119,3,'Toxicologia de los Alimentos',5,'segundo semestre'),(120,3,'Nutricion Deportiva',5,'primer semestre'),(121,3,'Nutricion en Geriatria',5,'primer semestre'),(122,3,'Etica y Bioetica',5,'primer semestre'),(123,3,'Practica Final Obligatoria',5,'anual'),(124,3,'Trabajo Final',5,'anual'),(125,3,'Optativa I',5,'primer semestre'),(126,3,'Optativa II',5,'primer semestre'),(127,4,'Anatomia',1,'primer semestre'),(128,4,'Histologia y Embriologia',1,'primer semestre'),(129,4,'Fisica Biologica',1,'primer semestre'),(130,4,'Psicologia de la Personalidad y Evolutiva',1,'primer semestre'),(131,4,'Fundamentos de Administracion',1,'primer semestre'),(132,4,'Fisiologia',1,'segundo semestre'),(133,4,'Quimica Biologica',1,'segundo semestre'),(134,4,'Etica Profesional',1,'segundo semestre'),(135,4,'Fundamentos de Radiologia',1,'segundo semestre'),(136,4,'Microbiologia y Epidemiologia',1,'anual'),(137,4,'Tecnicas Sanitarias',1,'anual'),(138,4,'Psicologia Aplicada',2,'primer semestre'),(139,4,'Patologia Medica',2,'segundo semestre'),(140,4,'Farmacologia',2,'anual'),(141,4,'Tecnicas Radiologicas I',2,'anual'),(142,4,'Fisica Radiologica',2,'anual'),(143,4,'Patologia Quirurgica',2,'anual'),(144,4,'Ingles',2,'anual'),(145,4,'Computacion I',2,'anual'),(146,4,'Tecnica Radiologica II',3,'primer semestre'),(147,4,'Ingles Tecnico',3,'primer semestre'),(148,4,'Computacion II',3,'primer semestre'),(149,5,'Anatomia',1,'primer semestre'),(150,5,'Histologia y Embriologia',1,'primer semestre'),(151,5,'Fisica Biologica',1,'primer semestre'),(152,5,'Psicologia de la Personalidad y Evolutiva',1,'primer semestre'),(153,5,'Fundamentos de Administracion',1,'primer semestre'),(154,5,'Fisiologia',1,'segundo semestre'),(155,5,'Quimica Biologica',1,'segundo semestre'),(156,5,'Etica Profesional',1,'segundo semestre'),(157,5,'Fundamentos de Quirofano',1,'segundo semestre'),(158,5,'Microbiologia y Epidemiologia',1,'anual'),(159,5,'Tecnicas Sanitarias',1,'anual'),(160,5,'Psicologia Aplicada',2,'primer semestre'),(161,5,'Patologia Medica',2,'segundo semestre'),(162,5,'Farmacologia',2,'anual'),(163,5,'Tecnicas Quirurgica I',2,'anual'),(164,5,'Patologia Quirurgica',2,'anual'),(165,5,'Ingles',2,'anual'),(166,5,'Tecnica Quirurgica II',3,'primer semestre'),(167,5,'Ingles Tecnico',3,'primer semestre'),(168,6,'Filosofia',1,'primer semestre'),(169,6,'Seguridad I',1,'primer semestre'),(170,6,'Medicina Industrial',1,'primer semestre'),(171,6,'Fisica General',1,'primer semestre'),(172,6,'Sociologia',1,'primer semestre'),(173,6,'Psicologia Laboral',1,'segundo semestre'),(174,6,'Ambiente de Trabajo I',1,'segundo semestre'),(175,6,'Seguridad II',1,'segundo semestre'),(176,6,'Quimica Tecnologica',1,'segundo semestre'),(177,6,'Organizacion Industrial',2,'primer semestre'),(178,6,'Relaciones Humanas',2,'primer semestre'),(179,6,'Seguridad III',2,'primer semestre'),(180,6,'Higiene Industrial',2,'primer semestre'),(181,6,'Enfermedades Profesionales',2,'segundo semestre'),(182,6,'Ambiente de Trabajo II',2,'segundo semestre'),(183,6,'Pedagogia y Didactica General',2,'segundo semestre'),(184,6,'Investigacion de Campo',2,'segundo semestre'),(185,6,'Estudio del Trabajo',3,'primer semestre'),(186,6,'Ergonomia',3,'primer semestre'),(187,6,'Ambiente de Trabajo III',3,'primer semestre'),(188,6,'Seguridad IV',3,'primer semestre'),(189,6,'Seleccion y Capacitacion del Personal',3,'segundo semestre'),(190,6,'Derecho del Trabajo',3,'segundo semestre'),(191,6,'Estadistica y Costo',3,'segundo semestre'),(192,6,'Seguridad Vial',3,'segundo semestre'),(193,6,'Etica y Responsabilidad Social Empresaria',3,'segundo semestre'),(194,7,'Arquitectura I',1,'anual'),(195,7,'Sistemas de Representacion',1,'anual'),(196,7,'Dibujo y Expresion',1,'anual'),(197,7,'Cultura Arquitectonica',1,'anual'),(198,7,'Construcciones I',1,'anual'),(199,7,'Estructuras I',1,'anual'),(200,7,'Matematicas',1,'anual'),(201,7,'Arquitectura II',2,'anual'),(202,7,'Ambiente I',2,'anual'),(203,7,'Teoria de la Arquitectura y el Urbanismo I',2,'anual'),(204,7,'Historia de la Arquitectura y el Urbanismo I',2,'anual'),(205,7,'Construcciones II',2,'anual'),(206,7,'Estructuras II',2,'anual'),(207,7,'Arquitectura III',3,'anual'),(208,7,'AMBIENTE III',3,'anual'),(209,7,'Teoria de la Arquitectura y el Urbanismo II',3,'anual'),(210,7,'Historia de la Arquitectura y el Urbanismo II',3,'anual'),(211,7,'Construcciones III',3,'anual'),(212,7,'Estructuras III',3,'anual'),(213,7,'Disenio Asistido por computadora',3,'anual'),(214,7,'Ingles (optativa)',3,'anual'),(215,7,'Frances (optativa)',3,'anual'),(216,7,'Arquitectura IV',4,'anual'),(217,7,'Ambiente III',4,'anual'),(218,7,'Teoria de la Arquitectura y el Urbanismo III',4,'anual'),(219,7,'Historia de la Arquitectura y el Urbanismo III',4,'anual'),(220,7,'Construcciones IV',4,'anual'),(221,7,'Estructuras IV',4,'anual'),(222,7,'Arquitectura V',5,'primer semestre'),(223,7,'Practica Profesional Asistida',5,'anual'),(224,7,'Urbanismo',5,'primer semestre'),(225,7,'Proyectos Inmobiliarios',5,'primer semestre'),(226,7,'Disenio (optativa)',5,'segundo semestre'),(227,7,'Marketing Para Arquitectos',5,'segundo semestre'),(228,7,'Disenio Urbano',5,'segundo semestre'),(229,7,'Proyecto Final',5,'primer semestre'),(230,8,'Taller de introduccion al disenio 1',1,'primer semestre'),(231,8,'Cultura del dsienio 1',1,'primer semestre'),(232,8,'Dibujo y Expresion Visual 1',1,'primer semestre'),(233,8,'Informatica 1',1,'primer semestre'),(234,8,'Taller de introduccion al disenio 2',1,'segundo semestre'),(235,8,'Cultura del dsienio 2',1,'segundo semestre'),(236,8,'Dibujo y Expresion Visual 2',1,'segundo semestre'),(237,8,'Informatica 2',1,'segundo semestre'),(238,8,'Taller de Disenio integral 1',2,'primer semestre'),(239,8,'Creatividad en el disenio',2,'primer semestre'),(240,8,'Psicologia',2,'primer semestre'),(241,8,'Materializacion 1',2,'primer semestre'),(242,8,'Taller de Disenio integral 2',2,'segundo semestre'),(243,8,'Actuacion Profesional',2,'segundo semestre'),(244,8,'Disenio Regional',2,'segundo semestre'),(245,8,'Materializacion 2',2,'segundo semestre'),(246,8,'Taller de disenio Especial 1',3,'primer semestre'),(247,8,'Actuacion Empresarial',3,'primer semestre'),(248,8,'Opcional Especifica 1',3,'primer semestre'),(249,8,'Semiologia',3,'primer semestre'),(250,8,'Introduccion a la Investigacion',3,'primer semestre'),(251,8,'Taller de Disenio Especial 2',3,'segundo semestre'),(252,8,'Practica Profesional',3,'segundo semestre'),(253,8,'Opcional Especifica 2',3,'segundo semestre'),(254,8,'Presentacion Final',3,'segundo semestre'),(255,8,'Taller de disenio estrategico',4,'primer semestre'),(256,8,'Ergonomia',4,'primer semestre'),(257,8,'Opcional Integral 1',4,'primer semestre'),(258,8,'Teoria General del Disenio',4,'primer semestre'),(259,8,'Estetica de los medios',4,'primer semestre'),(260,8,'Metodologia del disenio',4,'segundo semestre'),(261,8,'Marketing Empresario',4,'segundo semestre'),(262,8,'Opcional Integral 2',4,'segundo semestre'),(263,8,'Opcional Especifica 3',4,'segundo semestre'),(264,8,'Trabajo Final',4,'segundo semestre'),(265,9,'Taller de introduccion al disenio 1',1,'primer semestre'),(266,9,'Cultura del dsienio 1',1,'primer semestre'),(267,9,'Dibujo y Expresion Visual 1',1,'primer semestre'),(268,9,'Informatica 1',1,'primer semestre'),(269,9,'Taller de introduccion al disenio 2',1,'segundo semestre'),(270,9,'Cultura del dsienio 2',1,'segundo semestre'),(271,9,'Dibujo y Expresion Visual 2',1,'segundo semestre'),(272,9,'Informatica 2',1,'segundo semestre'),(273,9,'Taller de Disenio integral 1',2,'primer semestre'),(274,9,'Creatividad en el disenio',2,'primer semestre'),(275,9,'Psicologia',2,'primer semestre'),(276,9,'Materializacion 1',2,'primer semestre'),(277,9,'Taller de Disenio integral 2',2,'segundo semestre'),(278,9,'Actuacion Profesional',2,'segundo semestre'),(279,9,'Disenio Regional',2,'segundo semestre'),(280,9,'Materializacion 2',2,'segundo semestre'),(281,9,'Taller de disenio Especial 1',3,'primer semestre'),(282,9,'Actuacion Empresarial',3,'primer semestre'),(283,9,'Opcional Especifica 1',3,'primer semestre'),(284,9,'Semiologia',3,'primer semestre'),(285,9,'Introduccion a la Investigacion',3,'primer semestre'),(286,9,'Taller de Disenio Especial 2',3,'segundo semestre'),(287,9,'Practica Profesional',3,'segundo semestre'),(288,9,'Opcional Especifica 2',3,'segundo semestre'),(289,9,'Presentacion Final',3,'segundo semestre'),(290,9,'Taller de disenio estrategico',4,'primer semestre'),(291,9,'Ergonomia',4,'primer semestre'),(292,9,'Opcional Integral 1',4,'primer semestre'),(293,9,'Teoria General del Disenio',4,'primer semestre'),(294,9,'Estetica de los medios',4,'primer semestre'),(295,9,'Metodologia del disenio',4,'segundo semestre'),(296,9,'Marketing Empresario',4,'segundo semestre'),(297,9,'Opcional Integral 2',4,'segundo semestre'),(298,9,'Opcional Especifica 3',4,'segundo semestre'),(299,9,'Trabajo Final',4,'segundo semestre'),(300,11,'Idioma 1 (Ingles Basico)',1,'anual'),(301,11,'Corretaje 1 (Contexto Ocupacional)',1,'anual'),(302,11,'Derecho 1(Propedeutica Juridica)',1,'anual'),(303,11,'Disenio 1 (Logistica Disciplinar)',1,'anual'),(304,11,'Inmobiliario 1 (Valoracion Edilicia)',1,'anual'),(305,11,'Comunicacion 1 (Psicologia Social Basica)',1,'anual'),(306,11,'Marketing 1 (Posicionamiento)',1,'anual'),(307,11,'Valuacion 1 (Tecnicas Operacionales)',1,'anual'),(308,11,'Practica Integrada',1,'anual'),(309,11,'Comunicacion 2 (Psicologia Social Aplicada)',2,'anual'),(310,11,'Corretaje 2 (Gestion de Negocios)',2,'anual'),(311,11,'Derecho 2 (Logistica Juridica)',2,'anual'),(312,11,'Disenio 2 (Intermediacion)',2,'anual'),(313,11,'Idioma 2 (Ingles Aplicado)',2,'anual'),(314,11,'Markenting 2 (Riesgos Inmobiliarios)',2,'anual'),(315,11,'Valuacion 2 (Tecnicas Procesales)',2,'anual'),(316,11,'Practica Integrada (j)',2,'anual'),(317,11,'Inmobiliario 2 (Desarrollo Urbano)',2,'anual'),(318,11,'Pratica Ocupacional',3,'primer semestre'),(319,11,'Practica Integrada (f)',3,'primer semestre'),(320,12,'Comunicacion 1 (Psicologia Social Basica)',1,'anual'),(321,12,'Derecho 1 (Propedeutica Juridica)',1,'anual'),(322,12,'Disenio 1 (Valoracion Patrimonial)',1,'anual'),(323,12,'Gestion 1 (Contexto Ocupacional)',1,'anual'),(324,12,'Idioma 1 (Ingles Basico)',1,'anual'),(325,12,'Marketing 1 (Posicionamiento)',1,'anual'),(326,12,'Subasta 1 (Logistica Disciplinar)',1,'anual'),(327,12,'Valuacion 1 (Tecnicas Operacionales)',1,'anual'),(328,12,'Comunicacion 2 (Psicologia Social Aplicada)',2,'anual'),(329,12,'Derecho 2 (Logistica Juridica)',2,'anual'),(330,12,'Disenio 2 (Actuacion Creativa)',2,'anual'),(331,12,'Gestion 2 (Contexto Social)',2,'anual'),(332,12,'Idioma 1 (Ingles Aplicado)',2,'anual'),(333,12,'Marketing 1 (Riesgos Comerciales)',2,'anual'),(334,12,'Subasta 1 (Mercado Regional)',2,'anual'),(335,12,'Valuacion 1 (Tecnicas Procesales)',2,'anual'),(336,12,'Comunicacion 3 (Oratoria)',3,'primer semestre'),(337,12,'Derecho 3 (Porcesal)',3,'primer semestre'),(338,12,'Disenio 3 (Organizacion)',3,'primer semestre'),(339,12,'Gestion 3 (Juridica)',3,'primer semestre'),(340,12,'Marketing 3 (Ramate)',3,'primer semestre'),(341,12,'Practicas (Examen de Graduacion)',3,'primer semestre'),(342,13,'Analisis Matematico',1,'anual'),(343,13,'Algebra y Geometria Analitica',1,'anual'),(344,13,'Matematica Discreta',1,'anual'),(345,13,'Sistemas y Organizaciones',1,'anual'),(346,13,'Algoritmo y Estructuras de Datos',1,'anual'),(347,13,'Arquitectura de Computadoras',1,'anual'),(348,13,'Fisica I',1,'anual'),(349,13,'Ingles I',1,'anual'),(350,13,'Quimica',2,'anual'),(351,13,'Analisis Matematico II',2,'anual'),(352,13,'Fisica II',2,'anual'),(353,13,'Analisis de Sistemas',2,'anual'),(354,13,'Sintaxis y Semantica de los Lenguajes',2,'anual'),(355,13,'Paradigmas de Programacion',2,'anual'),(356,13,'Sistemas Operativos',2,'anual'),(357,13,'Sistemas de Representacion',2,'anual'),(358,13,'Probabilidades y Estadisticas',3,'anual'),(359,13,'Disenio de Sistemas',3,'anual'),(360,13,'Comunicaciones',3,'anual'),(361,13,'Matematica Superior',3,'anual'),(362,13,'Gestion de Datos',3,'anual'),(363,13,'Ingenieria y Sociedad',3,'anual'),(364,13,'Economia',3,'anual'),(365,13,'Ingles II',3,'anual'),(366,13,'Redes de Informacion',4,'anual'),(367,13,'Administracion de Recursos',4,'anual'),(368,13,'Investigacion Operativa',4,'anual'),(369,13,'Simulacion',4,'anual'),(370,13,'Ingenieria de Software',4,'anual'),(371,13,'Teoria de Control',4,'anual'),(372,13,'Legislacion',4,'anual'),(373,13,'Proyecto Final',5,'anual'),(374,13,'Inteligencia Artificial',5,'anual'),(375,13,'Administracion GerencialSistemas de Gestion',5,'anual'),(376,14,'Analisis Matematico I',1,'anual'),(377,14,'Quimica General',1,'anual'),(378,14,'Sistemas de Representacion',1,'anual'),(379,14,'Informatica I',1,'anual'),(380,14,'Pensamiento Sistemico',1,'anual'),(381,14,'Fisica I',1,'anual'),(382,14,'Algebra y Geometria Analitica',1,'anual'),(383,14,'Ingenieria y Sociedad',1,'anual'),(384,14,'Analisis Matematico II',2,'anual'),(385,14,'Administracion General (Integradora)',2,'anual'),(386,14,'Probabilidad y Estadistica',2,'anual'),(387,14,'Ciencia de los Materiales',2,'anual'),(388,14,'Fisica II',2,'anual'),(389,14,'Economia General',2,'anual'),(390,14,'Informatica II',2,'anual'),(391,14,'Ingles I',2,'anual'),(392,14,'Estudio del Trabajo (Integradora)',3,'anual'),(393,14,'Comercializacion',3,'anual'),(394,14,'Termodinamica y Maquinas Termicas',3,'anual'),(395,14,'Estatica y Resistencia de Materiales',3,'anual'),(396,14,'Mecanica de los Fluidos',3,'anual'),(397,14,'Economia de la Empresa',3,'anual'),(398,14,'Electrotecnia y Maquinas Electricas',3,'anual'),(399,14,'Investigacion Operativa',4,'anual'),(400,14,'Procesos Industriales',4,'anual'),(401,14,'Mecanica y Mecanismos',4,'anual'),(402,14,'Evaluacion de Proyectos (Integradora)',4,'anual'),(403,14,'Planificacion y Control de la Produccion',4,'anual'),(404,14,'Disenio de Producto',4,'anual'),(405,14,'Ingles II',4,'anual'),(406,14,'Instalaciones',4,'anual'),(407,14,'Mantenimiento',5,'anual'),(408,14,'Manejo de Materiales y Distribucion de Plantas',5,'anual'),(409,14,'Comercio Exterior',5,'anual'),(410,14,'Relaciones Industriales',5,'anual'),(411,14,'Proyecto Final (Integradora)',5,'anual'),(412,14,'Ingenieria en Calidad',5,'anual'),(413,14,'Control de Gestion',5,'anual'),(414,14,'Practica Supervisada',5,'anual'),(415,15,'Informatica I (Int)',1,'anual'),(416,15,'Algebra y Geometria Analitica',1,'anual'),(417,15,'Analisis Matematico I',1,'anual'),(418,15,'Ingenieria y Sociedad',1,'anual'),(419,15,'Analisis Matematico II',1,'anual'),(420,15,'Fisica I',1,'anual'),(421,15,'Sistemas de Representacion',1,'anual'),(422,15,'Informatica II',2,'anual'),(423,15,'Analisis de SeÃ±ales y Sistemas',2,'anual'),(424,15,'Quimica General',2,'anual'),(425,15,'Fisica II',2,'anual'),(426,15,'Probabilidad y Estadistica',2,'anual'),(427,15,'Fisica Electronica',2,'anual'),(428,15,'Ingles I',2,'anual'),(429,15,'Teoria de los Circuitos I',3,'anual'),(430,15,'Tecnicas Digitales I',3,'anual'),(431,15,'Dispositivos Electronicos',3,'anual'),(432,15,'Legislacion',3,'anual'),(433,15,'Electronica Aplicada',3,'anual'),(434,15,'Medios de Enlace',3,'anual'),(435,15,'Ingles II',3,'anual'),(436,15,'Tecnicas Digitales II',4,'anual'),(437,15,'Medidas Electronicas I',4,'anual'),(438,15,'Teoria de los Circuitos II',4,'anual'),(439,15,'Maquinas e Instalaciones Electricas',4,'anual'),(440,15,'Sistemas de Comunicaciones',4,'anual'),(441,15,'Electronica Aplicada II',4,'anual'),(442,15,'Tecnicas Digitales III',5,'anual'),(443,15,'Medidas Electronicas II',5,'anual'),(444,15,'Sistemas de Control',5,'anual'),(445,15,'Electronica Aplicada III',5,'anual'),(446,15,'Tecnologia Electronica',5,'anual'),(447,15,'Electronica de Potencia',5,'anual'),(448,15,'Organizacion Industrial',5,'anual'),(449,15,'Economia',6,'anual'),(450,15,'Proyecto Final',6,'anual');
/*!40000 ALTER TABLE `materias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nombramiento_docente`
--

DROP TABLE IF EXISTS `nombramiento_docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nombramiento_docente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_persona` int NOT NULL,
  `id_materia` int NOT NULL,
  `id_sueldo` int NOT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_persona` (`id_persona`),
  KEY `id_materia` (`id_materia`),
  KEY `id_sueldo` (`id_sueldo`),
  CONSTRAINT `nombramiento_docente_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`dni`),
  CONSTRAINT `nombramiento_docente_ibfk_2` FOREIGN KEY (`id_materia`) REFERENCES `materias` (`id`),
  CONSTRAINT `nombramiento_docente_ibfk_3` FOREIGN KEY (`id_sueldo`) REFERENCES `sueldo_docente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nombramiento_docente`
--

LOCK TABLES `nombramiento_docente` WRITE;
/*!40000 ALTER TABLE `nombramiento_docente` DISABLE KEYS */;
INSERT INTO `nombramiento_docente` VALUES (1,32500594,2,3,1),(2,29581911,1,10,1),(3,94308151,4,11,1),(4,94308151,5,1,1),(5,39175096,6,4,1),(6,39738049,3,7,1),(7,38731487,203,11,1),(8,39546271,198,3,1),(9,39546271,194,4,1);
/*!40000 ALTER TABLE `nombramiento_docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `oferta_academica`
--

DROP TABLE IF EXISTS `oferta_academica`;
/*!50001 DROP VIEW IF EXISTS `oferta_academica`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `oferta_academica` AS SELECT 
 1 AS `carrera`,
 1 AS `facultad`,
 1 AS `grado`,
 1 AS `duracion`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personas` (
  `dni` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `domicilio` varchar(50) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `fecha_de_nacimiento` date NOT NULL,
  PRIMARY KEY (`dni`),
  UNIQUE KEY `dni` (`dni`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO `personas` VALUES (21407119,'Veronica Elizabeth','CASTILLO','vero.e.castillo@gmail.com','7174 Center Way','2464583933','2000-03-17'),(29581911,'Gustavo Eduardo','MONTES','gemontes.insp@gmail.com','7 Autumn Leaf Pass','743857804','2005-08-07'),(30280581,'Luciana Ruth','ESPAMER','luespamer@gmail.com','7 Emmet Center','1535259924','2003-05-28'),(32071134,'Flavio','MORIENA','flavio_moriena@hotmail.com','41093 Prairie Rose Crossing','2595632241','2004-05-10'),(32500594,'Mirna Analia','CESARATTO','mirnacesaratto@hotmail.com','6 Park Meadow Junction','585486999','2003-02-24'),(32933469,'Lucia Belen','GIROTTO','lugirotto24@gmail.com','8 Stuart Alley','1154233994','1999-12-30'),(34574318,'Catalina','CORANTI','c.coranti@alumno.um.edu.ar','64 Declaration Park','1134552398','2005-10-10'),(34663139,'Maria Fernanda','PACHECO MARMOL','fer_07pacheco@outlook.com','6 Haas Circle','1846095004','2005-12-19'),(34763226,'Erika Elizabeth','GIL','hikkaa43@gmail.com','15056 Bonner Place','285843259','2000-05-27'),(35145692,'Martin','Gigena Curchod',' magc13@hotmail.com',' Antonio Ovides 4774',' 3585074933','1980-09-13'),(35218322,'Yamila Ivon','FERNANDEZ','yamiivon90@gmail.com','0560 Loftsgordon Street','1696637204','2002-07-03'),(35672637,'Ayelen Tamara','CHANADAY','a.chanaday@alumno.um.edu.ar','75675 Goodland Alley','3396991107','2000-07-11'),(36354265,'Maria del Rosario','DANIELE','rodaniele92@gmail.com','1333 Hudson Trail','2084038386','2005-01-03'),(36417145,'Cristian Alan','MONACO GHAZOUL','alanmonaco43@gmail.com','0 Debs Terrace','3383490894','2001-12-08'),(36425534,'Martin','LARROSA','mrtnlarrosa@gmail.com','2 Dixon Road','2622354572','2002-08-13'),(36494621,'Lisandro','FREILE','l.freile@alumno.um.edu.ar','5 Meadow Valley Junction','3491330879','2002-01-25'),(36587004,'Micaela del Milagro','OCHOA','micaelaochoa13@gmail.com','911 Walton Junction','761825734','2002-09-03'),(36855619,'Belen','GRIBAUDO','b.gribaudo@alumno.um.edu.ar','453 Dayton Way','1782468637','2001-12-28'),(37126588,'Diego Martin','GONZALEZ','d.gonzalez@alumno.um.edu.ar','5636 Veith Avenue','601840506','1999-03-13'),(37166612,'Baltazar Ezequiel','ESCUDERO','tibalescudero@gmail.com','2 Tony Avenue','1651832351','1999-04-15'),(37488636,'Sabina Rocio','LEONE','s.leone@alumno.um.edu.ar','8482 Hauk Road','2361131465','2000-03-01'),(37489849,'Valentino','COSSA FERNANDEZ','valencossa@hotmail.com','975 Nova Alley','3266514764','2003-07-09'),(37489933,'Ailen Yanil','LOPEZ','ailen.lz@hotmail.com','2284 Gateway Center','2037365083','2005-07-08'),(37490041,'Rodrigo David','MARQUEZ','rodrimarquez137@gmail.com','30618 Warner Alley','1826666197','2003-06-08'),(37631848,'Tamara Yohana','GIUSTI','t.giusti@alumno.um.edu.ar','393 Luster Circle','2366491790','2001-08-09'),(37640259,'Guillermina','MINI','g.mini@alumno.um.edu.ar','485 Manufacturers Way','968984504','2005-10-21'),(37826133,'Daniela Soledad','JUAREZ','juarezsoledadd@gmail.com','5 Grim Lane','2371361584','2004-11-15'),(37875684,'Gabriel Nicolas','LUCERO GUTIERRES','gabriel_lucero-94@hotmail.com','9364 Canary Lane','749058029','2004-04-16'),(38017916,'Mauricio Raul','MERSE','m.merse@alumno.um.edu.ar','500 Manufacturers Road','3474587066','2002-07-12'),(38018102,'Sofia','CUCCO','sofi_pispi@hotmail.com','52 Melby Crossing','1532641161','2000-12-30'),(38018636,'Maria Antonella','LEPORI','m.lepori@alumno.um.edu.ar','5889 Arizona Street','298901359','2000-12-18'),(38018773,'Camila','FELICEVICH','camifelicevich2@gmail.com','42456 Veith Plaza','3455782461','2001-07-25'),(38109542,'Ana Ayelen','GODINO','a.godino@alumno.um.edu.ar','81 Beilfuss Way','1373295153','2002-12-25'),(38251351,'Araceli Anahi­','LOPEZ','aralopez328@gmail.com','698 Service Park','255887389','2005-06-20'),(38436224,'Magali','FERNANDEZ','ma.fernandez@alumno.um.edu.ar','1178 Doe Crossing Point','2688060959','2000-02-06'),(38730859,'Mariana','MARINELLI','mmarinelli717@gmail.com','06 Lakewood Gardens Parkway','755256278','2003-05-20'),(38731255,'Maria Florencia','GIAVENO','florgiaveno@hotmail.com','218 Comanche Alley','2037589723','2005-09-17'),(38731487,'Lucia Marcela','MENEGHELLO','l.meneghello@alumno.um.edu.ar','17372 Oakridge Court','1896476909','1999-02-13'),(38731632,'Micaela Milagros','OCHOA','mili_711@hotmail.com','41761 Katie Hill','1884676016','1999-06-23'),(38883540,'Carolina','FURFARI','c.furfari@alumno.um.edu.ar','3447 Sutteridge Pass','2696338779','2003-07-26'),(39172939,'Lucia Raquel','CASTRO','lr.castro@alumno.um.edu.ar','516 East Way','203949793','2004-12-10'),(39175096,'Santiago Manuel','OVIEDO','s.oviedo@alumno.um.edu.ar','5 Village Crossing','3142031539','2000-11-05'),(39423175,'Marti­n Javier','CHAZARRETA','m.chazarreta@alumno.um.edu.ar','70 Fisk Place','2327287462','2000-01-09'),(39475125,'Ignacio Nicolas','MATTOS','i.mattos@alumno.um.edu.ar','376 2nd Parkway','2346394307','2003-08-10'),(39543352,'Maria Emilia','DARICO','m.darico@alumno.um.edu.ar','038 Rieder Street','1182694008','2003-02-07'),(39546128,'Rosario','GONZALEZ','ro.gonzalez@alumno.um.edu.ar','25 American Ash Plaza','2673591338','2003-02-11'),(39546153,'Paula Agustina','GUTIERREZ','pauli.gutierrez96@gmail.com','4633 7th Park','2007575910','2005-11-11'),(39546271,'Maria Lourdes','GENGHINI','lulugenghini@gmail.com','60 Sommers Park','3323022012','1999-02-13'),(39610825,'Joaqui­n Luis','FELICI','j.feliu@alumno.um.edu.ar','9124 Ludington Crossing','689064177','2005-08-21'),(39611444,'Candela Ines','FICCO','c.ficco@alumno.um.edu.ar','4026 Esker Court','2785072033','1999-05-31'),(39738049,'Gonzalo Manuel','CARRANZA','gonzaacarranza@gmail.com','68 Continental Crossing','2890135600','2004-01-05'),(39842030,'Rocio Martina','GUTIERREZ','rm.gutierrez@alumno.um.edu.ar','753 Tennessee Center','2778641361','2001-10-05'),(39897428,'Sabrina Belen','OLIVERA','s.olivera@alumno.um.edu.ar','0 Mayfield Lane','377413205','2003-07-11'),(39967900,'Gisella Belen','ORTOLAN','giseortolan06@hotmail.com','8 Fairview Drive','974727444','2000-07-17'),(39967912,'Brunella Soledad','ECCHER','b.eccher@alumno.um.edu.ar','9036 Blackbird Plaza','2959698125','2002-09-18'),(39967940,'Aldana Carolina','CAPOULAT','a.capoulat@alumno.um.edu.ar','3 Anthes Terrace','2715069160','2004-06-23'),(39970268,'Mariel Maria','COCCO','maru_cocco97@hotmail.com','95 Homewood Avenue','1278822826','1999-05-12'),(40030410,'Nahuel Andres','GAUDE','n.gaude@alumno.um.edu.ar','9461 Mitchell Plaza','2137111866','2001-06-23'),(40296290,'Fermin','GALLO','f.gallo@alumno.um.edu.ar','02151 Chive Hill','1054667409','2000-04-01'),(40348571,'Francisca Marta','GALLUCCI','f.gallucci@alumno.um.edu.ar','13 Waxwing Junction','2377467325','2000-06-26'),(40416285,'Ana Paula','CARRIZO','carrizoanapaula@hotmail.com','8 Swallow Alley','1794917350','2004-09-01'),(40416495,'Agustina','GIORGIS','a.giorgis@alumno.um.edu.ar','40562 Moland Point','2658832216','2001-05-19'),(40417940,'Julieta','MELLANO','j.mellano@alumno.um.edu.ar','97 Hagan Crossing','2367193377','2001-02-17'),(40418184,'Maria Milagros','LADU','m.ladu@alumno.um.edu.ar','44152 Rutledge Crossing','451085401','2004-12-29'),(40418198,'Guadalupe','MENTUCCI','g.mentucci@alumno.um.edu.ar','9116 Hayes Terrace','2490126164','2003-12-19'),(40456738,'Melina','CORSI','m.corsi@alumno.um.edu.ar','9 Dahle Park','680241248','1999-06-05'),(40503573,'Martin Gabriel','CENCI','m.cenci@alumno.um.edu.ar','57 Porter Road','1912877877','2004-02-11'),(40503946,'Constanza','MENEZ','constanzamenez@gmail.com','326 Dwight Circle','1508258574','2004-09-28'),(40504259,'Maria Emilia','MARCLE','m.marcle@alumno.um.edu.ar','0 West Trail','1073979859','2002-03-04'),(40573766,'Maria Laura','GASTALDI','m.gastaldi@alumno.um.edu.ar','310 Westridge Trail','3267744552','2002-10-16'),(40678462,'Daniel','LISTTE','danilistte@gmail.com','94 Coleman Lane','2185683210','2001-05-26'),(40772517,'Rocio Candela','PALACIO','r.palacio@alumno.um.edu.ar','800 Derek Plaza','2081621974','2001-08-07'),(40772864,'Santiago','CUGGINO','santicuggino@gmail.com','094 Rutledge Parkway','336420436','2001-02-01'),(40772946,'Jazmin','MUSSI','j.mussi@alumno.um.edu.ar','202 Lotheville Pass','2696802664','2004-02-10'),(40816319,'Vanina Micaela','MORNACCO','v.mornacco@alumno.um.edu.ar','00 Declaration Hill','3222716190','2003-06-10'),(40928079,'Federico Gabriel','MARTINEZ','fg.martinez@alumno.um.edu.ar','61236 East Plaza','3238785366','2004-04-06'),(40928291,'Giuliana Lourdes','OYOLA','giulianaoyola48@gmail.com','634 Eastlawn Plaza','306582094','1999-12-14'),(41018659,'Lucia','COLOMBANO','l.colombano@alumno.um.edu.ar','60643 Nevada Parkway','1946787955','1999-06-08'),(41088178,'Emmanuel','DEBERNARDI CARBO','e.debernardi@alumno.um.edu.ar','3 Milwaukee Way','801215369','2004-06-09'),(41116768,'Candela Solange','CARRANZA','c.carranza@alumno.um.edu.ar','0 Butternut Street','2688443855','1999-03-30'),(41204282,'Milena del Corazon de Jesus','MALCOLM ROQUIER','m.malcolm@alumno.um.edu.ar','7421 Springview Point','3480978309','2002-12-26'),(41225527,'Martin Ezequiel','NUÑEZ','martin1608.mn@gmail.com','260 Northfield Hill','1845920218','1999-07-07'),(41322860,'Nahuel','MERCAU','n.mercau@alumno.um.edu.ar','8507 Coolidge Alley','1494582077','1999-07-19'),(41370109,'Jonatan Ezequiel','CEJAS','jonatancejas2020@hotmail.com','05682 Memorial Center','2867439675','2003-12-22'),(41377668,'Agustina Elisa','FERRERO VILLAR','a.ferrero@alumno.um.edu.ar','682 Waubesa Avenue','2904013481','2001-04-27'),(41377774,'Lucia','OSTA PEREYRA','l.osta@alumno.um.edu.ar','12329 Banding Street','2948990909','1999-01-27'),(41377834,'Milagros','ABBATE DAGA CHAVES','m.abbatedaga@um.edu.ar','05 Pierstorff Street','1352445435','2003-07-20'),(41378892,'Mariana','CARRICABURU','m.carricaburu@alumno.um.edu.ar','64 Hayes Way','1354373984','2003-12-28'),(41440475,'Valentin','DALVANO OLDANO','cotiyjuana@live.com.ar','3233 Summerview Lane','781887754','2000-05-24'),(41441430,'Lautaro','DOMINGUEZ','la0.dominguez@alumno.um.edu.ar','737 Eggendart Parkway','504573562','2005-11-20'),(41441438,'Matias Ezequiel','LEYRIA','m.leyria@alumno.um.edu.ar','54955 Merry Terrace','172810347','2005-11-12'),(41441526,'Maria Celeste','MARE','celestemare08@gmail.com','877 Onsgard Way','3467029713','2000-11-13'),(41441564,'Lucia','MARQUES','luuli.marques@hotmail.com','4 Judy Circle','1612467602','2003-06-19'),(41441613,'Valentina','CESARETTI','valeecesaretti@gmail.com','6 Hazelcrest Avenue','334617272','2000-06-24'),(41483073,'Mauricio Matias','MEDINA','mm.medina@alumno.um.edu.ar','6133 Melvin Hill','649128184','2003-11-08'),(41485109,'Maria Julia','GIRAUDO','mariajuliagiraudo8@gmail.com','6915 Annamark Parkway','3352768454','2004-01-22'),(41593219,'Gustavo Ezequiel','MALDONADO','gustavomaldonado026@gmail.com','2474 Moland Junction','3333731075','2001-01-22'),(41594877,'Valentina','MARZIALI','v.marziali@alumno.um.edu.ar','0687 Northwestern Crossing','497687920','2004-08-26'),(41595227,'Guillermina','HERNANDEZ','gu.hernandez@alumno.um.edu.ar','3630 Carpenter Lane','2377277786','2003-10-02'),(41595241,'Camila Guadalupe','CORNEJO','c.cornejo@alumno.um.edu.ar','924 High Crossing Place','2590493569','2003-07-07'),(41827052,'Juan Cruz','OLIVEDA BERNAOLA','jcoliveda@gmail.com','9 Southridge Parkway','1602463641','2001-09-17'),(41887763,'Irina Sofia','FUNES','Irifunes41@gmail.com','009 Nevada Place','567461214','2004-01-08'),(41887971,'Martin','GENTTA','m.gentta@alumno.um.edu.ar','59987 Moland Crossing','768745394','2002-06-11'),(41920121,'Catalina','EVARISTTI','c.evaristti@alumno.um.edu.ar','71 Rowland Plaza','937565762','2003-04-23'),(41964731,'Lourdes','CUELLO','lo.cuello@alumno.um.edu.ar','9 Amoth Drive','2953717914','2005-11-21'),(41965140,'Jacqueline Sol','GUZMAN','jacsolguzman@gmail.com','36707 Johnson Hill','685539019','1999-07-22'),(41979036,'Rocio Dominga Camila','FRAGATA','fragata.rocio9933@gmail.com','8371 Raven Trail','3506145434','2002-05-04'),(42010128,'Claudia Noelia','ESCUDERO','c.escudero@alumno.um.edu.ar','58308 Buhler Lane','1172061850','2005-06-17'),(42048585,'Juan Roman','MORON','romanmoron98@gmail.com','480 Sutteridge Lane','1587994835','2001-08-20'),(42048636,'Magdalena','FERNANDEZ MAGNASCO','mam.fernandez@alumno.um.edu.ar','1 Quincy Point','3232554136','1999-05-24'),(42048649,'Paula Sofia','MORENO','ps.moreno@alumno.um.edu.ar','97692 Vidon Way','1340130799','2004-12-05'),(42048650,'Anahi­','IRENNE','nanirenne@yahoo.com.ar','72 Heath Road','3577670296','2001-05-26'),(42048730,'Nabila','DARZE','n.darze@alumno.um.edu.ar','62 Mallory Street','1366968905','1999-11-19'),(42108939,'Agustina','LENARDUZZI','a.lenarduzzi@alumno.um.edu.ar','8824 Kedzie Hill','1289343324','2003-06-04'),(42109026,'Manuela','GENTILE','m.gentile@alumno.um.edu.ar','9262 1st Alley','3471612855','2004-01-15'),(42161620,'Bautista','MORALES','moralesbauti2000@gmail.com','3762 Holy Cross Junction','822581764','2001-09-09'),(42161641,'Lucia','FERNANDEZ MAINARDI','luciamainardi05@gmail.com','02357 East Park','657420564','2005-03-05'),(42161681,'Agustina Mailen','JOFRE','a.jofre@alumno.um.edu.ar','0361 Becker Pass','1906823703','2002-07-18'),(42161711,'Celeste Anahi','JAIME','celeejaime5@gmail.com','8 Farmco Circle','1667047556','2005-09-29'),(42161804,'Nicolas Ezequiel','GALLARDO','nico.gallar99@gmail.com','109 Carberry Hill','628294371','2003-09-20'),(42162232,'Martina','CARBONARI MARIONI','martinacarbonari2000@gmail.com','4770 Pearson Plaza','3456258881','2002-08-25'),(42184056,'Valentina','IRRAZABAL','v.irrazabal@alumno.um.edu.ar','9993 Bowman Road','2763427259','2001-09-24'),(42184686,'Julieta','CASTAGNO','j.castagno@alumno.um.edu.ar','34796 Bluestem Drive','1736890123','2002-08-11'),(42185350,'Valentin Augusto','GIRALDA NAVARRO','valegira5@gmail.com','0 Old Gate Road','1143291739','2000-07-11'),(42382388,'Delfina','GUEVARA TOSELLI','dt.guevara@alumno.um.edu.ar','36 Gateway Road','810427508','2005-05-12'),(42386065,'Matias Ezequiel','MUÑOZ','mae.munoz@alumno.um.edu.ar','11 Victoria Hill','579142342','2001-05-06'),(42386099,'Valentina','FERRARO','v.ferraro@alumno.um.edu.ar','7199 Starling Avenue','3189024733','2005-11-05'),(42386165,'Rocio Milagros','KUNZ','r.kunz@alumno.um.edu.ar','9209 Dwight Alley','1735090158','2000-03-25'),(42438658,'Reggina','MOLAIOLI','r.molaioli@alumno.um.edu.ar','21235 Mayer Pass','1497681889','2005-08-22'),(42441629,'Lucila','GONDRA','l.gondra@alumno.um.edu.ar','43 Pennsylvania Avenue','1176835557','2001-11-04'),(42442214,'Maria del Cielo','CUMIN','m.cumin@alumno.um.edu.ar','2492 Pepper Wood Alley','3033421467','2003-10-02'),(42507136,'Facundo Ezequiel','MUCHUT','f.muchut@alumno.um.edu.ar','6576 Fremont Place','772252747','2004-02-05'),(42513279,'Agustina Silvana','MINOD','a.minod@alumno.um.edu.ar','772 Utah Pass','1546993121','2001-08-29'),(42513544,'Federico Ezequiel','GUIÑAZU','f.guinazu@alumno.um.edu.ar','3 Hagan Hill','2785318805','1999-02-11'),(42638086,'Candela Milagros','DESPLATS VILLADA','c.desplats@alumno.um.edu.ar','77 Darwin Junction','853961389','2001-02-27'),(42638288,'Martina','MALNIS','martinamal22@gmail.com','70 Lien Parkway','507128373','2005-08-30'),(42638322,'Sergio Ignacio','ETCHEPARE AIRAS','sergioairas@gmail.com','093 Oneill Alley','315247592','1999-09-02'),(42694513,'Maria del Rosario','LUCERO PICHETTI','roopichetti@gmail.com','812 Dottie Court','1867796894','2003-02-24'),(42695130,'Erica Estefania','CARRIZO','carrizoerica92@gmail.com','2371 Jenifer Place','1301093250','2004-01-08'),(42695169,'Francisco','GHIGLIONE BERTORELLO','f.ghiglione@alumno.um.edu.ar','1 Main Terrace','3103038639','2005-10-21'),(42695218,'Sofia Sol','MENEGHELLO BARBORA','sofimeneghello.81@gmail.com','40 Porter Road','3182507315','2001-11-13'),(42696416,'Juan Ignacio','CHIRINO MOLINA','juanichirino4@gmail.com','05 Hoard Parkway','3320047001','2000-02-18'),(42710878,'Juliana Nazarena','HERRERA','jn.herrera@alumno.um.edu.ar','5 Riverside Circle','1569490968','2004-11-01'),(42718080,'Enzo Mario','CICCIO','enzociccio1@hotmail.com','47910 Coleman Road','2172828347','2000-07-26'),(42786231,'Lucia','ORDOÑEZ','l.ordonez@alumno.um.edu.ar','59552 Lillian Road','1423843896','2003-09-12'),(42786295,'Pamela','DI STASI','p.distasi@alumno.um.edu.ar','32049 Arapahoe Point','401207972','2002-10-06'),(42788127,'Francisco Ernesto','PAGLIARICCI','pagliafran@gmail.com','24830 Sachs Court','2341950279','2002-03-28'),(42788146,'Milagros','JAOAND','gjaoand@hotmail.com','8 Kipling Center','2121532734','2003-04-02'),(42788153,'Natalia','FURLAN','n.furlan@alumno.um.edu.ar','5 Buhler Crossing','1901044372','2004-04-22'),(42859098,'Vanesa','GRIBAUDO','v.gribaudo@alumno.um.edu.ar','7683 Forest Point','1182910446','2003-06-18'),(42859268,'Guadalupe','LEGUIZA','g.leguiza@alumno.um.edu.ar','9840 Walton Hill','3090967392','2000-09-03'),(42861476,'Bianca Sofia','DELLA VECCHIA','b.dellavecchia@alumno.um.edu.ar','67249 Redwing Trail','2621288035','2004-02-18'),(42891418,'Tomas Benjamin','MORENO','tomimoreno74@gmail.com','5 Nova Alley','565819278','2004-07-30'),(42891874,'Milagros Selene','HEREDIA NAS','milagrosherdia9@gmail.com','80634 Burning Wood Junction','2299807776','2002-04-01'),(42892377,'Ludmila','FERNANDEZ','ludmiifernandez33@gmail.com','0925 Moose Road','1862271422','2000-08-19'),(42892736,'Lourdes Macarena','MUSSINI','l.mussini@alumno.um.edu.ar','39133 Anderson Avenue','2288932289','2000-10-05'),(42892822,'Ana Luz','MALUZAN','a.maluzan@alumno.um.edu.ar','4682 Maple Park','1377375366','2000-04-13'),(42892973,'Lucila','CARAGLIO COLINO','colinolucila@gmail.com','18415 Bayside Crossing','2865484209','2002-04-14'),(42981383,'Maicor','ABELLA','maicorrabella_@outlook.com','249 Independence Point','1286379134','2000-04-24'),(42991413,'Maria Candela','GONZALEZ GODOY','mc.gonzalez@alumno.um.edu.ar','901 Hallows Road','579229693','1999-11-12'),(43062594,'Nicolas Agustin','LEDESMA','Nico_Ledesma11@outlook.es','0864 Summit Street','1935581781','2005-02-27'),(43062731,'Michelle','MENARD','michelle.menard333@gmail.com','82 Service Center','357402073','2003-07-11'),(43062800,'Lisandro','LUNA MORAN','lisandrolunamoran@gmail.com','14 Mockingbird Road','1653033061','2003-02-04'),(43131753,'Melina Daniela','MARINO','meli_marino@hotmail.com','072 Hanson Hill','2442640098','2001-07-08'),(43133735,'Valentin','MONGE','v.monge@alumno.um.edu.ar','84 Spohn Court','1771530356','2004-02-08'),(43133737,'Carolina','GIORDANA','c.giordana@alumno.um.edu.ar','5622 Kings Road','505982919','2003-03-11'),(43137947,'Eugenia Ailen','NIEDERHAUSER','euge.nieder1@gmail.com','72465 Comanche Street','2467960620','2001-01-20'),(43187649,'Julieta','CERUTI','cerutijulieta@hotmail.com','350 Sunfield Lane','1570822720','1999-06-23'),(43190017,'Luciano Nahuel','GUTIERREZ','li_lu@live.com','0620 Norway Maple Crossing','1615278127','2003-06-25'),(43190284,'Agustin Tomas','GIACCONE','agustintgiaccone1999@gmail.com','223 Judy Pass','1044843122','2000-03-12'),(43190470,'Paulo Gabriel','CARPINTERO','p.carpintero@alumno.um.edu.ar','44 West Lane','1364361853','2002-03-17'),(43297405,'Salvador','GUERRIERI','guerrierisalvador0@gmail.com','38847 Grim Parkway','823896058','1999-04-12'),(43297461,'Pilar','ERCOLE','p.ercole@alumno.um.edu.ar','19 Fulton Park','915528013','2000-06-16'),(43297493,'Fabio','FLAMENCO','flamencofabio2001@gmail.com','869 Brickson Park Plaza','3265489324','2001-07-07'),(43297562,'Lara','PALACIOS','palacioslara484@gmail.com','58912 Canary Terrace','2992180695','2003-07-20'),(43298559,'Virginia','DEL CANTARE','virginiadelcantare@gmail.com','27449 Kingsford Way','3126733002','2002-05-07'),(43366392,'Valentin Santiago','OLIVIERI DELLA SANTA','v.olivieri@alumno.um.edu.ar','801 Eliot Circle','766321943','2003-04-19'),(43379041,'Sol Malena','LOPEZ','sm.lopez@alumno.um.edu.ar','22371 Dakota Trail','877272969','2005-08-19'),(43410162,'Candela','CASTILLO','ca0.castillo@alumno.um.edu.ar','89 Cambridge Center','1727739365','2005-07-05'),(43410377,'Sofia','GALLIANO','sofiagalliano01@gmail.com','08 Scoville Pass','1249164548','2003-06-22'),(43410383,'Virginia Belen','LUNA','viicolunna@gmail.com','408 Florence Alley','335873924','2005-05-27'),(43410630,'Octavio','DOLSO','octaviodolso1@gmail.com','125 Chive Junction','919572564','2004-11-03'),(43411972,'Adiel Angel','OCHOA','ada.ochoa@alumno.um.edu.ar','92000 Oakridge Junction','812604762','2000-06-08'),(43414033,'Paula Rafaela','PAGANINI','Paularpaganini@gmail.com','7244 Fair Oaks Avenue','2992463600','2004-08-07'),(43474123,'Ivan Saul','MERCADO','tikimerca@gmail.com','6 Lighthouse Bay Avenue','1400412404','2005-06-06'),(43474407,'Maia Agustina','CARAFFA','maiaacaraffa@gmail.com','68 Randy Street','2863521815','2000-09-30'),(43474498,'Maria Victoria','MATTOS','vickymattos0001@gmail.com','92 Dorton Lane','157078498','2001-09-22'),(43475343,'Candela','FERNIGRINI','candufernigrini@hotmail.com','4 Moland Crossing','1313162853','2000-06-22'),(43475480,'Matias','PADULA','matipadula9@gmail.com','18 Ryan Place','1497920008','2003-07-19'),(43475492,'Julieta Luz','FRIAS','julietaluzfrias@gmail.com','1 Bellgrove Pass','2691004076','1999-04-21'),(43475514,'Rocio Belen','FIORETTI','rociofioretti59@gmail.com','55295 Gina Parkway','1201960035','2002-08-27'),(43475532,'Tania Ayelen','FARIAS','fariastania544@gmail.com','15 Pepper Wood Terrace','2621742715','1999-02-18'),(43476845,'Sofia Selena','MACCAGNO GODOY','selenamaccagno@gmail.com','8 Hanson Center','2440802824','2005-09-06'),(43476857,'Ana Paula','MARRA','anapaumarra@gmail.com','936 Heath Drive','2004200326','2002-06-25'),(43476885,'Antonella Belen','DEPETRIZ','antonelladepetriz@gmail.com','923 Ronald Regan Street','149453645','2001-05-02'),(43476940,'Maria Eugenia','LA ROSA','eugedxs@gmail.com','38 Heath Hill','2503038880','1999-06-23'),(43476950,'Agustina','FERNANDEZ','agusfernandez1661@gmail.com','7467 Nova Parkway','560188080','2005-11-05'),(43476982,'Ignacio','GAICH','ignaciogaich@hotmail.com','247 Schlimgen Center','2599931006','2003-11-14'),(43525085,'Valentina Solange','CASTRO','vc089679@gmail.com','5711 Forest Plaza','3155199611','1999-07-11'),(43602256,'Milagros','GAUTERO CASTRO','milogautero@gmail.com','1923 Manufacturers Drive','3198238096','2003-11-17'),(43602299,'Rocio Pilar','FASANO','rociofasano@hotmail.com.ar','7 Novick Street','2798283493','2003-09-13'),(43607081,'Paula','CLAVENZANI','pauliclavenzani26@gmail.com','6572 Anthes Lane','1640458585','2001-06-26'),(43607116,'Agustina','COSTAMAGNA','aguscostamagna@hotmail.com','0629 Scofield Street','3278155232','2003-10-24'),(43607260,'Carola Anahi','GAUDE','cgaude13@gmail.com','0 Troy Center','3189363688','2004-11-09'),(43607276,'Dana','GIGENA','gigenadana@gmail.com','95707 Bobwhite Parkway','2505519030','2004-05-05'),(43607277,'Nestor Martin','GRANERO','nestormartingranero@gmail.com','518 Sachtjen Circle','1746582446','1999-06-17'),(43610931,'Amadeo Ubaldo','MUSSINI','amadeookmussini@gmail.com','81 Knutson Park','247461184','2005-02-26'),(43610936,'Delfina','CROSA','delfinc21@gmail.com','606 Vermont Drive','885351811','2002-10-16'),(43634412,'Iara Candela','FUSTER AYALA','larafuster2015@gmail.com','25210 Burning Wood Way','3334849086','1999-02-18'),(43674173,'Agostina Alejandra','NIDERCHAU','niderchaua@gmail.com','92 Loomis Center','353883651','2005-09-17'),(43674641,'Valentina','MAGALLANES','Valentina.magallanes9@gmail.com','28 Pawling Trail','3214017949','2002-02-07'),(43679058,'Micaela Lorena','CATRILEO','mancuok8@gmail.com','6 New Castle Circle','1348745676','2000-01-11'),(43748908,'Santiago Agustin','MUCHUT','samuchut68@gmail.com','6564 Park Meadow Circle','2707103711','2001-11-25'),(43808130,'Maria Sol','GEYMONAT','solgeymo@gmail.com','07066 Northland Point','3145277966','2000-06-04'),(43808132,'Juan Ignacio','DANERI','pepinoserasca@gmail.com','3674 Warner Way','2471189533','2001-10-11'),(43808254,'Martina','CERIONI','ma.cerioni@alumno.um.edu.ar','299 Clarendon Point','2410699608','2003-09-07'),(43808350,'Agustina Luciana','MONDINO','agustinalucianamondino@gmail.com','9 Nevada Plaza','876099454','1999-02-01'),(43808473,'Axel Adrian','LUNA','axeladrianluna@gmail.com','62283 Continental Junction','2750227176','2005-11-04'),(43808492,'Camila','KLUG','camilaklug7@gmail.com','90 Jana Center','2980032363','2004-07-09'),(43810320,'Agostina Danae','OCHOA CARMONA','agostina.carmona02@gmail.com','24 Transport Point','3289004126','2002-08-24'),(43810517,'Maria Agustina','DUTTO','agusdutto10@gmail.com','15 Amoth Crossing','2898565096','2002-09-24'),(43810580,'Jose David','FERNANDEZ','davidlgk817@gmail.com','7187 Everett Trail','2694045506','2004-12-28'),(43810611,'Agustina Naile','CORIA','agus.coria.ac.ac@gmail.com','83107 Monument Circle','3451059354','1999-08-22'),(43810613,'Magali','OVIEDO','magalii17@icloud.com','0 Northfield Drive','2190780753','2002-01-04'),(43810648,'Jesus Gabriel','CLAVORA','gabrielclavora2@gmail.com','4249 2nd Place','3328774473','2003-10-10'),(43810679,'Matias Nicolas','MARCLE','matiasmarcle@gmail.com','07307 Bay Place','307983892','2003-09-07'),(43810728,'Brisa Camila','MARTINEZ','bm843162@gmail.com','57602 Mockingbird Point','2741884622','2004-10-01'),(43867361,'Gianfranco','MANRIQUE','manrique_gianfranco@hotmail.com','11564 Crest Line Drive','3529348865','2000-07-23'),(43882266,'Ariel Arnaldo','ORTEGA','ortegaariel749@gmail.com','9080 4th Pass','1048385024','2004-12-28'),(43882923,'Ana Luz','DETTONI','analuzdettoni@hotmail.com','67880 Cherokee Hill','2154758841','2001-04-04'),(43883975,'Trinidad','CAUDANA','trinidadcaudana2002@gmail.com','691 3rd Point','1962752673','2005-07-23'),(43884065,'Jeronimo Jesus','MARENGO','jeronimomarengo02@gmail.com','194 Sutherland Road','2927495962','2003-01-16'),(43929568,'Agustina Abigail','OTERO ROCHA','agusrrocha@gmail.com','09381 Center Way','2423549558','2001-09-16'),(43929991,'Jazmin','OLMI DECOBERTI','olmijazmin@gmail.com','53 Bultman Alley','2644062571','2002-06-21'),(44039708,'Karen Ayelen','GARCIA','ka.garcia@alumno.um.edu.ar','57749 Hauk Circle','2686341556','2003-10-12'),(44077149,'Delfina','MARINI','marinidelfina@hotmail.com','43 Weeping Birch Center','2436701176','2004-05-28'),(44077852,'Katerinne','KELLER','katerinnekeller12@gmail.com','9796 Hayes Lane','2720672436','2004-06-24'),(44126900,'Santiago Martin','CILIA','santiagocilia09@gmail.com','917 Mccormick Hill','2146548273','2005-07-09'),(44203001,'Maria Lucia','GIACHERO','lugiacheroo@gmail.com','9467 Dottie Trail','2604085113','2002-04-23'),(44203614,'Evelin Agustina','FARIAS','evelinagustinafarias040502@gmail.com','09 Sunnyside Pass','562280679','2000-03-31'),(44204825,'Nicolas Alejo','LORENZATTI TRUCCO','nicolorenzatti15@gmail.com','364 Southridge Center','1412148317','2002-10-23'),(44245283,'Vanina','FILIPPA','vanifilippa@hotmail.com','17506 Merrick Point','3402027481','2003-11-04'),(44295037,'Paloma Guillermina','PALACIOS','palopalacios394@gmail.com','5279 Cody Court','1337779510','2004-02-27'),(44296778,'Rocio','JAYO URBIZU','jayorocio87@gmail.com','13673 Pawling Pass','414682570','2000-11-11'),(44359366,'Jazmin','COMOGLIO','jazmin_comoglio@hotmail.com','7 Ramsey Drive','1114946264','2002-01-18'),(44360195,'Esteban Raul','LUNA','estebanraulluna@gmail.com','44 Declaration Road','3499201832','2000-11-20'),(44360795,'Lourdes Trinidad','CUESTA','lourdescuesta345@gmail.com','893 Hanover Parkway','839736371','2001-09-02'),(44369575,'Martin Ignacio','COSTILLA','martincostilla2002@gmail.com','64326 Browning Terrace','1717110500','1999-02-19'),(44372464,'Zoe Trinidad','OCAÑA','zoe.190902@gmail.com','07624 Aberg Junction','2279153980','2002-11-29'),(44433262,'Selena Milagros','MORALES','cele.95067@gmail.com','6 Fieldstone Plaza','1756124567','2000-02-25'),(44433298,'Josefina','CHAVERO','josefinachavero0120@gmail.com','6 Duke Street','1536663083','2005-05-09'),(44433390,'Valentina Aylen','PAEZ','valepaez2008@gmail.com','6350 Colorado Avenue','2155280700','2002-03-13'),(44433392,'Rebeca','LUCA','rebecaluca18@gmail.com','3196 Main Point','1338676348','2001-02-14'),(44433396,'Maria Valentina','FERNANDEZ','valenn1914@gmail.com','59037 Anthes Crossing','2603081853','1999-09-29'),(44450156,'Lola','CESPEDES','lolitacespedes2@gmail.com','99 Sheridan Lane','3107189862','2003-08-10'),(44468978,'Gisela Magali','DELISA','magalidelisa444@gmail.com','755 Dennis Park','1554236203','2004-06-02'),(44471645,'Luna Graciela','OVIEDO LUCERO','lunalucer13@gmail.com','45 Canary Trail','986049271','2002-01-19'),(44472305,'Marilina Lucia','GALLO','gallomarilina@gmail.com','004 Elgar Way','3261505799','2002-01-16'),(44549905,'Rocio Zoe','OYOLA','rociooyola9@gmail.com','9 Bluejay Alley','1505270723','2002-12-12'),(44551352,'Magdalena','DIAZ','maguidiiaz@gmail.com','809 Coolidge Place','1951694665','2002-10-25'),(44551356,'Catalina Ayelen','CUELLO','catalinaayelen11@gmail.com','01054 Wayridge Trail','2968538921','2004-12-30'),(44606414,'Maria Paz','GENTTA','marigentta16@gmail.com','33731 Northwestern Circle','874133503','2002-09-19'),(44606603,'Josefina','KOCH','josefinakoch23@gmail.com','0683 Village Green Circle','2345787009','2003-09-12'),(44607180,'Maria Clara','DANIELE','cdaniele795@gmail.com','1770 Florence Street','567145621','2003-12-13'),(44607568,'Cindy Marlene','CENA','cindycena551@gmail.com','27301 Vera Park','3456023322','2001-01-18'),(44608262,'Tiziana Ailen','ISAURRAL','tizianaisaurral18@gmail.com','7 Esch Plaza','1518765152','2001-08-21'),(44608305,'Selene Abigail','JOFRE','seleneabigailjofre@gmail.com','79795 New Castle Way','1574987692','2003-06-28'),(44608318,'Ludmila Sofia','NIETO','ludmilanieto2003@gmail.com','99839 Aberg Plaza','3386809399','1999-01-16'),(44608334,'Agustin Nicolas','GARCIA MALDONADO','agus.gm013@gmail.com','83 Bellgrove Pass','1322516161','2005-04-02'),(44673852,'Valentin Ignacio','GALLARDO','valentingallardo06@gmail.com','43098 Lukken Plaza','1545034527','2003-02-04'),(44694624,'Romina Mafalda','MARTINEZ','martinezromi777@gmail.com','897 Fisk Street','1536871964','1999-02-21'),(44694658,'Rocio','MACHADO','rocio.machado2003@gmail.com','49 Eliot Center','1849241980','2004-08-11'),(44694691,'Luz Selene','GIRAUDO','luzgiraudo0@gmail.com','0 Carey Street','369395630','2000-06-16'),(44721170,'Dalma','OVIEDO','bravista.dalma@gmail.com','08001 Pearson Hill','273506692','2005-10-22'),(44721185,'RocÃ­o Celeste','CASTELLUCCIO','castellucciorocio@gmail.com','88 Ridge Oak Way','3175094048','1999-01-11'),(44740509,'Dana Yoseli','CORTI GUERRERO','yoseeliiguerrero14@gmail.com','02 Dixon Hill','149631689','2004-03-16'),(44775103,'Ailen','IRENNE','lali.irenne@gmail.com','06015 Village Green Circle','632502575','2001-07-22'),(44775134,'Danilo Valentin','LOPEZ','danilovlopez1@gmail.com','61 Derek Lane','3568937536','2004-02-04'),(44791450,'Tomas Augusto','FILIPPA GIANINETTO','tomasfilippa007@gmail.com','033 Melody Pass','2384253206','2001-01-25'),(44813331,'Nahuel Alejandro','CORDOBA','nahuelcordoba08@gmail.com','79 Little Fleur Junction','2082688798','2000-07-13'),(44813807,'Ana Victoria','CHIRINO','victoriachirino03@gmail.com','8 Summer Ridge Terrace','776303975','2003-04-23'),(44827594,'Agustina','DURE','agustdure@hotmail.com','66 Barnett Place','3514329665','2000-11-26'),(44842900,'Anna','CHICCO','annachicco9@gmail.com','1556 Holmberg Way','1100894010','2001-06-18'),(44873076,'Yael','MUSSE','yaeelmusse@gmail.com','711 Springs Point','2611600560','2003-08-09'),(44898501,'Martina Milagros','HEREDIA BUCCI','martinaheredia501@gmail.com','97 Buena Vista Center','1340018080','2002-05-04'),(44899696,'Luisina Belen','GONZALEZ','luisinagonzalez03@gmail.com','97660 Green Circle','3454801974','2003-11-19'),(44900851,'Dolores','CASTAGNO NICOLA','dolocastagnonicola@gmail.com','39356 Del Mar Court','3081431703','2001-03-12'),(44973582,'Jazmin Antonella','CORINALDESI','jazcorinaldesi2@gmail.com','42 Heath Way','1000380572','2002-05-14'),(44973695,'Agustina Florencia','GALLEGOS','gallegosaguu@gmail.com','63 Hermina Place','1273904709','2000-09-30'),(44974388,'Santiago Adrian','MARMARA','santiagomarmara@gmail.com','3038 Morrow Alley','423156154','2004-03-15'),(44975029,'Ariana Celeste','CHIRINO','ari123chirino@gmail.com','1693 Fairview Crossing','3397069991','1999-05-28'),(44975185,'Facundo','CARDOZO','facucardozoo03@gmail.com','54 Hoard Point','1408828490','2005-02-05'),(45026630,'Ana Belen','FERNANDEZ','anaafernandez773@gmail.com','38 Starling Point','2445330240','2000-02-28'),(45087219,'Micaela','GARCIA','garciamicaela402@gmail.com','6715 Kenwood Avenue','1259943684','2003-01-06'),(45088975,'Candela','GRAMAGLIA','candegramaglia@hotmail.com','3 Holmberg Park','1426377067','2004-01-05'),(45088976,'Mariangeles','GONZALEZ','gonzalezmariangeles21@gmail.com','88 Hooker Avenue','2095518357','2002-10-05'),(45089079,'Gonzalo','FUNES','gonzifunes25@gmail.com','39 Chinook Way','1954398112','2000-04-29'),(45089111,'Martin Emilio','GABUTTI VECI','martingabutti9@gmail.com','81 Killdeer Street','1751744600','2000-10-24'),(45089193,'Micaela Jazmin','GONZALEZ','maria.del.carmen.38@hotmail.com','30 Redwing Plaza','1947175840','2002-11-19'),(45089198,'Luana Jazmin','FERREYRA','luanaferreyra6@gmail.com','359 Leroy Plaza','2234219880','2000-05-27'),(45090108,'Marilena','FURLAN','marilenaf36@gmail.com','16 Vahlen Center','666293739','2002-07-01'),(45091010,'Martin Gaston','CARTELLO','martin.cartello.1@gmail.com','054 Barby Trail','2832838900','2000-11-16'),(45091020,'Dalma Roci­o','ESSER','dalmaesser2003@gmail.com','025 Fulton Avenue','3448567466','2004-08-24'),(45093227,'Ana Laura','ORTIZ','ortizlaury69@gmail.com','6 Kingsford Road','338555498','2001-06-03'),(45094521,'Macarena','DEFAGOT','maquidefagot@gmail.com','24934 Graceland Road','1089764523','2005-04-18'),(45154834,'Carmela','ELGUE','carmelaelgue@gmail.com','91 Dayton Street','3203556517','2005-07-12'),(45155519,'Martina','NARDONI','martinardoni2003@gmail.com','70 Gerald Park','2574407823','1999-07-08'),(45155535,'Milagros Pilar','OBERTO','obertopilar6@gmail.com','30 Redwing Terrace','1445279787','2002-08-01'),(45155675,'Debora Cristina','MONETTO','debomonetto@gmail.com','6 Warbler Way','1591624184','2003-09-16'),(45155695,'Tomas','MOYANO','moyanotms@gmail.com','2 Stuart Drive','480554899','2003-11-06'),(45244025,'Ramiro','DAVICO','ramirodavico18@gmail.com','2153 Bayside Point','2550537863','1999-02-17'),(45244107,'Victoria','LOPEZ AZCURRA','vikyazcurra@gmail.com','34 Oneill Crossing','1805293967','2004-10-15'),(45244117,'Morena','MOISO','moreemoiso15@gmail.com','485 Ridgeway Alley','2541386489','2005-09-22'),(45247161,'Joaquin Bautista','GONZALEZ HERNANDEZ','joagonher@hotmail.com','2 Ramsey Drive','244626859','2005-08-12'),(45247459,'Nicolas','MIRANDA','mirandanicolas30@gmail.com','25504 Eastlawn Alley','3024893470','2003-09-30'),(45349044,'Paula Abril','FERNANDEZ','fernandezpaulaabril@gmail.com','947 Pleasure Lane','1965791886','1999-03-29'),(45349774,'Rina','DESERAFINO','rinitadeserafino@gmail.com','63 Montana Pass','1636292100','2005-02-17'),(45350270,'Muriel','NAS GIRARDI','murielnas7@gmail.com','236 Pawling Circle','429449191','2002-04-27'),(45350425,'Melina','GROSSO','melinagro29@gmail.com','95 Ronald Regan Park','1906086579','1999-06-05'),(45406022,'Constanza','CERDA','cerdacoty25@gmail.com','146 Mccormick Way','2533143283','1999-08-10'),(45406070,'Martina','MUÑOZ ECHEGARAY','martibaile123@gmail.com','35 Drewry Hill','2905398397','2001-12-27'),(45406081,'Candela','FARRELL SOFFLI','candefarrell12@gmail.com','8 Tennessee Park','1314150784','1999-09-02'),(45406691,'Mia','GUEVARA GONZALEZ','delfi.guevara00@gmail.com','135 Oak Pass','3297321911','2000-10-02'),(45420870,'Lucila Anahi','CARDILLO','cardillolucila3@gmail.com','478 Fremont Way','1061956802','2001-02-28'),(45482220,'Santino Agustin','GUSELLA','santinogusella@gmail.com','1 Artisan Avenue','1645065609','2002-01-02'),(45482359,'Julia','FERNANDEZ','julyfernandez11@gmail.com','887 Texas Alley','1578085573','2000-03-03'),(45483692,'Tiziana','HEINRICH','tichiheinrich0704@gmail.com','1 Mifflin Trail','634281248','1999-01-01'),(45483847,'Antonio Imanol','OVIEDO','dg90a09@gmail.com','270 Union Junction','3429593168','2004-07-12'),(45484474,'Juan Ignacio','CARRANZA','valeria262008@live.com.ar','58 Farmco Point','1103650079','2002-10-20'),(45484516,'Abril','GARAY','abriilgaray42@gmail.com','2 Dwight Road','1995387998','2001-08-04'),(45484567,'Maria Florencia','CUESTA','mariaflorenciacuesta60@gmail.com','978 Grayhawk Avenue','3043409300','1999-11-20'),(45484569,'David Miguel','LUCERO','davidluceromiguel@gmail.com','83761 Granby Avenue','1724092717','2002-06-21'),(45485088,'Macarena','MACIA','macarenamacia@gmail.com','655 Almo Street','3258663859','2003-12-15'),(45592722,'Valentina','MARIN','valentinamarin2203@gmail.com','14 Browning Place','3002902979','2001-05-24'),(45592968,'Sofia Ailen','CISNEROS','soofi.cisneros@gmail.com','49158 Lillian Pass','2352909341','2000-10-06'),(45592976,'Lara Yasmin','OVIEDO','larayasminoviedo@gmail.com','97281 Jackson Park','3165898452','2004-10-22'),(45593031,'Juan Bernardo','CUSTODIO SALAZAR','bernardocustodio45@gmail.com','7 Sunnyside Avenue','2986671759','1999-07-29'),(45593623,'Milagro','GONZALEZ','gonzalezmili717@gmail.com','147 Quincy Junction','1187485779','2005-03-01'),(45593830,'Maria Guillermina','CARPINTERO','guillerminacarpintero@gmail.com','80 Eastlawn Place','390848106','2005-12-20'),(45697453,'Agustin Omar','DURAN','agustin2017duran.6@gmail.com','90 Oakridge Junction','546790870','2003-01-10'),(45697490,'Sofia','FROLA','sofiafrola36@gmail.com','25 Haas Hill','2566970680','2003-05-23'),(45698253,'Agustina','MOLINERO','agusmolinero@gmail.com','3759 Becker Avenue','1564025950','1999-04-22'),(45701643,'Valentina','LINAZA FURLAN','valentinalifu@gmail.com','16570 Anniversary Court','2900519711','2002-02-07'),(45701669,'Julieta','ORDOÑEZ','ordonezjulieta2004@gmail.com','55 Springview Alley','584852793','2003-06-25'),(45702794,'Celina Martina','DUCANT','celiducant123@gmail.com','02 Northwestern Drive','1424279127','2003-05-24'),(45836008,'Ana Catalina','MUÑOZ','catulinm13@gmail.com','3057 Gina Crossing','2435800208','2000-04-03'),(45836140,'Maria Chiara','PALACIOS','dctisera@hotmail.com','44 Village Green Trail','2477432691','2002-04-23'),(45837692,'Selena','OLIVA','doloserra76@gmail.com','08315 Texas Crossing','1018870112','2000-09-26'),(45932714,'Rocio Natali','HEREDIA','rocionataliheredia@gmail.com','8217 Magdeline Junction','2816847553','2003-08-19'),(45938533,'Maria Laura','CUELLO VASTA','cuellolaura73@gmail.com','5261 Arrowood Point','2073249824','2004-03-05'),(45938563,'Maria Monserrat','GARAY','mariamonserrat767@gmail.com','072 Union Way','712922067','2003-08-30'),(48011852,'Francisco','CIMAN D\'ANDREA','cimanfrancisco@gmail.com','55 Petterle Hill','1669202083','2002-01-10'),(94308151,'Irina','PAJON','irinapajon2001@gmail.com','6278 Vermont Junction','2583062526','2003-09-03');
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_insert_persona_aud` AFTER INSERT ON `personas` FOR EACH ROW INSERT INTO `audits`(entity, entity_id, insert_dt, created_by, last_update_dt, last_updated_by) 
VALUES ('personas', NEW.dni, CURRENT_TIMESTAMP(), USER(), CURRENT_TIMESTAMP(), USER()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `personas_rol`
--

DROP TABLE IF EXISTS `personas_rol`;
/*!50001 DROP VIEW IF EXISTS `personas_rol`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `personas_rol` AS SELECT 
 1 AS `Apellido`,
 1 AS `Nombre`,
 1 AS `rol`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rol_nombre` set('Autoridad','Docente','No docente','alumno','proveedor') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Autoridad'),(2,'No docente'),(3,'Docente'),(4,'alumno'),(5,'proveedor');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sueldo_docente`
--

DROP TABLE IF EXISTS `sueldo_docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sueldo_docente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_cargo` int NOT NULL,
  `id_dedicacion` int NOT NULL,
  `monto` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cargo` (`id_cargo`),
  KEY `id_dedicacion` (`id_dedicacion`),
  CONSTRAINT `sueldo_docente_ibfk_1` FOREIGN KEY (`id_cargo`) REFERENCES `cargos_docentes` (`id`),
  CONSTRAINT `sueldo_docente_ibfk_2` FOREIGN KEY (`id_dedicacion`) REFERENCES `dedicacion_docente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sueldo_docente`
--

LOCK TABLES `sueldo_docente` WRITE;
/*!40000 ALTER TABLE `sueldo_docente` DISABLE KEYS */;
INSERT INTO `sueldo_docente` VALUES (1,1,1,23697),(2,1,2,33646),(3,1,3,43175),(4,1,4,57459),(5,2,1,21614),(6,2,2,31585),(7,2,3,40197),(8,2,4,52745),(9,3,1,19615),(10,3,2,29533),(11,3,3,36977),(12,3,4,48254);
/*!40000 ALTER TABLE `sueldo_docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_cargos_dedicacion_sueldo`
--

DROP TABLE IF EXISTS `vista_cargos_dedicacion_sueldo`;
/*!50001 DROP VIEW IF EXISTS `vista_cargos_dedicacion_sueldo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_cargos_dedicacion_sueldo` AS SELECT 
 1 AS `nombre_cargo`,
 1 AS `nombre_dedicacion`,
 1 AS `monto`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'universidad_privada'
--

--
-- Dumping routines for database 'universidad_privada'
--
/*!50003 DROP FUNCTION IF EXISTS `calcular_edad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calcular_edad`(fecha_nacimiento DATE, fecha_actual DATE) RETURNS int
    READS SQL DATA
BEGIN
  DECLARE edad INT;
  SET edad = TIMESTAMPDIFF(YEAR, fecha_nacimiento, fecha_actual);
  RETURN edad;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `cantidad_inscriptos_por_materia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `cantidad_inscriptos_por_materia`(materia_id INT) RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE cantidad INT;
    SELECT COUNT(*) INTO cantidad
    FROM inscripciones
    WHERE materiaID = materia_id AND rolID = 4;
    RETURN cantidad;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_docentes_por_materia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_docentes_por_materia`(IN p_materiaID INT)
BEGIN
SELECT personas.nombre, personas.apellido, rol.rol_nombre
FROM inscripciones
INNER JOIN personas ON personas.dni = inscripciones.personaID
INNER JOIN rol ON rol.id = inscripciones.rolID
WHERE inscripciones.materiaID = p_materiaID AND rol.rol_nombre = 'docente';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_estudiantes_por_materia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_estudiantes_por_materia`(IN p_materiaID INT)
BEGIN
  SELECT personas.nombre, personas.apellido
  FROM inscripciones
  INNER JOIN personas ON personas.dni = inscripciones.personaID
  WHERE inscripciones.materiaID = p_materiaID AND inscripciones.rolID = 4;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_inscripciones_por_estudiante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_inscripciones_por_estudiante`(IN p_dni INT)
BEGIN
  SELECT inscripciones.id, personas.nombre, personas.apellido, materias.asignatura, materias.tipo_duracion, inscripciones.fecha_hora_inscripcion
  FROM inscripciones
  INNER JOIN personas ON personas.dni = inscripciones.personaID
  INNER JOIN materias ON materias.id = inscripciones.materiaID
  WHERE personas.dni = p_dni;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `monto_total_abonar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `monto_total_abonar`(IN dni INT, OUT total DECIMAL(10,2))
BEGIN
    SELECT SUM(sueldo_docente.monto) INTO total
    FROM nombramiento_docente
    INNER JOIN sueldo_docente ON nombramiento_docente.id_sueldo = sueldo_docente.id
    WHERE nombramiento_docente.activo = true AND nombramiento_docente.id_persona = dni;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_deuda_total_alumno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtener_deuda_total_alumno`(
  IN dni DECIMAL(10,2),
  OUT deuda_total DECIMAL(10,2)
)
BEGIN
  SELECT SUM(cuotas.importe) INTO deuda_total
  FROM personas p
  INNER JOIN cuotas ON p.dni = cuotas.id_persona
  INNER JOIN carreras ON cuotas.id_carrera = carreras.id
  WHERE p.dni = dni AND cuotas.pagado = 0 AND cuotas.vencimiento < NOW();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `alumnos_deudores`
--

/*!50001 DROP VIEW IF EXISTS `alumnos_deudores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `alumnos_deudores` AS select `p`.`dni` AS `dni`,`p`.`nombre` AS `nombre`,`p`.`apellido` AS `apellido`,`carreras`.`nombre_carrera` AS `nombre_carrera`,`cuotas`.`anio` AS `anio`,`cuotas`.`mes` AS `mes`,`cuotas`.`vencimiento` AS `vencimiento`,`cuotas`.`importe` AS `importe` from ((`personas` `p` join `cuotas` on((`p`.`dni` = `cuotas`.`id_persona`))) join `carreras` on((`cuotas`.`id_carrera` = `carreras`.`id`))) where ((`cuotas`.`pagado` = 0) and (`cuotas`.`vencimiento` < now())) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `autoridades_facultad`
--

/*!50001 DROP VIEW IF EXISTS `autoridades_facultad`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `autoridades_facultad` AS select `p`.`apellido` AS `Apellido`,`p`.`nombre` AS `Nombre`,`r`.`rol_nombre` AS `rol`,`f`.`nombre_facultad` AS `Facultad` from ((`personas` `p` join `facultades` `f` on((`p`.`dni` = `f`.`personaID`))) join `rol` `r` on((`f`.`rolID` = `r`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `docentes_con_sueldo`
--

/*!50001 DROP VIEW IF EXISTS `docentes_con_sueldo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `docentes_con_sueldo` AS select `personas`.`nombre` AS `nombre`,`personas`.`apellido` AS `apellido`,`materias`.`asignatura` AS `materia`,`cargos_docentes`.`nombre_cargo` AS `cargo`,`dedicacion_docente`.`nombre_dedicacion` AS `dedicacion`,`sueldo_docente`.`monto` AS `monto_a_abonar` from (((((((`personas` join `nombramiento_docente` on((`nombramiento_docente`.`id_persona` = `personas`.`dni`))) join `materias` on((`materias`.`id` = `nombramiento_docente`.`id_materia`))) join `carreras` on((`carreras`.`id` = `materias`.`carreraID`))) join `facultades` on((`facultades`.`id` = `carreras`.`facultadID`))) join `sueldo_docente` on((`sueldo_docente`.`id` = `nombramiento_docente`.`id_sueldo`))) join `dedicacion_docente` on((`dedicacion_docente`.`id` = `sueldo_docente`.`id_dedicacion`))) join `cargos_docentes` on((`cargos_docentes`.`id` = `sueldo_docente`.`id_cargo`))) where (`nombramiento_docente`.`activo` = true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `inscriptos`
--

/*!50001 DROP VIEW IF EXISTS `inscriptos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `inscriptos` AS select `i`.`personaID` AS `documento`,`i`.`materiaID` AS `idm`,`m`.`asignatura` AS `nombre_asignatura`,`p`.`nombre` AS `nombre`,`p`.`apellido` AS `apellido`,`i`.`rolID` AS `idrol`,`r`.`rol_nombre` AS `funcion` from (((`inscripciones` `i` join `personas` `p` on((`i`.`personaID` = `p`.`dni`))) join `materias` `m` on((`i`.`materiaID` = `m`.`id`))) join `rol` `r` on((`i`.`rolID` = `r`.`id`))) order by `m`.`asignatura` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `materia_por_anio_semestre`
--

/*!50001 DROP VIEW IF EXISTS `materia_por_anio_semestre`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `materia_por_anio_semestre` AS select `m`.`asignatura` AS `materia`,`c`.`nombre_carrera` AS `carrera`,`m`.`anio_cursado` AS `año`,`m`.`tipo_duracion` AS `semestre` from (`materias` `m` join `carreras` `c` on((`m`.`carreraID` = `c`.`id`))) order by `c`.`nombre_carrera`,`m`.`anio_cursado` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oferta_academica`
--

/*!50001 DROP VIEW IF EXISTS `oferta_academica`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `oferta_academica` AS select `c`.`nombre_carrera` AS `carrera`,`f`.`nombre_facultad` AS `facultad`,`c`.`grado` AS `grado`,`c`.`duracion` AS `duracion` from (`carreras` `c` join `facultades` `f` on((`c`.`facultadID` = `f`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `personas_rol`
--

/*!50001 DROP VIEW IF EXISTS `personas_rol`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `personas_rol` AS select `p`.`apellido` AS `Apellido`,`p`.`nombre` AS `Nombre`,`r`.`rol_nombre` AS `rol` from ((`personas` `p` join `inscripciones` `i` on((`p`.`dni` = `i`.`personaID`))) join `rol` `r` on((`i`.`rolID` = `r`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_cargos_dedicacion_sueldo`
--

/*!50001 DROP VIEW IF EXISTS `vista_cargos_dedicacion_sueldo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_cargos_dedicacion_sueldo` AS select `cargos_docentes`.`nombre_cargo` AS `nombre_cargo`,`dedicacion_docente`.`nombre_dedicacion` AS `nombre_dedicacion`,`sueldo_docente`.`monto` AS `monto` from ((`cargos_docentes` join `sueldo_docente` on((`cargos_docentes`.`id` = `sueldo_docente`.`id_cargo`))) join `dedicacion_docente` on((`dedicacion_docente`.`id` = `sueldo_docente`.`id_dedicacion`))) */;
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

-- Dump completed on 2023-05-06 22:47:28
