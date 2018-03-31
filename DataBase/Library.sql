-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	5.5.12

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
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `idbooks` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `author` varchar(45) NOT NULL,
  `year` int(11) NOT NULL,
  `description` varchar(225) NOT NULL,
  PRIMARY KEY (`idbooks`),
  UNIQUE KEY `idbooks_UNIQUE` (`idbooks`),
  UNIQUE KEY `title_UNIQUE` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'Harry Potter 7','Joanna Rouling',2011,'book about boy who alive'),(2,'Hungry games','zxclhkj',2008,'book about future'),(3,'What you think','Joe Navarro',2011,'book about emotion people'),(4,'SomeName','Anybody',2000,'Description'),(5,'BOOOOOOK','AUTHOR GOOOOD',1568,'DESCRIPTION ABOUT THIS GOOD BOOK'),(7,'Book 3','Author 3',1568,'Description 888888'),(8,'Book 4','Author 5',2017,'Description 55555'),(9,'Harry Potter','Joanna rouling',2001,'Good book'),(10,'Harry Potter 2','Joanna rouling',2002,'Interesting book'),(15,'Dubrovskii','Alexander Pushkin',1994,'Romantic book'),(17,'Harry Potter 3','Joanna rouling',2005,'very interesting book'),(18,'Harry Potter 4','Joanna rouling',2006,'asdffgfhgjhkkj'),(20,'Harry Potter 5','Joanna rouling',2009,'ikk jrghrjd fjghdfkjgn gkrjghdkfjg kshiognfdkj kghfdjkgndfmk fghdfiugnfdklg ndf!!!'),(21,'Book 8','Author 8',2015,'Description 8'),(22,'Book 8888','Author 8888',1569,'Description 888888'),(23,'Book 1','Author',1569,'Description 55555'),(24,'Book 2','Author',1587,'Description'),(25,'MyBook','Owin',2017,'New book'),(27,'MyBook2018','Owin111',2018,'New Book 1');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-31 12:47:05
