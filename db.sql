CREATE DATABASE  IF NOT EXISTS `myadmindb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `myadmindb`;
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
-- Table structure for table `book_keeping`
--

DROP TABLE IF EXISTS `book_keeping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_keeping` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ИД на клиент` int NOT NULL,
  `Име на клиент` varchar(255) NOT NULL,
  `Отдел` varchar(100) DEFAULT NULL,
  `Дата на Издаване` date DEFAULT NULL,
  `Дата на Плащане` date DEFAULT NULL,
  `Статус на Плащане` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_keeping`
--

LOCK TABLES `book_keeping` WRITE;
/*!40000 ALTER TABLE `book_keeping` DISABLE KEYS */;
INSERT INTO `book_keeping` VALUES (1,2001,'Компания АД','Финанси','2024-10-15','2024-10-20','Платен'),(2,2002,'Дружество ЕООД','Операции','2024-10-10','2024-10-21','Чакащо'),(3,2003,'Фирма ООД','Администрация','2024-10-05','2024-10-02','Неплатен');
/*!40000 ALTER TABLE `book_keeping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ИД на клиент` int NOT NULL,
  `Име на клиент` varchar(255) NOT NULL,
  `Отговорен служител` varchar(255) DEFAULT NULL,
  `Дата на регистрация` date DEFAULT NULL,
  `Дата на последна покупка` date DEFAULT NULL,
  `Статус на клиент` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,4001,'Клиент АД','Иван Тодоров','2023-02-15','2024-09-10','Активен'),(2,4002,'Партньор ООД','Мария Василева','2022-11-25','2024-08-30','Чакащо'),(3,4003,'Фирма Зет ЕООД','Георги Иванов','2021-04-14',NULL,'Неактивен');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ИД на отдел` int NOT NULL,
  `Име на отдел` varchar(255) NOT NULL,
  `Ръководител на отдел` varchar(255) DEFAULT NULL,
  `Дата на създаване` date DEFAULT NULL,
  `Брой служители` int DEFAULT NULL,
  `Статус` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,3001,'Продажби','Петър Димитров','2024-10-05',25,'Активен'),(2,3002,'ИТ','Александър Симеонов','2018-08-10',18,'Активен'),(3,3003,'Човешки ресурси','Елена Петрова','2019-01-20',10,'В процес на обновяване');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ИД на служител` int NOT NULL,
  `Име на служител` varchar(255) NOT NULL,
  `Отдел` varchar(100) DEFAULT NULL,
  `Време на Влизане` date DEFAULT NULL,
  `Време на Излизане` date DEFAULT NULL,
  `Статус` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,1001,'Иван Петров','Продажби','2024-10-21','2024-10-21','Активен'),(2,1002,'Мария Иванова','Маркетинг','2024-10-21','2024-10-21','Активен'),(3,1003,'Георги Георгиев','ИТ','2024-10-21','2024-10-21','Отсъстващ');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'userA','$2b$10$hashedPasswordA','BuildingA,BuildingB,BuildingC'),(2,'userB','$2b$10$hashedPasswordB','BuildingD,BuildingE,BuildingF'),(3,'userC','$2b$10$hashedPasswordC','BuildingG,BuildingH,BuildingI'),(4,'chavdar','123456','tableOne,tableTwo'),(5,'viktor','viktor','tableTwo,tableThree'),(6,'chavdar12','$2b$10$E3LwUsmXmYtD5AR.WCBfquSM5AxTu7sqS6cs64.rL5mD9U4l1wCt2','tableOne,tableTwo'),(7,'viktor1','$2b$10$HwFc59.F2W9qzf9pqm8StOMSTcMYjlJ6i5teRZpHfF9ROmrMqmCwy','tableOne,tableThree'),(8,'test','$2b$10$oGhFTSoTOcC/KarfV5aM2ev9eI0WHZdZftSTv1xl9QuZX1czPY1kK','emlpoyees,clients'),(9,'test1','$2b$10$ovP5KnQBe4SmqmWqq95VJOX78zCQDbKUnnRtAz9fkv0pbCj/HvvRi','departments,book_keeping');
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

-- Dump completed on 2024-10-21 15:54:22
