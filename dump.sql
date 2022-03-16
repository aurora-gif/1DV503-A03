CREATE DATABASE  IF NOT EXISTS `hrdb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `hrdb`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: hrdb
-- ------------------------------------------------------
-- Server version	5.6.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `certificates`
--

DROP TABLE IF EXISTS `certificates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates` (
  `cert_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  `source` varchar(50) NOT NULL,
  `specialization` varchar(50) NOT NULL,
  `cert_date` date NOT NULL,
  `employees_employee_id` int(11) NOT NULL,
  PRIMARY KEY (`cert_id`),
  UNIQUE KEY `cert_id_UNIQUE` (`cert_id`),
  KEY `fk_certificates_employees1_idx` (`employees_employee_id`),
  CONSTRAINT `fk_certificates_employees1` FOREIGN KEY (`employees_employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates`
--

LOCK TABLES `certificates` WRITE;
/*!40000 ALTER TABLE `certificates` DISABLE KEYS */;
INSERT INTO `certificates` VALUES (7,'PhD','Al-Baath','SE','2020-01-01',10);
/*!40000 ALTER TABLE `certificates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `dep_id` int(11) NOT NULL AUTO_INCREMENT,
  `dep_name` varchar(45) NOT NULL,
  PRIMARY KEY (`dep_id`),
  UNIQUE KEY `dep_id_UNIQUE` (`dep_id`),
  UNIQUE KEY `name_UNIQUE` (`dep_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (3,'Desktop Apps'),(1,'Development'),(2,'Maintenance');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `father_name` varchar(50) NOT NULL,
  `mother_name` varchar(50) NOT NULL,
  `birth_date` date NOT NULL,
  `hire_date` date NOT NULL,
  `salary` int(11) NOT NULL,
  `blood_type` varchar(5) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `departments_dep_id` int(11) NOT NULL,
  `jobs_job_id` int(11) NOT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `employee_id_UNIQUE` (`employee_id`),
  KEY `fk_employees_departments_idx` (`departments_dep_id`),
  KEY `fk_employees_jobs1_idx` (`jobs_job_id`),
  CONSTRAINT `fk_employees_departments` FOREIGN KEY (`departments_dep_id`) REFERENCES `departments` (`dep_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_employees_jobs1` FOREIGN KEY (`jobs_job_id`) REFERENCES `jobs` (`job_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (10,'Abdo','Darbooli','Nasr','Fatemah','1988-05-10','2022-01-01',1200,'A+','M',1,3),(11,'Ali','Dali','Rami','Huda','1990-01-14','2021-01-20',1500,'A+','M',3,1);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `employees_punishments_view`
--

DROP TABLE IF EXISTS `employees_punishments_view`;
/*!50001 DROP VIEW IF EXISTS `employees_punishments_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `employees_punishments_view` (
  `employee_id` tinyint NOT NULL,
  `first_name` tinyint NOT NULL,
  `last_name` tinyint NOT NULL,
  `father_name` tinyint NOT NULL,
  `mother_name` tinyint NOT NULL,
  `birth_date` tinyint NOT NULL,
  `hire_date` tinyint NOT NULL,
  `salary` tinyint NOT NULL,
  `blood_type` tinyint NOT NULL,
  `gender` tinyint NOT NULL,
  `departments_dep_id` tinyint NOT NULL,
  `jobs_job_id` tinyint NOT NULL,
  `punishment_id` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `source` tinyint NOT NULL,
  `punishment_date` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `employees_employee_id` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_title` varchar(45) NOT NULL,
  `min_salary` int(11) NOT NULL,
  `max_salary` int(11) NOT NULL,
  PRIMARY KEY (`job_id`),
  UNIQUE KEY `job_id_UNIQUE` (`job_id`),
  UNIQUE KEY `title_UNIQUE` (`job_title`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (1,'Senior Software Developer',1500,3000),(2,'Software Architects',2000,4500),(3,'Technical support',1200,3100);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `punishments`
--

DROP TABLE IF EXISTS `punishments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `punishments` (
  `punishment_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL,
  `source` varchar(50) NOT NULL,
  `punishment_date` date NOT NULL,
  `description` varchar(500) NOT NULL,
  `employees_employee_id` int(11) NOT NULL,
  PRIMARY KEY (`punishment_id`),
  KEY `fk_punishments_employees1_idx` (`employees_employee_id`),
  CONSTRAINT `fk_punishments_employees1` FOREIGN KEY (`employees_employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `punishments`
--

LOCK TABLES `punishments` WRITE;
/*!40000 ALTER TABLE `punishments` DISABLE KEYS */;
INSERT INTO `punishments` VALUES (7,'t1','s1','2022-01-11','des 1',10),(8,'t2','s2','2022-01-04','des 2',10),(9,'t','s','2022-01-10','d',11);
/*!40000 ALTER TABLE `punishments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rewards`
--

DROP TABLE IF EXISTS `rewards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rewards` (
  `reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL,
  `source` varchar(50) DEFAULT NULL,
  `reward_date` date DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `employees_employee_id` int(11) NOT NULL,
  PRIMARY KEY (`reward_id`),
  KEY `fk_rewards_employees1_idx` (`employees_employee_id`),
  CONSTRAINT `fk_rewards_employees1` FOREIGN KEY (`employees_employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rewards`
--

LOCK TABLES `rewards` WRITE;
/*!40000 ALTER TABLE `rewards` DISABLE KEYS */;
INSERT INTO `rewards` VALUES (7,'type1','Team Leader-2','2021-11-01','Reasons',10);
/*!40000 ALTER TABLE `rewards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `employees_punishments_view`
--

/*!50001 DROP TABLE IF EXISTS `employees_punishments_view`*/;
/*!50001 DROP VIEW IF EXISTS `employees_punishments_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employees_punishments_view` AS select `e`.`employee_id` AS `employee_id`,`e`.`first_name` AS `first_name`,`e`.`last_name` AS `last_name`,`e`.`father_name` AS `father_name`,`e`.`mother_name` AS `mother_name`,`e`.`birth_date` AS `birth_date`,`e`.`hire_date` AS `hire_date`,`e`.`salary` AS `salary`,`e`.`blood_type` AS `blood_type`,`e`.`gender` AS `gender`,`e`.`departments_dep_id` AS `departments_dep_id`,`e`.`jobs_job_id` AS `jobs_job_id`,`p`.`punishment_id` AS `punishment_id`,`p`.`type` AS `type`,`p`.`source` AS `source`,`p`.`punishment_date` AS `punishment_date`,`p`.`description` AS `description`,`p`.`employees_employee_id` AS `employees_employee_id` from (`employees` `e` join `punishments` `p` on((`e`.`employee_id` = `p`.`employees_employee_id`))) */;
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

-- Dump completed on 2022-01-11 12:00:17
