-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Dec 02. 14:23
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `bullet_hell`
--
CREATE DATABASE IF NOT EXISTS `bullet_hell` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bullet_hell`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `maps`
--

CREATE TABLE IF NOT EXISTS `maps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `file_name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `music_pack_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `music_pack_id` (`music_pack_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `maps`
--

INSERT INTO `maps` (`id`, `name`, `file_name`, `description`, `music_pack_id`) VALUES
(1, 'Slaughterhouse', '', 'This is the kind of place you really shouldn\'t go into, but out of sheer curiosity, you step in. The scent of blood and what you see overloads your senses. You will never get out.', NULL),
(2, 'Riot', '', 'Someone\'s had enough. That someone had a loud voice. This voice was used to destroy things. Now you\'ve had enough.', NULL),
(3, 'Palace of the Setting Sun', '', 'I live by the sword, you die by my sword.', NULL),
(100, 'Limitless', '', 'Every weapon deserves a chance to shine. Even if they are trash. But you never know.', NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `map_assets`
--

CREATE TABLE IF NOT EXISTS `map_assets` (
  `asset_id` int(11) NOT NULL AUTO_INCREMENT,
  `map_id` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  PRIMARY KEY (`asset_id`),
  KEY `map_id` (`map_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `map_weapons`
--

CREATE TABLE IF NOT EXISTS `map_weapons` (
  `map_id` int(11) NOT NULL,
  `weapon_id` int(11) NOT NULL,
  PRIMARY KEY (`map_id`,`weapon_id`),
  KEY `weapon_id` (`weapon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `map_weapons`
--

INSERT INTO `map_weapons` (`map_id`, `weapon_id`) VALUES
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(3, 31),
(3, 32),
(3, 33),
(3, 34),
(3, 35),
(3, 36);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `music_packs`
--

CREATE TABLE IF NOT EXISTS `music_packs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `anthem` varchar(50) NOT NULL,
  `main_menu_theme1` varchar(50) NOT NULL,
  `main_menu_theme2` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `music_packs`
--

INSERT INTO `music_packs` (`id`, `name`, `anthem`, `main_menu_theme1`, `main_menu_theme2`, `description`) VALUES
(1, 'Dusqk', 'relative path', 'relative path', 'relative path', 'Floaty, angelic voices and electric beats assist you in your fight with your opponent.\r\nby Dusqk'),
(2, 'CRT_HEAD', 'relative path', 'relative path', 'relative path', 'Imagine a russian bloke on crack. This figure plays his favorite music while you disfigure your enemy.\r\nby crt_head');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `players`
--

CREATE TABLE IF NOT EXISTS `players` (
  `username` varchar(255) NOT NULL,
  `points` int(11) NOT NULL,
  `winrate` double NOT NULL,
  `all_games_played` int(11) DEFAULT NULL,
  `kills` int(11) NOT NULL,
  `deaths` int(11) NOT NULL,
  `most_used_music_id` int(11) DEFAULT NULL,
  `music_pack_id` int(11) DEFAULT NULL,
  `active_skin_id` int(11) NOT NULL,
  PRIMARY KEY (`username`),
  KEY `most_used_music_id` (`most_used_music_id`),
  KEY `music_pack_id` (`music_pack_id`),
  KEY `fk_players_player_skins` (`active_skin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `players`
--

INSERT INTO `players` (`username`, `points`, `winrate`, `all_games_played`, `kills`, `deaths`, `most_used_music_id`, `music_pack_id`, `active_skin_id`) VALUES
('batyu', 21, 45, 12, 7, 3, 1, 1, 1),
('batyuzo', 0, 0, NULL, 0, 0, NULL, NULL, 1),
('gembarnus', 0, 0, NULL, 0, 0, NULL, NULL, 1),
('xXNiggerSlayerXx', 0, 0, NULL, 0, 0, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `player_login`
--

CREATE TABLE IF NOT EXISTS `player_login` (
  `username` varchar(255) NOT NULL,
  `password` varchar(128) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `player_login`
--

INSERT INTO `player_login` (`username`, `password`) VALUES
('batyu', 'batyucsakbatyu'),
('batyuzo', 'batyuzik'),
('gembarnus', 'gembarnus'),
('xXNiggerSlayerXx', 'adminadmin');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `player_skins`
--

CREATE TABLE IF NOT EXISTS `player_skins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `player_skins`
--

INSERT INTO `player_skins` (`id`, `name`, `file_name`, `description`) VALUES
(1, 'Knight', 'path-to-knight', 'The most common soldier');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `player_skin_inventory`
--

CREATE TABLE IF NOT EXISTS `player_skin_inventory` (
  `player_id` varchar(255) NOT NULL,
  `skin_id` int(11) NOT NULL,
  PRIMARY KEY (`player_id`,`skin_id`),
  KEY `skin_id` (`skin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `player_weapon_skin_inventory`
--

CREATE TABLE IF NOT EXISTS `player_weapon_skin_inventory` (
  `player_id` varchar(255) NOT NULL,
  `weapon_skin_id` int(11) NOT NULL,
  PRIMARY KEY (`player_id`,`weapon_skin_id`),
  KEY `weapon_skin_id` (`weapon_skin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rarities`
--

CREATE TABLE IF NOT EXISTS `rarities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rarity` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `rarities`
--

INSERT INTO `rarities` (`id`, `rarity`) VALUES
(1, 'Common'),
(2, 'Rare'),
(3, 'Unique');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `weapons`
--

CREATE TABLE IF NOT EXISTS `weapons` (
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
  PRIMARY KEY (`id`),
  KEY `rarity_id` (`rarity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `weapons`
--

INSERT INTO `weapons` (`id`, `name`, `file_name`, `damage`, `fire_rate`, `semi_auto`, `rarity_id`, `projectile_speed`, `mag`, `description`) VALUES
(11, 'Scythe', '', 100, 1, 1, 3, NULL, NULL, 'A deadly weapon'),
(12, 'Nailgun', '', 20, 3, 2, 2, 0.8, 13, 'A deadly weapon'),
(13, 'Cleaver', '', 70, 0.8, 1, 1, NULL, NULL, 'A deadly weapon'),
(14, 'Chainsaw', '', 3, 20, 2, 2, NULL, NULL, 'A deadly weapon'),
(15, 'Taser', '', 50, 1, 1, 1, NULL, NULL, 'A deadly weapon'),
(16, 'Knife', '', 50, 1.5, 3, 1, NULL, NULL, 'A deadly weapon'),
(21, 'The Power of Words', '', 10, 30, 2, 3, 343, 60, 'A deadly weapon'),
(22, 'Pistol', '', 35, 3, 1, 1, 1, 12, 'A deadly weapon'),
(23, 'Shotgun', '', 15, 0.75, 1, 2, 0.85, 7, 'A deadly weapon'),
(24, 'Pressure!', '', 7, 4, 1, 2, 0.85, 2, 'A deadly weapon'),
(31, 'Wrath of Nobunaga', '', 400, 1, 1, 3, 0.8, 1, 'A deadly weapon'),
(32, 'Bow', '', 70, 0.3, 1, 2, 0.75, 1, 'A deadly weapon'),
(33, 'Kunai', '', 40, 1, 1, 1, 0.75, 0, 'A deadly weapon'),
(34, 'Dagger', '', 50, 1.5, 3, 3, 0.5, 0, 'A deadly weapon'),
(35, 'Katana', '', 75, 1, 3, 2, 0, 0, 'A deadly weapon'),
(36, 'Spear', '', 50, 0.6, 3, 1, 0, 0, 'A deadly weapon');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `weapon_skins`
--

CREATE TABLE IF NOT EXISTS `weapon_skins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weapon_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `rarity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `weapon_id` (`weapon_id`),
  KEY `rarity` (`rarity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `maps`
--
ALTER TABLE `maps`
  ADD CONSTRAINT `maps_ibfk_1` FOREIGN KEY (`music_pack_id`) REFERENCES `music_packs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Megkötések a táblához `map_assets`
--
ALTER TABLE `map_assets`
  ADD CONSTRAINT `map_assets_ibfk_1` FOREIGN KEY (`map_id`) REFERENCES `maps` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `map_weapons`
--
ALTER TABLE `map_weapons`
  ADD CONSTRAINT `map_weapons_ibfk_1` FOREIGN KEY (`map_id`) REFERENCES `maps` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `map_weapons_ibfk_2` FOREIGN KEY (`weapon_id`) REFERENCES `weapons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `fk_players_player_skins` FOREIGN KEY (`active_skin_id`) REFERENCES `player_skins` (`id`),
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`most_used_music_id`) REFERENCES `music_packs` (`id`),
  ADD CONSTRAINT `players_ibfk_2` FOREIGN KEY (`music_pack_id`) REFERENCES `music_packs` (`id`);

--
-- Megkötések a táblához `player_login`
--
ALTER TABLE `player_login`
  ADD CONSTRAINT `player_login_ibfk_1` FOREIGN KEY (`username`) REFERENCES `players` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `player_skin_inventory`
--
ALTER TABLE `player_skin_inventory`
  ADD CONSTRAINT `player_skin_inventory_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `player_weapon_skin_inventory`
--
ALTER TABLE `player_weapon_skin_inventory`
  ADD CONSTRAINT `player_weapon_skin_inventory_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `player_weapon_skin_inventory_ibfk_2` FOREIGN KEY (`weapon_skin_id`) REFERENCES `weapon_skins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `weapons`
--
ALTER TABLE `weapons`
  ADD CONSTRAINT `weapons_ibfk_1` FOREIGN KEY (`rarity_id`) REFERENCES `rarities` (`id`);

--
-- Megkötések a táblához `weapon_skins`
--
ALTER TABLE `weapon_skins`
  ADD CONSTRAINT `weapon_skins_ibfk_1` FOREIGN KEY (`weapon_id`) REFERENCES `weapons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `weapon_skins_ibfk_2` FOREIGN KEY (`rarity`) REFERENCES `rarities` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
