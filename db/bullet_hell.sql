-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: bullet_hell
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB
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
-- Database: `bullet_hell`
--
CREATE DATABASE IF NOT EXISTS `bullet_hell` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci;
USE `bullet_hell`;
--
-- Table structure for table `map_assets`
--

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maps`
--

LOCK TABLES `maps` WRITE;
/*!40000 ALTER TABLE `maps` DISABLE KEYS */;
INSERT INTO `maps` VALUES (1,'Slaughterhouse','slaughterhouse.png','This is the kind of place you really shouldn\'t go into, but out of sheer curiosity, you step in. The scent of blood and what you see overloads your senses. You will never get out.',3),(3,'Palace of the Setting Sun','medieval_japan.png','I live by the sword, you die by my sword.',2),(4,'Limitless','practice.png','Every weapon deserves a chance to shine. Even if they are trash. But you never know.',5);
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
  `cover_image` varchar(40) NOT NULL,
  `anthem` varchar(50) NOT NULL,
  `main_menu_theme1` varchar(50) NOT NULL,
  `main_menu_theme2` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `music_packs`
--

LOCK TABLES `music_packs` WRITE;
/*!40000 ALTER TABLE `music_packs` DISABLE KEYS */;
INSERT INTO `music_packs` VALUES (1,'Dusqk','dusqk_coverart.png','relative path','relative path','relative path','Floaty, angelic voices and electric beats assist you in your fight with your opponent.\nby Dusqk'),(2,'CRT_HEAD1','crt1_coverart.png','relative path','relative path','relative path','Imagine a russian bloke on crack. This figure plays his favorite music while you disfigure your enemy.\nby crt_head1'),(3,'CRT_HEAD2','','night ops','electrosphere','mecha grey','Imagine a russian bloke on crack. This figure plays his favorite music while you disfigure your enemy.\nby crt_head2'),(4,'hellstar plus','hellstar_plus.png','hellstar plus','heretical priestess','sever','You are about to fight the most important battle of your life!'),(5,'Mute City','mutecity1_coverart.png','Mute City','Mute City','Mute City','Being the last one standing is not so easy. Knowing your opponent as well as yourself is where the victory lies.');
/*!40000 ALTER TABLE `music_packs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_login`
--

DROP TABLE IF EXISTS `player_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_login` (
  `username` varchar(30) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_admin` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`username`),
  CONSTRAINT `player_login_ibfk_1` FOREIGN KEY (`username`) REFERENCES `players` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_login`
--

LOCK TABLES `player_login` WRITE;
/*!40000 ALTER TABLE `player_login` DISABLE KEYS */;
INSERT INTO `player_login` VALUES ('0UghL9qPNzQsFegGzJWisyw5ychmD4','4JvYrs3fnheDSE7A8TWzdYLjDIh7xmUs0cIJzHeA5cgvZNyhRQGsPh9X7IklTp5wpe8Svl6sm3teJIjd7B6xt2EAzd5hPvacBx0qKaZrIJkB8ZUJHE9XpiQALTA0aAB9',0),('1kHVFEYm7GB2YMoqZu0QB9YRZsVwAK','xXIrTJgmBJyv2BUAaCO1OIjyU5vWU97TIcdfiSOAAE3a5EWHp68ld80b8O1sCCoNxnoZ3uVcBVoZuN8POGPFFFeYQNqaOLuSqiQDBHgLTz0kqCB7pD9JpB8UJGMFGyd8',0),('1pjiDAchlfUE9foGsgGs1CsOJyAR2c','hfmRWeXGdaYlJvJPEcqhnOF5Mj6eY6Iqm8iR6SQ8LXDkQNOvGfEcpmDkbUFrhR94oPSouVOkl3F8MOI89nOPEvhP6hiOVzSAWwm0jiolAqGcSbU3Um7nnp3uhBF7qtc4',0),('1TCljYcvcTfrn7YXpCeITpmgFH0zBm','DY4DIWt112X8SNvPj5ZocfVt4SeGtp8wZoSMZKR2sP7WbLGcotRdsYtEqdahI6eFqjYyxOA4Va4Fp0fQi4e235hAHKFe8fFATECRh7kNo3zqNQaqLuPcCwrAq3hytMOO',0),('1XKHKibJVumEkImQ9v1EQajxwpsgtO','FTCuBW7t9QlPBHuBtcTgUtjcqOf10SU83xDvooPHoqaJCYWDKDVOOr6heEcnrbEh0isnnECsDQvkWpfUSaA3m9bvsmi55dXw6hURvGIn4vBvQN8oJqDP6NUvw7sAN3Cs',0),('2drNrH8Xi1N23m4EF50Ei419S55Viy','Ndq71P4S0I3f0fqTSgZKrbJ5R0N6WDNu5wQE7P4FNB8FKN5EObknZ0VIYjUwS7LQly6U8MZKAr2GwFlgTwdsdlV5ycTrYCKJ4yyCZ7UjYxfe10OjW54lWZu1tkLGiW8f',0),('2H0haYjh9K2sKMxN3785Wm0HkqyeAU','gAVxmfOtnCk2DlnpkUERQx7j0XTgC9sVjKUgnNtZo9tYalDW9fK2jKzJUnZTus6Rf4XOlYjENJhCglJyKZC00oCCGN9UxRjj9a4dwP1jfxsCQUMtVlahTIXvxICQHpyn',0),('2R8p27wG8gvM3lKj2GsXeuSJ8dibnl','PHriN9AWteLhVaRgJKVr70Oqtf37b9pSeHdhSc7ad9k3QoMhoga9cWX5BS0yqwKnLj8oOryrJ7g7uJSwSrnH9y4j2GlblUdIKgXQmZm2q4D9ZDSvAGNos4Vx8RTHO9iR',0),('2xaqvLC0gxfeMObRac53cs2kTZDowE','4agIMCPiw8cj6XOAJB3K7LWjxcnoBW9axDtM5MSGDAg9u50Jcxdofx3Kl8ex3gxXSEedETqWIWYiwFMkZQBZkAMBG3bOKiX7lEhCRoZ3JrBO9piyIY8Dux09j32OKOgj',0),('2ZV3XJbtjZOaoiAvziUEO4HsV6jmog','PL854jOr91NrOfQy9RR7ZuWUNa3iKnTwMhwcifogVHhe8UsRDsXsvoBtbu1jzYh5P9B271GbCIlDeMnJFjo4Wjr7Yr4uiv6IavaFTu9F2MVmvDTnjtZ1ruM8kN3UbP9p',0),('3hWNEWY1TJbhsU9VONjs0Lk9Sdt4Hu','lmjNraVjbprPlVoR1Ro4IUCqB7oZjAvBu07rbKIsiF428jV0UMMSq54kmUfJUx6ikLW4DB3iLEysSEEVhRz5dCRGYkB9pKXcchmFdI2oSPA6sP147QYu8dJFzaREZ1ne',0),('4KdZbshf2WfkQDINvn7thwsKUBHVtl','2L7UOT7OMSGENqAT3OoHCaWP0KgTvHpjj2sgyjFjnWPz2NzN3wYDS6MVWGkms02Ifp9E0vqhXU8YYSdnGilCmvrvVfI8uez6xaU4b0LNaHYAuQBXnuQZpnZDpzBfnciz',0),('4POv7lPrB9r3HScotR3FBx25ofSDqk','njLep62Ah4S71TRDkcgnHSZvXJ9bmeqAZYKhd313U4HwHKLuk8SjBwkRQbsDgFuNmjOa2CF4WCLVVCwSTK2vhZTsqD7X2vEBU6rjl12LrzVH7ApI8351pJ7rH4AGDciq',0),('5geFnUXPsqylk2Vw1EHdRYKFOelMah','fn2HXFwXEQT3KIzmpW7Cossw3BHRdcWHVniybmUO2t1Ej5sSANKFLWhcIe1Afb7DUvihQStn0Pp00qGuI5lKL5F91wkkHmdGnbeXn9lwuOfKm8fHMhAZpXncVeRjjaK4',0),('7vt8ADi39iSeUKrY3axE0wBMQvTrhV','ANwLmzjHaeInukr2kvl8H7iewfm4ap7Q294AEBtsAHVLkZrZIQ6PM1oTpxFurjf269TLfO2RJZMFHmPS33DtCriPNu61Pb8yWYu9hOrUchNnq0vrmA4yxTGF8LUr3ros',0),('8keFXZgnfCjPOjQdhoQ8ZG2ciyMBbO','gaYxEt2BeoA88rWb7zx1GhGe9qNBOt3X3b4gHw3FCgTKIlLhhrdEJQR6f77gQiW1QtEpNC2Vqah8bKcvLqnEz9ylq4l7mFwihWKmsd5FlsjwHvjp8FbLQ1TORoIbQCEl',0),('9k70OXiOwm6Wn6A1vSbm7calTTbWiS','83elWcZmXqk1yGsRQn21j8VkCosYmMJRRGMOIML6j1rdnXaqXGPXaWt3W9JSoaJTrSr9jIPcO2TnE2jiM1cse8ottdvl7Cciw8yXgNjaXPcVqJ4kXqO4HBi1oQHAwhT5',0),('af1cB3xFee6ZAPRde4tU5RSvuVGAn6','cr6ni2H45Q7JGlLzux0bvixp1aBmyC6kdEZuJ3sN0c9iyFJvvqb2Ro3U7uZyfV8KsEMpiRcy4rHXgejy8KVYzeEdWgjS7kgfcHlFcrt0W6sdAdjP7YQm0UVIBCru2BeE',0),('AFCDg1F7K4VGwqXiLaSVCObhrbwC2x','8RvEKWbCcQoqVqDuhs9kNamykGv6aD0ze3VGHQP8nwYMazqztYa2942kEEJXgGqLflhtseZawXB7TqTpQvow8NxmKkRtbkbK3e987YWn64mezrAlRm80aQB4WKAarppD',0),('AhJXyyuhTsQ9gUeDZdHywnPqqmVU99','atIDziTdKIMkOZ5TjDIeGqyGzCXohNZwuGAfnNdHfNwDsT2HCSHq3KHkOqZmskvUH8QYVe4QFtX1diwH5ZxLOvmPwWkGkP0jMZC9MhlQOGqOgfCBO7cwo6kiqejUkzYO',0),('b74PjZb9KbbZNAZlOrEjp0KjgNQyI2','mC9oo4yT9WHThU9esiJkzGIZSJ1xKeCsh9Dl7nf5CzVL9LOfixPdAkrdDSpOukPH0MNTJNOPdfN6WYjHD8m81vslFiq8AErZ9u6wVutIDC1hcFALCGm7kDZC6hH6nnav',0),('batyu','batyucsakbatyu',0),('batyuzo','batyuzik',0),('bkyJkMS4AGQp2ZXVaJVtm3xWtKWRnW','MyskZpf3L0odmaYTYN5rCHKRSlBLToRTZBBpME29TknDLekFzLkRa8rfB7ofOM65SzXrvGuOBPh5D6s2K1g8BNGvtSAK4jWCRwAiSesAy2kKmhSQHFyFNFp89KSXiJIe',0),('BzvE5u6XQEHDC7hXCdSLiRz3LidnHE','AJPliwyiWUX2OCvKXeU1YKBIyphNwYzrN5CNN9HgyN7ATIYQVK0YZkDuPfxhBZ3JElMt4y28AbkGm3Mqv1yvJnHGDByHOSls0TqUO5NzSTYySJoDrzIWx69bFe94ofuk',0),('Cb5O2DBuHzGkEqZ1prQm3fUPFYPrrT','3xyjqAjVCfJXJuh04ve3JV4HFl49hNtyoVdkNZER3NInGw4mrtHa4T4I6KRdiRa9QeNq5atMANFkXKTIPkGx3WFMl1B1UMAekVopxyUtLDh6UVX6G0rN1IKOQovTYVpe',0),('CGdPu2v6Jw74HJZtnBKtcqUW1qjkVF','xeYJtSDGo4dgtqaGOh1ANhVYvdKnOL50aBTFOfwlcKXdPlaZNfVDx8QheFOv5FNUyX1bka2s0mMC1vQhwYe8tZfwvGyUsmDTXsd8AvkdVOXiKUhFU9RSxSnJ3uIcaHqH',0),('cHUkX6JvP9qkzAbfwDou1YmAqcIOPY','8g4GPlBW6HzGTDl8MU5FnJ1JeYx05oGPk6lZ1GPKUFHRumadgQmnRL6J9G8p3NJHMSpSwHxTxuqLf2IVS7dxaIcuCN4z1YPFG7eQVBfniyGzQ1wv2DzRWs5TvZBYLgHU',0),('cjpLLh8McUbxcltz8iEyqdSalO8ehc','9XZDuSzrxP7DehQz1V1h2DqyaA502Nsk5We2fWOHqME34wV0exK1fJcQ82jiWCpzzkd093JsyBk7lgGEcFHeYz2In2gxmslinJ6dcY4iS6lyeIz2juy9TWmH54icy1kM',0),('cNspSxyZM082gAuzLgxwlgd9kgP3wO','5EovuUBoWQM37YAW4q9IX8K8Dv28OjHFHxenN5jbh97A0Y9ZXngeZVWxR0yWRPXjShoQDpeXUIneK5PgzBim4JSdDkmOPZOZiMfheiT0pwEetNDMdhXgWXjwr5Mk1li4',0),('cSJhKxSM5g9dUh5rhuqF4cnqVKKBGG','H4h2ikNp6Wl0vMaHWlB32ULam7PHkLmozpyGdReRgRtEwBIbVX4eEdeArPi6xL4kxQC84XHsHtCX6eldCIumUcySn54Qs2tRbiIzr1CpnilcZSWVNvGApSYvRMfCYiIc',0),('cy10KVPJh37HK2hJTHHidIT2BNOKJ8','vggKskwlNREiWsVy4phaqjeFh7GnkGgFTTHe63lfc8leBo4h8H8NsdGYw45KaApXJNPxNlCjxtlUHCEQbjvOTwrrSU0oa7LonohfGB0MdpaPnkxB498heuKkxDIaRsfr',0),('D99PUKB35Hx2R5j1Gekpfj2PGb7KlY','gxiUaSGl93ZKl9B1fWMH7vlTkpXoGx421GhhokHkKPfZRuK3Bn0weoxmB7wfQhKdQ0e3PlWnrLV11L9g5lMPaaVbTly9kMSfUaqQ5hbJ9KkMsbFDqW1YlLLokbnBIoTd',0),('DArJoQNXvGEtDJ5iNozcxZKcS7BM7Z','QaRHdPHxmeEQNPOvyAUBUeoAOp2O6C8JTrg9fZMH5v9JLDpnwIqgwq8ntCor4DTBwrc2d1YIJxZo3aGho9NE9LZIoGMf5el7rabQt894MxTZHrm87g2Vy8mhdRiQcFKH',0),('DlOq0Sfi7QXqe5G1f1AHAFOxEVjUsu','CBxKfCFO1JDEXHoOg49GdpqzSYkdNjBCHMVAEERGSdyOlBUsf93I176xVvY07N1YdsCxlOF1lQvtuMojMeE4mOvRSRgW7WYE7CbDAfqJzBLMfyVchoj4RfoiIUpjDIU6',0),('dT5EvQHak3yAkzlOM64G25bVGp0D2M','Qgo8CYC17pLtBd3pokpCjaAixkdlTl8H1Wj2SSttXYkNJJkS7OA69Mq14GNsJCf7iOjFPtEIDj5N8V1995K6NpIdw5rDK58LICE4tljuQpQ0UlLQuKS5MYiPuirAGBu7',0),('EBdtdvKUb5QSAvXDTztu8DpXNUemng','927FIwwcKZ1Kyq57XnhVaL876Ynra88EpH43UJNXoOAGpWlBG40Rj7n6xZAclD7zCErfnTwcfjzZJQgBCcRsmyBOXvKZMFQsYkCZ0vn48vL7f7vj8SNOV1MpyVj7mVj6',0),('EDWUhlgOoNmDi95VHX59lhZHCIR4Nl','Ag7UvuBcQqLjeg61o5mYngpBL1jvJMKBk3oyj42d2zOGKWHHQkMp026OmCUFhCaijg1m86IV5rcDgAAVRmt2HiICrloIeIosCvkFEw3BDvbtRbYI1RyQma6BtG2bEyda',0),('eH33iikPnZWVvw1bnoSLAEYxNAuD9N','3qaUZqAVIRtEZJLB2LlWR4rnssxrJvrUxxTEtdFBkgDGzVRipvtiLCjqBhf0PF3MHaoT06yBUTtETZyHL6Kr3yLB7YgzWGqJkzaOqo7VnJkMXhGmQsVbnpaOl0nmeN7b',0),('gembarnus','gembarnus',0),('girmany','baba',1),('gizmo','gizmo',0),('gjpmim7LTmomlP6IUhPB9TvJ6hROxM','4lpiTcdDvJIryunkfx9Wcr6KX7P00lMflpcUaVkPGDNeLLTSOaOyvwgdGPpCPlsa0UR1iNojJzMrLjhGFUx1ugjPL4WWStMYY0ydGaaESHCyRPUvRVybMt5I9RKhDhwC',0),('gL3pYjwsxxfgPrb7G1t80rlFUXussM','Q74ikILzLAEpQIBOVVabWWD0MDujKZQAlRo5NbPUkNrASUYXKCPzZ9tvRGC5VnILnTbwbcnYNP0HJgLWnA9fX8Yr9cTSquTMLoDhnoq60eyqeExRU6uVrsZT0wjouSab',0),('GQLMCHjWHyWZuPwcm7SPPZIhHO7jkU','wAW5GzV8FKvTogVE8JvSDVvqKEVhZm6uhI1oyLtOi3KPTF4b4LUXmzJOlIREihyhEe1cfTTarjmWWG0PqXXOWHZ0dtVDERd3WOYTsGnaISnXtSvtCJPfiRzHnBxkjyWX',0),('h8IQT6RjLzBYt3O9rEF79SIxYqEfhC','kcMTULTckHilR48BJS1jPFo51jxb72ks2xMM1MeHq9EG7Dsb2zOXIZj1UC8O9xy7kcLkrPxWW0S8d7EAZdnGKkZGwfrxkXjKJXezIW5GYNvWJtvAJ6Uay9niGzrhBerS',0),('HldoPTK4xM1UpKaaKRreJHKYyYDNe0','ViIL9NUZ2WlKZL3KnYgS3Mgu4xXtPRcPSAVizQBvVOeSvZg6Ls8XFAmxcmVgE6HSt7u61V8nek5IiDbFlDttLiXgS0aCzs7f39ckCPcL987YSkDbbbfSg23YAxDOfwM1',0),('HLw0xAy5BlLJZiZrQv8nXV8fJ5nlEg','eBVKtaSlBlBEThk9XhkaMBK6JXgSeGR0qf5w6v1liF3Z7b4RFMrIeQuvT9JP46TiVmaQ9jJihzE7nbbT1fk9ztMvYdZ5nDUN3SP158Bsanp6vOnWzDJRliuNYIRBtEky',0),('hNtGWOYfl72vagpYP10UYAkj3FF0Po','mDu3nmvZ6rewT5sXZdyZZ2ecZ5ygM5Fsxv1eKtrXv0GH4h99O1WgIf6HKq1YdIZmLsY9jC5eSxNvTe7ktU3HRkxkGOB0i8K3mEv4e8tum6wrKsUao2cD4qzmEKPIdCdJ',0),('I8jYcaX34iCnGEphHeG9n0utmsnXD6','exnt4Ewd1laHuVE15rMpgGP2PfGJlNh6oU4qo6fdEpeflHSC5e9wcKTo6DDKo8m4Uz9kgGC2WPtJpichy5Kq6Or0xv0kI1UKRZwRWquBPB7BIoGo3Rii92s6C5iFzXjj',0),('jlJHPlzGugdBwO47AQKYj6xsEEJdKR','bQyWSLwvlHMltxfvVLgqJET15audQPNZ0fjXnwADfMyPh8vb92dSi3EzBJLDcnpmII4bnlZMtWJwYs4CJa4rXPI4xZurXCFhGhVYwAuHVBntBYNKCPfReqCEwXvsVIHh',0),('jxX0OyfokBkIeYZABe5Ef5E3JBkMTn','JhjBZWK6ZUSJHBuZUxLF3MRgrGs04azxF3DLZEvDXGfmaXpIc2y5AufiYbNF3UNPM3yRUmGqNmFbmUq7JbU3v6yWfy5iPUO4O0SEbeZuxEH6ZN9xWuplA2H0Nhxupy72',0),('k03Cjwc7KnwexzINPEgjeH8lnKiPZW','FVerTI5LUkIfwyZPQ9xBiA3rmoTXzTFcNHEQdFlSwKrACo1Q7FatT0CfjYgqB9Sjg1xi5V6BQfGMiFyHUz2p9x3hB3fWLHCaC0Qcs8KsB5dFfClKEF74CnHMbk09WEL5',0),('K1v3I8A7F4T8qdCuL0bfCCe4sFdIMv','CaqHNiape9SOx7Hx9Dzm3KZ2upkhomUBHrBP4aU53r8iiMxOlEfQaqU47uRFnscmAL9ZHloMQ0k5rvfIhkpFWjYXpSUhNV3cGj6T41CBYu2DShcwcAYpma5DP4ckfmVk',0),('kGh34OV5uFGot04Va2N3XFa75MX6lL','JKUsGsnSdC04bzX70qEptZA7enbn9fLJ3FCGBuK72XeDQX2Ct4BTYFPGWw9ysjyjUh3HLoQqo8UIFvsaaAAGGkNOEJgbgUyKiS4FUPlFSFg8lJi2o0o8iX8tVv8nr1c1',0),('kPGBilUgqny8PVsE6wlWPXFzXy9tty','x9UTYp9cAD9lV76WFamZq4NBXdTEqyNy1LZHCrjw8eg1XYc2QhZTBc8J4ieLfyuG9qJx6VHBK66VgvocP5KiIebFRwoGCqAI6EplXa56zEp6Yjk39Mia5PRBB58G04aD',0),('L5LIvlxICZKyLJ8T7AyRP4IX4Tf75a','SZNTRLTz3f9tm6tqtqtkEYHIcRGv2bQlG5SKw6ASffLsxmiPsFldyex4oN32Qd0nFqeaVdURSXSHsB2OJRNyeaMSMeeGjRsmZFnYxJKW6gbOrui845kUgtuZn6xreYsf',0),('LeJg7C1Qr8LVSKsLwLMRIuwQOS7QKL','rvgF8VjRPng9RPYlsC3kUvb19aY3OA12D8u877Kmrpz2047XwuMMgzWJ9868vGx7DEfOhWC1fxPRuxxFa13CjuY7CquisuxpLRCahJlZ3MwZQ3KWantpLgHpW6BB1UWh',0),('lP64j2LkjCwHexe8hMU5JPj8ztIMPx','V51zZnVL4m68j5Tm9SL1SXWlfCF9kfVjVJHNEtmyuvt8u0OOVCsYdpinnfPD18GKuE6Sw7eGMwt8gRmDiIP3jj36bPooHbIqF20Ca67g81KTpRfAiuWKbkPg4YEjV02N',0),('m4b8HdNiMh4FoUi7IhNlKDIPfiPjWn','liUEOOXNRLmdjrKV2ZZQc5PZbFCL9A6oJ6BEJzGBwpZBYNhz0LycKxPNuztJBAVvyhTIYwWaFp5y4xqDwIkYsQDgyaphvThATql51JhAVAccY8jn510JvnrXy6hvKlv6',0),('md1itMFcQV2bbiXQIMpEqkaB0VBAZR','k2IBJbmN3LsOQih65rOBDawLonqtD81SOLLvCHaUVEB8XxygNwXz6Zcouz7Hk56ywkaWRWK4bhK5EJuAVeLwe1jkNLjy1TNW7CrIL0n4WFqVaUVFMezYdHWpYUF7nXOT',0),('MIARhofTYZplX4EErVuVXrnqMuYuXR','hEVkm6nqMoltP26TrzP7cIRdoa7qWP1tNTEyfIX0eMs9ljJGjiSGUifP7ZqL98qHuNVM8Zl6kQx5csjB6KgLP6jRf64DJwqm7ypOHkoc5KhDDOISBTV6RTB5LhOF4nND',0),('MP6xKS3n83hGQn5wYq43SWYkgGzKvF','aB3vrs7dtZFCAwLzgViR91CkWJzOcb8cfF8AEjT6zULvoKeKueN4IbVINdUuYMaZEF68nrHrWxrvisExouNSHQsGKIkWDAgWvwQVsCzYS8Dq69mrKkNwAwaNBb5UFawl',0),('nMusfw62e0qs6sJpFvwSr55dH0fr9X','G5pyrugeknAZGrgd5qyfIPYESLz9oTj8KeoGvNDNeha3a5nJPYScewqNqItnck6peYFiTgEbadMfigdBLKJPN6sFDnkOV0VARFBS6e6JhOr4T3vzNC6XOc4vfTXqlEL6',0),('nR2tsrYxQWyVcR7oN3mzOpY63rffPx','QyyKcnKyyErzqaZWPsLuW65i0aW6bv4DbiUJQwcZnUZYGSxh7hvTEYZsLjCsyWoXobmZUUaQuITFoZUMzX6s0AG38RsrBKOvmUHA7BRHeBZvmXjBq4aI44XiPWDjK6TR',0),('ocGHUaPV82btHYOtWH2ouPloE8GQHo','7EpJYB7rmoLVp47sxyhBxyAJsX4DodbYEPEwHf6Bq9Mrr5ozXMs0NjvIcB4MkuUxoMPIVkJIab4zHoj1XVaHFQGqL3kXXDqAh1UYyOYSBNGwdcfqhe2z2lTtRjP0ldo9',0),('oNx6kDghFmG11yMBvHEbeHuWbDq2rr','AG600ylyTstDbi3INyShOO5R1Vr19lhCAeRp2LCU8dlv2FikF3Xbv9AFjXCt0fHHZPxiFSmB8oEFWoqCkxNZucG35OMoLHBwglrzyG1PRT3UJrm4nmYcfXcNhcISExLx',0),('OOZJu6hAxbilWKF4AvBV55xEZtIolQ','sl061p8y45qnMKxyxHTkkIdMJjTaTXcO6t505MPOOJbRUzisyRTOMvMhnJdVCO6grD7KvRcpCyktF7xWMH5gDGuVBbQ5sK7k8a0DOYNjzNf7LmuTpNs7Good4gW6UMR1',0),('oQseKOQi831vEGO79xvye1wHmvdj3L','QkKeAl2vkjO3Nena6RdyVl6jX8IZNOKG4BCAf0Tcck5aaPyzMsBxSYAnm3eE3DwhfZJQ0AyMbKDzmtJxjW8O7mKUWK3GiMm7Otrcx64JYSBO9vw7kLV3aqkm2asyzU8D',0),('OrJDCvIonRWSzFz3jde2XyAodBceP4','B4LNGUJx4C2Dj9BkR7lTw023gv9zTtAUUjSvDndEurKoGvsQgxmu2GKgRJiVSdhnB6N5vLJuc811SiruNHhgCpyhge0qNEBfRehnfh9gGDaFL7dVDuJkIw1PJ6INkkNG',0),('P0UpmaWumVYJrdcqSl79iT0nPk8zKn','SEFzBqhnd7s8Aos57OYPPyM7SIAXVf4lCYIki0Y2ArxKVGVtUItiUipFBm6l54eIXlOD2yLsDGLrzXTe5vFVrqgT8Q2SqcCtvhFoRLiLXOjAQvi83K4q3dJ8yYFUIRRC',0),('RujdfbE6q10nPw64Wms5x3QUoe5IB4','Y08yUr8Z5xP5NROngVDR1EopNLzpc3WEIQxEiLf5sDAolf9AvCW8gKk41JuQdPV3IfP9gKFnfh6bt55BCqLu4pIG3NU2DqTlY9lGjEBjr7F2K5mZdkNRQQu739tpIXl6',0),('rv0PUfAvqsKvSgaxGrpZ4KYpDLrvUl','xmIixUWX9TJQQbedqkaf1fmpdsbnFeeqf0qNLC43FGEShfXECRiRWtoxscnjITBKuL8NrPgAsbe3J41IC2BqiDxzAM3y2MFqK8Z6TXaVSWDDHfuCq2OPZRHo5V6AEQ8s',0),('RxAlldgxfrukIQ6LLRPaTH2siXXiRg','ANebN1r8vWrdoexiEd062AdSler8KEZjchc3TyIF48bZYLzwXWzeFqNztwdnYEBIOujHKkZZoK6e1F86t14vgWYzVjRuD6rBUnbrnjpYpRK1s4GqYr4fuxzYIlE1ttWu',0),('rY1fyMSfpHYrDrDXGUJtYbMonfCNU5','ayaDcetlUUD36UqYY9HmNx7EscTD2neKjjZadD21yJRkh6WQPQl516IgHzcw1IeFWExcCEPCca3bRXHIvFUuOcP8IRfApwTil8B1ULqXQgyAVjZEotNJz3Sl9lzxuZY1',0),('S4kPvzX2dO9ltMNE2HV8Tlgh0fj8nk','MkXNwFZGLItdO01H7g1VNjE60epHAlAncsVODyf164cuDHfwjlCKhZDmp2tgNYqcRwbGW3QtI4waSRsZRidyWVIImtYNjRYwTVnbKfhSkghnzaTnJbaghgmzRFakQDVi',0),('s89xRJpkH06w1d5yVwHyhTMRwjDSNY','xmB1yhv5cYc3Ikk2O8bZvQnODMPx1SnC86L5x5xvOTBmd7T8GSNoEOtcNzurvDfW11yOEqgXUc8acFD17Jrsf99Jdis5Gf2pJBTOeV2R7IjH9E7P5UWedf3C9iyZh8mR',0),('sPFPMREeASPs33uUxbzC0CPlQFoPAG','OKLvDHhAnk7AF6cpjToVX2cyJF4MaVX3UjdsC1Zt62rcJoFlEmjIfG34nBVBzvwCHBSarSfOHR3VcFT24P52vi9s1I5hV2S0Jcb32VmHnvlDswHADa4vgxnHRfPn11co',0),('sqTpaMbQyVbRoYCln5XTklVF2ijrHp','oaTr7ts6X9y7gzPgsIEhNvqAyFiQLlclByWI9nZO6k6fluyfpNlG8i7RhhmGov0ERrrjXWLGiECPKJCg3dV8qXlI8ehU6Lq4IMgqzjlZSC584zGWMIDHbxgLtosCCuBb',0),('sS11GdYLvuKkESUk399QkeEV8Jo5WW','KhN7ZTYKz9YBwkYd3GOWD5KZBnnLIpmgNFEFJRVHUtjb3SEUabOTsEG4C5dOOd3c13DGKjUy5JNd0hnwANBRmzZjNiVfnw4FZcawp52sP5PCrZM42aS1ovVw6hJuS5ka',0),('t8mpmBKl9WidQeHeaaZ1b0A29nt3mN','YMSRm42amJNMPoCWqigT5SlBkQsbs5Md36Rtak5B1INNT4eBhsWwRTHxa9S4IpYIpGgpGie4oig0TPdxisSvcc4JNAzrx9OhpWSSAaScarZjyUZF9HdpkVKD86SVbG7K',0),('ToT71NgzN1xaPeFT6M0U87nJekc1H2','IYaZgVjEh7dnVNKFRnLZ6wZ0bFhO0F3tAkEsIBZEWgXNZbPVbXCQFhtZZe0UIjChplxah9pDTWQmvxCPG11MtDDT0yKzykgNmb3z1JhQpQho14lqzAYdOG9RtCh9dzrS',0),('uapuYuYqsoTYb3wtHk4ZDAXvTbx4xX','CmaPxXpWNKMQ9qBrWWfcw6wAZiFt8KzAJmCxhJBxjpddDlEtCQEN8nKA1nm3IaP0tyiUac0U9nr0PrAp3vBXGJ25au8fXZzgVlvycHZRJjwVyaowYooXg6oIXyI3nqkA',0),('uC34OMQiRSGAQYiC7mHEW0VGHn3aPN','IXfCeS7wtx52ZZfc6y9CwZ5hYBWskIrIJFunk5fE6CrlOHVuzbJqZeSW7wun5OhdYg48AtQqMVw6ttEHPw3S55TFDaD2pQHzh48smifJozrhbMJd0DDKwbSKctCqnyPX',0),('UEfDtMc9UU7YuJMRnjp70XlqNEkTya','ETTjV36AwvRRjvdT9h7PSGT4ilVrGxdMWl2jUHxpASOGkvqQnHnFbYi6XpJbSnNFMJ1sT3RKWyleepeyJG33YWgEPBZ5Qzxi86lJv4X2vQwtsIWjBpyrfrRI8Na74Fyy',0),('uFVEL4S9cOaXOupppLdlm6w8DO51ZN','UH9LqjaXzE2yGEvmk1LZR22n2YTEFcKZ33Qn4DpHCOeYfWgYRHElWXh8lAyp9bEhXpuPA0Z1R8FIZw510ZqGAu50v9VFaGHXi9hsLeNWDlvZ9m50zXrSRAkFZQ72pSCT',0),('V1Hjch78JZJn7DG8mQ5kGX4Ii5y6Jh','iEygNGd7a84dflQljusgArg7BI8oMM7DWfmhn9uZpykKEeVeMUpHI8RyR86T29cF7847RCtI78cL39SJNHOGGe2QWRmvZdk0YuPG7rrdLM2BRtczsCWjg2ianQqNrTRV',0),('Vdy04xvtZeoBU9GQFYtcYxFYwZG49m','c16AURqOqoGgcc35UZmHnZwcGncFxcxHOoFoaiqwZcBmu4eI9PQTZT0nyR16MqFguRvyfHveNmFNAhS2J2eJOe8Fq6kPgpOP6nqf9PSkTyz8ZcPX5eQhaCcC9Eq2ss6V',0),('VJj2FGQ9AVsDU3jcubgzsLtlhHkK1p','i2z9m5FKWajK3LwOB3An59Df4pMcDoXYre12uU2YZoGxeO7fJZJodvu4wtazPJSyVo9ycjqYLV0Uao2L9CKkfQH9N3JchNO9NqatnWE6c0N4aHBhwNDEm7Nj5A3h9Tbc',0),('VM5vpqW5uqzyYIqr3AJ5t7mXGMtdeR','LDUL6IfTppUVIw6D3EnLE8iMHy2EKgERAYiTmu7GkwQTJRpkJ2c3iue8kMeYdrsNjgRNyMxJnqOZ9rmClMcFqBeEYOrlYN5tQKXRf6akMkZ516k2mTChv50rF1DmCtKC',0),('Vog3SPXmaeNT2jdV3eyHGME6Ev5aAL','cZ6RKm3MeUhOLFQFsAIkWhv1cCloNlqaAuIkioJhLdyyU5VVkdDGA1p3QTR0FavfJsNHK58zMiu1TafOnITUuVonOUQJAcqGhYwTWycvdJBa7Qoo2dF322VvhC09U1Pt',0),('VtYJLh4QZT3SYkryMTMB5PtguXJ8vE','6WZu5Hcr6ZjMDn4R9ONgdRcII9Q1IoK4QHrEcJnzw1C5mv5RiLGJougP3KGoFJZZk9gIw4ZlvuRPYZU1umHDEUqiwtS2vMGkOrqkU84GCOBwNOIJnsgDV28PMH5YR7ON',0),('wGOBoiMxrMjct6fiEB5gNzVcX2uvRw','SjOjlLucF6C7zA1huVzPVYlOFxquNWsIGw3EVKAiyo0wNZzfr6wJ7aHqhwjpT16ITCoJTQ46hkGrPmZ6yDRaoLKQAbWT7FBE5aIN6aeCMFeZyvJws6ClbEHXDycMBaih',0),('WOH4f8ispKl3smL0kn6Sagmaa48pyh','OlExclw5KnYCqWISil5vpbtxYUCCQ6zBal8Aovx8qIT19LR5OfuPboJmDyU5aXPFimrM6S66JOH4xDbZUu2eV7Nm28zOMbb7WM9IDqmqjRy5HzxHXNfuh4NrzWWIfShK',0),('wtOfG5LspQcouHLEulA3jUOotp8dIU','9c8abZZ2ARLqcKHz9NNwFTygcsg2JqrLiinz0L7Rn2e9WFfwFL78u1I47Rl8VExivhqRuIVxJnm1r70NU7bTcCcyC7T8mpVPYD2ZoZV7AmT62MNGlUIusKCuem071FWY',0),('WUo14j6Kj4DZu3pkBMN6R9VaWEf7sQ','JHkcj2vB8Lfvz6MFDEHCBzyWtmDx92mL48Go1I6oa6BLGDVK3iWZTzdNmxlrO0Wim2PDp8JcDTFVvug1BQag8VNQUSALjoosscYBl1FtlpBb3V4kuxEZor1tAEjjMpiz',0),('WW0nBKjxTR6CPiSa76DqyZhjJJSLeo','7JuURBsqbcDIawlAo4DfQokNk3gAitTKvKJQCplGtqjMjbbt6f2G4Tj8Yz9sYJO8ZECOykk3NsZjctR1NCOvxZqhSdXEKBqccNdBEBHy59TwEuCPUT1kDr6eDXLumgUP',0),('yNQcNQ6RleqfyaKfo6ea9xlL3DsOh5','Sv6irzjkdtdtkn0d8HkrKyZeyZwyFu0xC0nRoY2VBHbm0pAIT7zHGJiImEbrkloMHNk7v1HYcsQKkFm5eXsbNhYxzqBzZZflJecFsrxfyuywqTqc2W8GXpTqZACUWARD',0),('Ytr3wPHuvqY5Iyh77Oo2dFGWpg4pMx','pRxnYm1tSYHwvdFQYuMTclny1ichNb4AJKUuEao8x72COf70ZFFTP6EcFDzqVpOrRlU14AKeEmxKbCO2gtQtfljfOZ9NjjP8jTbHuF4fEzTm05me42AtCgbNvNz5fSP9',0),('YuNHH29sN7xmP5SXfKoyEOxOrq5MfN','XO8zD85k9yYDtJmLzjQdQ9iRq0bqYXc8gtnD4WjCA99KYc0YimUq32J8grcUn6z7zehLHR0ZL2KuNlr1Mdu4zJQre0m5QS5VlNb672rPRaBAlC9JpO3njfdwHdRPVlVr',0),('Yz4BFJbvKexeRiVE6IPCbycytNTsD9','cb36N4Y6bMWs3eKvuXjYPMq66gh1dxlwSIQIdg17AZFhrr3JwJCb2ZPdlaxlcw1okJLO0xWNRFQhNmPljTA3ivf26v4IJFIjP9Uva4YpJnf87h8BuKRWdvqHQRdEbeiL',0),('zkKPJaEKT4gYRiZeXyOmcEF2j6IUVR','LSxRAj8LhEKhlSzVYmpLDyf0mLAWOfCLMIbl4IIhvqK3s5bVD6pV44TePM3TjLEOyNp8hOiY46u5Npwlo2fxktCTeKoKjUeJ1zsot2AB3uSxLVNRP8imnlzHFbtFhPFC',0),('zLG9m9PJCGm6NQi1EoOmjgk5BSGkfB','j8YNHfOpiMM37goNQAe5QVPKUF7vCTuoN8jeZqBS3JsFeXsiGg9Yd7Uz0Nsx8Gy7QvXDMJNqUWLfpiprU1LUukxTfZWWefIxJvrl31zYT1XqNXSANGeKiLy0MDiKaSQx',0),('zvFEd3ImL0mMJzcOe7jWzstS4amuse','fSrsm7OzaIys3mxaA8CNOEE7rZn5iataeyhKJD77yP2Dh1ouDja6Tq9J1kvXCwJevNQidDBbG5dfyPYCsrR5Chgil7gSGRQmmgoz4zjbwXWUTwG7paCl1F5vklnHSzpG',0),('ZYDORBMsgbjthYqQuGkK4sgPzLNMXY','sxhCMVEvPxKeJuIrHS3QLJnlwubC9wiXNMesQjOgMmcWz2yxGZ9ugc77G4Hdsj7H6LvODmzfiKtKpVepjAYq80fotgZq9REsQ5nduf03Iu1ZwdLvVh8I3QH74JnIEhKE',0);
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
  CONSTRAINT `player_skin_inventory_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_skin_inventory`
--

LOCK TABLES `player_skin_inventory` WRITE;
/*!40000 ALTER TABLE `player_skin_inventory` DISABLE KEYS */;
INSERT INTO `player_skin_inventory` VALUES ('gembarnus',1),('gembarnus',2),('gembarnus',3),('gembarnus',4),('girmany',1),('girmany',2);
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
  `display_image` varchar(255) NOT NULL,
  `background_image` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_skins`
