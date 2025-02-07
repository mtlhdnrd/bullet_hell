-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: bullet_hell
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `map_assets`
--

CREATE DATABASE IF NOT EXISTS `bullet_hell` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bullet_hell`;

DROP TABLE IF EXISTS `map_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_assets` (
  `asset_id` int(11) NOT NULL AUTO_INCREMENT,
  `map_id` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  PRIMARY KEY (`asset_id`),
  KEY `map_id` (`map_id`),
  CONSTRAINT `map_assets_ibfk_1` FOREIGN KEY (`map_id`) REFERENCES `maps` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_assets`
--

LOCK TABLES `map_assets` WRITE;
/*!40000 ALTER TABLE `map_assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `map_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_weapons`
--

DROP TABLE IF EXISTS `map_weapons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_weapons` (
  `map_id` int(11) NOT NULL,
  `weapon_id` int(11) NOT NULL,
  PRIMARY KEY (`map_id`,`weapon_id`),
  KEY `weapon_id` (`weapon_id`),
  CONSTRAINT `map_weapons_ibfk_1` FOREIGN KEY (`map_id`) REFERENCES `maps` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `map_weapons_ibfk_2` FOREIGN KEY (`weapon_id`) REFERENCES `weapons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_weapons`
--

LOCK TABLES `map_weapons` WRITE;
/*!40000 ALTER TABLE `map_weapons` DISABLE KEYS */;
INSERT INTO `map_weapons` VALUES (1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(3,31),(3,32),(3,33),(3,34),(3,35),(3,36);
/*!40000 ALTER TABLE `map_weapons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maps`
--

DROP TABLE IF EXISTS `maps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `file_name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `music_pack_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `music_pack_id` (`music_pack_id`),
  CONSTRAINT `maps_ibfk_1` FOREIGN KEY (`music_pack_id`) REFERENCES `music_packs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maps`
--

LOCK TABLES `maps` WRITE;
/*!40000 ALTER TABLE `maps` DISABLE KEYS */;
INSERT INTO `maps` VALUES (1,'Slaughterhouse','','This is the kind of place you really shouldn\'t go into, but out of sheer curiosity, you step in. The scent of blood and what you see overloads your senses. You will never get out.',3),(2,'Riot','','Someone\'s had enough. That someone had a loud voice. This voice was used to destroy things. Now you\'ve had enough.',1),(3,'Palace of the Setting Sun','','I live by the sword, you die by my sword.',2),(4,'Limitless','','Every weapon deserves a chance to shine. Even if they are trash. But you never know.',5);
/*!40000 ALTER TABLE `maps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `music_packs`
--

DROP TABLE IF EXISTS `music_packs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `music_packs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `anthem` varchar(50) NOT NULL,
  `main_menu_theme1` varchar(50) NOT NULL,
  `main_menu_theme2` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `music_packs`
--

LOCK TABLES `music_packs` WRITE;
/*!40000 ALTER TABLE `music_packs` DISABLE KEYS */;
INSERT INTO `music_packs` VALUES (1,'Dusqk','relative path','relative path','relative path','Floaty, angelic voices and electric beats assist you in your fight with your opponent.\nby Dusqk'),(2,'CRT_HEAD1','relative path','relative path','relative path','Imagine a russian bloke on crack. This figure plays his favorite music while you disfigure your enemy.\nby crt_head1'),(3,'CRT_HEAD2','night ops','electrosphere','mecha grey','Imagine a russian bloke on crack. This figure plays his favorite music while you disfigure your enemy.\nby crt_head2'),(4,'avest','avest','avest','avest','You are about to fight the most important battle of your life!'),(5,'Mute City','Mute City','Mute City','Mute City','Being the last one standing is not so easy. Knowing your opponent as well as yourself is where the victory lies.');
/*!40000 ALTER TABLE `music_packs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_login`
--

DROP TABLE IF EXISTS `player_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_login` (
  `username` varchar(255) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_admin` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`username`),
  CONSTRAINT `player_login_ibfk_1` FOREIGN KEY (`username`) REFERENCES `players` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_login`
--

LOCK TABLES `player_login` WRITE;
/*!40000 ALTER TABLE `player_login` DISABLE KEYS */;
INSERT INTO `player_login` VALUES ('batyu','batyucsakbatyu',0),('batyuzo','batyuzik',0),('gembarnus','gembarnus',0),('girmany','gizmo',1),('gizmo','gizmo',0);
/*!40000 ALTER TABLE `player_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_skin_inventory`
--

DROP TABLE IF EXISTS `player_skin_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_skin_inventory` (
  `player_id` varchar(255) NOT NULL,
  `skin_id` int(11) NOT NULL,
  PRIMARY KEY (`player_id`,`skin_id`),
  KEY `skin_id` (`skin_id`),
  CONSTRAINT `player_skin_inventory_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_skin_inventory`
--

LOCK TABLES `player_skin_inventory` WRITE;
/*!40000 ALTER TABLE `player_skin_inventory` DISABLE KEYS */;
INSERT INTO `player_skin_inventory` VALUES ('gembarnus',1),('gembarnus',2),('gembarnus',3),('gembarnus',4);
/*!40000 ALTER TABLE `player_skin_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_skins`
--

DROP TABLE IF EXISTS `player_skins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_skins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_skins`
--

LOCK TABLES `player_skins` WRITE;
/*!40000 ALTER TABLE `player_skins` DISABLE KEYS */;
INSERT INTO `player_skins` VALUES (1,'Knight','knight path','The most common soldier'),(2,'Rogue','rogue path','Beheaded his own master. Imagine what he can do to you...'),(3,'Samurai','samurai path','Bound by loyalty, but not by law. Beware!'),(4,'Entity','entity path','Zero identity, defined only by its boundaries.');
/*!40000 ALTER TABLE `player_skins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players` (
  `username` varchar(255) NOT NULL,
  `points` int(11) NOT NULL DEFAULT 0,
  `winrate` double NOT NULL DEFAULT 0,
  `all_games_played` int(11) NOT NULL DEFAULT 0,
  `kills` int(11) NOT NULL DEFAULT 0,
  `deaths` int(11) NOT NULL DEFAULT 0,
  `most_used_music_id` int(11) DEFAULT NULL,
  `music_pack_id` int(11) DEFAULT NULL,
  `active_skin_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`username`),
  KEY `most_used_music_id` (`most_used_music_id`),
  KEY `music_pack_id` (`music_pack_id`),
  KEY `fk_players_player_skins` (`active_skin_id`),
  CONSTRAINT `fk_players_player_skins` FOREIGN KEY (`active_skin_id`) REFERENCES `player_skins` (`id`),
  CONSTRAINT `players_ibfk_1` FOREIGN KEY (`most_used_music_id`) REFERENCES `music_packs` (`id`),
  CONSTRAINT `players_ibfk_2` FOREIGN KEY (`music_pack_id`) REFERENCES `music_packs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES ('batyu',21,45,12,7,3,1,1,1),('batyuzo',0,0,0,0,0,NULL,NULL,1),('gembarnus',0,0,0,0,0,NULL,NULL,1),('girmany',0,0,0,0,0,NULL,NULL,NULL),('gizmo',0,0,0,0,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rarities`
--

DROP TABLE IF EXISTS `rarities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rarities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rarity` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rarities`
--

LOCK TABLES `rarities` WRITE;
/*!40000 ALTER TABLE `rarities` DISABLE KEYS */;
INSERT INTO `rarities` VALUES (1,'Common'),(2,'Rare'),(3,'Unique');
/*!40000 ALTER TABLE `rarities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weapons`
--

DROP TABLE IF EXISTS `weapons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weapons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `damage` int(11) NOT NULL,
  `fire_rate` float NOT NULL,
  `semi_auto` tinyint(1) NOT NULL,
  `rarity_id` int(11) NOT NULL,
  `projectile_speed` float DEFAULT NULL,
  `mag` int(11) DEFAULT NULL,
  `description` text DEFAULT 'A deadly weapon',
  `devinfo` text DEFAULT 'FIRE:',
  PRIMARY KEY (`id`),
  KEY `rarity_id` (`rarity_id`),
  CONSTRAINT `weapons_ibfk_1` FOREIGN KEY (`rarity_id`) REFERENCES `rarities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weapons`
--

LOCK TABLES `weapons` WRITE;
/*!40000 ALTER TABLE `weapons` DISABLE KEYS */;
INSERT INTO `weapons` VALUES (11,'Scythe','weapons/def_scythe_ink.png',100,1,1,3,NULL,NULL,'A lethal and cool-looking weapon wielded by Death itself','FIRE: melee attack\nALTFIRE: take away enemy weapon\nUNEQUIP: default'),(12,'Nailgun','weapons/def_nailgun1.png',20,3,2,2,0.8,13,'Safety instructions would suggest you NOT to pin coworkers to a wall...','FIRE: shoot (gravity)\nALTFIRE: -\nUNEQUIP: default'),(13,'Cleaver','weapons/def_cleaver_ink.png',70,0.8,1,1,0.4,NULL,'Chop things up with this very nuanced instrument of destruction. Don\'t cut your finger.','FIRE: melee attack\nALTFIRE: -\nUNEQUIP: default'),(14,'Chainsaw','weapons/def_chainsaw_ink1.png',3,20,2,2,NULL,200,'Ever heard of Mick Gordon? The Doom Slayer? Hell, maybe?','FIRE: rev, damage on\nALTFIRE: -\nUNEQUIP: default'),(15,'Taser','weapons/taser1.png',50,1,1,1,NULL,NULL,'Some crackhead clunker cranked the crap out of this cruel (but previously non-lethal) critter.','FIRE: check triggerbox in front of muzzle\nALTFIRE: -\nUNEQUIP: default'),(16,'Knife','weapons/def_knife_ink.png',50,1.5,3,1,0.4,NULL,'If the glove don\'t fit, stop wearing them and continue stabbing','FIRE: melee attack\nALTFIRE: throw (gravity)\nUNEQUIP: default'),(21,'The Power of Words','weapons/def_hatespeech.png',10,30,2,3,343,90,'SPREAD AWARENESS IN A CONE','FIRE: check triggerbox in front of muzzle\nALFTIRE: -\nUNEQUIP: default'),(22,'Pistol','weapons/def_pistol1.png',35,3,1,1,1,12,'9 millimeters is a LOT.','FIRE: shoot particle\nALTFIRE: -\nUNEQUIP: default'),(23,'Shotgun','weapons/def_shotgun.png',15,0.75,1,2,0.85,7,'If you get the general direction right, you\'ll have no problems with this one','FIRE: shoot particles(7)\nALTFIRE: -\nUNEQUIP: default'),(24,'Pressure!','no_photo.jpg',7,4,1,2,0.85,2,'You already massacred a perfectly good metal tube, so everyone knows you have the resolve','FIRE: shoot particles(15)\nALTFIRE: -\nUNEQUIP: default'),(31,'Wrath of Nobunaga','no_photo.jpg',400,1,1,3,0.8,1,'The legendary daimyo left you a present. He will smile upon you if you put it to good use!','FIRE: shoot particle (3 ricochet, every bounce halves damage)\nALTFIRE: -\nUNEQUIP: default'),(32,'Bow','no_photo.jpg',70,0.3,1,2,0.6,1,'Ranged weapon against pointy sticks, who would win?','FIRE: shoot particle (gravity)\nALTFIRE: refill\nUNEQUIP: default'),(33,'Kunai','weapons/def_kunai_ink.png',40,1,1,1,0.6,NULL,'If your arms aren\'t long enough... damn that\'s a straight line...','FIRE: melee attack\nALTFIRE: throw\nUNEQUIP: default'),(34,'Dagger','no_photo.jpg',50,1.5,3,1,NULL,NULL,'If all else fails...','FIRE: melee attack\nALTFIRE: -\nUNEQUIP: default'),(35,'Katana','no_photo.jpg',75,1,3,2,NULL,NULL,'Craftsmanship and lethality meet in your hands.','FIRE: melee attack\nALTFIRE: stab\nUNEQUIP: default'),(36,'Spear','no_photo.jpg',50,0.6,3,1,0.4,NULL,'Poke fun at the idiots trying to reach you with a knife','FIRE: melee attack\nALTFIRE: throw (gravity)\nUNEQUIP: default');
/*!40000 ALTER TABLE `weapons` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-07 10:14:38
