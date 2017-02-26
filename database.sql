CREATE DATABASE  IF NOT EXISTS `siwfebbraio2017db` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `siwfebbraio2017db`;
-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: localhost    Database: siwfebbraio2017db
-- ------------------------------------------------------
-- Server version	5.7.17-0ubuntu0.16.04.1

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
-- Table structure for table `esami`
--

DROP TABLE IF EXISTS `esami`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esami` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dataPrenotazione` datetime DEFAULT NULL,
  `dataSvolgimento` datetime DEFAULT NULL,
  `medico_id` bigint(20) DEFAULT NULL,
  `paziente_id` bigint(20) DEFAULT NULL,
  `tipologiaEsame_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_po8yw18tatjsfbyd6ij3xyfx` (`medico_id`),
  KEY `FK_fppih84rm17hb7gor85f78cv3` (`paziente_id`),
  KEY `FK_briy2jkfip8a8tbo5de93scjt` (`tipologiaEsame_id`),
  CONSTRAINT `FK_briy2jkfip8a8tbo5de93scjt` FOREIGN KEY (`tipologiaEsame_id`) REFERENCES `tipologie_esami` (`id`),
  CONSTRAINT `FK_fppih84rm17hb7gor85f78cv3` FOREIGN KEY (`paziente_id`) REFERENCES `pazienti` (`id`),
  CONSTRAINT `FK_po8yw18tatjsfbyd6ij3xyfx` FOREIGN KEY (`medico_id`) REFERENCES `medici` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esami`
--

LOCK TABLES `esami` WRITE;
/*!40000 ALTER TABLE `esami` DISABLE KEYS */;
INSERT INTO `esami` VALUES (1,'2017-02-26 20:15:18','2017-03-10 09:00:00',1,1,1),(2,'2017-02-26 20:21:31','2017-02-28 10:30:00',3,4,2);
/*!40000 ALTER TABLE `esami` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indicatori_esami`
--

DROP TABLE IF EXISTS `indicatori_esami`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indicatori_esami` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `tipologiaEsame_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_917p0cc7wt7a5bn1dv85iwqf9` (`tipologiaEsame_id`),
  CONSTRAINT `FK_917p0cc7wt7a5bn1dv85iwqf9` FOREIGN KEY (`tipologiaEsame_id`) REFERENCES `tipologie_esami` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indicatori_esami`
--

LOCK TABLES `indicatori_esami` WRITE;
/*!40000 ALTER TABLE `indicatori_esami` DISABLE KEYS */;
INSERT INTO `indicatori_esami` VALUES (1,'Glicemia',1),(2,'Trigliceridi',1),(3,'Colesterolo',1),(4,'FT3',1),(5,'FT4',1),(6,'Proteine',2),(7,'Glucosio',2),(8,'Nitriti',2);
/*!40000 ALTER TABLE `indicatori_esami` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medici`
--

DROP TABLE IF EXISTS `medici`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medici` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cognome` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `specializzazione` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medici`
--

LOCK TABLES `medici` WRITE;
/*!40000 ALTER TABLE `medici` DISABLE KEYS */;
INSERT INTO `medici` VALUES (1,'Maggio','Cristina','Medicina di Laboratorio'),(2,'Iodice','Franco','Cardiologia'),(3,'Verdini','Maurizio','Medicina di Laboratorio');
/*!40000 ALTER TABLE `medici` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pazienti`
--

DROP TABLE IF EXISTS `pazienti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pazienti` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codiceFiscale` varchar(255) DEFAULT NULL,
  `cognome` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `indirizzo` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pazienti`
--

LOCK TABLES `pazienti` WRITE;
/*!40000 ALTER TABLE `pazienti` DISABLE KEYS */;
INSERT INTO `pazienti` VALUES (1,'SLVLRD89E25H501X','Silvetti','paziente1@domain.com','Via Francesco Crispi 18','Leonardo'),(2,'MRCRSS23A01K789V','Rossi','paziente2@domain.com','Via Roma 123','Marco'),(3,'FRCRMN78F13G600V','Romano','paziente3@domain.com','Via del Mare 92','Francesco'),(4,'MRUBNC90A12J507V','Bianchi','paziente4@domain.com','Via Tiburtina 465','Mauro');
/*!40000 ALTER TABLE `pazienti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prerequisiti_esame`
--

DROP TABLE IF EXISTS `prerequisiti_esame`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prerequisiti_esame` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `valore` varchar(255) DEFAULT NULL,
  `tipologiaEsame_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bqt2vhodnw729ftnd54tibdp9` (`tipologiaEsame_id`),
  CONSTRAINT `FK_bqt2vhodnw729ftnd54tibdp9` FOREIGN KEY (`tipologiaEsame_id`) REFERENCES `tipologie_esami` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prerequisiti_esame`
--

LOCK TABLES `prerequisiti_esame` WRITE;
/*!40000 ALTER TABLE `prerequisiti_esame` DISABLE KEYS */;
INSERT INTO `prerequisiti_esame` VALUES (1,'Digiuno 12','Il paziente deve essere a digiuno da 12 ore',1),(2,'No Pregnant','Il paziente non può essere una donna in gravidanza',1),(3,'Digiuno 12','Il paziente deve essere a digiuno da 12 ore',2);
/*!40000 ALTER TABLE `prerequisiti_esame` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risultati`
--

DROP TABLE IF EXISTS `risultati`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `risultati` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `risultato` varchar(255) DEFAULT NULL,
  `esame_id` bigint(20) DEFAULT NULL,
  `indicatoreEsame_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_5gm3pyf4adeo4tampob6f76r2` (`esame_id`),
  KEY `FK_ps681m9m15xa2jinavfjweccy` (`indicatoreEsame_id`),
  CONSTRAINT `FK_5gm3pyf4adeo4tampob6f76r2` FOREIGN KEY (`esame_id`) REFERENCES `esami` (`id`),
  CONSTRAINT `FK_ps681m9m15xa2jinavfjweccy` FOREIGN KEY (`indicatoreEsame_id`) REFERENCES `indicatori_esami` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risultati`
--

LOCK TABLES `risultati` WRITE;
/*!40000 ALTER TABLE `risultati` DISABLE KEYS */;
INSERT INTO `risultati` VALUES (1,'110 mg/dl',1,1),(2,'170 mg/100 ml',1,2),(3,'220 mg/100 ml',1,3),(4,'2,3 pg/ml',1,4),(5,'2 ng/dl',1,5),(6,'8 mg/dl',2,6),(7,'15 mg/dl',2,7),(8,'non presenti',2,8);
/*!40000 ALTER TABLE `risultati` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipologie_esami`
--

DROP TABLE IF EXISTS `tipologie_esami`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipologie_esami` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codice` varchar(255) DEFAULT NULL,
  `costo` varchar(255) DEFAULT NULL,
  `descrizione` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipologie_esami`
--

LOCK TABLES `tipologie_esami` WRITE;
/*!40000 ALTER TABLE `tipologie_esami` DISABLE KEYS */;
INSERT INTO `tipologie_esami` VALUES (1,'ES0001','100,00','esami del sangue','Esami del sangue'),(2,'ES0002','150,00','esami delle urine','Esami delle urine');
/*!40000 ALTER TABLE `tipologie_esami` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-26 23:28:40