--

LOCK TABLES `player_skins` WRITE;
/*!40000 ALTER TABLE `player_skins` DISABLE KEYS */;
INSERT INTO `player_skins` VALUES (1,'Knight','knight.png','','The most common soldier'),(2,'Rogue','rogue.png','','Beheaded his own master. Imagine what he can do to you...'),(3,'Samurai','samurai.png','','Bound by loyalty, but not by law. Beware!'),(4,'Entity','entity.png','','Zero identity, defined only by its boundaries.'),(5,'Butcher','butcher.png','','Set free from the Váci hentes, on his way to kill the furries. (He killed the Duolingo Owl btw)');
/*!40000 ALTER TABLE `player_skins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players` (
  `username` varchar(30) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES ('0UghL9qPNzQsFegGzJWisyw5ychmD4',70,77.94456481933594,379,4,4,5,1,2),('1kHVFEYm7GB2YMoqZu0QB9YRZsVwAK',23,88.12190246582031,149,4,1,2,1,4),('1pjiDAchlfUE9foGsgGs1CsOJyAR2c',5,16.777517318725586,163,4,4,2,3,4),('1TCljYcvcTfrn7YXpCeITpmgFH0zBm',49,57.36177062988281,252,5,5,1,5,3),('1XKHKibJVumEkImQ9v1EQajxwpsgtO',19,91.11637115478516,365,1,2,3,1,3),('2drNrH8Xi1N23m4EF50Ei419S55Viy',30,87.04908752441406,473,5,1,2,4,3),('2H0haYjh9K2sKMxN3785Wm0HkqyeAU',34,31.356521606445312,175,4,3,2,1,4),('2R8p27wG8gvM3lKj2GsXeuSJ8dibnl',42,79.45818328857422,281,5,5,5,5,5),('2xaqvLC0gxfeMObRac53cs2kTZDowE',83,58.00962829589844,83,4,1,4,2,1),('2ZV3XJbtjZOaoiAvziUEO4HsV6jmog',37,14.404695510864258,440,3,2,5,2,4),('3hWNEWY1TJbhsU9VONjs0Lk9Sdt4Hu',99,12.429285049438477,373,5,5,2,3,4),('4KdZbshf2WfkQDINvn7thwsKUBHVtl',50,17.847766876220703,12,3,1,1,5,5),('4POv7lPrB9r3HScotR3FBx25ofSDqk',89,45.2338981628418,300,5,1,3,3,4),('5geFnUXPsqylk2Vw1EHdRYKFOelMah',56,69.05805969238281,378,2,2,1,5,4),('7vt8ADi39iSeUKrY3axE0wBMQvTrhV',90,16.747957229614258,351,3,4,3,5,4),('8keFXZgnfCjPOjQdhoQ8ZG2ciyMBbO',4,51.853172302246094,270,5,3,5,2,3),('9k70OXiOwm6Wn6A1vSbm7calTTbWiS',12,46.909854888916016,103,3,5,3,5,5),('af1cB3xFee6ZAPRde4tU5RSvuVGAn6',100,72.03633880615234,24,2,3,5,5,5),('AFCDg1F7K4VGwqXiLaSVCObhrbwC2x',13,26.916139602661133,328,4,4,4,2,1),('AhJXyyuhTsQ9gUeDZdHywnPqqmVU99',37,39.36427688598633,503,4,4,2,5,1),('b74PjZb9KbbZNAZlOrEjp0KjgNQyI2',50,19.475082397460938,334,4,1,4,1,4),('batyu',21,45,12,7,3,1,1,1),('batyuzo',0,0,0,0,0,NULL,2,1),('bkyJkMS4AGQp2ZXVaJVtm3xWtKWRnW',67,64.45103454589844,323,1,5,1,4,1),('BzvE5u6XQEHDC7hXCdSLiRz3LidnHE',54,43.028621673583984,196,2,4,5,3,1),('Cb5O2DBuHzGkEqZ1prQm3fUPFYPrrT',20,33.9015007019043,78,2,2,4,3,1),('CGdPu2v6Jw74HJZtnBKtcqUW1qjkVF',59,48.134910583496094,175,5,5,3,4,4),('cHUkX6JvP9qkzAbfwDou1YmAqcIOPY',83,28.996299743652344,86,3,1,5,3,4),('cjpLLh8McUbxcltz8iEyqdSalO8ehc',28,78.88040924072266,288,1,1,4,5,3),('cNspSxyZM082gAuzLgxwlgd9kgP3wO',50,18.0150203704834,313,5,2,5,5,4),('cSJhKxSM5g9dUh5rhuqF4cnqVKKBGG',78,5.264167785644531,483,1,3,5,5,3),('cy10KVPJh37HK2hJTHHidIT2BNOKJ8',68,22.884876251220703,444,1,1,1,5,4),('D99PUKB35Hx2R5j1Gekpfj2PGb7KlY',12,7.042112350463867,243,3,2,4,1,2),('DArJoQNXvGEtDJ5iNozcxZKcS7BM7Z',13,41.66267776489258,477,3,4,5,2,4),('DlOq0Sfi7QXqe5G1f1AHAFOxEVjUsu',6,85.37594604492188,81,4,1,5,4,5),('dT5EvQHak3yAkzlOM64G25bVGp0D2M',83,69.13838195800781,71,1,1,3,5,3),('EBdtdvKUb5QSAvXDTztu8DpXNUemng',26,15.788393020629883,109,3,4,5,3,3),('EDWUhlgOoNmDi95VHX59lhZHCIR4Nl',0,65.12394714355469,505,2,1,4,1,4),('eH33iikPnZWVvw1bnoSLAEYxNAuD9N',64,68.3124008178711,61,4,3,5,4,3),('gembarnus',0,0,0,0,0,NULL,3,1),('girmany',0,0,0,0,0,NULL,4,1),('gizmo',0,0,0,0,0,NULL,1,2),('gjpmim7LTmomlP6IUhPB9TvJ6hROxM',55,90.15375518798828,311,2,1,3,2,3),('gL3pYjwsxxfgPrb7G1t80rlFUXussM',86,25.341564178466797,277,4,2,3,1,4),('GQLMCHjWHyWZuPwcm7SPPZIhHO7jkU',68,3.915651321411133,353,5,5,1,3,2),('h8IQT6RjLzBYt3O9rEF79SIxYqEfhC',74,67.48799133300781,214,5,5,3,2,5),('HldoPTK4xM1UpKaaKRreJHKYyYDNe0',69,66.9729995727539,281,4,5,2,5,1),('HLw0xAy5BlLJZiZrQv8nXV8fJ5nlEg',11,35.163814544677734,343,4,3,4,3,2),('hNtGWOYfl72vagpYP10UYAkj3FF0Po',54,13.66801643371582,479,4,3,1,1,5),('I8jYcaX34iCnGEphHeG9n0utmsnXD6',95,14.096390724182129,237,1,2,2,3,1),('jlJHPlzGugdBwO47AQKYj6xsEEJdKR',16,63.787166595458984,324,5,3,2,3,1),('jxX0OyfokBkIeYZABe5Ef5E3JBkMTn',27,4.534468173980713,424,4,3,3,4,1),('k03Cjwc7KnwexzINPEgjeH8lnKiPZW',83,23.116262435913086,127,5,4,2,4,3),('K1v3I8A7F4T8qdCuL0bfCCe4sFdIMv',60,73.24268341064453,348,4,3,3,5,4),('kGh34OV5uFGot04Va2N3XFa75MX6lL',59,46.89240646362305,113,4,2,3,3,5),('kPGBilUgqny8PVsE6wlWPXFzXy9tty',18,33.39250946044922,32,2,5,3,3,4),('L5LIvlxICZKyLJ8T7AyRP4IX4Tf75a',85,24.29001235961914,215,1,5,5,3,3),('LeJg7C1Qr8LVSKsLwLMRIuwQOS7QKL',5,2.7817788124084473,404,3,4,1,1,2),('lP64j2LkjCwHexe8hMU5JPj8ztIMPx',20,24.14510154724121,91,1,2,1,4,5),('m4b8HdNiMh4FoUi7IhNlKDIPfiPjWn',93,4.159496784210205,168,1,1,3,1,4),('md1itMFcQV2bbiXQIMpEqkaB0VBAZR',16,19.55788230895996,311,4,5,1,5,2),('MIARhofTYZplX4EErVuVXrnqMuYuXR',53,77.3717041015625,111,5,5,3,3,4),('MP6xKS3n83hGQn5wYq43SWYkgGzKvF',12,67.07158660888672,3,3,3,4,4,4),('nMusfw62e0qs6sJpFvwSr55dH0fr9X',62,89.90750122070312,72,3,4,3,5,1),('nR2tsrYxQWyVcR7oN3mzOpY63rffPx',32,52.26374816894531,82,1,4,2,1,3),('ocGHUaPV82btHYOtWH2ouPloE8GQHo',17,63.417823791503906,329,3,4,3,5,1),('oNx6kDghFmG11yMBvHEbeHuWbDq2rr',83,39.88207244873047,300,5,4,1,1,5),('OOZJu6hAxbilWKF4AvBV55xEZtIolQ',23,57.12376403808594,232,5,1,4,2,1),('oQseKOQi831vEGO79xvye1wHmvdj3L',69,32.305049896240234,65,2,1,2,1,1),('OrJDCvIonRWSzFz3jde2XyAodBceP4',38,79.98065185546875,13,2,2,1,4,4),('P0UpmaWumVYJrdcqSl79iT0nPk8zKn',21,70.49296569824219,277,3,2,4,2,1),('RujdfbE6q10nPw64Wms5x3QUoe5IB4',13,14.604379653930664,231,4,5,3,1,2),('rv0PUfAvqsKvSgaxGrpZ4KYpDLrvUl',18,22.91025161743164,189,4,4,3,3,3),('RxAlldgxfrukIQ6LLRPaTH2siXXiRg',5,88.77236938476562,6,2,5,5,3,2),('rY1fyMSfpHYrDrDXGUJtYbMonfCNU5',36,12.191581726074219,26,5,4,1,3,3),('S4kPvzX2dO9ltMNE2HV8Tlgh0fj8nk',41,87.9725112915039,173,5,1,4,3,3),('s89xRJpkH06w1d5yVwHyhTMRwjDSNY',78,72.5754623413086,209,2,5,5,3,4),('sPFPMREeASPs33uUxbzC0CPlQFoPAG',63,89.27446746826172,92,4,3,2,2,3),('sqTpaMbQyVbRoYCln5XTklVF2ijrHp',75,48.04045486450195,83,5,4,2,2,4),('sS11GdYLvuKkESUk399QkeEV8Jo5WW',98,46.214324951171875,17,2,4,5,1,2),('t8mpmBKl9WidQeHeaaZ1b0A29nt3mN',99,73.781005859375,169,1,3,1,5,1),('ToT71NgzN1xaPeFT6M0U87nJekc1H2',98,47.97722244262695,294,4,5,1,5,5),('uapuYuYqsoTYb3wtHk4ZDAXvTbx4xX',62,18.534175872802734,328,4,5,3,1,5),('uC34OMQiRSGAQYiC7mHEW0VGHn3aPN',51,11.539300918579102,208,3,2,1,3,1),('UEfDtMc9UU7YuJMRnjp70XlqNEkTya',85,31.895734786987305,58,1,4,5,5,5),('uFVEL4S9cOaXOupppLdlm6w8DO51ZN',4,42.60246658325195,453,4,3,5,3,5),('V1Hjch78JZJn7DG8mQ5kGX4Ii5y6Jh',63,21.06834602355957,305,5,2,3,5,2),('Vdy04xvtZeoBU9GQFYtcYxFYwZG49m',19,7.4736504554748535,243,3,3,2,4,1),('VJj2FGQ9AVsDU3jcubgzsLtlhHkK1p',53,15.553082466125488,223,1,2,1,2,3),('VM5vpqW5uqzyYIqr3AJ5t7mXGMtdeR',59,75.18721771240234,429,3,3,1,5,2),('Vog3SPXmaeNT2jdV3eyHGME6Ev5aAL',10,6.3183274269104,466,5,4,4,4,4),('VtYJLh4QZT3SYkryMTMB5PtguXJ8vE',85,81.83431243896484,140,5,2,2,5,1),('wGOBoiMxrMjct6fiEB5gNzVcX2uvRw',15,81.73526763916016,226,4,2,2,3,2),('WOH4f8ispKl3smL0kn6Sagmaa48pyh',43,7.766647815704346,374,1,5,3,3,3),('wtOfG5LspQcouHLEulA3jUOotp8dIU',89,44.759220123291016,340,3,2,4,3,4),('WUo14j6Kj4DZu3pkBMN6R9VaWEf7sQ',95,55.62948989868164,285,1,1,3,4,1),('WW0nBKjxTR6CPiSa76DqyZhjJJSLeo',34,7.709743976593018,137,5,5,2,2,3),('yNQcNQ6RleqfyaKfo6ea9xlL3DsOh5',45,86.46504974365234,239,1,3,2,1,4),('Ytr3wPHuvqY5Iyh77Oo2dFGWpg4pMx',37,8.419471740722656,342,3,5,1,1,5),('YuNHH29sN7xmP5SXfKoyEOxOrq5MfN',10,56.125953674316406,474,5,2,3,1,5),('Yz4BFJbvKexeRiVE6IPCbycytNTsD9',92,54.9355583190918,257,3,2,1,2,1),('zkKPJaEKT4gYRiZeXyOmcEF2j6IUVR',50,34.497520446777344,100,5,5,2,4,3),('zLG9m9PJCGm6NQi1EoOmjgk5BSGkfB',5,54.69929122924805,263,4,1,5,3,2),('zvFEd3ImL0mMJzcOe7jWzstS4amuse',96,48.481689453125,295,2,1,1,2,5),('ZYDORBMsgbjthYqQuGkK4sgPzLNMXY',17,39.755577087402344,25,4,2,5,5,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;
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

-- Dump completed on 2025-02-24 13:10:54
