USE assignment1;

DROP TABLE IF EXISTS `cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cards` (
  `card_id` int NOT NULL AUTO_INCREMENT,
  `card_name` varchar(45) DEFAULT NULL,
  `card_num` varchar(45) DEFAULT NULL,
  `card_cvc` varchar(45) DEFAULT NULL,
  `card_date` varchar(45) DEFAULT NULL,
  `card_user` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`card_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cards`
--

LOCK TABLES `cards` WRITE;
/*!40000 ALTER TABLE `cards` DISABLE KEYS */;
INSERT INTO `cards` VALUES (1,'asdf','asdf','asdf','2012-00-10 12',NULL),(2,'asdf','asdf','asdf','2012-00-10 12','1'),(3,'asdf','asdf','asdf','2012-00-10 12','1'),(4,'adf','adf','daf','1996-00-15 01','10'),(5,'asdf','asdf','asdf','2012-00-10 12','1'),(6,'asdf','saf','sdf','1996-00-15 01','11'),(7,'dsaf','asf','asdf','1996-00-15 01','12'),(8,'asdfasd','asfsdaf','asdfsdf','1996-00-15 01','13'),(9,'asdf','adf','sdf','1996-00-15 01','15'),(10,'asdf','asd','sda','1996-00-15 01','16'),(11,'asdf','sadf','sd','1996-00-15 01','17'),(12,'asdfsadf','adf','asdfasfd','1996-00-15 01','18'),(29,'234535','45335','453453','1996-00-15 01','25'),(35,'9895191','984984954','54','1997-00-15 01','25'),(36,'6316','saf','asdf','1996-00-15 01','26'),(37,'qe','qew','wrq','1996-00-15 01','27'),(38,'asdf','432453','453','1996-00-15 01','34'),(39,'64654654','','','1996-00-15 01','36'),(40,'3565654','654654654654','654','1996-00-15 01','37'),(43,'32154','442','24445','1996-00-15 01','25'),(44,'fsdafsad','2454','245','1996-00-15 01','39');
/*!40000 ALTER TABLE `cards` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-04 16:08:17

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight` (
  `flight_id` int NOT NULL AUTO_INCREMENT,
  `departing` varchar(45) DEFAULT NULL,
  `destination` varchar(45) DEFAULT NULL,
  `departure_time` datetime DEFAULT NULL,
  PRIMARY KEY (`flight_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES (3,'ireland','france','1996-10-15 05:35:32'),(4,'ireland','france','1996-10-15 05:35:32'),(5,'ireland','france','1996-10-15 05:35:32');
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-04 16:08:16
-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: assignment1
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(60) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `surname` varchar(45) DEFAULT NULL,
  `card_id` varchar(45) DEFAULT NULL,
  `number` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'sadf','asdfdsa','asdfdsa','asdffdsa',NULL,'martin','nasdf','0',NULL),(3,'sadffdsa','asdfdsa','asdfdsa','asdffdsa',NULL,'martin','nasdf','0',NULL),(5,'martinconlon22@gmail.comasdf','22','22','+353876967008',NULL,'Martin','Conlon','0',NULL),(6,'martinconlon22@gmail.comasdfsdaf','22','22','+353876967008',NULL,'Martin','Conlon','0',NULL),(7,'martinconsadflon22@gmail.com','22','22','+353876967008',NULL,'Martin','Conlon','0',NULL),(8,'','','','',NULL,'','',NULL,NULL),(9,'martiasdfconlon22@gmail.com','22','22','+353876967008',NULL,'Martin','Conlon',NULL,NULL),(10,'msdgagartinconlon22@gmail.com','22','22','+353876967008',NULL,'Martin','Conlon',NULL,NULL),(11,'martinconsflon22@gmail.com','22','22','+353876967008',NULL,'Martin','Conlon',NULL,NULL),(12,'martincosfanlon22@gmail.com','4724 West 6th Avenue','4724 West 6th Avenue','0830344536',NULL,'Martin','Conlon',NULL,NULL),(13,'martinconldsfaon22@gmail.com','22','22','+353876967008',NULL,'Martin','Conlon',NULL,NULL),(15,'martinconloasdfsdafn22@gmail.com','22','22','+353876967008',NULL,'Martin','Conlon',NULL,NULL),(16,'martinsadfconlon22@gmail.com','22','22','+353876967008',NULL,'Martin','Conlon',NULL,NULL),(17,'martinconlon22dsfaf@gmail.com','22','22','+353876967008',NULL,'Martin','Conlon',NULL,NULL),(18,'martinconladfsdafon22@gmail.com','22','22','+353876967008',NULL,'Martin','Conlon',NULL,NULL),(19,'martinconlasdfasdfon22@gmail.com','22','22','martinconlon22@gmail.com',NULL,'martinconlon22@gmail.com','martinconlon22@gmail.com',NULL,NULL),(21,'martincoasdfhnlon2asdfsadfh2@gmail.com','22','22','martinconlon22@gmail.com',NULL,'martinconlon22@gmail.com','martinconlon22@gmail.com',NULL,NULL),(22,'martinconlon22gmail.com','22','22','martinconlon22@gmail.com',NULL,'martinconlon22@gmail.com','martinconlon22@gmail.com',NULL,NULL),(24,'martincfsadfsdaonlon22fsdaf@gmail.com','22','22','martinconlon22@gmail.com',NULL,'martinconlon22@gmail.com','martinconlon22@gmail.com',NULL,NULL),(25,'martinconlon22@gmail.cfdsdfom','22','22','martinconlon22@gmail.com',NULL,'martinconlon22@gmail.com','martinconlon22@gmail.com',NULL,NULL),(26,'martincodsdafnlon22@gmail.com','22','22','martinconlon22@gmail.com',NULL,'martinconlon22@gmail.com','martinconlon22@gmail.com',NULL,NULL),(27,'martincovsavsdfcasdnlon22@gmail.com','22','22','martinconlon22@gmail.com',NULL,'martinconlon22@gmail.com','martinconlon22@gmail.com',NULL,NULL),(28,'martinconlosagfqwfasdfasdfn22@gmail.com','22','22','martinconlon22@gmail.com',NULL,'martinconlon22@gmail.com','martinconlon22@gmail.com',NULL,NULL),(29,'martincosafasdfsdnlon22@gmail.com','22','22','martinconlon22@gmail.com',NULL,'martinconlon22@gmail.com','martinconlon22@gmail.com',NULL,NULL),(30,'martinfsadfconlsdfdsafdsafon22@gmail.com','22','22','martinconlon22@gmail.com',NULL,'martinconlon22@gmail.com','martinconlon22@gmail.com',NULL,NULL),(31,'martinconlon22dafdsaff@gmail.com','22','22','martinconlon22@gmail.com',NULL,'martinconlon22@gmail.com','martinconlon22@gmail.com',NULL,NULL),(32,'martinconlonsdafas dfs22@gmail.com','22','22','martinconlon22@gmail.com',NULL,'martinconlon22@gmail.com','martinconlon22@gmail.com',NULL,NULL),(33,'mawdsfgadsfrtinconlon22@gmail.com','22','22','martinconlon22@gmail.com',NULL,'martinconlon22@gmail.com','martinconlon22@gmail.com',NULL,NULL),(34,'martincsdfaonlosadfsdafn22@gmail.com','22','22','martinconlon22@gmail.com',NULL,'martinconlon22@gmail.com','martinconlon22@gmail.com',NULL,NULL),(36,'martincofsdafdsaflon22@gmail.com','22','22','martinconlon22@gmail.com',NULL,'martinconlon22@gmail.com','martinconlon22@gmail.com',NULL,NULL),(37,'martinconlocgvssdfgasdfn22@gmail.com','22','22','martinconlon22@gmail.com',NULL,'martinconlon22@gmail.com','martinconlon22@gmail.com',NULL,NULL),(38,'martinconlon22@gmail.comdfgsdfsdafsda','22','22','martinconlon22@gmail.com',NULL,'martinconlon22@gmail.com','martinconlon22@gmail.com',NULL,NULL),(39,'martinconlon22fsdafsdafsdg@gmail.com','22','22','martinconlon22@gmail.com',NULL,'martinconlon22@gmail.com','martinconlon22@gmail.com',NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-04 16:08:17

DROP TABLE IF EXISTS `user_reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_reservations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `flight_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_reservations`
--

LOCK TABLES `user_reservations` WRITE;
/*!40000 ALTER TABLE `user_reservations` DISABLE KEYS */;
INSERT INTO `user_reservations` VALUES (2,1,2),(3,11,3),(4,12,3),(5,13,3),(6,15,4),(7,16,3),(8,17,2),(9,18,3),(23,34,3),(24,36,3),(25,37,2),(27,38,3),(28,25,3),(29,39,3);
/*!40000 ALTER TABLE `user_reservations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-04 16:08:17

