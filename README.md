DB SQL command. 
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: giga_pokedex
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `evolutions`
--

DROP TABLE IF EXISTS `evolutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evolutions` (
  `evo_id` int NOT NULL AUTO_INCREMENT,
  `basic` int DEFAULT NULL,
  `stage_one` int DEFAULT NULL,
  `stage_two` int DEFAULT NULL,
  PRIMARY KEY (`evo_id`),
  KEY `evo_to_base_idx` (`basic`),
  KEY `evo_to_s_1_idx` (`stage_one`),
  KEY `evo_to_s2_idx` (`stage_two`),
  CONSTRAINT `evo_to_base` FOREIGN KEY (`basic`) REFERENCES `national_dex` (`national_no`),
  CONSTRAINT `evo_to_s1` FOREIGN KEY (`stage_one`) REFERENCES `national_dex` (`national_no`),
  CONSTRAINT `evo_to_s2` FOREIGN KEY (`stage_two`) REFERENCES `national_dex` (`national_no`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evolutions`
--

LOCK TABLES `evolutions` WRITE;
/*!40000 ALTER TABLE `evolutions` DISABLE KEYS */;
INSERT INTO `evolutions` VALUES (1,1,2,3),(2,4,5,6),(3,7,8,9),(4,NULL,NULL,NULL);
/*!40000 ALTER TABLE `evolutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mon_info`
--

DROP TABLE IF EXISTS `mon_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mon_info` (
  `mon_id` int NOT NULL,
  `mon_name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`mon_id`),
  CONSTRAINT `info_to_nat` FOREIGN KEY (`mon_id`) REFERENCES `national_dex` (`national_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mon_info`
--

LOCK TABLES `mon_info` WRITE;
/*!40000 ALTER TABLE `mon_info` DISABLE KEYS */;
INSERT INTO `mon_info` VALUES (1,'Bulbasaur','Seed Pokemon'),(2,'Ivysaur','Seed Pokemon'),(3,'Venusaur','Seed Pokemon'),(4,'Charmander','Lizard Pokemon'),(5,'Charmeleon','Flame Pokemon'),(6,'Charizard','Flame Pokemon'),(7,'Squirtle','Tiny Turtle Pokemon'),(8,'Wartortle','Turtle Pokemon'),(9,'Blastoise','Shellfish Pokemon');
/*!40000 ALTER TABLE `mon_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `national_dex`
--

DROP TABLE IF EXISTS `national_dex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `national_dex` (
  `national_no` int NOT NULL AUTO_INCREMENT,
  `region` int NOT NULL,
  `primary_type` int NOT NULL,
  `secondary_type` int DEFAULT NULL,
  `evolution_tree` int NOT NULL,
  PRIMARY KEY (`national_no`),
  UNIQUE KEY `national_no_UNIQUE` (`national_no`),
  KEY `mon_to_evo_idx` (`evolution_tree`),
  KEY `mon_to_type_1_idx` (`primary_type`),
  KEY `mon_to_type_2_idx` (`secondary_type`),
  KEY `mon_to_region_idx` (`region`),
  CONSTRAINT `mon_to_evo` FOREIGN KEY (`evolution_tree`) REFERENCES `evolutions` (`evo_id`),
  CONSTRAINT `mon_to_region` FOREIGN KEY (`region`) REFERENCES `regions` (`region_id`),
  CONSTRAINT `mon_to_type_1` FOREIGN KEY (`primary_type`) REFERENCES `p_types` (`type_id`),
  CONSTRAINT `mon_to_type_2` FOREIGN KEY (`secondary_type`) REFERENCES `p_types` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `national_dex`
--

LOCK TABLES `national_dex` WRITE;
/*!40000 ALTER TABLE `national_dex` DISABLE KEYS */;
INSERT INTO `national_dex` VALUES (1,1,5,8,1),(2,1,5,8,1),(3,1,5,8,1),(4,1,2,NULL,2),(5,1,2,NULL,2),(6,1,2,10,2),(7,1,3,NULL,3),(8,1,3,NULL,3),(9,1,3,NULL,3);
/*!40000 ALTER TABLE `national_dex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `p_types`
--

DROP TABLE IF EXISTS `p_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `p_types` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(45) NOT NULL DEFAULT 'Normal',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `p_types`
--

LOCK TABLES `p_types` WRITE;
/*!40000 ALTER TABLE `p_types` DISABLE KEYS */;
INSERT INTO `p_types` VALUES (1,'Normal'),(2,'Fire'),(3,'Water'),(4,'Electric'),(5,'Grass'),(6,'Ice'),(7,'Fighting'),(8,'Poison'),(9,'Ground'),(10,'Flying'),(11,'Psychic'),(12,'Bug'),(13,'Rock'),(14,'Ghost'),(15,'Dragon'),(16,'Dark'),(17,'Steel'),(18,'Fairy');
/*!40000 ALTER TABLE `p_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regions` (
  `region_id` int NOT NULL AUTO_INCREMENT,
  `region_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`region_id`),
  UNIQUE KEY `region_id_UNIQUE` (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regions`
--

LOCK TABLES `regions` WRITE;
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
INSERT INTO `regions` VALUES (1,'Kanto'),(2,'Johto'),(3,'Hoenn'),(4,'Sinnoh'),(5,'Hisui'),(6,'Unova'),(7,'Kalos'),(8,'Alola'),(9,'Galar'),(10,'Paldea'),(11,'Kitakami');
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-21 18:02:58


Terminal into directory and run command node script.js
