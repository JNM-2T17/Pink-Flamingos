CREATE DATABASE  IF NOT EXISTS `db_agile` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `db_agile`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: db_agile
-- ------------------------------------------------------
-- Server version	5.7.11-log

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
-- Table structure for table `ag_comment`
--

DROP TABLE IF EXISTS `ag_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ag_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `author` varchar(45) NOT NULL,
  `content` text NOT NULL,
  `dateAdded` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `commentfk_1` (`post_id`),
  CONSTRAINT `commentfk_1` FOREIGN KEY (`post_id`) REFERENCES `ag_post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ag_comment`
--

LOCK TABLES `ag_comment` WRITE;
/*!40000 ALTER TABLE `ag_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ag_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ag_post`
--

DROP TABLE IF EXISTS `ag_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ag_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `author` varchar(45) NOT NULL,
  `content` text NOT NULL,
  `dateAdded` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ag_post`
--

LOCK TABLES `ag_post` WRITE;
/*!40000 ALTER TABLE `ag_post` DISABLE KEYS */;
INSERT INTO `ag_post` VALUES (1,'Test','Austin','This is a test','2016-05-27 20:25:18',1),(2,'Test','Austin','This is a test','2016-05-27 20:26:52',1),(3,'Test2','Austin Again','Lol','2016-05-27 23:36:41',1),(4,'Gusto ko ng kamatis','Rissa Quindoza','I want kamatis. Kamatis is good','2016-05-30 16:14:07',1),(5,'Gusto ko bumutas','Angelo Matias','Ako ay bubutas ng bagay na maibubutas ng aking pambutas.','2016-05-30 16:14:30',1),(6,'Ako ay matutulog','Kenneth Wang','Antok na ako. Matutulog ako. <3','2016-05-30 16:14:46',1);
/*!40000 ALTER TABLE `ag_post` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-30 16:18:11
