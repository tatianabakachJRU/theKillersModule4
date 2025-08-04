CREATE DATABASE  IF NOT EXISTS `lego` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `lego`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: lego
-- ------------------------------------------------------
-- Server version	5.7.27-log

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
-- Table structure for table `lego_set`
--

DROP TABLE IF EXISTS `lego_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lego_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `released` int(11) NOT NULL,
  `inventory` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lego_set`
--

LOCK TABLES `lego_set` WRITE;
/*!40000 ALTER TABLE `lego_set` DISABLE KEYS */;
INSERT INTO `lego_set` VALUES (1,42110,'Land Rover Defender',2019,2573),(2,75192,'Millennium Falcon',2017,7541),(3,70676,'Lloyd\'s Titan Mech',2019,878),(4,21042,'Statue of Liberty',2018,1685),(5,41491,'Batman & The Joker',2016,206),(6,60198,'Cargo Train',2018,1226),(7,71043,'Hogwarts Castle',2018,6020),(8,11008,'Bricks and Houses',2020,270),(9,10266,'NASA Apollo 11 Lunar Lander',2019,1087),(10,43185,'Boun’s Boat',2021,247),(11,41150,'Moana\'s Ocean Voyage',2016,307),(12,41379,'Heartlake City Restaurant',2019,640),(13,76989,'Horizon Forbidden West: Tallneck',2022,1222),(14,75936,'Jurassic Park: T. rex Rampage',2019,3120),(15,21108,'Ghostbusters Ecto-1',2014,508),(16,21155,'The Creeper Mine',2019,834),(17,10211,'Grand Emporium',2010,2187),(18,80009,'Pigsy\'s Food Truck',2020,832),(19,75888,'Porsche 911 RSR and 911 Turbo 3.0',2018,398),(20,76139,'1989 Batmobile',2019,3310),(21,76218,'Sanctum Sanctorum',2022,2713);
/*!40000 ALTER TABLE `lego_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part`
--

DROP TABLE IF EXISTS `part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `part` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(25) NOT NULL,
  `name` varchar(100) NOT NULL,
  `weight` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part`
--

LOCK TABLES `part` WRITE;
/*!40000 ALTER TABLE `part` DISABLE KEYS */;
INSERT INTO `part` VALUES (127,'98313','Arm Mechanical with Clip [Thick Support]',0.4),(128,'99781','Bracket 1 x 2 - 1 x 2',0.55),(129,'10201','Bracket 1 x 2 - 1 x 4 [Rounded Corners]',0.93),(130,'93274','Bracket 1 x 2 - 2 x 4',1.29),(131,'99780','Bracket 1 x 2 - 1 x 2 Inverted',0.55),(132,'60476','Brick Special 1 x 1 with Clip Horizontal',0.56),(133,'60475b','Brick Special 1 x 1 with Clip Vertical [Open O Clip, Hollow Stud]',0.58),(134,'60475a','Brick Special 1 x 1 with Clip Vertical [Thick U Clip, Solid Stud]',0.59),(135,'92338','Chain 5 links',0.33),(136,'60596','Door Frame 1 x 4 x 6 Type 2',3.2),(137,'18588','Launcher, Weapon Rapid Shooter Six Barrel',2.8),(138,'61930','Light Unit, LED with Black Cable, Power Functions',9.18),(139,'3710','Plate 1 x 4',0.71),(140,'3021','Plate 2 x 3',0.93),(141,'85861','Plate Round 1 x 1 with Open Stud',0.1),(142,'6141','Plate Round 1 x 1 with Solid Stud',0.12),(143,'3839b','Plate Special 1 x 2 with Handles [Flat Ends / Low Attachment]',0.61),(144,'4697b','Pneumatic T-Piece (T Bar) [New Style]',0.15),(145,'15790','Propeller 3 Blade 9 Diameter with Recessed Center',1.89),(146,'2421','Propeller 3 Blade Small',0.41),(147,'92842','Propeller 3 Blades 5 Diameter',0.8),(148,'2479','Propeller 4 Blade 5 Diameter with Rounded Ends, Open Hub',1.38),(149,'61409','Slope 18° 2 x 1 x 2/3 with 4 Slots',0.3),(150,'54200','Slope 30° 1 x 1 x 2/3 (Cheese Slope)',0.21),(151,'85984','Slope 30° 1 x 2 x 2/3',0.34),(152,'3039','Slope 45° 2 x 2',1.15),(153,'3039pr0015','Slope 45° 2 x 2 with Complex Control Panel with Red and Green Lamps Print',1.15),(154,'3039pr0018','Slope 45° 2 x 2 with Silver Control Panel and Screen Print',1.15),(155,'3747b','Slope Inverted 33° 3 x 2 [Connections between Studs]',1.68),(156,'3660','Slope Inverted 45° 2 x 2 [Ovoid Bottom Pin, Bar-sized Stud Holes]',1.25),(157,'4871','Slope Inverted 45° 4 x 2 Double',1.82),(158,'45590','Technic Axle Connector Double Flexible [Rubber]',0.59),(159,'3706','Technic Axle 6',0.94),(160,'32034','Technic Axle and Pin Connector Angled #2 - 180°',0.68),(161,'32016','Technic Axle and Pin Connector Angled #3 - 157.5°',0.67),(162,'32015','Technic Axle and Pin Connector Angled #5 - 112.5°',0.69);
/*!40000 ALTER TABLE `part` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-01 16:34:46
