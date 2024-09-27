-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: myadmindb
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `buildinga`
--

DROP TABLE IF EXISTS `buildinga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buildinga` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `family` varchar(255) NOT NULL,
  `cardno` varchar(255) NOT NULL,
  `groupid` varchar(255) NOT NULL,
  `usr` varchar(255) DEFAULT NULL,
  `psw` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `regdate` bigint DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buildinga`
--

LOCK TABLES `buildinga` WRITE;
/*!40000 ALTER TABLE `buildinga` DISABLE KEYS */;
INSERT INTO `buildinga` VALUES (1,'АЛЕКСАНДЪР','ЧЕРВЕНКОВ','692511','1','usr','psw','email','15',1566302056,'pic0',1,'наемател'),(2,'ЕРВИН','ИВАНОВ','708616','1','usr','psw','email','15',1566302056,'pic0',1,'наемател'),(3,'СВИЛЕН','СИМЕОНОВ','13181465','2','usr','psw','email','3',1566302056,'pic0',1,'доцент'),(4,'АТАНАС','КУРУТОС','1194957','1','usr','psw','email','3',1566302056,'pic0',1,'гл. асистент'),(5,'ДАНИЕЛА','АНТОНОВА','1508231','1','usr','psw','email','7',1566302056,'pic0',1,'доцент'),(6,'КРАСИМИРА','ДИКОВА','2100398','2','usr','psw','email','1',1566302056,'pic0',1,'асистент'),(7,'НИКОЛАЙ','ВАСИЛЕВ','2100400','1','usr','psw','email','2',1566302056,'pic0',1,'професор'),(8,'БОЖАНКА','МИХОВА','2100439','1','usr','psw','email','1',1566302056,'pic0',1,'асоцииран член'),(9,'МАРГАРИТА','ПОПОВА','14565860','1','usr','psw','email','8',1566302056,'pic0',1,'научен секретар'),(10,'НАДЕЖДА','ПЕТРОВА','2187388','1','usr','psw','email','5',1566302056,'pic0',1,'доцент'),(11,'МИЛЕНА','СПАСОВА','2189638','1','usr','psw','email','5',1566302056,'pic0',1,'доцент'),(12,'ИВАНКА','СТОЙНЕВА','2290701','1','usr','psw','email','9',1566302056,'pic0',1,'асоцииран член'),(13,'ВЕСЕЛА','КЪНЧЕВА','2321034','1','usr','psw','email','7',1566302056,'pic0',1,'химик'),(14,'ЮЛИАНА','РАЙНОВА','2323047','1','usr','psw','email','6',1566302056,'pic0',1,'гл. асистент'),(15,'СТЕФАН','ФИЛИПОВ','2325453','1','usr','psw','email','4',1566302056,'pic0',1,'пом. директор'),(16,'ИВАН','АНГЕЛОВ','2326217','1','usr','psw','email','6',1566302056,'pic0',1,'доцент'),(17,'ПЛАМЕН','ХРИСТОВ','2376106','1','usr','psw','email','6',1566302056,'pic0',1,'биолог'),(18,'ПЕТЪР','НЕДКОВ','2392277','1','usr','psw','email','15',1566302056,'pic0',1,'наемател'),(19,'АДРИАНА','СЛАВОВА - КАЗАКОВА','2392685','1','usr','psw','email','7',1566302056,'pic0',1,'гл. асистент'),(20,'КАПКА','СИРАКОВА','2405076','1','usr','psw','email','12',1566302056,'pic0',1,'чистач'),(21,'СВЕТЛАНА','МОМЧИЛОВА','2406799','2','usr','psw','email','7',1566302056,'pic0',1,'доцент'),(22,'НАТАЛИЯ','МАНИКАТОВА','2590048','1','usr','psw','email','15',1566302056,'pic0',1,'наемател'),(23,'ПОСЕТИТЕЛ','17','2590736','1','usr','psw','email','14',1566302056,'pic0',1,''),(24,'ПОСЕТИТЕЛ','18','2592041','1','usr','psw','email','14',1566302056,'pic0',1,''),(25,'ПОСЕТИТЕЛ','19','2602445','1','usr','psw','email','14',1566302056,'pic0',1,''),(26,'МИХАИЛ','ТОДОРОВ','2605475','1','usr','psw','email','15',1566302056,'pic0',1,'наемател');
/*!40000 ALTER TABLE `buildinga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buildingb`
--

DROP TABLE IF EXISTS `buildingb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buildingb` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `family` varchar(255) NOT NULL,
  `cardno` varchar(255) NOT NULL,
  `groupid` varchar(255) NOT NULL,
  `usr` varchar(255) DEFAULT NULL,
  `psw` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `regdate` bigint DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buildingb`
