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
-- Table structure for table `askeritaşıt`
--

DROP TABLE IF EXISTS `askeritaşıt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `askeritaşıt` (
  `ID` int NOT NULL,
  `İsim` varchar(32) NOT NULL,
  `Miktar` int unsigned NOT NULL,
  `Tür` varchar(32) NOT NULL,
  `Birlik` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `askeritaşıt`
--

LOCK TABLES `askeritaşıt` WRITE;
/*!40000 ALTER TABLE `askeritaşıt` DISABLE KEYS */;
/*!40000 ALTER TABLE `askeritaşıt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bakım`
--

DROP TABLE IF EXISTS `bakım`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bakım` (
  `ID` int NOT NULL,
  `BakımTarihi` date NOT NULL,
  `İşlemDetayi` varchar(128) NOT NULL,
  PRIMARY KEY (`ID`)
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
-- Table structure for table `cephane`
--

DROP TABLE IF EXISTS `cephane`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cephane` (
  `ID` int NOT NULL,
  `İsim` varchar(32) NOT NULL,
  `Miktar` int unsigned NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cephane`
--

LOCK TABLES `cephane` WRITE;
/*!40000 ALTER TABLE `cephane` DISABLE KEYS */;
/*!40000 ALTER TABLE `cephane` ENABLE KEYS */;
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
-- Table structure for table `erzak`
--

DROP TABLE IF EXISTS `erzak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `erzak` (
  `ID` int NOT NULL,
  `İsim` varchar(32) NOT NULL,
  `Miktar` int unsigned NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erzak`
--

LOCK TABLES `erzak` WRITE;
/*!40000 ALTER TABLE `erzak` DISABLE KEYS */;
/*!40000 ALTER TABLE `erzak` ENABLE KEYS */;
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
-- Table structure for table `silah`
--

DROP TABLE IF EXISTS `silah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `silah` (
  `ID` int NOT NULL,
  `İsim` varchar(32) NOT NULL,
  `Miktar` int unsigned NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `silah`
--

LOCK TABLES `silah` WRITE;
/*!40000 ALTER TABLE `silah` DISABLE KEYS */;
/*!40000 ALTER TABLE `silah` ENABLE KEYS */;
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
-- Table structure for table `siviltaşıt`
--

DROP TABLE IF EXISTS `siviltaşıt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `siviltaşıt` (
  `ID` int NOT NULL,
  `İsim` varchar(32) NOT NULL,
  `Miktar` int unsigned NOT NULL,
  `Tür` varchar(32) NOT NULL,
  `Birim` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `siviltaşıt`
--

LOCK TABLES `siviltaşıt` WRITE;
/*!40000 ALTER TABLE `siviltaşıt` DISABLE KEYS */;
/*!40000 ALTER TABLE `siviltaşıt` ENABLE KEYS */;
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

--
-- Table structure for table `yakıt`
--

DROP TABLE IF EXISTS `yakıt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yakıt` (
  `ID` int NOT NULL,
  `İsim` varchar(32) NOT NULL,
  `Miktar` int unsigned NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yakıt`
--

LOCK TABLES `yakıt` WRITE;
/*!40000 ALTER TABLE `yakıt` DISABLE KEYS */;
/*!40000 ALTER TABLE `yakıt` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-06 19:05:35
