-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dbnovosti_32_73
-- ------------------------------------------------------
-- Server version	8.0.22

CREATE SCHEMA IF NOT EXISTS `dbnovosti_32_73` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE dbnovosti_32_73;

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
-- Table structure for table `korisnikinfo`
--


DROP TABLE IF EXISTS `korisnikinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `korisnikinfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `telefon` varchar(45) NOT NULL,
  `ime` varchar(45) NOT NULL,
  `prezime` varchar(45) NOT NULL,
  `role` varchar(45) NOT NULL DEFAULT 'User',
  `STATUS` varchar(45) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `korisnikinfo`
--

LOCK TABLES `korisnikinfo` WRITE;
/*!40000 ALTER TABLE `korisnikinfo` DISABLE KEYS */;
INSERT INTO `korisnikinfo` VALUES (1,'admin','admin','admin@email.com','admin','admin','admin','Admin','ACTIVE'),(2,'editor','editor','editor@email.com','editor','editor','editor','Editor','ACTIVE'),(3,'user','user','user@email.com','user','user','user','User','ACTIVE'),(4,'Emir','Emir','Emir@email.com','Emir','Emir','Emir','Admin','ACTIVE'),(5,'Amad','Amad','Amad@email.com','Amad','Amad','Amad','Admin','ACTIVE'),(6,'Varupa','Varupa','Varupa@email.com','Varupa','Varupa','Varupa','Editor','ACTIVE'),(8,'Mlinaric','Mlinaric','Mlinaric@email.com','Mlinaric','Mlinaric','Mlinaric','Editor','ACTIVE'),(9,'test','test','test@email.com','test','test','test','User','INACTIVE'),(10,'Adam','adam','adam@adam.adam','061934762','Adam','Adamovski','User','INACTIVE'),(13,'user432','user432','user432@user432.com','32918393','userr','userr','User','ACTIVE'),(14,'useruser','useruser','useruser@useruser.com','82183281','useruser','useruser','User','ACTIVE'),(15,'AmadEmir','AmadEmir','AmadEmir@EmirAmad.com','123125142','Amad','Emir','User','ACTIVE'),(16,'Amir','Amir','amir@amir.com','01231254','Amir','Amir','User','ACTIVE');
/*!40000 ALTER TABLE `korisnikinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-12 19:37:09


-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dbnovosti_32_73
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
-- Table structure for table `post`
--

USE dbnovosti_32_73;

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `postID` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `postcontent` text NOT NULL,
  `summary` tinytext NOT NULL,
  `imageurl` varchar(255) DEFAULT 'https://www.nomadfoods.com/wp-content/uploads/2018/08/placeholder-1-e1533569576673.png',
  PRIMARY KEY (`postID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'Everything you need to know about Cyberpunk 2077 radio stations','Youve likely heard at least one of the Cyberpunk 2077 radio stations in your cruise around Night City thus far, and they can have a big impact on the overall atmosphere and experience as you play as Im sure many GTA V players can attest. Even if youre not paying much attention to the specific Cyberpunk 2077 music being played or rocking out in the privacy of your own vehicle, they provide a great deal of immersion in this fast-paced dystopian world. The first place youre likely to notice the radio in Night City is when you first jump into a vehicle. Radio stations are available in both cars and motorcycles and you will always get a random station until you switch to another or decide to turn it off.','Discover the artists and songs from the Cyberpunk 2077 soundtrack.asd','https://image-cdn.essentiallysports.com/wp-content/uploads/20200903001300/cyberpunk-2077-release-date.jpg'),(4,'Ark 2 is coming heres what we know so far','Ark 2 is, somehow, a real videogame, and its got a whole bunch of Vin Diesel (in some capacity). One of the least expected reveals of The Game Awards 2020, Studio Wildcard debuted Ark 2 with a lengthy cinematic starring Vin Diesels character beating up dinos and looking generally ripped, if a little CGI plasticky.\r\n\r\nBut, wait, isnt Ark a multiplayer survival game? Whats with these voiced characters and stories? It seems like Studio Wildcard has bigger ambitions for the Ark franchise, including an animated show starring Diesel, Russel Crowe, Elliot Page, Karl Urban, and more.\r\n\r\nHeres what we know about the actual game so far.\r\n\r\nStudio Wildcard isnt talking release dates yet for Ark 2, suggesting that the game is still far away. Keep in mind that the first game launched in Early Access and didnt hit a full release until 2017, a full two years later. With a big star like Vin Diesel attached, Early Access might not be the plan this time around, though.','Ark 2 is real, and it stars Vin Diesel?','https://www.pcgamesn.com/wp-content/uploads/2020/12/ark-2-announcement-vin-diesel.jpg'),(7,'Cheap SSD deals of the week','SSD prices are so cheap compared to what they cost just a few years ago, every SSD feels like a cheap SSD. But even so, some are really really cheap. While were stuck at home with more time to devote to the best PC games, its nice to have the drive space to keep tons of games installed at once. Thats where these deals come into play. Find a cheap SSD deal, and you can add 1-2TB of affordable storage to your PC.\r\n\r\nThe best gaming PCs these days all use SSDs as their primary boot drives, thanks to their speed and reliability. But its also affordable to have a big secondary drive solely devoted to a king-sized gaming library. For some games, itll remarkably speed up loading times, and with a big enough drive you wont hae to stress about uninstalling old games every time Call of Duty: Modern Warfare has another 50GB update.\r\n\r\nHere are the cheap SSD deals weve found this week. We keep this guide updated as new deals appear, so check back frequently. If you want a top-of-the-line SSD, check the sales against our guide to the best SSDs for gaming. Theres a tasty variety of SATA SSDs with some awesome deals, along with our choices for best NVMe SSDs we found on sale, too.','These are the cheapest SSD deals youll find this week, anywhere on the internet.','https://assets.rockpapershotgun.com/images/2020/04/Samsung-860-Evo-best-gaming-SSD-1212x681.jpg/RPSS/thumbnail/1920x1080/format/jpg/quality/75');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-12 19:37:08


-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dbnovosti_32_73
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
-- Table structure for table `post_comment`
--

USE dbnovosti_32_73;

DROP TABLE IF EXISTS `post_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_comment` (
  `post_commentID` int NOT NULL AUTO_INCREMENT,
  `postID` int NOT NULL,
  `userID` int NOT NULL,
  `commentcontent` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `datepublished` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`post_commentID`),
  KEY `postID_idx` (`postID`),
  KEY `userID_idx` (`userID`),
  CONSTRAINT `postID` FOREIGN KEY (`postID`) REFERENCES `post` (`postID`),
  CONSTRAINT `userID` FOREIGN KEY (`userID`) REFERENCES `korisnikinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_comment`
--

LOCK TABLES `post_comment` WRITE;
/*!40000 ALTER TABLE `post_comment` DISABLE KEYS */;
INSERT INTO `post_comment` VALUES (1,1,3,'FIRST! Wheres my cookie?','2020-12-12 15:13:00'),(2,1,1,'Me admin','2020-12-12 15:13:30'),(4,4,13,'Hello!','2020-12-12 19:07:12'),(5,4,13,'dsadhwkjadh','2020-12-12 19:07:15'),(6,4,13,'asdwad','2020-12-12 19:07:16');
/*!40000 ALTER TABLE `post_comment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-12 19:37:09