--

LOCK TABLES `buildingb` WRITE;
/*!40000 ALTER TABLE `buildingb` DISABLE KEYS */;
INSERT INTO `buildingb` VALUES (1,'ГЕОРГИ','СТОЯНОВ','872311','1','usr','psw','email','10',1666302056,'pic0',1,'администратор'),(2,'АЛЕНА','МАРИНОВА','892515','1','usr','psw','email','11',1666302056,'pic0',1,'гл. асистент'),(3,'СТАНИСЛАВ','ПЕТРОВ','13574891','2','usr','psw','email','5',1666302056,'pic0',1,'доцент'),(4,'АНТОНИ','ХРИСТОВ','1197757','1','usr','psw','email','6',1666302056,'pic0',1,'научен сътрудник'),(5,'ЛЮБОВ','МИЛЕВА','1678931','1','usr','psw','email','12',1666302056,'pic0',1,'асистент'),(6,'ВАСИЛ','ЙОРДАНОВ','2200198','2','usr','psw','email','13',1666302056,'pic0',1,'инженер');
/*!40000 ALTER TABLE `buildingb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buildingc`
--

DROP TABLE IF EXISTS `buildingc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buildingc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `family` varchar(255) NOT NULL,
  `cardno` varchar(255) NOT NULL,
  `groupid` varchar(255) NOT NULL,
  `usr` varchar(255) DEFAULT NULL,
  `psw` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `regdate` bigint DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buildingc`
--

LOCK TABLES `buildingc` WRITE;
/*!40000 ALTER TABLE `buildingc` DISABLE KEYS */;
INSERT INTO `buildingc` VALUES (1,'ЕМИЛИЯ','ДИМИТРОВА','992301','2','usr','psw','email','14',1766302056,'pic1',1,'ученик'),(2,'ЗОРНИЦА','ПЕТКОВА','973412','3','usr','psw','email','15',1766302056,'pic1',1,'асистент'),(3,'ХРИСТО','ПАВЛОВ','1234512','1','usr','psw','email','6',1766302056,'pic1',1,'лектор'),(4,'АНТОН','ГЕОРГИЕВ','987451','2','usr','psw','email','3',1766302056,'pic1',1,'изследовател');
/*!40000 ALTER TABLE `buildingc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buildingd`
--

DROP TABLE IF EXISTS `buildingd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buildingd` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `family` varchar(255) NOT NULL,
  `cardno` varchar(255) NOT NULL,
  `groupid` varchar(255) NOT NULL,
  `usr` varchar(255) DEFAULT NULL,
  `psw` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `regdate` bigint DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buildingd`
--

LOCK TABLES `buildingd` WRITE;
/*!40000 ALTER TABLE `buildingd` DISABLE KEYS */;
INSERT INTO `buildingd` VALUES (1,'ВИКТОРИЯ','ПЕТРОВА','445678','3','usr','psw','email','9',1666302056,'pic2',1,'наемател'),(2,'АНГЕЛ','СТЕФАНОВ','667891','1','usr','psw','email','5',1666302056,'pic2',1,'асоцииран член'),(3,'ВАЛЕРИ','МИХАЙЛОВ','128437','2','usr','psw','email','7',1666302056,'pic2',1,'администратор');
/*!40000 ALTER TABLE `buildingd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buildinge`
--

DROP TABLE IF EXISTS `buildinge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buildinge` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `family` varchar(255) NOT NULL,
  `cardno` varchar(255) NOT NULL,
  `groupid` varchar(255) NOT NULL,
  `usr` varchar(255) DEFAULT NULL,
  `psw` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `regdate` bigint DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buildinge`
--

LOCK TABLES `buildinge` WRITE;
/*!40000 ALTER TABLE `buildinge` DISABLE KEYS */;
INSERT INTO `buildinge` VALUES (1,'МИЛАН','МИХАЙЛОВ','897134','1','usr','psw','email','6',1567302056,'pic3',1,'асистент'),(2,'ДИМИТЪР','ИВАНОВ','892476','2','usr','psw','email','12',1567302056,'pic3',1,'доцент');
/*!40000 ALTER TABLE `buildinge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buildingf`
--

DROP TABLE IF EXISTS `buildingf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buildingf` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `family` varchar(255) NOT NULL,
  `cardno` varchar(255) NOT NULL,
  `groupid` varchar(255) NOT NULL,
  `usr` varchar(255) DEFAULT NULL,
  `psw` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `regdate` bigint DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buildingf`
--

LOCK TABLES `buildingf` WRITE;
/*!40000 ALTER TABLE `buildingf` DISABLE KEYS */;
/*!40000 ALTER TABLE `buildingf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buildingg`
--

DROP TABLE IF EXISTS `buildingg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buildingg` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `family` varchar(255) NOT NULL,
  `cardno` varchar(255) NOT NULL,
  `groupid` varchar(255) NOT NULL,
  `usr` varchar(255) DEFAULT NULL,
  `psw` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `regdate` bigint DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buildingg`
--

LOCK TABLES `buildingg` WRITE;
/*!40000 ALTER TABLE `buildingg` DISABLE KEYS */;
INSERT INTO `buildingg` VALUES (1,'КАТЕРИНА','МИХАЙЛОВА','883112','2','usr','psw','email','8',1666302056,'pic4',1,'асистент'),(2,'МИЛЕНА','СТОЕВА','879623','1','usr','psw','email','4',1666302056,'pic4',1,'професор'),(3,'БОЯН','ЙОРДАНОВ','1354873','2','usr','psw','email','3',1666302056,'pic4',1,'доцент');
/*!40000 ALTER TABLE `buildingg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buildingh`
--

DROP TABLE IF EXISTS `buildingh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buildingh` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `family` varchar(255) NOT NULL,
  `cardno` varchar(255) NOT NULL,
  `groupid` varchar(255) NOT NULL,
  `usr` varchar(255) DEFAULT NULL,
  `psw` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `regdate` bigint DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buildingh`
--

LOCK TABLES `buildingh` WRITE;
/*!40000 ALTER TABLE `buildingh` DISABLE KEYS */;
INSERT INTO `buildingh` VALUES (1,'МИРОСЛАВ','ТОДОРОВ','877311','1','usr','psw','email','11',1666302056,'pic5',1,'гл. асистент'),(2,'СВЕТЛИНА','ГАНЧЕВА','898145','2','usr','psw','email','14',1666302056,'pic5',1,'професор'),(3,'АНТОАН','СТАНЧЕВ','1245312','1','usr','psw','email','9',1666302056,'pic5',1,'научен сътрудник');
/*!40000 ALTER TABLE `buildingh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buildingi`
--

DROP TABLE IF EXISTS `buildingi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buildingi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `family` varchar(255) NOT NULL,
  `cardno` varchar(255) NOT NULL,
  `groupid` varchar(255) NOT NULL,
  `usr` varchar(255) DEFAULT NULL,
  `psw` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `regdate` bigint DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buildingi`
--

LOCK TABLES `buildingi` WRITE;
/*!40000 ALTER TABLE `buildingi` DISABLE KEYS */;
INSERT INTO `buildingi` VALUES (1,'СТЕФАН','РАДЕВ','798145','2','usr','psw','email','16',1666302056,'pic6',1,'администратор'),(2,'ЗЛАТИНА','ИВАНОВА','812346','1','usr','psw','email','5',1666302056,'pic6',1,'асистент'),(3,'КРИСТИНА','БОГДАНОВА','1490873','3','usr','psw','email','7',1666302056,'pic6',1,'асоцииран член');
/*!40000 ALTER TABLE `buildingi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `accessibleTables` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'userA','$2b$10$hashedPasswordA','BuildingA,BuildingB,BuildingC'),(2,'userB','$2b$10$hashedPasswordB','BuildingD,BuildingE,BuildingF'),(3,'userC','$2b$10$hashedPasswordC','BuildingG,BuildingH,BuildingI');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-25 23:56:56
