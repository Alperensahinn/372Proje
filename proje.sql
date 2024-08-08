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
  `PersonelID` int NOT NULL AUTO_INCREMENT,
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
INSERT INTO `bulun` VALUES (1,9,38),(2,3,22),(3,12,41),(5,14,29),(7,7,4),(7,8,44),(8,7,7),(8,12,41),(8,19,19),(9,1,20),(9,19,30),(11,1,4),(14,3,3),(15,1,26),(15,16,18),(17,16,11),(19,7,18),(21,19,38),(22,7,44),(22,19,37),(23,14,35),(24,15,10),(25,10,11),(26,8,33),(29,16,1),(29,19,29),(29,20,22),(31,6,35),(31,9,33),(31,15,23),(31,16,17),(32,2,35),(32,17,26),(33,20,44),(35,1,43),(35,5,33),(35,15,16),(37,15,8),(38,14,40),(39,13,8),(41,16,50),(42,16,12),(43,10,23),(43,13,41),(44,1,11),(44,11,3),(45,15,6),(46,2,6),(46,6,9),(47,15,23),(47,19,12),(47,20,45),(53,7,28),(55,1,43),(55,2,45),(55,3,43),(57,8,40),(58,18,25),(58,19,40),(58,20,36),(59,9,34),(59,15,27),(61,7,33),(61,9,35),(62,9,44),(63,13,10),(64,11,6),(65,6,37),(65,15,38),(66,3,28),(67,6,10),(70,1,18),(70,14,3),(71,11,24),(74,8,31),(74,13,46),(74,15,49),(75,3,14),(75,10,26),(76,3,50),(76,7,7),(76,8,23),(76,19,27),(78,13,8),(79,2,16),(79,8,50),(79,15,41),(81,6,15),(81,17,16),(83,4,15),(83,18,3),(84,5,11),(86,1,33),(86,5,27),(86,19,45),(88,5,50),(88,18,38),(88,19,4),(89,17,9),(90,7,5);
/*!40000 ALTER TABLE `bulun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `depo`
--

DROP TABLE IF EXISTS `depo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `depo` (
  `DepoID` int NOT NULL AUTO_INCREMENT,
  `Konum` varchar(32) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`DepoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depo`
--

LOCK TABLES `depo` WRITE;
/*!40000 ALTER TABLE `depo` DISABLE KEYS */;
INSERT INTO `depo` VALUES (1,'Mardin/Kabala'),(2,'Ankara/Kahramankazan'),(3,'Konya/Meram'),(4,'Aydın/Efeler'),(5,'Aydın/Efeler'),(6,'Denizli/Merkezefendi'),(7,'Eskişehir/Odunpazarı'),(8,'Aydın/Efeler'),(9,'Manisa/Şehzadeler'),(10,'Malatya/Battalgazi'),(11,'Tekirdağ/Süleymanpaşa'),(12,'Bursa/Osmangazi'),(13,'Antalya/Muratpaşa'),(14,'Denizli/Merkezefendi'),(15,'Aydın/Efeler'),(16,'Manisa/Şehzadeler'),(17,'Samsun/Atakum'),(18,'İstanbul/Kadıköy'),(19,'Manisa/Şehzadeler'),(20,'Malatya/Battalgazi');
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
INSERT INTO `fiyat_verir` VALUES (1,23,883.717990515885),(1,32,4683.688662667801),(1,67,1231.346003807702),(1,78,1570.4426194501752),(2,18,2986.327967876027),(2,36,2161.0951086707087),(2,57,2403.206014904812),(2,99,1959.5931878767155),(3,12,3059.257662462799),(3,30,595.5444982656408),(3,66,1062.0838720860427),(3,87,4928.580566671914),(4,14,4052.316758148505),(4,43,1101.5243397120748),(4,54,2784.854938619778),(4,93,1074.0924986415016),(5,23,2856.887751622832),(5,43,2967.4209471976387),(5,57,2569.1336169590086),(5,91,519.3293084829826),(6,1,2472.693875293661),(6,34,2109.141819450281),(6,70,270.50781336652324),(6,90,888.2413833507447),(7,20,4321.566835976009),(7,43,2984.9526955354836),(7,51,4921.37972343777),(7,96,3766.869887582464),(8,17,3683.2082784297622),(8,26,2936.076930085881),(8,60,680.1387358120732),(8,92,3491.6135188902526),(9,21,4629.508248814564),(9,29,4089.8935470010897),(9,56,3763.5545096883893),(9,99,1391.1087573020711),(10,20,888.6681111362362),(10,38,1747.14436347013),(10,66,2847.3870291342173),(10,80,2854.2532475159105),(11,19,1988.0883632343048),(11,36,817.4915189964025),(11,73,1987.7586884382542),(11,87,4436.202146569054),(12,17,1205.1915384232107),(12,45,2353.484088773687),(12,61,2006.5917834934705),(12,82,416.83351192693755),(13,12,4942.490140176067),(13,39,4462.760383551044),(13,67,2083.054618562078),(13,97,623.0494841081334),(14,10,1283.4827886028284),(14,28,3929.2157867173055),(14,62,3206.0577850146196),(14,84,1231.406678165805),(15,17,1065.6568496423356),(15,47,4342.798932221174),(15,51,4757.0855518882645),(15,100,1700.4754648028536),(16,6,411.8743111510458),(16,27,657.2594814010188),(16,64,3544.746471683012),(16,88,2009.6567492627046),(17,1,1549.092203297113),(17,31,1825.9770124030076),(17,72,4287.718489636285),(17,84,1754.6095471196118),(18,7,2542.4972699874606),(18,42,4820.632559888479),(18,65,2389.869400997768),(18,90,322.5513073713936),(19,7,1103.0883963606786),(19,47,4047.5507276052836),(19,64,2608.936810466234),(19,82,301.8372161120382),(20,11,2623.579934718819),(20,26,745.4969940199874),(20,72,1914.7601164168939),(20,84,3802.4126584404075),(21,14,3041.760383690788),(21,41,2271.5352619839005),(21,63,1876.186453560125),(21,91,4823.902462194435),(22,12,1891.0345789742237),(22,45,3483.7379348552513),(22,72,260.39215643620184),(22,79,2837.125311348367),(23,12,3002.1066175876626),(23,48,907.9976004908671),(23,64,317.7028502401324),(23,86,1106.1178899919269),(24,24,3804.052142318758),(24,40,670.1516823019325),(24,57,823.1119042815174),(24,79,569.0255442263252),(25,14,523.3642000778275),(25,29,2541.5589245506953),(25,58,667.9234488670668),(25,84,3032.247213985886),(26,23,688.5110146267052),(26,35,4311.858910116926),(26,73,3146.177427055916),(26,93,3015.7390261725254),(27,15,4367.756976927915),(27,41,1194.518193071438),(27,61,3715.930333203882),(27,93,1091.7325191843452),(28,15,3779.645439601012),(28,39,3873.876067137336),(28,67,2036.8530710368539),(28,78,4586.4739271278895),(29,20,911.694651351298),(29,44,1659.5877283587563),(29,59,298.2107776517274),(29,99,4456.65898180936),(30,22,1993.5462856567965),(30,48,2730.300347884621),(30,64,1475.4018450699484),(30,97,888.2292606444543),(31,7,1581.3590560146326),(31,47,4863.784864876565),(31,72,2313.0710113055948),(31,86,4481.513259973322),(32,23,4467.570261899819),(32,31,1832.8060830543363),(32,74,808.1575219471855),(32,97,2165.477208166857),(33,9,252.72076397110777),(33,27,4136.456975888836),(33,67,436.39965268178696),(33,77,4330.486041134116),(34,13,3498.2981405723253),(34,50,2317.4019694510557),(34,65,1994.7781055745984),(34,86,4804.165223282609),(35,16,2483.4056153973393),(35,26,2362.129772326649),(35,60,380.412684947909),(35,88,1217.8092131152287),(36,1,235.36793160465555),(36,27,3949.7057063705133),(36,60,4902.464186127771),(36,87,573.290805130596),(37,23,4657.618337674929),(37,35,1091.9445213143513),(37,72,1514.1335353134466),(37,100,2515.6514602176962),(38,13,669.7476986139201),(38,43,3048.9116179681437),(38,52,853.6845999827398),(38,82,3885.6069652473916),(39,19,730.3707346964069),(39,50,1920.122616178042),(39,72,3616.879757357216),(39,98,2867.039234660559),(40,12,3715.389743939277),(40,47,2957.269694168296),(40,59,2300.1529822603916),(40,80,3823.617646248312),(41,3,2329.2390572220693),(41,28,3757.449213736997),(41,73,4781.4359116741125),(41,87,4747.40009315788),(42,11,413.59873916804963),(42,26,698.5453977594627),(42,71,448.01910913896705),(42,78,2771.4540394166156),(43,13,1716.940706170114),(43,39,3345.135464547139),(43,65,2744.332520047617),(43,99,1295.9809323058385),(44,24,4386.384558708662),(44,40,2714.92289127975),(44,64,2741.3795763055323),(44,78,4824.352043084125),(45,3,1761.2129606666451),(45,50,459.2387826503922),(45,63,2097.6312797260507),(45,83,2987.166007108024),(46,3,2066.1286178169044),(46,36,4671.082256802789),(46,63,3421.3903051608827),(46,78,1719.3082683581029),(47,5,1065.1856916788738),(47,41,2525.6810446146455),(47,63,3359.013386370169),(47,83,4138.418073434072),(48,4,4058.4278943117283),(48,40,2250.810395646925),(48,72,2197.87070521028),(48,91,3819.281705955604),(49,21,3436.5454132190785),(49,33,3524.702869125071),(49,62,2355.1855957140883),(49,94,2001.2794713542828),(50,6,3129.604817744603),(50,40,2805.8307813622814),(50,57,1056.0301743787604),(50,79,320.43231994224845),(51,5,1175.2462215860137),(51,27,4699.146570941294),(51,58,1280.8912396312771),(51,92,3326.6100203632677),(52,23,887.6720336869992),(52,26,354.5600147505704),(52,51,2581.7747856989695),(52,92,2413.3059354217266),(53,25,3607.9352959372814),(53,29,2234.254985721262),(53,63,280.7293419577894),(53,78,4717.7320849200705),(54,17,1531.924503398035),(54,43,2884.732136240029),(54,72,2376.193926011498),(54,82,3935.76191409427),(55,5,1237.936788765602),(55,30,4176.337690381931),(55,58,1782.598312637362),(55,87,903.8094666222131),(56,9,2060.3886070418775),(56,27,2818.461323451094),(56,61,2037.4262439692857),(56,83,4833.764575586174),(57,20,4333.6894796818715),(57,26,1233.5365289039044),(57,68,1260.8729932247002),(57,92,452.4788385285177),(58,11,2990.8731988947147),(58,27,4800.146757059712),(58,53,3899.79323306885),(58,79,701.1162635574481),(59,11,2740.0453488870426),(59,46,1112.8736040438998),(59,63,234.52950906350748),(59,85,1931.7301032966402),(60,23,537.5388645704663),(60,36,2831.120453130618),(60,70,1943.810192007994),(60,95,3060.305310210033),(61,12,1840.6057830945847),(61,45,514.2043226754845),(61,64,992.8413769762891),(61,87,1031.1064460261896),(62,3,2447.5505952340404),(62,41,1853.842957767859),(62,59,4991.872127430141),(62,96,3843.9560341263245),(63,7,1933.0297760738677),(63,34,4886.114334191207),(63,56,2799.1498157381575),(63,87,367.9668199306526),(64,6,3060.396966362814),(64,26,1247.3749464717998),(64,75,1517.0218875157898),(64,86,3653.14857055589),(65,20,833.4197014109856),(65,27,1150.2821470566828),(65,71,4552.703989628159),(65,93,4107.642497465704),(66,12,2400.6025575887907),(66,50,4219.79736694411),(66,70,3112.241854468363),(66,76,1058.299246876102),(67,10,4936.4112922117765),(67,40,755.9967989258754),(67,74,3004.548469404911),(67,88,2371.0247292111258),(68,19,748.012322366429),(68,39,3497.863367138719),(68,54,2566.9152734713407),(68,100,4290.8030586297045),(69,15,3232.9848524985696),(69,35,3521.0804383471714),(69,58,1367.0971870096264),(69,80,2198.1701742835394),(70,8,1673.5480686731669),(70,45,4321.918573577388),(70,66,3194.3119311338305),(70,80,2405.485454921406),(71,23,1260.9812053296826),(71,48,752.8394422945407),(71,62,3722.6891458206264),(71,78,2492.3997407163265),(72,18,2402.659040301101),(72,38,4232.305531427302),(72,66,524.5738438805278),(72,79,4363.449274204209),(73,21,3043.728172065934),(73,45,4362.434864175241),(73,73,2895.5886386078373),(73,79,1624.9387859636179),(74,18,1299.638831779838),(74,33,2537.699805123646),(74,72,1398.106828127912),(74,85,2237.2119896151335),(75,23,4369.737543699343),(75,29,4174.35790820597),(75,62,2409.423087042876),(75,82,4701.342450762855),(76,7,1829.3189649810024),(76,32,2911.1006671791856),(76,71,1689.4089436246652),(76,90,2067.1851418206284),(77,25,4010.95306953516),(77,31,535.5612454386323),(77,60,652.2493508469988),(77,97,2273.94526246689),(78,11,1453.1043082205226),(78,45,4769.6550454421795),(78,51,4041.2980674452833),(78,93,388.83927738422346),(79,7,749.8208952735812),(79,40,4207.718152148116),(79,63,2747.3898179842345),(79,86,2797.3112914498374),(80,11,1597.8439090782797),(80,34,355.41099639174354),(80,54,3367.8072426550325),(80,90,3846.6040642688354),(81,23,1646.003580733774),(81,50,950.3800012714803),(81,58,3307.3130446040195),(81,94,1948.1431436755586),(82,15,2859.7453089929413),(82,28,275.24547657428525),(82,72,3698.443319231535),(82,99,1607.786819689967),(83,6,4246.948715452658),(83,31,449.9586560341642),(83,69,3461.729427742337),(83,99,3977.658686072667),(84,11,4636.3470585272335),(84,50,1565.359135647584),(84,62,2482.6097045410643),(84,84,1121.6961079974576),(85,17,617.4725440732399),(85,26,3663.930887777322),(85,63,531.9993634867799),(85,77,1781.9048833033708),(86,6,409.73634108350456),(86,43,1312.117628381808),(86,56,849.3475693909207),(86,87,2850.661280168943),(87,20,2375.621174261342),(87,39,794.5734071206276),(87,59,1842.2759483886102),(87,91,4345.501313981955),(88,11,938.4355007525933),(88,38,4866.362538327064),(88,71,2246.6829449759643),(88,86,1330.2454651370504),(89,8,3396.317616832083),(89,47,2802.2861343543086),(89,74,4589.335594429686),(89,97,433.7129622317077),(90,21,413.87063398651964),(90,39,4602.107926768105),(90,71,4165.54057485784),(90,91,2158.2551230299414),(91,4,2830.6188664406395),(91,26,4444.623519335363),(91,59,328.6603527443093),(91,89,247.86790655132265),(92,20,4510.79227728934),(92,46,4837.214477368113),(92,55,1794.3041735383397),(92,82,4824.211117566242),(93,8,4607.591031150551),(93,40,418.63362205748285),(93,61,3412.099186213527),(93,79,4329.827492554245),(94,4,1758.7629600386838),(94,38,1919.9304277994493),(94,71,4380.725177134862),(94,82,4703.297841786713),(95,24,1744.5547686539746),(95,43,238.54909309740452),(95,55,4177.738511067763),(95,80,1189.4191545748472),(96,1,2582.417755572135),(96,50,2870.5232147813695),(96,62,4034.5469148465354),(96,78,4940.8618024572625),(97,10,700.857286621618),(97,32,3166.6538695473073),(97,71,3435.8478697140217),(97,85,1969.2202471017224),(98,13,910.4036229566623),(98,48,813.2922094790786),(98,55,4222.120079782048),(98,89,2393.1065462128895),(99,11,3710.892988115305),(99,29,2130.69467286611),(99,73,1412.402304071326),(99,78,3486.201781809099),(100,4,4795.546174208802),(100,36,2635.713865355905),(100,54,2435.316508883165),(100,92,833.7206317959748);
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
  `MateryalID` int NOT NULL AUTO_INCREMENT,
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
INSERT INTO `materyal` VALUES (1,'MKE 120mm Havan','Silah','MKEK'),(2,'MKE 120mm Havan Mermisi','Mühimmat','MKEK'),(3,'AH-1W Süper Kobra','Hava Aracı','Bell Textron'),(4,'AH-1W Süper Kobra Pal','Hava Aracı','Bell Textron'),(5,'FTM-91','Gıda','Hazer Baba'),(6,'Teneke','Gıda','Hazer Baba'),(7,'FNSS PARS 6x6','Kara Aracı','FNSS'),(8,'Otokar Cobra','Kara Aracı','Otokar'),(9,'BMC Kirpi','Kara Aracı','BMC'),(10,'Alp Havacılık İHA','Hava Aracı','Alp Havacılık'),(11,'Kale Kalıp SİHA','Hava Aracı','Kale Kalıp'),(12,'Sarsılmaz Kılınç-2000','Silah','Sarsılmaz'),(13,'Nurol Makina Ejder Yalçın','Kara Aracı','Nurol Makina'),(14,'Katmerciler Hızır','Kara Aracı','Katmerciler'),(15,'TEI TS1400 Turboşaft Motor','Hava Aracı','TEI'),(16,'Meteksan Savunma Akıllı Mühimmat','Mühimmat','Meteksan'),(17,'Ares Tersanesi Korvet','Deniz Aracı','Ares Tersanesi'),(18,'Yonca-Onuk Tersanesi Zırhlı Bot','Deniz Aracı','Yonca-Onuk'),(19,'Dearsan Tersanesi Fırkateyn','Deniz Aracı','Dearsan'),(20,'Vestel Elektronik Savaş Sistemi','Elektronik','Vestel'),(21,'Baykar Bayraktar TB2','Hava Aracı','Baykar'),(22,'Desan Tersanesi Yat','Deniz Aracı','Desan'),(23,'Savronik Elektronik Mühimmat','Mühimmat','Savronik'),(24,'Aydın Elektronik Sistemler','Yazılım','Aydın'),(25,'Arıkan Savunma Zırhlı Araç','Kara Aracı','Arıkan Savunma'),(26,'Ayesaş Elektronik Cihaz','Elektronik','Ayesaş'),(27,'Garanti Kompozit Teknolojileri','Kompozit','Garanti Giyim'),(28,'Hema Endüstri Mühimmat','Mühimmat','Hema'),(29,'KATMERCİLER Zırhlı Araç','Kara Aracı','KATMERCİLER'),(30,'Karel Elektronik Savunma','Elektronik','Karel'),(31,'MilSOFT Yazılım Sistemi','Yazılım','MilSOFT'),(32,'Onur A.Ş. Savunma Teknolojileri','Teknoloji','Onur A.Ş.'),(33,'Procend Defense Sistemleri','Savunma','Procend'),(34,'SDT  Savunma Teknolojileri','Hava Aracı','SDT'),(35,'Selex ES Elektronik Sistemi','Elektronik','Selex ES'),(36,'Simsoft Simülasyon Sistemi','Simülasyon','Simsoft'),(37,'TAI T129 ATAK Helikopteri','Hava Aracı','TAI'),(38,'THK Gökçen Uçakları','Hava Aracı','THK'),(39,'TR Mekatronik Sistemler','Mekatronik','TR Mekatronik'),(40,'Türk Loydu Sertifikasyon','Sertifikasyon','Türk Loydu'),(41,'Üçel Savunma Zırhlı Araç','Kara Aracı','Üçel Savunma'),(42,'ÜNTES Savunma Elektroniği','Elektronik','ÜNTES'),(43,'Vestel Elektronik Savunma','Elektronik','Vestel'),(44,'VİKO Savunma Ürünleri','Elektronik','VİKO'),(45,'Yenipazar Defense','Savunma','Yenipazar'),(46,'Yıldız Teknopark Teknoloji','Teknoloji','Yıldız Teknopark'),(47,'Yonca-Onuk JV Zırhlı Araç','Kara Aracı','Yonca-Onuk'),(48,'ZSR Patlayıcı Sanayi','Patlayıcı','ZSR'),(49,'Çukurova Savunma Sistemleri','Savunma','Çukurova'),(50,'Öztiryakiler Savunma Ekipmanları','Ekipman','Öztiryakiler'),(51,'Barış Savunma Zırhlı Araç','Kara Aracı','Barış Savunma'),(52,'MTA Sismik Araçlar','Sismik','MTA'),(53,'Aselsan 3D Radar Sistemi','Radar','Aselsan'),(54,'ROKETSAN Atmaca Füzesi','Füze','ROKETSAN'),(55,'TAI HÜRJET','Hava Aracı','TAI'),(56,'HAVELSAN Savunma Simülatörü','Simülatör','HAVELSAN'),(57,'STM Akya Denizaltı Torpidosu','Torpido','STM'),(58,'MKEK Yavuz Tüfeği','Silah','MKEK'),(59,'FNSS Kaplan','Kara Aracı','FNSS'),(60,'Otokar Arma','Kara Aracı','Otokar'),(61,'BMC Vuran','Kara Aracı','BMC'),(62,'Alp Havacılık Hava İHA','Hava Aracı','Alp Havacılık'),(63,'Kale Kalıp SİHA','Hava Aracı','Kale Kalıp'),(64,'Sarsılmaz Canik','Silah','Sarsılmaz'),(65,'Nurol Makina BMC','Kara Aracı','Nurol Makina'),(66,'Katmerciler KAPLAN','Kara Aracı','Katmerciler'),(67,'TEI TS1400 Motor','Hava Aracı','TEI'),(68,'Meteksan Savunma Mühimmat','Mühimmat','Meteksan'),(69,'Ares Tersanesi Karakol Botu','Deniz Aracı','Ares Tersanesi'),(70,'Yonca-Onuk Tersanesi Hız Botu','Deniz Aracı','Yonca-Onuk'),(71,'Dearsan Tersanesi Yat','Deniz Aracı','Dearsan'),(72,'Vestel Savunma Elektroniği','Elektronik','Vestel'),(73,'Baykar Bayraktar Akinci','Hava Aracı','Baykar'),(74,'Desan Tersanesi Güç Botu','Deniz Aracı','Desan'),(75,'Savronik Elektronik Mühimmat','Mühimmat','Savronik'),(76,'Aydın Yazılım Savunma','Yazılım','Aydın'),(77,'Arıkan Savunma Zırhlı Araç','Kara Aracı','Arıkan Savunma'),(78,'Ayesaş Elektronik Savunma','Elektronik','Ayesaş'),(79,'Garanti Giyim Savunma','Kompozit','Garanti Giyim'),(80,'Hema Endüstri Savunma','Mühimmat','Hema'),(81,'KATMERCİLER Savunma Aracı','Kara Aracı','KATMERCİLER'),(82,'Karel Elektronik Savunma','Elektronik','Karel'),(83,'MilSOFT Savunma','Yazılım','MilSOFT'),(84,'Onur Savunma Teknolojileri','Teknoloji','Onur A.Ş.'),(85,'Procend Defense Savunma','Savunma','Procend'),(86,'SDT Uzay Savunma','Hava Aracı','SDT'),(87,'Selex ES Elektronik','Elektronik','Selex ES'),(88,'Simsoft Savunma','Simülasyon','Simsoft'),(89,'TAI Hürjet','Hava Aracı','TAI'),(90,'THK Gökçen','Hava Aracı','THK'),(91,'TR Mekatronik Savunma','Mekatronik','TR Mekatronik');
/*!40000 ALTER TABLE `materyal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operasyon`
--

DROP TABLE IF EXISTS `operasyon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operasyon` (
  `OperasyonID` int NOT NULL AUTO_INCREMENT,
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
  `SiparişID` int NOT NULL AUTO_INCREMENT,
  `MateryalID` int NOT NULL,
  `Miktar` double NOT NULL,
  `DepoID` int NOT NULL,
  PRIMARY KEY (`SiparişID`,`MateryalID`),
  KEY `MateryalID_idx` (`MateryalID`),
  KEY `Depo_FK_idx` (`DepoID`),
  CONSTRAINT `Depo_FK` FOREIGN KEY (`DepoID`) REFERENCES `depo` (`DepoID`),
  CONSTRAINT `Materyal_FK` FOREIGN KEY (`MateryalID`) REFERENCES `materyal` (`MateryalID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sipariş`
--

LOCK TABLES `sipariş` WRITE;
/*!40000 ALTER TABLE `sipariş` DISABLE KEYS */;
INSERT INTO `sipariş` VALUES (1,1,100,1),(2,1,80,2),(3,2,500,3),(4,4,20,4),(5,22,29,13),(6,59,47,18),(7,9,35,16),(8,77,32,4),(9,51,24,10),(10,81,46,10),(11,45,35,2),(12,22,33,18),(13,8,35,3),(14,21,33,15),(15,78,15,5),(16,51,33,8),(17,14,9,14),(18,47,28,2),(19,76,48,11),(20,5,31,3),(21,25,45,13),(22,3,46,16),(23,18,45,6),(24,54,11,3),(25,44,16,10),(26,40,11,20),(27,76,28,2),(28,61,5,10),(29,16,39,5),(30,87,42,11),(31,55,8,19),(32,33,21,14),(33,88,2,2),(34,73,1,10),(35,84,35,11),(36,23,38,3),(37,30,20,13),(38,19,44,5),(39,45,33,15),(40,57,47,17),(41,43,48,3),(42,7,37,5),(43,7,7,1),(44,56,40,5),(45,37,35,16),(46,18,42,9),(47,66,33,16),(48,12,26,9),(49,71,24,8),(50,11,35,1),(51,49,41,17),(52,57,20,16),(53,88,1,8),(54,74,42,15),(55,3,31,17),(56,36,45,11),(57,70,48,17),(58,48,30,5),(59,3,38,17),(60,43,31,20),(61,75,4,3),(62,74,26,17),(63,77,49,14),(64,61,49,14),(65,33,49,9),(66,88,46,10),(67,64,11,18),(68,7,25,1),(69,53,28,15),(70,79,10,11),(71,68,34,11),(72,42,48,11),(73,31,19,12),(74,56,6,5),(75,54,42,15),(76,26,6,9),(77,27,1,7),(78,43,42,10),(79,80,19,4),(80,19,6,11),(81,30,1,19),(82,12,26,20),(83,82,23,18),(84,77,33,8),(85,66,30,10),(86,11,47,17),(87,62,35,12),(88,57,16,19),(89,65,17,10),(90,6,21,3),(91,91,22,1),(92,27,2,2),(93,12,15,14),(94,67,42,9),(95,7,32,20),(96,22,9,13),(97,89,10,13),(98,64,41,20),(99,7,49,5),(100,18,43,2);
/*!40000 ALTER TABLE `sipariş` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sivil_personel`
--

DROP TABLE IF EXISTS `sivil_personel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sivil_personel` (
  `PersonelID` int NOT NULL AUTO_INCREMENT,
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
INSERT INTO `sivil_personel` VALUES (1,'Mustafa','YILDIRIM'),(2,'Ayşe','TURAN'),(3,'Kemal','KAYA'),(4,'Selin','ÖZKAN'),(5,'Ahmet','ŞAHİN'),(6,'Nur','Kaya'),(7,'Bora','Keskin'),(8,'Salih','Özkan'),(9,'Sevda','Kayaalp'),(10,'Melis','Karaca'),(11,'Hande','Uçar'),(12,'Selin','Gündüz'),(13,'Serap','Aslan'),(14,'Bahar','Kayaalp'),(15,'Aylin','Acar'),(16,'Ömer','Erdoğan'),(17,'Berat','Ak'),(18,'Enes','Aslan'),(19,'Cem','Uçar'),(20,'Berk','Yıldırım'),(21,'Osman','Arslan'),(22,'Zeynep','Aslan'),(23,'Serkan','Yücel'),(24,'Gülay','Göksu'),(25,'Melih','Erdoğan'),(26,'Şükran','Arslan'),(27,'Tuba','Uçar'),(28,'Kemal','Ergin'),(29,'Aylin','Tunç'),(30,'Nil','Kılıç'),(31,'Şükran','Bozkurt'),(32,'Ebru','Arslan'),(33,'Şükran','Aksoy'),(34,'Duygu','Bal'),(35,'Gizem','Erdem'),(36,'Melike','Şahin'),(37,'Betül','Aslan'),(38,'Levent','Polat'),(39,'Yusuf','Güneş'),(40,'Mustafa','Kara'),(41,'Hande','Güven'),(42,'Nil','Ergin'),(43,'Mustafa','Acar'),(44,'Levent','Gündüz'),(45,'Emine','Özen'),(46,'Elif','Güven'),(47,'Cansu','Ateş'),(48,'Hayri','Yücel'),(49,'Tamer','Acar'),(50,'Ece','Güneş'),(51,'Naz','Yıldız'),(52,'Nazlı','Erdem'),(53,'Elif','Durmuş'),(54,'Ayşe','Kayaalp'),(55,'Merve','Karataş'),(56,'Nihal','Kaplan'),(57,'Yusuf','Arslan'),(58,'Semih','Bulut'),(59,'Hayri','Kurt'),(60,'Hatice','Güneş'),(61,'Duygu','Korkmaz'),(62,'Aykut','Bulut'),(63,'Enes','Uludağ'),(64,'Hilal','Güler'),(65,'Melis','Kurt'),(66,'Selda','Yaman'),(67,'Nur','Çetin'),(68,'Koray','Elmas'),(69,'Ayhan','Gökmen'),(70,'Tuba','Kara'),(71,'Levent','Erkek'),(72,'Ece','Gökmen'),(73,'İpek','Aslan'),(74,'Betül','Bulut'),(75,'Emine','Sönmez'),(76,'Gül','Acar'),(77,'Esra','Keskin'),(78,'Selda','Keskin'),(79,'Ömer','Durmuş'),(80,'Ece','Koç'),(81,'Selda','Sağlam'),(82,'Ezgi','Karabulut'),(83,'Esra','Çakmak'),(84,'Cansu','Uysal'),(85,'Ece','Arı'),(86,'Gökhan','Kılıçarslan'),(87,'Tuba','Bayram'),(88,'Burak','Çetin'),(89,'Nil','Yücel'),(90,'Orhan','Güneş'),(91,'Elif','Arslan'),(92,'Pelin','Çetin'),(93,'Deniz','Göksu'),(94,'Ebru','Erdoğan'),(95,'Nil','Şimşek'),(96,'Gül','Ergin'),(97,'Bora','Erdoğan'),(98,'Nazlı','Korkmaz'),(99,'Aylin','Kılıç'),(100,'Melike','Acar'),(101,'Levent','Kayaalp'),(102,'Salih','Karahan'),(103,'Kemal','Uysal'),(104,'Betül','Yavuz'),(105,'Ahmet','Koç'),(106,'Suat','Kılıçarslan'),(107,'Merve','Demir'),(108,'Yasin','Bulut'),(109,'Hatice','Doğru'),(110,'Ayhan','Karataş'),(111,'Furkan','Uysal'),(112,'Esra','Pek'),(113,'Semih','Çetin'),(114,'Burak','Uçar'),(115,'İpek','Yıldırım'),(116,'Berk','Güzel'),(117,'İsmail','Dinç'),(118,'Furkan','Kaya'),(119,'Neşe','Karataş'),(120,'Fırat','Karabulut'),(121,'Gülay','Güzel'),(122,'Gül','Çakmak'),(123,'İsmail','Karaca'),(124,'Mustafa','Akyüz'),(125,'Suat','Gündüz'),(126,'Hasan','Koçak'),(127,'Orhan','Durmuş'),(128,'Burak','Aksoy'),(129,'Serap','Gündüz'),(130,'Naz','Bayram'),(131,'Hasan','Şimşek'),(132,'Aykut','Güney'),(133,'Mustafa','Ak'),(134,'Kerem','Polat'),(135,'Enes','Çevik'),(136,'Suat','Duman'),(137,'Hatice','Turan'),(138,'Kerem','Keskin'),(139,'Şükran','Yücel'),(140,'Sami','Karaca'),(141,'Ali','Şimşek'),(142,'Tuba','Yılmaz'),(143,'Melike','Çevik'),(144,'Sevda','Karataş'),(145,'Rabia','Korkut'),(146,'Kerem','Kara'),(147,'Pelin','Çetin'),(148,'Ezgi','Güler'),(149,'Yasin','Er'),(150,'Ayhan','Kara'),(151,'Ayşe','Kara'),(152,'Nihat','Karabulut'),(153,'Melike','Gündüz'),(154,'Tamer','Karaca'),(155,'Hilal','Şimşek'),(156,'Özgür','Uçar'),(157,'Berat','Kaptan'),(158,'Orhan','Acar'),(159,'Selda','Korkmaz'),(160,'Nihal','Karataş'),(161,'Eren','Ak'),(162,'Volkan','Karabulut'),(163,'Nazlı','Gökmen'),(164,'Hayri','Bilgin'),(165,'Gökçe','Çevik'),(166,'Ece','Çakır'),(167,'Hatice','Sağlam'),(168,'Ahmet','Aksoy'),(169,'Ayşe','Altın'),(170,'Sinem','Gündüz'),(171,'Mert','Demir'),(172,'Nihat','Ergin'),(173,'Özgür','Sönmez'),(174,'Deniz','Çelik'),(175,'Nihat','Kaya'),(176,'Serap','Yücel'),(177,'Gökhan','Bozkurt'),(178,'Fırat','Arı'),(179,'Mustafa','Pek'),(180,'Kemal','İlhan'),(181,'Nil','Çelik'),(182,'Büşra','Doğan'),(183,'Enes','Keskin'),(184,'Pelin','Yüce'),(185,'Ayşe','Gökmen'),(186,'Ece','Dinç'),(187,'Can','Kılıçarslan'),(188,'Suat','Karahan'),(189,'Levent','Elmas'),(190,'Zeynep','Duman'),(191,'Gökçe','Uçar'),(192,'Aykut','Türkmen'),(193,'Sena','Tekin'),(194,'Zeynep','İlhan'),(195,'Berk','Kaptan'),(196,'Sami','Bal'),(197,'Sibel','Ateş'),(198,'Fırat','Çevik'),(199,'Rabia','Uludağ'),(200,'Neşe','Yücel'),(201,'Aykut','Ekinci'),(202,'Hande','Özen'),(203,'Ezgi','Kaplan'),(204,'Aylin','Bayraktar'),(205,'Nil','Gündüz'),(206,'Bora','Gül'),(207,'Selda','Yavuz'),(208,'Rabia','Arı'),(209,'Selda','Altın'),(210,'Okan','Türkmen'),(211,'Halil','Kara'),(212,'Gökhan','Topal'),(213,'Berat','Kaya'),(214,'Osman','Erkek'),(215,'Cem','Ateş'),(216,'Kerem','Erdoğan'),(217,'Seda','Ak'),(218,'Hasan','Uçar'),(219,'Enes','Demirtaş'),(220,'Suat','Aksoy'),(221,'Ali','Arslan'),(222,'Sevda','Yüce'),(223,'Ayhan','Yüce'),(224,'Ayhan','Güler'),(225,'Kerem','Bal'),(226,'Yasin','Durmuş'),(227,'Sami','Şimşek'),(228,'Veli','Korkut'),(229,'Hande','Aksoy'),(230,'Nazlı','İlhan'),(231,'Kadir','Gül'),(232,'Berk','Turan'),(233,'Nihal','Acar'),(234,'Okan','İlhan'),(235,'Suat','Demir'),(236,'Ömer','Karabulut'),(237,'Seda','Şahin'),(238,'Serkan','Aksoy'),(239,'Serap','Çelik'),(240,'Seda','Karahan'),(241,'Aylin','Şahin'),(242,'Nur','Doğru'),(243,'Sami','Tunç'),(244,'Şeyma','Uysal'),(245,'Serap','Bulut'),(246,'Nihal','Karahan'),(247,'Gizem','Demirtaş'),(248,'Osman','Erdem'),(249,'Rabia','İlhan'),(250,'Hande','Doğru'),(251,'Ece','Tunç'),(252,'Kerem','Demir'),(253,'Gizem','Öztürk'),(254,'Ahmet','Gündüz'),(255,'Osman','Karahan'),(256,'Hayri','Güler'),(257,'Osman','Ekinci'),(258,'Merve','Demir'),(259,'İbrahim','Demir'),(260,'Tamer','Ekinci'),(261,'Selda','Karahan'),(262,'Aykut','Ateş'),(263,'Hüseyin','Tunç'),(264,'Emre','Uludağ'),(265,'Nur','Acar'),(266,'Yusuf','Polat'),(267,'Zeynep','Çevik'),(268,'Gökhan','Aslan'),(269,'Melike','Karaca'),(270,'Bahar','Koç'),(271,'Hilal','Kaya'),(272,'Rabia','Kaya'),(273,'Emine','Uçar'),(274,'Sami','Bulut'),(275,'Selin','Çevik'),(276,'Furkan','Karataş'),(277,'Melis','Şimşek'),(278,'Cem','Karataş'),(279,'Arda','Doğan'),(280,'Okan','Uçar'),(281,'Zeynep','Yücel'),(282,'Merve','Topal'),(283,'Sevil','Karaca'),(284,'Sinem','Bulut'),(285,'Osman','Uçar'),(286,'Yasin','Şentürk'),(287,'Sibel','Çelik'),(288,'Levent','Ak'),(289,'Cansu','Uçar'),(290,'Gökhan','Çelik'),(291,'Sevda','Ergin'),(292,'Nihal','Dinç'),(293,'Zeynep','Yavuz'),(294,'Berk','Duman'),(295,'Kemal','Altın'),(296,'Nihat','Gökmen'),(297,'Fırat','Yıldırım'),(298,'Volkan','Erdem'),(299,'Bora','Ekinci'),(300,'Nihal','Ağaoğlu'),(301,'Ferhat','Yıldız'),(302,'Neşe','Aydın'),(303,'Hasan','Yaman'),(304,'Sibel','Polat'),(305,'Mert','Kaya'),(306,'İlker','Doğan'),(307,'Can','Demirtaş'),(308,'Tamer','Ekinci'),(309,'Hande','Koçak'),(310,'Hatice','Korkmaz'),(311,'Kemal','Uysal'),(312,'Ferhat','Altın'),(313,'Halil','Şimşek'),(314,'Melis','Arslan'),(315,'Mehmet','Erdem'),(316,'Fatma','Kaplan'),(317,'Duygu','Ağaoğlu'),(318,'Fatma','Karabulut'),(319,'Hatice','Bayraktar'),(320,'Melis','Kurt'),(321,'Salih','Çakmak'),(322,'Yusuf','Koçak'),(323,'Ferhat','Çetin'),(324,'Veli','Özen'),(325,'Levent','Ağaoğlu'),(326,'Suat','Kılıç'),(327,'Şeyma','Yılmaz'),(328,'Büşra','Güven'),(329,'Ezgi','Çınar'),(330,'Hüseyin','Gökmen'),(331,'Mustafa','Çevik'),(332,'Volkan','Erkek'),(333,'Hilal','Keskin'),(334,'Furkan','Demir'),(335,'İpek','Yavuz'),(336,'Naz','Yüce'),(337,'Ömer','Bozkurt'),(338,'Serap','Kaya'),(339,'Furkan','Güney'),(340,'Nihal','Turan'),(341,'Hande','Karabulut'),(342,'Merve','Kurt'),(343,'Burak','Yılmaz'),(344,'Aylin','İlhan'),(345,'Cem','Güler'),(346,'Harun','Arı'),(347,'Berk','Erkek'),(348,'Salih','Kayaalp'),(349,'Büşra','Kayaalp'),(350,'Selin','Koç'),(351,'Esra','Kaptan'),(352,'Enes','Çınar'),(353,'Koray','Duman'),(354,'Ahmet','Güzel'),(355,'Hayri','Ateş'),(356,'Şeyma','Erkek'),(357,'Mustafa','Ekinci'),(358,'Sevil','Pek'),(359,'Bahar','Bayraktar'),(360,'Hayri','Bayraktar'),(361,'Nihal','Gül'),(362,'Gizem','Sağlam'),(363,'Gökhan','Durmaz'),(364,'Ebru','Ateş'),(365,'Fatma','Kurt'),(366,'Pelin','Yıldırım'),(367,'Sevda','Sarı'),(368,'Suat','İlhan'),(369,'İsmail','Ergün'),(370,'Nazlı','Polat'),(371,'Gökçe','Karabulut'),(372,'Gökhan','Özkan'),(373,'Sami','Şahin'),(374,'Kemal','Doğan'),(375,'Sena','Durmaz'),(376,'Suat','Karahan'),(377,'Nihat','Tunç'),(378,'Fatma','Çakmak'),(379,'Sevda','Ulusoy'),(380,'Bora','Şimşek'),(381,'İbrahim','Uludağ'),(382,'Fatma','Demirtaş'),(383,'Suat','Ergün'),(384,'Özgür','Kaya'),(385,'İpek','Elmas'),(386,'Sevil','Acar'),(387,'Serkan','Uçar'),(388,'Sena','Turan'),(389,'İsmail','Ateş'),(390,'Kadir','Erdem'),(391,'Ali','Kayaalp'),(392,'Ömer','Çevik'),(393,'Ali','Duman'),(394,'Melih','Kayaalp'),(395,'Burak','Yaman'),(396,'Duygu','Bozkurt'),(397,'Koray','Çalışkan'),(398,'Emre','Topal'),(399,'Ezgi','Keskin'),(400,'Berk','Dinç'),(401,'Hatice','Kaya'),(402,'Yasin','Arslan'),(403,'Ezgi','Özen'),(404,'Furkan','Erdoğan'),(405,'Ebru','Ergin'),(406,'Bahar','Aksoy'),(407,'Ebru','Çetin'),(408,'Kerem','Kara'),(409,'Mehmet','Çelik'),(410,'Serap','Keskin'),(411,'Selin','Yavuz'),(412,'Bora','Kurt'),(413,'Hatice','Özkan'),(414,'Serap','Özen'),(415,'Eren','Karabulut'),(416,'Ebru','Yıldız'),(417,'Ali','Yaman'),(418,'Aylin','Şahin'),(419,'Ece','Ergün'),(420,'Sevil','Güven'),(421,'Elif','Turan'),(422,'Bahar','Ekinci'),(423,'Eren','Çevik'),(424,'Sevil','Ateş'),(425,'Emine','Duman'),(426,'Sami','Elmas'),(427,'Hilal','Altın'),(428,'Ahmet','Er'),(429,'İbrahim','Öztürk'),(430,'Nur','Korkut'),(431,'Cem','Duman'),(432,'Sami','Elmas'),(433,'Bahar','Yüce'),(434,'Neşe','Bal'),(435,'Gizem','Durmuş'),(436,'Tuba','Kaya'),(437,'Cem','Kaplan'),(438,'Ayhan','Çelik'),(439,'Bora','Çelik'),(440,'Selin','Bayraktar'),(441,'Orhan','Arslan'),(442,'Zeynep','Sönmez'),(443,'İlker','Yıldırım'),(444,'Sibel','Güzel'),(445,'Orhan','Özen'),(446,'Suat','Güney'),(447,'Sevda','Kaptan'),(448,'Esra','Bozkurt'),(449,'Özgür','Ekinci'),(450,'Sinem','Kara'),(451,'Aylin','Koç'),(452,'Deniz','Kayaalp'),(453,'Betül','Elmas'),(454,'Rabia','Karaca'),(455,'Tuba','Ateş'),(456,'Pelin','Pek'),(457,'Ayşe','Öztürk'),(458,'Ali','Acar'),(459,'Özlem','Yücel'),(460,'Ezgi','Akyüz'),(461,'Bora','Aksoy'),(462,'Salih','Pek'),(463,'Deniz','Bayram'),(464,'Mehmet','Türkmen'),(465,'Gülay','Güzel'),(466,'Sibel','Doğan'),(467,'Rabia','Acar'),(468,'Okan','Koç'),(469,'Yusuf','Ekinci'),(470,'Sevda','Bulut'),(471,'Seda','Uçar'),(472,'Murat','Çetin'),(473,'Özgür','Yavuz'),(474,'Sibel','Gökmen'),(475,'Elif','Gökmen'),(476,'Rabia','Güzel'),(477,'Harun','Gökmen'),(478,'İsmail','Özen'),(479,'Fırat','Şentürk'),(480,'Salih','Özkan'),(481,'Hande','Acar'),(482,'Kerem','Gül'),(483,'Eren','Aslan'),(484,'Furkan','Pek'),(485,'Nihat','Güzel'),(486,'Kerem','Çınar'),(487,'Selin','Erdem'),(488,'Hilal','Korkmaz'),(489,'Orhan','İlhan'),(490,'Osman','Karabulut'),(491,'Naz','Polat'),(492,'Duygu','Bayraktar'),(493,'Levent','Ulusoy'),(494,'Özgür','Bayram'),(495,'Mert','Ateş'),(496,'Nur','Çakmak'),(497,'Sami','Güler'),(498,'Özgür','Turan'),(499,'Berk','Yavuz'),(500,'Ömer','Özkan'),(501,'Berat','Sönmez'),(502,'Hasan','Güzel'),(503,'Ezgi','Çakır'),(504,'Ayhan','Kurt'),(505,'Duygu','Keskin'),(506,'Seda','Güven'),(507,'Nazlı','Ağaoğlu'),(508,'Semih','Kaptan'),(509,'Cansu','Çakır'),(510,'Ezgi','Kurt'),(511,'Yusuf','Çakmak'),(512,'Tamer','Karabulut'),(513,'Bora','Topal'),(514,'Veli','Demir'),(515,'Ferhat','Keskin'),(516,'Veli','Doğan'),(517,'Tuba','Çelik'),(518,'Rabia','Erdem'),(519,'Berk','Yıldız'),(520,'Deniz','Demir'),(521,'Ece','Şimşek'),(522,'Kemal','Çınar'),(523,'Naz','Acar'),(524,'Merve','Doğan'),(525,'Hasan','Güler'),(526,'Gökhan','İlhan'),(527,'Can','Erdoğan'),(528,'Yusuf','Akyüz'),(529,'Cem','Er'),(530,'Bahar','Özdemir'),(531,'Selin','Durmuş'),(532,'Melih','Aksoy'),(533,'Burak','Duman'),(534,'Büşra','Doğan'),(535,'Betül','Acar'),(536,'Melis','Şen'),(537,'Sena','Aslan'),(538,'Yusuf','Kaya'),(539,'Emine','Karahan'),(540,'Şükran','Uçar'),(541,'Emine','Er'),(542,'Salih','Demirtaş'),(543,'Ebru','Kayaalp'),(544,'Melih','Polat'),(545,'Şükran','Güler'),(546,'Ezgi','Uysal'),(547,'Gül','Erdoğan'),(548,'Ayşe','Kaptan'),(549,'Pelin','Elmas'),(550,'Berat','Doğan'),(551,'Duygu','Bozkurt'),(552,'İlker','Duman'),(553,'Mert','Güler'),(554,'Mehmet','Türkmen'),(555,'Levent','Ergün'),(556,'Suat','Göksu'),(557,'Ahmet','Sarı'),(558,'Koray','Er'),(559,'Mert','Polat'),(560,'Fatma','Şen'),(561,'İpek','Aksoy'),(562,'Sena','Kurt'),(563,'Enes','Çetin'),(564,'Merve','Erdem'),(565,'Hatice','Öztürk'),(566,'Nihat','Kaya'),(567,'Berat','Öztürk'),(568,'Semih','Kurt'),(569,'Melis','Topal'),(570,'Levent','Demir'),(571,'Nil','Koç'),(572,'Hüseyin','Şen'),(573,'Nihat','Erdem'),(574,'Gülay','Demir'),(575,'Seda','Sağlam'),(576,'Tamer','Kaya'),(577,'Büşra','Çakır'),(578,'Hayri','Akyüz'),(579,'Mustafa','Özen'),(580,'Tuba','Çalışkan'),(581,'Hatice','Türkmen'),(582,'Emre','Kayaalp'),(583,'Serkan','Bal'),(584,'Sena','Şahin'),(585,'Nazlı','Erdem'),(586,'Sami','Kılıçarslan'),(587,'Serap','Kurt'),(588,'Aykut','Yavuz'),(589,'Emine','Durmuş'),(590,'Şükran','Gökmen'),(591,'Tuba','Kurt'),(592,'Arda','Yaman'),(593,'İpek','Türkmen'),(594,'Gökçe','Türkmen'),(595,'Sibel','Güzel'),(596,'Sevda','Demirtaş'),(597,'Mehmet','Durmaz'),(598,'Veli','Turan'),(599,'Bora','Karabulut'),(600,'Serap','Kaplan'),(601,'Tamer','Yıldız'),(602,'İsmail','Çevik'),(603,'Bahar','Gül'),(604,'Furkan','Pek'),(605,'Seda','Tunç'),(606,'Levent','Bulut'),(607,'Nihat','Özkan'),(608,'Fatma','Kaya'),(609,'Yasin','Uçar'),(610,'Berk','Kaya'),(611,'Serap','Turan'),(612,'Murat','Kurt'),(613,'Ayhan','Yücel'),(614,'Nihat','Çetin'),(615,'Fatma','Yücel'),(616,'Cem','Arslan'),(617,'Salih','Korkmaz'),(618,'Berat','Çevik'),(619,'Kerem','Korkut'),(620,'Mehmet','Uçar'),(621,'Özgür','Çınar'),(622,'Salih','Kaya'),(623,'Koray','Turan'),(624,'Serap','Polat'),(625,'Gül','Doğru'),(626,'Volkan','Uysal'),(627,'Yasin','Sağlam'),(628,'Tamer','Duman'),(629,'Naz','Yıldırım'),(630,'Sevil','Çakmak'),(631,'Ali','Aydın'),(632,'Elif','Bal'),(633,'Naz','Yıldız'),(634,'Sena','İlhan'),(635,'Bahar','Doğru'),(636,'Hande','Er'),(637,'Merve','Karabulut'),(638,'Özlem','Durmuş'),(639,'Serkan','Doğan'),(640,'Gülay','Uludağ'),(641,'Kerem','Sönmez'),(642,'Salih','Yavuz'),(643,'Hande','Karataş'),(644,'Seda','Ergün'),(645,'Sami','Uludağ'),(646,'Harun','Topal'),(647,'Semih','Yücel'),(648,'Rabia','Uludağ'),(649,'Halil','Özkan'),(650,'Aykut','Çelik'),(651,'Mustafa','Yılmaz'),(652,'Zeynep','Altın'),(653,'Harun','Acar'),(654,'Fatma','Kılıç'),(655,'Emine','Tekin'),(656,'Seda','Yücel'),(657,'Kemal','Arı'),(658,'Hande','Dinç'),(659,'Berk','Kılıçarslan'),(660,'İpek','Kayaalp'),(661,'Serkan','Kaya'),(662,'Nihat','Kılıçarslan'),(663,'Ebru','Bayraktar'),(664,'Özlem','Aslan'),(665,'Harun','Kılıç'),(666,'Melis','Kara'),(667,'Şeyma','Akyüz'),(668,'Deniz','Kayaalp'),(669,'Gizem','Bayram'),(670,'Ahmet','Karahan'),(671,'Melis','Sarı'),(672,'Elif','Altın'),(673,'Özlem','Şen'),(674,'Halil','Güler'),(675,'Gül','Sağlam'),(676,'Melih','Erkek'),(677,'Sinem','Koç'),(678,'Melike','Kurt'),(679,'Veli','Bilgin'),(680,'Levent','Akyüz'),(681,'Gül','Güneş'),(682,'Selin','Karahan'),(683,'Melih','Kaplan'),(684,'Selda','Keskin'),(685,'İsmail','Durmuş'),(686,'Mehmet','Şahin'),(687,'Merve','Türkmen'),(688,'Naz','Ergin'),(689,'Sinem','Pek'),(690,'Hatice','Acar'),(691,'Duygu','Kaptan'),(692,'Serap','Kaya'),(693,'Özgür','Türkmen'),(694,'Gizem','Gül'),(695,'Zeynep','Çelik'),(696,'Gökçe','Erdem'),(697,'Koray','Doğan'),(698,'Şeyma','Yıldız'),(699,'Aykut','Güler'),(700,'Burak','Bilgin'),(701,'Nil','Özen'),(702,'Nihal','Bulut'),(703,'İsmail','Aksoy'),(704,'İsmail','Yavuz'),(705,'Nihat','Şentürk'),(706,'Eren','Koç'),(707,'Ferhat','Aydın'),(708,'Mustafa','Karataş'),(709,'Gülay','Kılıçarslan'),(710,'Nihat','Bayraktar'),(711,'Murat','Erdem'),(712,'Ömer','Tekin'),(713,'Nil','Karaca'),(714,'Selda','Pek'),(715,'Emine','Karataş'),(716,'Aylin','Kaya'),(717,'Nazlı','Kayaalp'),(718,'Hayri','Kaya'),(719,'Sevil','Karaca'),(720,'Selda','Bilgin'),(721,'Bahar','Doğru'),(722,'Harun','Ak'),(723,'Murat','Şimşek'),(724,'Enes','Arslan'),(725,'Aylin','Çevik'),(726,'Gülay','Özen'),(727,'Sibel','Özdemir'),(728,'Nil','Kılıç'),(729,'Osman','Karataş'),(730,'Sinem','Güler'),(731,'Serkan','Şahin'),(732,'Naz','Ateş'),(733,'İpek','Karaca'),(734,'Nazlı','Şimşek'),(735,'Orhan','Aksoy'),(736,'Bora','Özkan'),(737,'Aykut','Uysal'),(738,'Osman','Arı'),(739,'Naz','Karaca'),(740,'Serkan','Karahan'),(741,'Ayşe','Yüce'),(742,'Hayri','Çetin'),(743,'Nihat','Topal'),(744,'Ezgi','Ateş'),(745,'Şeyma','Bulut'),(746,'Elif','Aksoy'),(747,'İbrahim','Karaca'),(748,'Pelin','Çalışkan'),(749,'İlker','Çevik'),(750,'Hatice','Kaplan'),(751,'Halil','Güney'),(752,'Volkan','Bulut'),(753,'Volkan','Güler'),(754,'Nihat','Aydın'),(755,'Pelin','Çetin'),(756,'İpek','Turan'),(757,'İpek','Topal'),(758,'Ömer','Erkek'),(759,'Salih','Kayaalp'),(760,'Tamer','Güler'),(761,'Serkan','Kılıçarslan'),(762,'Şeyma','Durmuş'),(763,'Fatma','Şahin'),(764,'Ayşe','Turan'),(765,'Cansu','Kaya'),(766,'Berk','Topal'),(767,'Can','Ergün'),(768,'Nihal','Gökmen'),(769,'Nihal','Yıldız'),(770,'Sibel','Kara'),(771,'Halil','Doğru'),(772,'Hatice','Dinç'),(773,'Yusuf','Uysal'),(774,'Hilal','Kılıçarslan'),(775,'Berat','Dinç'),(776,'Cem','Erdoğan'),(777,'Burak','Altın'),(778,'Aykut','Tunç'),(779,'Sevil','Kılıçarslan'),(780,'Halil','Ulusoy'),(781,'Semih','Şahin'),(782,'Elif','Demirtaş'),(783,'Okan','Ekinci'),(784,'Neşe','Sönmez'),(785,'Hüseyin','Türkmen'),(786,'Harun','Yüce'),(787,'Ezgi','Erdem'),(788,'Berat','Uysal'),(789,'Sami','Koç'),(790,'Özgür','Yavuz'),(791,'Neşe','Bayram'),(792,'Hilal','Doğru'),(793,'Gül','Erdoğan'),(794,'Neşe','Ekinci'),(795,'Yasin','Çalışkan'),(796,'Merve','Sönmez'),(797,'Ahmet','Aksoy'),(798,'Arda','Aksoy'),(799,'Melike','Güler'),(800,'Özlem','İlhan'),(801,'Eren','Elmas'),(802,'Seda','Sarı'),(803,'Sinem','Kaya'),(804,'Gökhan','Gökmen'),(805,'Özgür','Korkmaz'),(806,'Serap','Çelik'),(807,'Ahmet','Özdemir'),(808,'Furkan','Karahan'),(809,'Furkan','Aksoy'),(810,'Gülay','Ergin'),(811,'Hüseyin','Bayram'),(812,'Hayri','Aksoy'),(813,'Murat','Ak'),(814,'Emre','Aslan'),(815,'Murat','Gündüz'),(816,'Sevil','Sağlam'),(817,'Aylin','Çelik'),(818,'Ferhat','Ergün'),(819,'Berk','Koçak'),(820,'Mert','Uludağ'),(821,'Sibel','Göksu'),(822,'Kerem','Karahan'),(823,'Murat','Sağlam'),(824,'Arda','Yılmaz'),(825,'Bora','Arslan'),(826,'Murat','Korkut'),(827,'Yusuf','Er'),(828,'İpek','Duman'),(829,'Serap','Polat'),(830,'Melis','Bayram'),(831,'Gizem','Öztürk'),(832,'Suat','Akyüz'),(833,'Can','Sarı'),(834,'Aylin','Çakır'),(835,'Kadir','Demir'),(836,'Berk','Ak'),(837,'Semih','Turan'),(838,'Arda','Korkmaz'),(839,'Ebru','Acar'),(840,'Büşra','Acar'),(841,'Melike','Tunç'),(842,'İsmail','Ağaoğlu'),(843,'Tamer','Turan'),(844,'Gizem','Acar'),(845,'Nazlı','Yüce'),(846,'Sena','Topal'),(847,'Ahmet','Şimşek'),(848,'Serkan','Kaya'),(849,'İsmail','Ergin'),(850,'Özlem','Güzel'),(851,'Volkan','Ulusoy'),(852,'Bahar','Er'),(853,'Koray','Güneş'),(854,'Yasin','Kayaalp'),(855,'Selin','Kaptan'),(856,'Nihat','Aksoy'),(857,'Bahar','Acar'),(858,'Gökhan','Özkan'),(859,'Duygu','Ateş'),(860,'Nihat','Korkut'),(861,'Okan','Kılıçarslan'),(862,'Sena','Ak'),(863,'Hatice','Bayram'),(864,'Orhan','Kılıçarslan'),(865,'Ezgi','Çakır'),(866,'Selda','Gül'),(867,'Gökhan','Güzel'),(868,'Hüseyin','Doğan'),(869,'Fırat','Duman'),(870,'Tamer','Kaptan'),(871,'Deniz','Acar'),(872,'Emre','Bulut'),(873,'Melike','Kaya'),(874,'İlker','Kaya'),(875,'Osman','Öztürk'),(876,'Ayhan','Yıldız'),(877,'Okan','Güven'),(878,'Neşe','Altın'),(879,'Mert','Uçar'),(880,'Melike','Bal'),(881,'Emine','Uçar'),(882,'İsmail','Akyüz'),(883,'Fırat','Ergin'),(884,'Şeyma','Sağlam'),(885,'Furkan','Güney'),(886,'Esra','Ak'),(887,'Gülay','Şentürk'),(888,'Seda','Kılıçarslan'),(889,'Eren','Korkmaz'),(890,'Ayşe','Kayaalp'),(891,'Suat','Güney'),(892,'Pelin','Ekinci'),(893,'Kemal','Ulusoy'),(894,'Ayşe','Yücel'),(895,'Nil','Aydın'),(896,'Okan','Şen'),(897,'Merve','Acar'),(898,'Betül','Demirtaş'),(899,'Volkan','Sönmez'),(900,'Arda','Bozkurt'),(901,'Özlem','Bayram'),(902,'Bahar','Türkmen'),(903,'İbrahim','Uçar'),(904,'Sami','Altın'),(905,'Cansu','Güzel'),(906,'Mert','Öztürk'),(907,'Levent','Sönmez'),(908,'Ebru','Topal'),(909,'Sevil','Aksoy'),(910,'Burak','Aslan'),(911,'Ahmet','Şimşek'),(912,'Bahar','Durmuş'),(913,'Can','Bulut'),(914,'Mehmet','Kurt'),(915,'Naz','Karahan'),(916,'Yasin','Polat'),(917,'Tamer','Şimşek'),(918,'Nur','Özkan'),(919,'Şeyma','Durmuş'),(920,'Berk','Karaca'),(921,'Furkan','Kılıç'),(922,'Selin','Güzel'),(923,'Murat','Çelik'),(924,'Semih','Ekinci'),(925,'Ebru','Ağaoğlu'),(926,'Gizem','Erkek'),(927,'Nihal','Güven'),(928,'Tamer','Ulusoy'),(929,'Gökhan','Güzel'),(930,'Mert','Uludağ'),(931,'Burak','Er'),(932,'Sevda','Çevik'),(933,'Enes','Durmaz'),(934,'Harun','Çakmak'),(935,'Burak','Kaya'),(936,'Sevil','Kılıç'),(937,'Hande','Doğan'),(938,'Aylin','Kaya'),(939,'Bahar','Elmas'),(940,'Aykut','Dinç'),(941,'Mehmet','Kurt'),(942,'Melih','Altın'),(943,'Sinem','Ergün'),(944,'Nur','Sağlam'),(945,'Serkan','Şimşek'),(946,'Nil','Aydın'),(947,'İpek','Çakmak'),(948,'Osman','Ateş'),(949,'Ezgi','İlhan'),(950,'Suat','Turan'),(951,'Sevil','Er'),(952,'Mert','Doğru'),(953,'Furkan','Öztürk'),(954,'Ömer','Kaptan'),(955,'Gizem','Bayram'),(956,'Okan','Türkmen'),(957,'Hüseyin','Aslan'),(958,'Can','Çakır'),(959,'Seda','Doğan'),(960,'Hande','Aydın'),(961,'İlker','Ekinci'),(962,'Serap','Şen'),(963,'Volkan','Kaplan'),(964,'Şükran','Gökmen'),(965,'Esra','Kaplan'),(966,'Yasin','Sağlam'),(967,'Nazlı','Acar'),(968,'Melis','Durmaz'),(969,'Şeyma','Gündüz'),(970,'Melis','Özen'),(971,'Gül','Korkmaz'),(972,'Rabia','Koçak'),(973,'Gökçe','Yaman'),(974,'Burak','Uçar'),(975,'Hilal','Yüce'),(976,'Seda','Güler'),(977,'Ece','Gündüz'),(978,'Neşe','Öztürk'),(979,'Sinem','Korkut'),(980,'Gül','Çelik'),(981,'Okan','Kılıç'),(982,'Selin','Turan'),(983,'Ferhat','Öztürk'),(984,'Ayhan','Keskin'),(985,'Ömer','Kurt'),(986,'Gülay','Türkmen'),(987,'Sinem','Kaya'),(988,'İpek','Bilgin'),(989,'Şükran','Çakır'),(990,'İlker','Kayaalp'),(991,'Orhan','Bayram'),(992,'Ezgi','Kara'),(993,'Gül','Koçak'),(994,'Şeyma','Uysal'),(995,'Koray','Uludağ'),(996,'Elif','Altın'),(997,'İpek','İlhan'),(998,'İlker','Elmas'),(999,'Gökçe','Kaptan');
/*!40000 ALTER TABLE `sivil_personel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tedarikçi`
--

DROP TABLE IF EXISTS `tedarikçi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tedarikçi` (
  `TedarikçiID` int NOT NULL AUTO_INCREMENT,
  `FirmaAdı` varchar(32) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`TedarikçiID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tedarikçi`
--

LOCK TABLES `tedarikçi` WRITE;
/*!40000 ALTER TABLE `tedarikçi` DISABLE KEYS */;
INSERT INTO `tedarikçi` VALUES (1,'Aselsan'),(2,'Roketsan'),(3,'Tusaş'),(4,'HAVELSAN'),(5,'STM'),(6,'MKEK'),(7,'FNSS'),(8,'Otokar'),(9,'BMC'),(10,'Alp Havacılık'),(11,'Kale Kalıp'),(12,'Sarsılmaz'),(13,'Nurol Makina'),(14,'Katmerciler'),(15,'TEI'),(16,'Meteksan Savunma'),(17,'Ares Tersanesi'),(18,'Yonca-Onuk Tersanesi'),(19,'Dearsan Tersanesi'),(20,'Havelsan Hava Elektronik Sanayi'),(21,'Vestel Savunma'),(22,'Baykar'),(23,'FNSS Savunma Sistemleri'),(24,'TÜMOSAN'),(25,'MKE Ankaragücü'),(26,'Canik TP9'),(27,'Best Grup'),(28,'Desan Tersanesi'),(29,'Savronik'),(30,'Aydın Yazılım'),(31,'Arıkan Savunma'),(32,'Ayesaş'),(33,'Garanti Kompozit'),(34,'Hema Endüstri'),(35,'KATMERCİLER'),(36,'Karel Elektronik'),(37,'Koc Holding'),(38,'MilSOFT'),(39,'Onur A.Ş.'),(40,'Procend Defense'),(41,'SDT'),(42,'Selex ES Elektronik'),(43,'Simsoft'),(44,'TAI'),(45,'THK Gökçen Aviation'),(46,'TR Mekatronik'),(47,'Turkish Aerospace Industries'),(48,'UMTAS'),(49,'Unidef'),(50,'Vestel Defence'),(51,'YAKUPOĞLU (YDS)'),(52,'YDS Shoes'),(53,'Yonca-Onuk JV'),(54,'Anadolu Deniz İnşaat'),(55,'Aselsan MGEO'),(56,'Aydın Yazılım'),(57,'BİTES Savunma'),(58,'BMC Power'),(59,'Boğaziçi Savunma'),(60,'Cesur Teknoloji'),(61,'Dalaman Aircraft Factory'),(62,'DelMar Defense'),(63,'Ekin Teknoloji'),(64,'ELSIS Elektronik Sistemler'),(65,'Erko Elektronik'),(66,'Girsan'),(67,'Gölcük Shipyard'),(68,'Hisar Savunma'),(69,'Istanbul Denizcilik'),(70,'Koç Savunma'),(71,'KORKUT Systems'),(72,'Kuzey Savunma'),(73,'NATO Savunma'),(74,'Nurol BAE Systems'),(75,'Nurol Technology'),(76,'ODTÜ TEKNOKENT'),(77,'Öztek Savunma'),(78,'PROFEN'),(79,'Profen Savunma'),(80,'SanLab Simulation'),(81,'STM Savunma'),(82,'TAIS Shipyards'),(83,'TUSAŞ Engine Industries'),(84,'TAI Helicopter'),(85,'Turksat'),(86,'TÜBİTAK SAGE'),(87,'Türk Loydu'),(88,'Üçel Savunma'),(89,'ÜNTES Savunma'),(90,'Vestel Elektronik'),(91,'VİKO Savunma'),(92,'Yenipazar Defense'),(93,'Yıldız Teknopark'),(94,'Yonca Onuk JV'),(95,'ZSR Patlayıcı Sanayi'),(96,'Zorlu Holding'),(97,'Çukurova Savunma'),(98,'Öztiryakiler'),(99,'Barış Savunma'),(100,'MTA Sismik');
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

-- Dump completed on 2024-08-07 21:30:28
