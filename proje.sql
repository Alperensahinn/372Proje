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
-- Table structure for table `askeri_personel`
--

DROP TABLE IF EXISTS `askeri_personel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `askeri_personel` (
  `PersonelID` int NOT NULL,
  `Rütbe` varchar(32) NOT NULL,
  `Birlik` varchar(32) NOT NULL,
  PRIMARY KEY (`PersonelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `PersonelID` int NOT NULL,
  `BakımTarihi` date NOT NULL,
  `İşlemDetayi` varchar(128) NOT NULL,
  PRIMARY KEY (`MateryalID`,`PersonelID`),
  KEY `PersonelID_idx` (`PersonelID`),
  CONSTRAINT `Materyal__ID` FOREIGN KEY (`MateryalID`) REFERENCES `materyal` (`MateryalID`),
  CONSTRAINT `Personel_ID` FOREIGN KEY (`PersonelID`) REFERENCES `sivil_personel` (`PersonelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bakım`
--

LOCK TABLES `bakım` WRITE;
/*!40000 ALTER TABLE `bakım` DISABLE KEYS */;
INSERT INTO `bakım` VALUES (3,2,'2019-04-18','Kokpit camları değiştirildi.');
/*!40000 ALTER TABLE `bakım` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `depo`
--

DROP TABLE IF EXISTS `depo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `depo` (
  `DepoID` int NOT NULL,
  `Konum` varchar(32) NOT NULL,
  PRIMARY KEY (`DepoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  CONSTRAINT `Tedarikç_iID` FOREIGN KEY (`TedarikçiID`) REFERENCES `teradikçi` (`TedarikçiID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kullanlılır`
--

LOCK TABLES `kullanlılır` WRITE;
/*!40000 ALTER TABLE `kullanlılır` DISABLE KEYS */;
INSERT INTO `kullanlılır` VALUES (3,1,4);
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
  `İsim` varchar(32) NOT NULL,
  `Miktar` double unsigned NOT NULL,
  `Tür` varchar(32) NOT NULL,
  `DepoID` int NOT NULL,
  PRIMARY KEY (`MateryalID`),
  KEY `DepoID_idx` (`DepoID`),
  CONSTRAINT `DepoID` FOREIGN KEY (`DepoID`) REFERENCES `depo` (`DepoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materyal`
--

LOCK TABLES `materyal` WRITE;
/*!40000 ALTER TABLE `materyal` DISABLE KEYS */;
INSERT INTO `materyal` VALUES (1,'155 milimetre top mermisi',2456,'Cephane',1),(2,'Jet yakıtı',4500,'Yakıt',2),(3,'F-22',8,'Askeri Taşıt',2),(4,'Ural-375D',24,'Sivil Taşıt',1),(5,'G3 Piyade Tüfeği',1456,'Silah',1),(6,'Konserve Ton Balığı',2560,'Erzak',2);
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
  `İsim` varchar(32) NOT NULL,
  `BaşlangıçTarihi` date DEFAULT NULL,
  `BitişTarihi` date DEFAULT NULL,
  PRIMARY KEY (`OperasyonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operasyon`
--

LOCK TABLES `operasyon` WRITE;
/*!40000 ALTER TABLE `operasyon` DISABLE KEYS */;
INSERT INTO `operasyon` VALUES (1,'Pençe Kaplan','2020-06-17',NULL);
/*!40000 ALTER TABLE `operasyon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personel`
--

DROP TABLE IF EXISTS `personel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personel` (
  `PersonelID` int NOT NULL,
  `İsim` varchar(32) NOT NULL,
  `Bölüm` varchar(32) NOT NULL,
  PRIMARY KEY (`PersonelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personel`
--

LOCK TABLES `personel` WRITE;
/*!40000 ALTER TABLE `personel` DISABLE KEYS */;
INSERT INTO `personel` VALUES (1,'Seyit Ali Çabuk','Kara Kuvvetleri'),(2,'Ahmet Yıldız','Kara Kuvvetleri');
/*!40000 ALTER TABLE `personel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sipariş`
--

DROP TABLE IF EXISTS `sipariş`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sipariş` (
  `MateryalID` int DEFAULT NULL,
  `SiparişID` int NOT NULL,
  `SiparişTarihi` date DEFAULT NULL,
  `TeslimTarihi` date DEFAULT NULL,
  `Miktar` double DEFAULT NULL,
  PRIMARY KEY (`SiparişID`),
  KEY `MateryalID_idx` (`MateryalID`),
  CONSTRAINT `MateryalID` FOREIGN KEY (`MateryalID`) REFERENCES `materyal` (`MateryalID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sipariş`
--

LOCK TABLES `sipariş` WRITE;
/*!40000 ALTER TABLE `sipariş` DISABLE KEYS */;
INSERT INTO `sipariş` VALUES (2,1,'2024-06-28',NULL,268);
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
  `Görev` varchar(32) NOT NULL,
  `Birim` varchar(32) NOT NULL,
  PRIMARY KEY (`PersonelID`),
  CONSTRAINT `PersonelID` FOREIGN KEY (`PersonelID`) REFERENCES `personel` (`PersonelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sivil_personel`
--

LOCK TABLES `sivil_personel` WRITE;
/*!40000 ALTER TABLE `sivil_personel` DISABLE KEYS */;
INSERT INTO `sivil_personel` VALUES (2,'Temizlik ve Bakım','Bakım ve Onarım Birimi');
/*!40000 ALTER TABLE `sivil_personel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taşıt`
--

DROP TABLE IF EXISTS `taşıt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taşıt` (
  `MateryalID` int NOT NULL,
  `Bölüm` varchar(32) NOT NULL,
  `Birlik` varchar(32) DEFAULT NULL,
  `Birim` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`MateryalID`),
  CONSTRAINT `Materyal___ID` FOREIGN KEY (`MateryalID`) REFERENCES `materyal` (`MateryalID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taşıt`
--

LOCK TABLES `taşıt` WRITE;
/*!40000 ALTER TABLE `taşıt` DISABLE KEYS */;
INSERT INTO `taşıt` VALUES (3,'Hava Kuvvetleri','Muharip Hava Kuvvetleri','4. Ana Jet Üs Komutanlığı'),(4,'Kara Kuvvetleri','Lojistik ve Destek Birlikleri','5. Logistik Tugayı');
/*!40000 ALTER TABLE `taşıt` ENABLE KEYS */;
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
  CONSTRAINT `TedarikçiID` FOREIGN KEY (`TedarikçiID`) REFERENCES `teradikçi` (`TedarikçiID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tedarik`
--

LOCK TABLES `tedarik` WRITE;
/*!40000 ALTER TABLE `tedarik` DISABLE KEYS */;
INSERT INTO `tedarik` VALUES (1,1);
/*!40000 ALTER TABLE `tedarik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teradikçi`
--

DROP TABLE IF EXISTS `teradikçi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teradikçi` (
  `TedarikçiID` int NOT NULL,
  `İsim` varchar(32) NOT NULL,
  `İletişimBilgileri` varchar(32) NOT NULL,
  PRIMARY KEY (`TedarikçiID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teradikçi`
--

LOCK TABLES `teradikçi` WRITE;
/*!40000 ALTER TABLE `teradikçi` DISABLE KEYS */;
INSERT INTO `teradikçi` VALUES (1,'HAVELSAN','0312 688 88 88'),(2,'ASELSAN','0253 465 22 44');
/*!40000 ALTER TABLE `teradikçi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfer`
--

DROP TABLE IF EXISTS `transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transfer` (
  `MateryalID` int NOT NULL,
  `GöndericiDepoID` int NOT NULL,
  `AlıcıDepoID` int NOT NULL,
  `BaşlangıçTarihi` date DEFAULT NULL,
  `BitişTarihi` date DEFAULT NULL,
  `Miktar` double unsigned NOT NULL,
  PRIMARY KEY (`MateryalID`,`GöndericiDepoID`,`AlıcıDepoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfer`
--

LOCK TABLES `transfer` WRITE;
/*!40000 ALTER TABLE `transfer` DISABLE KEYS */;
INSERT INTO `transfer` VALUES (4,1,2,'2024-06-28',NULL,5);
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

-- Dump completed on 2024-07-07 22:38:03
