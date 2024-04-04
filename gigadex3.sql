
Create database pokemon;
USE pokemon;
DROP TABLE IF EXISTS `evolutions`;
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
LOCK TABLES `evolutions` WRITE;
INSERT INTO `evolutions` VALUES (1,1,2,3),(2,4,5,6),(3,7,8,9),(4,NULL,NULL,NULL);
UNLOCK TABLES;
DROP TABLE IF EXISTS `mon_info`;
CREATE TABLE `mon_info` (
  `mon_id` int NOT NULL,
  `mon_name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`mon_id`),
  CONSTRAINT `info_to_nat` FOREIGN KEY (`mon_id`) REFERENCES `national_dex` (`national_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `mon_info` WRITE;
INSERT INTO `mon_info` VALUES (1,'Bulbasaur','Seed Pokemon'),(2,'Ivysaur','Seed Pokemon'),(3,'Venusaur','Seed Pokemon'),(4,'Charmander','Lizard Pokemon'),(5,'Charmeleon','Flame Pokemon'),(6,'Charizard','Flame Pokemon'),(7,'Squirtle','Tiny Turtle Pokemon'),(8,'Wartortle','Turtle Pokemon'),(9,'Blastoise','Shellfish Pokemon');
UNLOCK TABLES;
DROP TABLE IF EXISTS `national_dex`;
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
LOCK TABLES `national_dex` WRITE;
INSERT INTO `national_dex` VALUES (1,1,5,8,1),(2,1,5,8,1),(3,1,5,8,1),(4,1,2,NULL,2),(5,1,2,NULL,2),(6,1,2,10,2),(7,1,3,NULL,3),(8,1,3,NULL,3),(9,1,3,NULL,3);
UNLOCK TABLES;
DROP TABLE IF EXISTS `p_types`;
CREATE TABLE `p_types` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(45) NOT NULL DEFAULT 'Normal',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `p_types` WRITE;
INSERT INTO `p_types` VALUES (1,'Normal'),(2,'Fire'),(3,'Water'),(4,'Electric'),(5,'Grass'),(6,'Ice'),(7,'Fighting'),(8,'Poison'),(9,'Ground'),(10,'Flying'),(11,'Psychic'),(12,'Bug'),(13,'Rock'),(14,'Ghost'),(15,'Dragon'),(16,'Dark'),(17,'Steel'),(18,'Fairy');
UNLOCK TABLES;
DROP TABLE IF EXISTS `regions`;
CREATE TABLE `regions` (
  `region_id` int NOT NULL AUTO_INCREMENT,
  `region_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`region_id`),
  UNIQUE KEY `region_id_UNIQUE` (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `regions` WRITE;
INSERT INTO `regions` VALUES (1,'Kanto'),(2,'Johto'),(3,'Hoenn'),(4,'Sinnoh'),(5,'Hisui'),(6,'Unova'),(7,'Kalos'),(8,'Alola'),(9,'Galar'),(10,'Paldea'),(11,'Kitakami');
UNLOCK TABLES;
