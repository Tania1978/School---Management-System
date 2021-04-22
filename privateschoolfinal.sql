-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: privateschool
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `assignments`
--

DROP TABLE IF EXISTS `assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(40) NOT NULL,
  `description` varchar(100) NOT NULL,
  `submission_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignments`
--

LOCK TABLES `assignments` WRITE;
/*!40000 ALTER TABLE `assignments` DISABLE KEYS */;
INSERT INTO `assignments` VALUES (1,'Biology 1','Introduction to Evolutionary Concepts','2020-11-15'),(2,'Biology 2','Paper on Meta-Darwinian Theory of Evolution','2021-03-12'),(3,'Physics 1','Motion in two dimensions','2020-11-05'),(4,'Physics 2','Motion: circular motion, relative motion','2020-12-15'),(5,'Music 1','Video Assignment','2020-04-20'),(6,'Music 2','Band Project','2020-05-15'),(7,'Arts 1','3D Landscapes','2020-12-15'),(8,'Arts 2','Portraits','2021-04-07');
/*!40000 ALTER TABLE `assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignmentspercourse`
--

DROP TABLE IF EXISTS `assignmentspercourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignmentspercourse` (
  `assignment_id` int NOT NULL,
  `course_id` int NOT NULL,
  PRIMARY KEY (`assignment_id`,`course_id`),
  KEY `FK_asspercourse_course_id__courses_id` (`course_id`),
  CONSTRAINT `FK_asspercourse_assignment_id__assignments_id` FOREIGN KEY (`assignment_id`) REFERENCES `assignments` (`id`),
  CONSTRAINT `FK_asspercourse_course_id__courses_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignmentspercourse`
--

LOCK TABLES `assignmentspercourse` WRITE;
/*!40000 ALTER TABLE `assignmentspercourse` DISABLE KEYS */;
INSERT INTO `assignmentspercourse` VALUES (1,1),(2,1),(3,2),(4,2),(5,3),(6,3),(7,4),(8,4);
/*!40000 ALTER TABLE `assignmentspercourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `stream` varchar(20) NOT NULL,
  `type` enum('full_time','part_time') NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'Biology','Evolution','full_time','2020-09-10','2021-05-31'),(2,'Physics','Kinematics','part_time','2020-10-17','2021-01-31'),(3,'Music','Guitar','part_time','2020-03-15','2020-06-15'),(4,'Arts','Painting','full_time','2020-09-10','2021-05-31');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollments`
--

DROP TABLE IF EXISTS `enrollments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollments` (
  `student_id` int NOT NULL,
  `course_id` int NOT NULL,
  `enrollment_date` date DEFAULT NULL,
  `tuition_fees` int DEFAULT NULL,
  PRIMARY KEY (`student_id`,`course_id`),
  KEY `FK_enrollments_course_id__courses_id` (`course_id`),
  CONSTRAINT `FK_enrollments_course_id__courses_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  CONSTRAINT `FK_enrollments_student_id__students_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollments`
--

