-- MySQL dump 10.13  Distrib 8.4.11, for macos15 (arm64)
--
-- Host: localhost    Database: queryquest
-- ------------------------------------------------------
-- Server version	8.4.11

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
-- Table structure for table `borrow_transactions`
--

DROP TABLE IF EXISTS `borrow_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrow_transactions` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `resource_id` int NOT NULL,
  `borrow_date` date NOT NULL,
  `due_date` date NOT NULL,
  `return_date` date DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `student_id` (`student_id`),
  KEY `resource_id` (`resource_id`),
  CONSTRAINT `borrow_transactions_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  CONSTRAINT `borrow_transactions_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`),
  CONSTRAINT `borrow_transactions_chk_1` CHECK ((`due_date` >= `borrow_date`)),
  CONSTRAINT `borrow_transactions_chk_2` CHECK (((`return_date` is null) or (`return_date` >= `borrow_date`)))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrow_transactions`
--

LOCK TABLES `borrow_transactions` WRITE;
/*!40000 ALTER TABLE `borrow_transactions` DISABLE KEYS */;
INSERT INTO `borrow_transactions` VALUES (1,1,1,'2026-10-01','2026-10-08','2026-10-07'),(2,2,2,'2026-10-02','2026-10-09',NULL),(3,3,3,'2026-10-03','2026-10-10',NULL),(4,4,4,'2026-10-04','2026-10-11','2026-10-10'),(5,5,5,'2026-10-05','2026-10-12',NULL),(6,6,6,'2026-10-06','2026-10-13',NULL),(7,7,7,'2026-10-07','2026-10-14','2026-10-12'),(8,8,8,'2026-10-08','2026-10-15',NULL),(9,9,1,'2026-10-09','2026-10-16',NULL),(10,10,2,'2026-10-10','2026-10-17',NULL),(11,11,4,'2026-10-01','2026-10-08','2026-10-07'),(12,12,5,'2026-10-02','2026-10-09',NULL),(13,13,6,'2026-10-03','2026-10-10',NULL),(14,14,7,'2026-10-04','2026-10-11','2026-10-10'),(15,15,8,'2026-10-05','2026-10-12',NULL),(16,16,3,'2026-10-06','2026-10-13',NULL),(17,17,2,'2026-10-07','2026-10-14','2026-10-12'),(18,18,1,'2026-10-08','2026-10-15',NULL),(19,19,4,'2026-10-09','2026-10-16',NULL),(20,20,6,'2026-10-10','2026-10-17',NULL);
/*!40000 ALTER TABLE `borrow_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `department_id` int NOT NULL AUTO_INCREMENT,
  `department_name` varchar(100) NOT NULL,
  PRIMARY KEY (`department_id`),
  UNIQUE KEY `department_name` (`department_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Computer Science'),(3,'Electronics'),(2,'Information Technology');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources`
--

DROP TABLE IF EXISTS `resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resources` (
  `resource_id` int NOT NULL AUTO_INCREMENT,
  `resource_name` varchar(150) NOT NULL,
  `category` varchar(50) NOT NULL,
  `total_quantity` int NOT NULL DEFAULT '1',
  `available_quantity` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`resource_id`),
  CONSTRAINT `resources_chk_1` CHECK ((`total_quantity` >= 0)),
  CONSTRAINT `resources_chk_2` CHECK ((`available_quantity` >= 0)),
  CONSTRAINT `resources_chk_3` CHECK ((`available_quantity` <= `total_quantity`))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources`
--

LOCK TABLES `resources` WRITE;
/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
INSERT INTO `resources` VALUES (1,'Database Systems Textbook','Book',10,10),(2,'Arduino Starter Kit','Equipment',5,5),(3,'Raspberry Pi Kit','Equipment',4,4),(4,'Computer Networks Textbook','Book',8,8),(5,'Wireless Mouse','Accessory',12,12),(6,'Web Development Textbook','Book',6,6),(7,'HDMI Adapter','Accessory',7,7),(8,'Electronics Lab Kit','Equipment',5,5);
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `student_id` int NOT NULL AUTO_INCREMENT,
  `student_name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `department_id` int NOT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `email` (`email`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `students_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Supriya Patel','supriya234@gmail.com',1),(2,'Sandeep Shetty','sandeep09@gmail.com',2),(3,'Sanjana Dixit','s.dixit@gmail.com',1),(4,'Rohan Rao','rohan56@gmail.com',3),(5,'Ishani Sharma','ishani88@gmail.com',2),(6,'Aarav Mehta','aarav.mehta@example.com',1),(7,'Ananya Shah','ananya.shah@example.com',2),(8,'Vihaan Desai','vihaan.desai@example.com',3),(9,'Diya Kulkarni','diya.kulkarni@example.com',1),(10,'Aditya Joshi','aditya.joshi@example.com',2),(11,'Ira Kapoor','ira.kapoor@example.com',3),(12,'Reyansh Nair','reyansh.nair@example.com',1),(13,'Saanvi Rao','saanvi.rao@example.com',2),(14,'Arjun Patil','arjun.patil@example.com',3),(15,'Myra Iyer','myra.iyer@example.com',1),(16,'Kabir Malhotra','kabir.malhotra@example.com',2),(17,'Aditi Menon','aditi.menon@example.com',3),(18,'Rudra Verma','rudra.verma@example.com',1),(19,'Kiara Sinha','kiara.sinha@example.com',2),(20,'Dev Khanna','dev.khanna@example.com',3),(21,'Neel Shah','neel.shah@example.com',1),(22,'Riya Deshmukh','riya.deshmukh@example.com',2),(23,'Atharv Joshi','atharv.joshi@example.com',3),(24,'Anika Rao','anika.rao@example.com',1),(25,'Siddharth Jain','siddharth.jain@example.com',2),(26,'Meera Pillai','meera.pillai@example.com',3),(27,'Yash Thakur','yash.thakur@example.com',1),(28,'Navya Bhat','navya.bhat@example.com',2),(29,'Omkar Sawant','omkar.sawant@example.com',3),(30,'Tara Fernandes','tara.fernandes@example.com',1),(31,'Dhruv Sethi','dhruv.sethi@example.com',2),(32,'Avni Gokhale','avni.gokhale@example.com',3),(33,'Kunal Bansal','kunal.bansal@example.com',1),(34,'Pihu Arora','pihu.arora@example.com',2),(35,'Manav Chawla','manav.chawla@example.com',3),(36,'Shreya Naidu','shreya.naidu@example.com',1),(37,'Parth Trivedi','parth.trivedi@example.com',2),(38,'Ishita Bose','ishita.bose@example.com',3),(39,'Nikhil More','nikhil.more@example.com',1),(40,'Aanya Shetty','aanya.shetty@example.com',2),(41,'Pranav Kulkarni','pranav.kulkarni@example.com',3),(42,'Zara Merchant','zara.merchant@example.com',1),(43,'Harsh Vora','harsh.vora@example.com',2),(44,'Mira Chatterjee','mira.chatterjee@example.com',3),(45,'Sahil Pawar','sahil.pawar@example.com',1),(46,'Tanvi Reddy','tanvi.reddy@example.com',2),(47,'Vedant Shinde','vedant.shinde@example.com',3),(48,'Nisha Thomas','nisha.thomas@example.com',1),(49,'Akash Gupta','akash.gupta@example.com',2),(50,'Sia Anand','sia.anand@example.com',3);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-13 21:13:21
