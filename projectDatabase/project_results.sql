-- MySQL dump 10.13  Distrib 8.0.25, for macos11 (x86_64)
--
-- Host: 127.0.0.1    Database: project
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `results`
--

DROP TABLE IF EXISTS `results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `results` (
  `raceID` int NOT NULL AUTO_INCREMENT,
  `raceName` varchar(255) NOT NULL,
  `quali16` int DEFAULT NULL,
  `quali55` int DEFAULT NULL,
  `race16` varchar(45) DEFAULT NULL,
  `race55` varchar(45) DEFAULT NULL,
  `points16` decimal(3,1) DEFAULT NULL,
  `points55` decimal(3,1) DEFAULT NULL,
  PRIMARY KEY (`raceID`),
  UNIQUE KEY `raceName_UNIQUE` (`raceName`),
  UNIQUE KEY `SessionID_UNIQUE` (`raceID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results`
--

LOCK TABLES `results` WRITE;
/*!40000 ALTER TABLE `results` DISABLE KEYS */;
INSERT INTO `results` VALUES (1,'Bahrain Grand Prix',4,8,'6','8',8.0,4.0),(2,'Emilia Romagna Grand Prix',4,11,'4','5',12.0,10.0),(3,'Portuguese Grand Prix',8,5,'6','11',8.0,0.0),(4,'Spanish Grand Prix',4,6,'4','7',12.0,6.0),(5,'Monaco Grand Prix',1,4,'DNS','2',0.0,18.0),(6,'Azerbaijan Grand Prix',1,5,'4','8',12.0,4.0),(7,'French Grand Prix',7,5,'16','11',0.0,0.0),(8,'Styrian Grand Prix',7,12,'7','6',6.0,8.0),(9,'Austrian Grand Prix',12,11,'8','5',4.0,10.0),(10,'British Grand Prix',4,11,'2','6',18.0,8.0),(11,'Hungarian Grand Prix',7,15,'DNF','3',0.0,15.0),(12,'Belgian Grand Prix',11,13,'8','10',2.0,0.5),(13,'Dutch Grand Prix',5,6,'5','7',10.0,6.0),(14,'Italian Grand Prix',6,7,'4','6',12.0,8.0),(15,'Russian Grand Prix',15,2,'15','3',0.0,15.0),(16,'Turkish Grand Prix',NULL,NULL,NULL,NULL,NULL,NULL),(17,'United States Grand Prix',NULL,NULL,NULL,NULL,NULL,NULL),(18,'Mexico City Grand Prix',NULL,NULL,NULL,NULL,NULL,NULL),(19,'São Paulo Grand Prix',NULL,NULL,NULL,NULL,NULL,NULL),(20,'Qatar Grand Prix',NULL,NULL,NULL,NULL,NULL,NULL),(21,'Saudi Arabian Grand Prix',NULL,NULL,NULL,NULL,NULL,NULL),(22,'Abu Dhabi Grand Prix',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `results` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-14 18:07:08