LOCK TABLES `enrollments` WRITE;
/*!40000 ALTER TABLE `enrollments` DISABLE KEYS */;
INSERT INTO `enrollments` VALUES (1,1,'2020-10-10',500),(1,4,'2020-10-13',500),(2,3,'2020-09-10',500),(3,2,'2020-09-05',500),(3,3,'2020-08-16',500),(4,1,'2020-09-20',500),(5,1,'2020-07-23',500),(5,4,'2020-07-26',500),(6,3,'2020-10-02',500),(7,2,'2020-10-01',500),(8,4,'2020-06-30',500),(9,2,'2020-07-16',500),(9,3,'2020-07-12',500),(10,1,'2020-09-18',500),(11,2,'2020-09-10',500),(12,1,'2020-10-13',500),(12,4,'2020-10-02',500);
/*!40000 ALTER TABLE `enrollments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scorescard`
--

DROP TABLE IF EXISTS `scorescard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scorescard` (
  `student_id` int NOT NULL,
  `course_id` int NOT NULL,
  `assignment_id` int NOT NULL,
  `oral_grade` int DEFAULT '0',
  `total_grade` int DEFAULT '0',
  PRIMARY KEY (`student_id`,`course_id`,`assignment_id`),
  KEY `FK_scorescard__assignmentspercourse` (`assignment_id`,`course_id`),
  CONSTRAINT `FK_scorescard__assignmentspercourse` FOREIGN KEY (`assignment_id`, `course_id`) REFERENCES `assignmentspercourse` (`assignment_id`, `course_id`),
  CONSTRAINT `FK_scorescard__enrollments` FOREIGN KEY (`student_id`, `course_id`) REFERENCES `enrollments` (`student_id`, `course_id`),
  CONSTRAINT `scorescard_chk_1` CHECK ((`oral_grade` between 0 and 20)),
  CONSTRAINT `scorescard_chk_2` CHECK ((`total_grade` between 0 and 80))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scorescard`
--

LOCK TABLES `scorescard` WRITE;
/*!40000 ALTER TABLE `scorescard` DISABLE KEYS */;
INSERT INTO `scorescard` VALUES (1,1,1,16,79),(1,1,2,16,79),(1,4,7,0,0),(1,4,8,16,79),(2,3,5,18,70),(2,3,6,18,79),(3,2,3,15,78),(3,2,4,16,79),(3,3,5,14,75),(3,3,6,12,79),(4,1,1,16,68),(4,1,2,16,75),(5,1,1,17,79),(5,1,2,16,78),(5,4,7,17,75),(5,4,8,19,69),(6,3,5,19,72),(6,3,6,15,79),(7,2,3,16,79),(7,2,4,0,0),(8,4,7,20,59),(8,4,8,16,67),(9,2,3,15,75),(9,2,4,18,79),(9,3,5,16,79),(9,3,6,16,75),(10,1,1,13,65),(10,1,2,14,70),(11,2,3,0,0),(11,2,4,16,79),(12,1,1,0,0),(12,1,2,12,73),(12,4,7,17,70),(12,4,8,0,0);
/*!40000 ALTER TABLE `scorescard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `date_of_birth` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Liam','Smith','1978-02-03'),(2,'John','Graves','1985-02-07'),(3,'Oliver','Jones','1983-04-12'),(4,'William','Boyd','1990-05-26'),(5,'Maria','Kanari','1978-06-23'),(6,'Helen','Rogers','1979-08-08'),(7,'Olivia','Newton','1982-09-07'),(8,'Emma','Collins','1984-02-05'),(9,'Nikol','Smith','1983-12-16'),(10,'Tania','Varens','1988-11-18'),(11,'Yiannis','Karageorgis','1991-04-01'),(12,'Dimitris','Habakis','1982-12-07');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainers`
--

DROP TABLE IF EXISTS `trainers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `subject` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainers`
--

LOCK TABLES `trainers` WRITE;
/*!40000 ALTER TABLE `trainers` DISABLE KEYS */;
INSERT INTO `trainers` VALUES (1,'Eleni','Smaragdi','Biology'),(2,'Dimitris','Karagiannis','Biology'),(3,'Christos','Kalopoulos','Physics'),(4,'John','Karens','Physics'),(5,'Maria','Koliva','Music'),(6,'Aliki','Tsalikoglou','Music'),(7,'Kostas','Dimitriadis','Arts'),(8,'Kelly','Moisidou','Arts');
/*!40000 ALTER TABLE `trainers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainerspercourse`
--

DROP TABLE IF EXISTS `trainerspercourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainerspercourse` (
  `trainer_id` int NOT NULL,
  `course_id` int NOT NULL,
  PRIMARY KEY (`trainer_id`,`course_id`),
  KEY `FK_trainerspercourse_course_id__courses_id` (`course_id`),
  CONSTRAINT `FK_trainerspercourse_course_id__courses_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  CONSTRAINT `FK_trainerspercourse_trainer_id__trainers_id` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainerspercourse`
--

LOCK TABLES `trainerspercourse` WRITE;
/*!40000 ALTER TABLE `trainerspercourse` DISABLE KEYS */;
INSERT INTO `trainerspercourse` VALUES (1,1),(2,1),(3,2),(4,2),(5,3),(6,3),(7,4),(8,4);
/*!40000 ALTER TABLE `trainerspercourse` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-14  8:15:01
