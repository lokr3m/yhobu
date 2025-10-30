-- MySQL dump 10.13  Distrib 8.0.43, for Linux (x86_64)
--
-- Host: localhost    Database: yhobu
-- ------------------------------------------------------
-- Server version	8.0.43-0ubuntu0.24.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `yhobu`
--

/*!40000 DROP DATABASE IF EXISTS `yhobu`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `yhobu` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `yhobu`;

--
-- Table structure for table `arst`
--

DROP TABLE IF EXISTS `arst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arst` (
  `isikukood` bigint unsigned NOT NULL COMMENT 'Arsti isikukood',
  `eesnimi` varchar(64) NOT NULL COMMENT 'eesnimi',
  `inserted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`isikukood`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Hobuseid arstiavd arstid';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arst`
--

LOCK TABLES `arst` WRITE;
/*!40000 ALTER TABLE `arst` DISABLE KEYS */;
INSERT INTO `arst` VALUES (12312312312,'Hille','2025-10-27 16:01:22','2025-10-27 16:01:22'),(12312312313,'Edgar','2025-10-27 16:01:40','2025-10-27 16:01:40'),(12312312314,'Vassili','2025-10-27 16:01:40','2025-10-27 16:01:40'),(12312312315,'Laura','2025-10-30 08:42:34','2025-10-30 08:42:34'),(12312312316,'Martin','2025-10-30 08:42:34','2025-10-30 08:42:34'),(12312312317,'Karin','2025-10-30 08:42:34','2025-10-30 08:42:34'),(12312312318,'Rainer','2025-10-30 08:42:34','2025-10-30 08:42:34'),(12312312319,'Sirje','2025-10-30 08:42:34','2025-10-30 08:42:34'),(12312312320,'Taavi','2025-10-30 08:42:34','2025-10-30 08:42:34'),(12312312321,'Kadri','2025-10-30 08:42:34','2025-10-30 08:42:34');
/*!40000 ALTER TABLE `arst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hobune`
--

DROP TABLE IF EXISTS `hobune`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hobune` (
  `registreerimiskood` varchar(8) NOT NULL,
  `nimi` varchar(64) NOT NULL,
  `aasta` year DEFAULT NULL,
  `omanik_isikukood` bigint unsigned NOT NULL,
  `tall_kood` varchar(6) DEFAULT NULL,
  `inserted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`registreerimiskood`),
  KEY `omanik_isikukood` (`omanik_isikukood`),
  KEY `tall_kood` (`tall_kood`),
  CONSTRAINT `hobune_ibfk_1` FOREIGN KEY (`omanik_isikukood`) REFERENCES `omanik` (`isikukood`),
  CONSTRAINT `hobune_ibfk_2` FOREIGN KEY (`tall_kood`) REFERENCES `tall` (`kood`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Hobused';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hobune`
--

LOCK TABLES `hobune` WRITE;
/*!40000 ALTER TABLE `hobune` DISABLE KEYS */;
INSERT INTO `hobune` VALUES ('200','Kahli',2010,100002,'5','2025-10-27 15:49:39','2025-10-27 15:49:39'),('201','Kaine',2011,100002,'5A','2025-10-27 15:49:39','2025-10-27 15:49:39'),('202','Kalina',2012,100003,'7','2025-10-27 15:49:39','2025-10-27 15:49:39'),('203','Kalondra',2013,100003,'7','2025-10-27 15:49:39','2025-10-27 15:49:39'),('204','Kar Kalim',2014,100003,'7','2025-10-27 15:49:39','2025-10-27 15:49:39'),('205','Karisha',2015,100004,'7A','2025-10-27 15:49:39','2025-10-27 15:49:39'),('206','Kasimira',2016,100004,'7A','2025-10-27 15:49:39','2025-10-27 15:49:39'),('207','Katareena',2017,100004,'7A','2025-10-27 15:49:39','2025-10-27 15:49:39'),('208','Katifa',2018,100006,'7A','2025-10-27 15:49:39','2025-10-27 15:49:39'),('209','Kayleigh',2019,100006,'7A','2025-10-27 15:49:39','2025-10-27 15:49:39'),('210','Keener Than Keen',2020,100006,'7A','2025-10-27 15:49:39','2025-10-27 15:49:39'),('211','Kei',2021,36576574545,'7B','2025-10-27 15:49:39','2025-10-27 15:49:39'),('212','Kellendria',2022,36576574545,'7B','2025-10-27 15:49:39','2025-10-27 15:49:39'),('213','Kelly Green',2010,100006,'7B','2025-10-27 15:49:39','2025-10-27 15:49:39'),('214','Kelvin',2011,100006,'7B','2025-10-27 15:49:39','2025-10-27 15:49:39'),('215','Keno',2012,100006,'7B','2025-10-27 15:49:39','2025-10-27 15:49:39'),('216','Kentucky Roses',2013,100006,'7B','2025-10-27 15:49:39','2025-10-27 15:49:39'),('217','Kermit',2014,100005,'2','2025-10-27 15:49:39','2025-10-27 15:49:39'),('218','Kevah',2015,100000,'2','2025-10-27 15:49:39','2025-10-27 15:49:39'),('219','Kiawa',2016,100001,'2','2025-10-27 15:49:39','2025-10-27 15:49:39'),('220','King',2017,100000,'2','2025-10-27 15:49:39','2025-10-27 15:49:39'),('221','King Quakers crystal',2018,100001,'2','2025-10-27 15:49:39','2025-10-27 15:49:39'),('222','Kings Ransom',2019,100001,'2','2025-10-27 15:49:39','2025-10-27 15:49:39'),('223','Kipawa',2020,100000,'2','2025-10-27 15:49:39','2025-10-27 15:49:39'),('224','Kirby',2021,100001,'2','2025-10-27 15:49:39','2025-10-27 15:49:39'),('225','Kiss',2022,100003,'5','2025-10-27 15:49:39','2025-10-27 15:49:39'),('226','Kiss Me Clown',2010,100004,'5','2025-10-27 15:49:39','2025-10-27 15:49:39'),('227','Kissin the Sky',2011,100005,'5','2025-10-27 15:49:39','2025-10-27 15:49:39'),('228','Kit-Kats Chat',2012,100006,'5','2025-10-27 15:49:39','2025-10-27 15:49:39'),('229','Kitty Hawk',2013,36576574545,'5','2025-10-27 15:49:39','2025-10-27 15:49:39'),('230','Kizi',2014,100004,'5','2025-10-27 15:49:39','2025-10-27 15:49:39'),('231','Knight',2015,100004,'5','2025-10-27 15:49:39','2025-10-27 15:49:39'),('232','Kochiese',2016,100008,'5','2025-10-27 15:49:39','2025-10-27 15:49:39'),('233','Kodiak',2017,100008,'5','2025-10-27 15:49:39','2025-10-27 15:49:39');
/*!40000 ALTER TABLE `hobune` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `hobuse_treeningud`
--

DROP TABLE IF EXISTS `hobuse_treeningud`;
/*!50001 DROP VIEW IF EXISTS `hobuse_treeningud`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `hobuse_treeningud` AS SELECT 
 1 AS `hobuse_nimi`,
 1 AS `treeningute_arv`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `inventar`
--

DROP TABLE IF EXISTS `inventar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventar` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `kirjeldus` varchar(100) DEFAULT NULL,
  `hind` decimal(8,2) DEFAULT NULL,
  `tall_kood` varchar(6) DEFAULT NULL,
  `omanik_isikukood` bigint unsigned DEFAULT NULL COMMENT 'inventari omanik',
  `inserted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `tall_kood` (`tall_kood`),
  KEY `omanik_isikukood` (`omanik_isikukood`),
  CONSTRAINT `inventar_ibfk_1` FOREIGN KEY (`tall_kood`) REFERENCES `tall` (`kood`),
  CONSTRAINT `inventar_ibfk_2` FOREIGN KEY (`omanik_isikukood`) REFERENCES `omanik` (`isikukood`),
  CONSTRAINT `inventar_chk_1` CHECK ((((`tall_kood` is null) and (`omanik_isikukood` is not null)) or ((`tall_kood` is not null) and (`omanik_isikukood` is null))))
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Inventar koos hindadega';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventar`
--

LOCK TABLES `inventar` WRITE;
/*!40000 ALTER TABLE `inventar` DISABLE KEYS */;
INSERT INTO `inventar` VALUES (2,'Sadul',1203.00,NULL,36576574545,'2025-10-27 15:52:55','2025-10-27 15:53:34'),(3,'Tallihari',45.50,NULL,100000,'2025-10-30 08:42:34','2025-10-30 08:42:34'),(4,'Ratsasaabas',120.00,NULL,100001,'2025-10-30 08:42:34','2025-10-30 08:42:34'),(5,'Kiiver',89.99,NULL,100002,'2025-10-30 08:42:34','2025-10-30 08:42:34'),(6,'Püksid',65.00,NULL,100003,'2025-10-30 08:42:34','2025-10-30 08:42:34'),(7,'Suitsud',25.00,NULL,100004,'2025-10-30 08:42:34','2025-10-30 08:42:34'),(8,'Hobusevaip',95.00,NULL,100005,'2025-10-30 08:42:34','2025-10-30 08:42:34'),(9,'Toitesegu',55.50,NULL,100006,'2025-10-30 08:42:34','2025-10-30 08:42:34'),(10,'Karjatõke',450.00,'2',NULL,'2025-10-30 08:42:34','2025-10-30 08:42:34'),(11,'Puhastusharjad komplekt',35.00,NULL,100008,'2025-10-30 08:42:34','2025-10-30 08:42:34'),(12,'Ratsamadrats',850.00,NULL,100000,'2025-10-30 08:42:34','2025-10-30 08:42:34'),(13,'Kannused',42.00,NULL,100001,'2025-10-30 08:42:34','2025-10-30 08:42:34');
/*!40000 ALTER TABLE `inventar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `nimed`
--

DROP TABLE IF EXISTS `nimed`;
/*!50001 DROP VIEW IF EXISTS `nimed`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `nimed` AS SELECT 
 1 AS `eesnimi`,
 1 AS `perekonnanimi`,
 1 AS `nimi`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `omanik`
--

DROP TABLE IF EXISTS `omanik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omanik` (
  `isikukood` bigint unsigned NOT NULL,
  `eesnimi` varchar(64) NOT NULL,
  `perekonnanimi` varchar(64) NOT NULL,
  `aadress` varchar(64) DEFAULT NULL,
  `telefon` varchar(16) DEFAULT NULL,
  `inserted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`isikukood`),
  UNIQUE KEY `telefon` (`telefon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Omanikud';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omanik`
--

LOCK TABLES `omanik` WRITE;
/*!40000 ALTER TABLE `omanik` DISABLE KEYS */;
INSERT INTO `omanik` VALUES (100000,'Aadu','Laid','Tallinn','55231231','2025-10-27 15:49:39','2025-10-27 15:49:39'),(100001,'Ester','Teeveer','Kuressaare','5832325','2025-10-27 15:49:39','2025-10-27 15:49:39'),(100002,'Raul','Väli','Paide','435345643','2025-10-27 15:49:39','2025-10-27 15:49:39'),(100003,'Mihkel','Soo','Lehtse','534345','2025-10-27 15:49:39','2025-10-27 15:49:39'),(100004,'Paavo','Neihaus','Aruküla','34534','2025-10-27 15:49:39','2025-10-27 15:49:39'),(100005,'Oskar','Vallik','Tartu','','2025-10-27 15:49:39','2025-10-27 15:49:39'),(100006,'Reet','Romanjuk','Pärnu','52377','2025-10-27 15:49:39','2025-10-27 15:49:39'),(100008,'Carina Romana','Ciaro','Ikla','53242342','2025-10-27 15:49:39','2025-10-27 15:49:39'),(36576574545,'Mihkel','Kuusk','Mooste','557877667','2025-10-27 15:49:39','2025-10-30 08:42:34'),(39505123456,'Karin','Tamm','Tartu','5559999','2025-10-30 08:42:34','2025-10-30 08:42:34');
/*!40000 ALTER TABLE `omanik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `omanik_arsti_maksed`
--

DROP TABLE IF EXISTS `omanik_arsti_maksed`;
/*!50001 DROP VIEW IF EXISTS `omanik_arsti_maksed`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `omanik_arsti_maksed` AS SELECT 
 1 AS `omanik_eesnimi`,
 1 AS `omanik_perekonnanimi`,
 1 AS `hobuse_nimi`,
 1 AS `arst_isikukood`,
 1 AS `visiidi_tasu`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `omanik_inventari_kulud`
--

DROP TABLE IF EXISTS `omanik_inventari_kulud`;
/*!50001 DROP VIEW IF EXISTS `omanik_inventari_kulud`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `omanik_inventari_kulud` AS SELECT 
 1 AS `eesnimi`,
 1 AS `perekonnanimi`,
 1 AS `kogumaksumUs`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `personal`
--

DROP TABLE IF EXISTS `personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal` (
  `isikukood` bigint unsigned NOT NULL,
  `eesnimi` varchar(64) NOT NULL,
  `perekonnanimi` varchar(64) NOT NULL,
  `ametikoht` enum('treener','tallimees','muu') NOT NULL,
  `telefon` varchar(16) DEFAULT NULL,
  `tall_kood` varchar(6) DEFAULT NULL COMMENT 'Tallimees töötab täpselt ühes tallis',
  `inserted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`isikukood`),
  KEY `personal_ibfk_1` (`tall_kood`),
  CONSTRAINT `personal_ibfk_1` FOREIGN KEY (`tall_kood`) REFERENCES `tall` (`kood`),
  CONSTRAINT `personal_chk_1` CHECK ((((`ametikoht` = _utf8mb4'tallimees') and (`tall_kood` is not null)) or (`ametikoht` <> _utf8mb4'tallimees')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Personal - treenerid, tallimehed ja muu personal';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal`
--

LOCK TABLES `personal` WRITE;
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
INSERT INTO `personal` VALUES (36705678901,'Mari','Pärn','tallimees','5555678','2','2025-10-30 08:42:34','2025-10-30 08:42:34'),(37210123456,'Margus','Raud','tallimees','5550123','7B','2025-10-30 08:42:34','2025-10-30 08:42:34'),(37503456789,'Kristiina','Põld','treener','5553456',NULL,'2025-10-30 08:42:34','2025-10-30 08:42:34'),(37907890123,'Kristi','Saar','tallimees','5557890','5A','2025-10-30 08:42:34','2025-10-30 08:42:34'),(38008901234,'Peeter','Lepp','tallimees','5558901','7','2025-10-30 08:42:34','2025-10-30 08:42:34'),(38311234567,'Liina','Org','muu','5551235',NULL,'2025-10-30 08:42:34','2025-10-30 08:42:34'),(38501234567,'Marta','Kask','treener','5551234',NULL,'2025-10-30 08:42:34','2025-10-30 08:42:34'),(38604567890,'Andres','Mägi','treener','5554567',NULL,'2025-10-30 08:42:34','2025-10-30 08:42:34'),(39012345678,'Jaanus','Tamm','treener','5552345',NULL,'2025-10-30 08:42:34','2025-10-30 08:42:34'),(39109012345,'Anne','Kivi','tallimees','5559012','7A','2025-10-30 08:42:34','2025-10-30 08:42:34'),(39412345678,'Jüri','Veski','muu','5552346',NULL,'2025-10-30 08:42:34','2025-10-30 08:42:34'),(39806789012,'Toomas','Kukk','tallimees','5556789','5','2025-10-30 08:42:34','2025-10-30 08:42:34');
/*!40000 ALTER TABLE `personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tall`
--

DROP TABLE IF EXISTS `tall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tall` (
  `kood` varchar(6) NOT NULL,
  `aadress` varchar(64) NOT NULL,
  `inserted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`kood`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Andmed tallide kohta';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tall`
--

LOCK TABLES `tall` WRITE;
/*!40000 ALTER TABLE `tall` DISABLE KEYS */;
INSERT INTO `tall` VALUES ('2','Karksi','2025-10-27 15:49:39','2025-10-27 15:49:39'),('5','Tallinn 1','2025-10-27 15:49:39','2025-10-27 15:49:39'),('5A','Tallinn 3','2025-10-27 15:49:39','2025-10-27 15:49:55'),('7','Jäneda 1','2025-10-27 15:49:39','2025-10-27 15:49:39'),('7A','Jäneda 2','2025-10-27 15:49:39','2025-10-27 15:49:39'),('7B','Jäneda 3','2025-10-27 15:49:39','2025-10-27 15:49:39');
/*!40000 ALTER TABLE `tall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `tallimehed`
--

DROP TABLE IF EXISTS `tallimehed`;
/*!50001 DROP VIEW IF EXISTS `tallimehed`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `tallimehed` AS SELECT 
 1 AS `isikukood`,
 1 AS `eesnimi`,
 1 AS `perekonnanimi`,
 1 AS `telefon`,
 1 AS `tall_kood`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `treenerite_programmid`
--

DROP TABLE IF EXISTS `treenerite_programmid`;
/*!50001 DROP VIEW IF EXISTS `treenerite_programmid`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `treenerite_programmid` AS SELECT 
 1 AS `eesnimi`,
 1 AS `perekonnanimi`,
 1 AS `programmi_nimi`,
 1 AS `kirjeldus`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `treening`
--

DROP TABLE IF EXISTS `treening`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treening` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `hobune_registreerimiskood` varchar(8) NOT NULL,
  `treener_isikukood` bigint unsigned NOT NULL,
  `treeningu_aeg` datetime NOT NULL,
  `programm_nimi` varchar(100) NOT NULL,
  `kirjeldus` varchar(255) DEFAULT NULL,
  `inserted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `treening_ibfk_1` (`hobune_registreerimiskood`),
  KEY `treening_ibfk_2` (`treener_isikukood`),
  KEY `treening_ibfk_3` (`programm_nimi`),
  CONSTRAINT `treening_ibfk_1` FOREIGN KEY (`hobune_registreerimiskood`) REFERENCES `hobune` (`registreerimiskood`),
  CONSTRAINT `treening_ibfk_2` FOREIGN KEY (`treener_isikukood`) REFERENCES `personal` (`isikukood`),
  CONSTRAINT `treening_ibfk_3` FOREIGN KEY (`programm_nimi`) REFERENCES `treeningprogramm` (`nimi`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Treeningud';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treening`
--

LOCK TABLES `treening` WRITE;
/*!40000 ALTER TABLE `treening` DISABLE KEYS */;
INSERT INTO `treening` VALUES (1,'200',38501234567,'2025-10-01 09:00:00','Algajate programm','Põhioskuste treening','2025-10-30 08:42:34','2025-10-30 08:42:34'),(2,'201',38501234567,'2025-10-01 10:30:00','Algajate programm','Takistuste ületamine','2025-10-30 08:42:34','2025-10-30 08:42:34'),(3,'202',39012345678,'2025-10-02 09:00:00','Võistluste ettevalmistus','Kiirustreening','2025-10-30 08:42:34','2025-10-30 08:42:34'),(4,'203',39012345678,'2025-10-02 11:00:00','Võistluste ettevalmistus','Vastupidavustreening','2025-10-30 08:42:34','2025-10-30 08:42:34'),(5,'204',37503456789,'2025-10-03 09:00:00','Taastusravi programm','Kerge jalutuskäik','2025-10-30 08:42:34','2025-10-30 08:42:34'),(6,'205',38501234567,'2025-10-03 14:00:00','Algajate programm','Sööda annustamise järgi treening','2025-10-30 08:42:34','2025-10-30 08:42:34'),(7,'206',39012345678,'2025-10-04 09:00:00','Võistluste ettevalmistus','Hüpete treening','2025-10-30 08:42:34','2025-10-30 08:42:34'),(8,'207',37503456789,'2025-10-04 10:00:00','Taastusravi programm','Massaaž ja venitusharjutused','2025-10-30 08:42:34','2025-10-30 08:42:34'),(9,'208',38501234567,'2025-10-05 09:00:00','Algajate programm','Galopi treening','2025-10-30 08:42:34','2025-10-30 08:42:34'),(10,'209',39012345678,'2025-10-05 11:00:00','Võistluste ettevalmistus','Tehnikatreening','2025-10-30 08:42:34','2025-10-30 08:42:34'),(11,'210',38501234567,'2025-10-06 09:00:00','Algajate programm','Ratsaniku käsud','2025-10-30 08:42:34','2025-10-30 08:42:34'),(12,'211',39012345678,'2025-10-06 14:00:00','Võistluste ettevalmistus','Simuleeritud võistlus','2025-10-30 08:42:34','2025-10-30 08:42:34'),(13,'200',39012345678,'2025-10-07 09:00:00','Võistluste ettevalmistus','Lisatreening','2025-10-30 08:42:34','2025-10-30 08:42:34'),(14,'201',37503456789,'2025-10-07 10:00:00','Taastusravi programm','Taastumine pärast vigastust','2025-10-30 08:42:34','2025-10-30 08:42:34'),(15,'202',38501234567,'2025-10-08 09:00:00','Algajate programm','Kordustreening','2025-10-30 08:42:34','2025-10-30 08:42:34');
/*!40000 ALTER TABLE `treening` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treeningprogramm`
--

DROP TABLE IF EXISTS `treeningprogramm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treeningprogramm` (
  `nimi` varchar(100) NOT NULL,
  `kirjeldus` varchar(255) NOT NULL,
  `vastutaja` bigint unsigned NOT NULL,
  `inserted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`nimi`),
  KEY `vastutaja` (`vastutaja`),
  CONSTRAINT `treeningprogramm_ibfk_1` FOREIGN KEY (`vastutaja`) REFERENCES `personal` (`isikukood`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Treeningprogrammid';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treeningprogramm`
--

LOCK TABLES `treeningprogramm` WRITE;
/*!40000 ALTER TABLE `treeningprogramm` DISABLE KEYS */;
INSERT INTO `treeningprogramm` VALUES ('Algajate programm','Põhilised oskused ja treeningud algajatele hobustele',38501234567,'2025-10-30 08:42:34','2025-10-30 08:42:34'),('Taastusravi programm','Programm vigastustest taastumiseks ja rehabilitatsiooniks',37503456789,'2025-10-30 08:42:34','2025-10-30 08:42:34'),('Võistluste ettevalmistus','Intensiivne programm võistlusteks valmistumiseks',39012345678,'2025-10-30 08:42:34','2025-10-30 08:42:34');
/*!40000 ALTER TABLE `treeningprogramm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visiit`
--

DROP TABLE IF EXISTS `visiit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visiit` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `hobune_registreerimiskood` varchar(8) NOT NULL COMMENT 'Peab olema hobuste tabelis',
  `arst_isikukood` bigint unsigned NOT NULL,
  `visiidi_aeg` datetime DEFAULT NULL,
  `visiidi_kirjeldus` varchar(255) DEFAULT NULL,
  `hind` decimal(8,2) DEFAULT NULL,
  `inserted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `hobune_registreerimiskood` (`hobune_registreerimiskood`),
  KEY `arst_isikukood` (`arst_isikukood`),
  CONSTRAINT `visiit_ibfk_1` FOREIGN KEY (`hobune_registreerimiskood`) REFERENCES `hobune` (`registreerimiskood`),
  CONSTRAINT `visiit_ibfk_2` FOREIGN KEY (`arst_isikukood`) REFERENCES `arst` (`isikukood`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Inventar koos hindadega';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visiit`
--

LOCK TABLES `visiit` WRITE;
/*!40000 ALTER TABLE `visiit` DISABLE KEYS */;
INSERT INTO `visiit` VALUES (1,'220',12312312312,'2025-11-02 00:00:00','Hobune on täiesti terve',125.00,'2025-10-27 16:03:00','2025-10-27 16:03:00'),(2,'201',12312312313,'2025-10-15 10:00:00','Rutiin kontroll',85.00,'2025-10-30 08:42:34','2025-10-30 08:42:34'),(3,'202',12312312314,'2025-10-16 11:00:00','Hammaste kontroll',95.00,'2025-10-30 08:42:34','2025-10-30 08:42:34'),(4,'203',12312312315,'2025-10-17 09:30:00','Vaktsinatsioon',120.00,'2025-10-30 08:42:34','2025-10-30 08:42:34'),(5,'204',12312312316,'2025-10-18 14:00:00','Vigastuse ravi',150.00,'2025-10-30 08:42:34','2025-10-30 08:42:34'),(6,'205',12312312317,'2025-10-19 10:30:00','Kontroll peale ravi',75.00,'2025-10-30 08:42:34','2025-10-30 08:42:34'),(7,'206',12312312318,'2025-10-20 15:00:00','Üldine tervisekontroll',100.00,'2025-10-30 08:42:34','2025-10-30 08:42:34'),(8,'207',12312312319,'2025-10-21 09:00:00','Labori analüüsid',135.00,'2025-10-30 08:42:34','2025-10-30 08:42:34'),(9,'208',12312312320,'2025-10-22 11:30:00','Kopse kontroll',110.00,'2025-10-30 08:42:34','2025-10-30 08:42:34'),(10,'209',12312312321,'2025-10-23 13:00:00','Jalgade kontroll',90.00,'2025-10-30 08:42:34','2025-10-30 08:42:34'),(11,'210',12312312312,'2025-10-24 10:00:00','Hammasoperatsioon',200.00,'2025-10-30 08:42:34','2025-10-30 08:42:34'),(12,'211',12312312313,'2025-10-25 14:30:00','Kohustuslik kontroll',80.00,'2025-10-30 08:42:34','2025-10-30 08:42:34');
/*!40000 ALTER TABLE `visiit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'yhobu'
--

--
-- Dumping routines for database 'yhobu'
--

--
-- Current Database: `yhobu`
--

USE `yhobu`;

--
-- Final view structure for view `hobuse_treeningud`
--

/*!50001 DROP VIEW IF EXISTS `hobuse_treeningud`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`testuser`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `hobuse_treeningud` AS select `h`.`nimi` AS `hobuse_nimi`,count(`t`.`id`) AS `treeningute_arv` from (`hobune` `h` left join `treening` `t` on((`h`.`registreerimiskood` = `t`.`hobune_registreerimiskood`))) group by `h`.`registreerimiskood`,`h`.`nimi` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `nimed`
--

/*!50001 DROP VIEW IF EXISTS `nimed`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`testuser`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `nimed` AS select `o`.`eesnimi` AS `eesnimi`,`o`.`perekonnanimi` AS `perekonnanimi`,`h`.`nimi` AS `nimi` from (`omanik` `o` left join `hobune` `h` on((`o`.`isikukood` = `h`.`omanik_isikukood`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `omanik_arsti_maksed`
--

/*!50001 DROP VIEW IF EXISTS `omanik_arsti_maksed`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`testuser`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `omanik_arsti_maksed` AS select `o`.`eesnimi` AS `omanik_eesnimi`,`o`.`perekonnanimi` AS `omanik_perekonnanimi`,`h`.`nimi` AS `hobuse_nimi`,`v`.`arst_isikukood` AS `arst_isikukood`,`v`.`hind` AS `visiidi_tasu` from ((`omanik` `o` join `hobune` `h` on((`o`.`isikukood` = `h`.`omanik_isikukood`))) join `visiit` `v` on((`h`.`registreerimiskood` = `v`.`hobune_registreerimiskood`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `omanik_inventari_kulud`
--

/*!50001 DROP VIEW IF EXISTS `omanik_inventari_kulud`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`testuser`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `omanik_inventari_kulud` AS select `o`.`eesnimi` AS `eesnimi`,`o`.`perekonnanimi` AS `perekonnanimi`,coalesce(sum(`i`.`hind`),0) AS `kogumaksumUs` from (`omanik` `o` left join `inventar` `i` on((`o`.`isikukood` = `i`.`omanik_isikukood`))) group by `o`.`isikukood`,`o`.`eesnimi`,`o`.`perekonnanimi` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tallimehed`
--

/*!50001 DROP VIEW IF EXISTS `tallimehed`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`testuser`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `tallimehed` AS select `personal`.`isikukood` AS `isikukood`,`personal`.`eesnimi` AS `eesnimi`,`personal`.`perekonnanimi` AS `perekonnanimi`,`personal`.`telefon` AS `telefon`,`personal`.`tall_kood` AS `tall_kood` from `personal` where (`personal`.`ametikoht` = 'tallimees') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `treenerite_programmid`
--

/*!50001 DROP VIEW IF EXISTS `treenerite_programmid`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`testuser`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `treenerite_programmid` AS select `p`.`eesnimi` AS `eesnimi`,`p`.`perekonnanimi` AS `perekonnanimi`,`tp`.`nimi` AS `programmi_nimi`,`tp`.`kirjeldus` AS `kirjeldus` from (`personal` `p` join `treeningprogramm` `tp` on((`p`.`isikukood` = `tp`.`vastutaja`))) where (`p`.`ametikoht` = 'treener') */;
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

-- Dump completed on 2025-10-30  8:43:41
