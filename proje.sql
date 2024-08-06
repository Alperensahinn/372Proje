CREATE DATABASE  IF NOT EXISTS `proje` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
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
-- Table structure for table `askeri_personel`
--

DROP TABLE IF EXISTS `askeri_personel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `askeri_personel` (
  `PersonelID` int NOT NULL,
  `Rütbe` varchar(32) COLLATE utf8mb4_general_ci NOT NULL,
  `Birlik` varchar(32) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`PersonelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `askeri_personel`
--

LOCK TABLES `askeri_personel` WRITE;
/*!40000 ALTER TABLE `askeri_personel` DISABLE KEYS */;
INSERT INTO `askeri_personel` VALUES (1,'Onbaşı','57. Piyade Alayı');
/*!40000 ALTER TABLE `askeri_personel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bakım`
--

DROP TABLE IF EXISTS `bakım`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bakım` (
  `MateryalID` int NOT NULL,
  `DepoID` int NOT NULL,
  `BakımTarihi` date NOT NULL,
  `İşlemDetayi` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `PersonelID` int NOT NULL,
  PRIMARY KEY (`MateryalID`,`DepoID`,`BakımTarihi`),
  KEY `PersonelID_idx` (`PersonelID`),
  KEY `DepoID_idx` (`DepoID`),
  CONSTRAINT `Depo__ID` FOREIGN KEY (`DepoID`) REFERENCES `depo` (`DepoID`),
  CONSTRAINT `Materyal__ID` FOREIGN KEY (`MateryalID`) REFERENCES `materyal` (`MateryalID`),
  CONSTRAINT `Personel_ID` FOREIGN KEY (`PersonelID`) REFERENCES `sivil_personel` (`PersonelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bakım`
--

LOCK TABLES `bakım` WRITE;
/*!40000 ALTER TABLE `bakım` DISABLE KEYS */;
INSERT INTO `bakım` VALUES (3,2,'2019-04-18','Kokpit camları değiştirildi.',2);
/*!40000 ALTER TABLE `bakım` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulun`
--

DROP TABLE IF EXISTS `bulun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bulun` (
  `MateryalID` int NOT NULL,
  `DepoID` int NOT NULL,
  `Miktar` double unsigned NOT NULL,
  PRIMARY KEY (`MateryalID`,`DepoID`),
  KEY `DepoID_idx` (`DepoID`),
  CONSTRAINT `DepoID` FOREIGN KEY (`DepoID`) REFERENCES `depo` (`DepoID`),
  CONSTRAINT `Materyal____ID` FOREIGN KEY (`MateryalID`) REFERENCES `materyal` (`MateryalID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulun`
--

LOCK TABLES `bulun` WRITE;
/*!40000 ALTER TABLE `bulun` DISABLE KEYS */;
INSERT INTO `bulun` VALUES (1,1,1260),(2,2,4650),(3,2,30),(4,2,60),(5,1,800),(6,1,5000);
/*!40000 ALTER TABLE `bulun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `depo`
--

DROP TABLE IF EXISTS `depo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `depo` (
  `DepoID` int NOT NULL,
  `Konum` varchar(32) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`DepoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depo`
--

LOCK TABLES `depo` WRITE;
/*!40000 ALTER TABLE `depo` DISABLE KEYS */;
INSERT INTO `depo` VALUES (1,'Mardin/Kabala'),(2,'Ankara/Kahramankazan');
/*!40000 ALTER TABLE `depo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fiyat_verir`
--

DROP TABLE IF EXISTS `fiyat_verir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fiyat_verir` (
  `SiparişID` int NOT NULL,
  `TedarikçiID` int NOT NULL,
  `Fiyat` double NOT NULL,
  PRIMARY KEY (`SiparişID`,`TedarikçiID`),
  KEY `TedarikçiID__idx` (`TedarikçiID`) /*!80000 INVISIBLE */,
  CONSTRAINT `Tedarikç_iID` FOREIGN KEY (`TedarikçiID`) REFERENCES `tedarikçi` (`TedarikçiID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fiyat_verir`
--

LOCK TABLES `fiyat_verir` WRITE;
/*!40000 ALTER TABLE `fiyat_verir` DISABLE KEYS */;
INSERT INTO `fiyat_verir` VALUES (1,1,999.9),(1,2,572.6);
/*!40000 ALTER TABLE `fiyat_verir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kullanlılır`
--

DROP TABLE IF EXISTS `kullanlılır`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kullanlılır` (
  `MateryalID` int NOT NULL,
  `OperasyonID` int NOT NULL,
  `Miktar` double unsigned NOT NULL,
  PRIMARY KEY (`MateryalID`,`OperasyonID`),
  KEY `OperasyonIsdadD_idx` (`OperasyonID`),
  KEY `Materyal_ID_idx` (`MateryalID`),
  CONSTRAINT `Materyal_ID` FOREIGN KEY (`MateryalID`) REFERENCES `materyal` (`MateryalID`),
  CONSTRAINT `Operasyon_ID` FOREIGN KEY (`OperasyonID`) REFERENCES `operasyon` (`OperasyonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kullanlılır`
--

LOCK TABLES `kullanlılır` WRITE;
/*!40000 ALTER TABLE `kullanlılır` DISABLE KEYS */;
INSERT INTO `kullanlılır` VALUES (1,1,30),(1,2,20),(1,3,35),(2,1,7.5),(2,2,50),(3,3,2),(4,3,3);
/*!40000 ALTER TABLE `kullanlılır` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materyal`
--

DROP TABLE IF EXISTS `materyal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materyal` (
  `MateryalID` int NOT NULL,
  `MateryalAdı` varchar(32) COLLATE utf8mb4_general_ci NOT NULL,
  `Tür` varchar(32) COLLATE utf8mb4_general_ci NOT NULL,
  `Marka` varchar(32) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`MateryalID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materyal`
--

LOCK TABLES `materyal` WRITE;
/*!40000 ALTER TABLE `materyal` DISABLE KEYS */;
INSERT INTO `materyal` VALUES (1,'MKE 120mm Havan','Silah','MKEK'),(2,'MKE 120mm Havan Mermisi','Mühimmat','MKEK'),(3,'AH-1W Süper Kobra','Hava Aracı','Bell Textron'),(4,'AH-1W Süper Kobra Pal','Hava Aracı','Bell Textron'),(5,'FTM-91','Gıda','Hazer Baba'),(6,'Teneke','Gıda','Hazer Baba');
/*!40000 ALTER TABLE `materyal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operasyon`
--

DROP TABLE IF EXISTS `operasyon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operasyon` (
  `OperasyonID` int NOT NULL,
  `OperasyonAdı` varchar(32) COLLATE utf8mb4_general_ci NOT NULL,
  `Tarih` date NOT NULL,
  PRIMARY KEY (`OperasyonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operasyon`
--

LOCK TABLES `operasyon` WRITE;
/*!40000 ALTER TABLE `operasyon` DISABLE KEYS */;
INSERT INTO `operasyon` VALUES (1,'Barış Pınarı','2019-03-09'),(2,'Kıran-11','2020-01-15'),(3,'Kapan-3','2020-02-18');
/*!40000 ALTER TABLE `operasyon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sipariş`
--

DROP TABLE IF EXISTS `sipariş`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sipariş` (
  `SiparişID` int NOT NULL,
  `MateryalID` int NOT NULL,
  `Miktar` double NOT NULL,
  PRIMARY KEY (`SiparişID`,`MateryalID`),
  KEY `MateryalID_idx` (`MateryalID`),
  CONSTRAINT `Materyal_FK` FOREIGN KEY (`MateryalID`) REFERENCES `materyal` (`MateryalID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sipariş`
--

LOCK TABLES `sipariş` WRITE;
/*!40000 ALTER TABLE `sipariş` DISABLE KEYS */;
INSERT INTO `sipariş` VALUES (1,1,100),(2,1,80),(3,2,500),(4,4,20);
/*!40000 ALTER TABLE `sipariş` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sivil_personel`
--

DROP TABLE IF EXISTS `sivil_personel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sivil_personel` (
  `PersonelID` int NOT NULL,
  `Ad` varchar(32) COLLATE utf8mb4_general_ci NOT NULL,
  `Soyad` varchar(32) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`PersonelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sivil_personel`
--

LOCK TABLES `sivil_personel` WRITE;
/*!40000 ALTER TABLE `sivil_personel` DISABLE KEYS */;
INSERT INTO `sivil_personel` VALUES (1,'Mustafa','YILDIRIM'),(2,'Ayşe','TURAN'),(3,'Kemal','KAYA'),(4,'Selin','ÖZKAN'),(5,'Ahmet','ŞAHİN');
/*!40000 ALTER TABLE `sivil_personel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tedarikçi`
--

DROP TABLE IF EXISTS `tedarikçi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tedarikçi` (
  `TedarikçiID` int NOT NULL,
  `FirmaAdı` varchar(32) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`TedarikçiID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tedarikçi`
--

LOCK TABLES `tedarikçi` WRITE;
/*!40000 ALTER TABLE `tedarikçi` DISABLE KEYS */;
INSERT INTO `tedarikçi` VALUES (1,'Aselsan'),(2,'Roketsan'),(3,'Tusaş');
/*!40000 ALTER TABLE `tedarikçi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfer`
--

DROP TABLE IF EXISTS `transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transfer` (
  `TransferID` int NOT NULL AUTO_INCREMENT,
  `MateryalID` int NOT NULL,
  `GöndericiDepoID` int NOT NULL,
  `AlıcıDepoID` int NOT NULL,
  `BaşlangıçTarihi` date DEFAULT NULL,
  `BitişTarihi` date DEFAULT NULL,
  `Miktar` double unsigned NOT NULL,
  PRIMARY KEY (`TransferID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfer`
--

LOCK TABLES `transfer` WRITE;
/*!40000 ALTER TABLE `transfer` DISABLE KEYS */;
INSERT INTO `transfer` VALUES (1,4,1,2,'2024-06-28',NULL,5);
/*!40000 ALTER TABLE `transfer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-06 14:45:19
