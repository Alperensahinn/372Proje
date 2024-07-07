CREATE DATABASE  IF NOT EXISTS `proje` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `proje`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: proje
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `askeripersonel`
--

DROP TABLE IF EXISTS `askeripersonel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `askeripersonel` (
  `ID` int NOT NULL,
  `İsim` varchar(32) NOT NULL,
  `Rütbe` varchar(32) NOT NULL,
  `Birlik` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `askeripersonel`
--

LOCK TABLES `askeripersonel` WRITE;
/*!40000 ALTER TABLE `askeripersonel` DISABLE KEYS */;
/*!40000 ALTER TABLE `askeripersonel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bakım`
--

DROP TABLE IF EXISTS `bakım`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bakım` (
  `MateryalID` int NOT NULL,
  `PersonelID` int NOT NULL,
  `BakımTarihi` date NOT NULL,
  `İşlemDetayi` varchar(128) NOT NULL,
  PRIMARY KEY (`MateryalID`,`PersonelID`),
  KEY `PersonelID_idx` (`PersonelID`),
  CONSTRAINT `Materyal__ID` FOREIGN KEY (`MateryalID`) REFERENCES `materyal` (`ID`),
  CONSTRAINT `Personel_ID` FOREIGN KEY (`PersonelID`) REFERENCES `sivilpersonel` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bakım`
--

LOCK TABLES `bakım` WRITE;
/*!40000 ALTER TABLE `bakım` DISABLE KEYS */;
/*!40000 ALTER TABLE `bakım` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulunur`
--

DROP TABLE IF EXISTS `bulunur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bulunur` (
  `MateryalID` int NOT NULL,
  `DepoID` int NOT NULL,
  PRIMARY KEY (`MateryalID`,`DepoID`),
  KEY `DepoID_idx` (`DepoID`),
  KEY `Materyal__ID_idx` (`MateryalID`),
  CONSTRAINT `DepoID` FOREIGN KEY (`DepoID`) REFERENCES `depo` (`ID`),
  CONSTRAINT `Materyal___ID` FOREIGN KEY (`MateryalID`) REFERENCES `materyal` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulunur`
--

LOCK TABLES `bulunur` WRITE;
/*!40000 ALTER TABLE `bulunur` DISABLE KEYS */;
/*!40000 ALTER TABLE `bulunur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `depo`
--

DROP TABLE IF EXISTS `depo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `depo` (
  `ID` int NOT NULL,
  `Konum` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depo`
--

LOCK TABLES `depo` WRITE;
/*!40000 ALTER TABLE `depo` DISABLE KEYS */;
/*!40000 ALTER TABLE `depo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `görevli`
--

DROP TABLE IF EXISTS `görevli`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `görevli` (
  `OperasyonID` int NOT NULL,
  `PersonelID` int NOT NULL,
  PRIMARY KEY (`PersonelID`,`OperasyonID`),
  KEY `PersonelID_idx` (`PersonelID`),
  KEY `OperasyonID_idx` (`OperasyonID`),
  CONSTRAINT `OperasyonID` FOREIGN KEY (`OperasyonID`) REFERENCES `operasyon` (`ID`),
  CONSTRAINT `PersonelID` FOREIGN KEY (`PersonelID`) REFERENCES `askeripersonel` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `görevli`
--

LOCK TABLES `görevli` WRITE;
/*!40000 ALTER TABLE `görevli` DISABLE KEYS */;
/*!40000 ALTER TABLE `görevli` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kullanlılır`
--

DROP TABLE IF EXISTS `kullanlılır`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kullanlılır` (
  `OperasyonID` int NOT NULL,
  `MateryalID` int NOT NULL,
  PRIMARY KEY (`OperasyonID`,`MateryalID`),
  KEY `OperasyonIsdadD_idx` (`OperasyonID`),
  KEY `Materyal_ID_idx` (`MateryalID`),
  CONSTRAINT `Materyal_ID` FOREIGN KEY (`MateryalID`) REFERENCES `materyal` (`ID`),
  CONSTRAINT `Operasyon_ID` FOREIGN KEY (`OperasyonID`) REFERENCES `operasyon` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kullanlılır`
--

LOCK TABLES `kullanlılır` WRITE;
/*!40000 ALTER TABLE `kullanlılır` DISABLE KEYS */;
/*!40000 ALTER TABLE `kullanlılır` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materyal`
--

DROP TABLE IF EXISTS `materyal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materyal` (
  `ID` int NOT NULL,
  `İsim` varchar(32) NOT NULL,
  `Miktar` int unsigned NOT NULL,
  `Tür` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materyal`
--

LOCK TABLES `materyal` WRITE;
/*!40000 ALTER TABLE `materyal` DISABLE KEYS */;
/*!40000 ALTER TABLE `materyal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operasyon`
--

DROP TABLE IF EXISTS `operasyon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operasyon` (
  `ID` int NOT NULL,
  `İsim` varchar(32) NOT NULL,
  `BaşlangıçTarihi` date DEFAULT NULL,
  `BitişTarihi` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operasyon`
--

LOCK TABLES `operasyon` WRITE;
/*!40000 ALTER TABLE `operasyon` DISABLE KEYS */;
/*!40000 ALTER TABLE `operasyon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sipariş`
--

DROP TABLE IF EXISTS `sipariş`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sipariş` (
  `ID` int NOT NULL,
  `SiparişTarihi` date NOT NULL,
  `TeslimTarihi` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sipariş`
--

LOCK TABLES `sipariş` WRITE;
/*!40000 ALTER TABLE `sipariş` DISABLE KEYS */;
/*!40000 ALTER TABLE `sipariş` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `siparişedilir`
--

DROP TABLE IF EXISTS `siparişedilir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `siparişedilir` (
  `SiparişID` int NOT NULL,
  `MateryalID` int NOT NULL,
  PRIMARY KEY (`SiparişID`,`MateryalID`),
  KEY `SiparişID_idx` (`SiparişID`),
  KEY `MateryalID_idx` (`MateryalID`),
  CONSTRAINT `MateryalID` FOREIGN KEY (`MateryalID`) REFERENCES `materyal` (`ID`),
  CONSTRAINT `Sipariş_ID` FOREIGN KEY (`SiparişID`) REFERENCES `sipariş` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `siparişedilir`
--

LOCK TABLES `siparişedilir` WRITE;
/*!40000 ALTER TABLE `siparişedilir` DISABLE KEYS */;
/*!40000 ALTER TABLE `siparişedilir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sivilpersonel`
--

DROP TABLE IF EXISTS `sivilpersonel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sivilpersonel` (
  `ID` int NOT NULL,
  `İsim` varchar(32) NOT NULL,
  `Meslek` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sivilpersonel`
--

LOCK TABLES `sivilpersonel` WRITE;
/*!40000 ALTER TABLE `sivilpersonel` DISABLE KEYS */;
/*!40000 ALTER TABLE `sivilpersonel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tedarik`
--

DROP TABLE IF EXISTS `tedarik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tedarik` (
  `TedarikçiID` int NOT NULL,
  `SiparişID` int NOT NULL,
  PRIMARY KEY (`TedarikçiID`,`SiparişID`),
  KEY `TedarikçiID_idx` (`TedarikçiID`),
  KEY `SiparişID_idx` (`SiparişID`),
  CONSTRAINT `SiparişID` FOREIGN KEY (`SiparişID`) REFERENCES `sipariş` (`ID`),
  CONSTRAINT `TedarikçiID` FOREIGN KEY (`TedarikçiID`) REFERENCES `teradikçi` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tedarik`
--

LOCK TABLES `tedarik` WRITE;
/*!40000 ALTER TABLE `tedarik` DISABLE KEYS */;
/*!40000 ALTER TABLE `tedarik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teradikçi`
--

DROP TABLE IF EXISTS `teradikçi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teradikçi` (
  `ID` int NOT NULL,
  `İsim` varchar(32) NOT NULL,
  `İletişimBilgileri` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teradikçi`
--

LOCK TABLES `teradikçi` WRITE;
/*!40000 ALTER TABLE `teradikçi` DISABLE KEYS */;
/*!40000 ALTER TABLE `teradikçi` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-07 16:22:46
