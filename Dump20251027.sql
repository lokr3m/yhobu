CREATE DATABASE  IF NOT EXISTS `yhobu` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `yhobu`;
-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: yhobu
-- ------------------------------------------------------
-- Server version	8.0.43

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
INSERT INTO `arst` VALUES (12312312312,'Hille','2025-10-27 16:01:22','2025-10-27 16:01:22'),(12312312313,'Edgar','2025-10-27 16:01:40','2025-10-27 16:01:40'),(12312312314,'Vassili','2025-10-27 16:01:40','2025-10-27 16:01:40');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Inventar koos hindadega';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventar`
--

LOCK TABLES `inventar` WRITE;
/*!40000 ALTER TABLE `inventar` DISABLE KEYS */;
INSERT INTO `inventar` VALUES (2,'Sadul',1203.00,NULL,36576574545,'2025-10-27 15:52:55','2025-10-27 15:53:34');
/*!40000 ALTER TABLE `inventar` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `omanik` VALUES (100000,'Aadu','Laid','Tallinn','55231231','2025-10-27 15:49:39','2025-10-27 15:49:39'),(100001,'Ester','Teeveer','Kuressaare','5832325','2025-10-27 15:49:39','2025-10-27 15:49:39'),(100002,'Raul','Väli','Paide','435345643','2025-10-27 15:49:39','2025-10-27 15:49:39'),(100003,'Mihkel','Soo','Lehtse','534345','2025-10-27 15:49:39','2025-10-27 15:49:39'),(100004,'Paavo','Neihaus','Aruküla','34534','2025-10-27 15:49:39','2025-10-27 15:49:39'),(100005,'Oskar','Vallik','Tartu','','2025-10-27 15:49:39','2025-10-27 15:49:39'),(100006,'Reet','Romanjuk','Pärnu','52377','2025-10-27 15:49:39','2025-10-27 15:49:39'),(100008,'Carina Romana','Ciaro','Ikla','53242342','2025-10-27 15:49:39','2025-10-27 15:49:39'),(36576574545,'Üllar','Lindmaa','Mooste','557877667','2025-10-27 15:49:39','2025-10-27 15:49:39');
/*!40000 ALTER TABLE `omanik` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Inventar koos hindadega';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visiit`
--

LOCK TABLES `visiit` WRITE;
/*!40000 ALTER TABLE `visiit` DISABLE KEYS */;
INSERT INTO `visiit` VALUES (1,'220',12312312312,'2025-11-02 00:00:00','Hobune on täiesti terve',125.00,'2025-10-27 16:03:00','2025-10-27 16:03:00');
/*!40000 ALTER TABLE `visiit` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-27 18:03:57
