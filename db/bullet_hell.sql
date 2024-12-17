-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Nov 28. 13:38
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

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

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `maps`
--

CREATE TABLE `maps` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `file_name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `music_pack_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `map_assets`
--

CREATE TABLE `map_assets` (
  `asset_id` int(11) NOT NULL,
  `map_id` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `map_weapons`
--

CREATE TABLE `map_weapons` (
  `map_id` int(11) NOT NULL,
  `weapon_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `music_packs`
--

CREATE TABLE `music_packs` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `anthem` varchar(50) NOT NULL,
  `main_menu_theme1` varchar(50) NOT NULL,
  `main_menu_theme2` varchar(50) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `music_packs`
--

INSERT INTO `music_packs` (`id`, `name`, `anthem`, `main_menu_theme1`, `main_menu_theme2`, `description`) VALUES
(1, 'Dusqk', 'relative path', 'relative path', 'relative path', 'képzelj el egy orosz embert, aki cracken van, és elektronikus zenét  csinál');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `players`
--

CREATE TABLE `players` (
  `username` varchar(255) NOT NULL,
  `points` int(11) NOT NULL,
  `winrate` double NOT NULL,
  `all_games_played` int(11) DEFAULT NULL,
  `kills` int(11) NOT NULL,
  `deaths` int(11) NOT NULL,
  `most_used_music_id` int(11) DEFAULT NULL,
  `music_pack_id` int(11) DEFAULT NULL,
  `active_skin_id` int(11) NOT NULL
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

CREATE TABLE `player_login` (
  `username` varchar(255) NOT NULL,
  `password` varchar(128) NOT NULL
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

CREATE TABLE `player_skins` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `player_skins`
--

INSERT INTO `player_skins` (`id`, `name`, `file_name`, `description`) VALUES
(1, 'Knight', 'path-to-knight', 'The most common soldier');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `player_skin_inventory`
--

CREATE TABLE `player_skin_inventory` (
  `player_id` varchar(255) NOT NULL,
  `skin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `player_weapon_skin_inventory`
--

CREATE TABLE `player_weapon_skin_inventory` (
  `player_id` varchar(255) NOT NULL,
  `weapon_skin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rarities`
--

CREATE TABLE `rarities` (
  `id` int(11) NOT NULL,
  `rarity` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `weapons`
--

CREATE TABLE `weapons` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `fire_rate` int(11) NOT NULL,
  `semi_auto` tinyint(1) NOT NULL,
  `rarity_id` int(11) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `weapon_skins`
--

CREATE TABLE `weapon_skins` (
  `id` int(11) NOT NULL,
  `weapon_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `rarity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `maps`
--
ALTER TABLE `maps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `music_pack_id` (`music_pack_id`);

--
-- A tábla indexei `map_assets`
--
ALTER TABLE `map_assets`
  ADD PRIMARY KEY (`asset_id`),
  ADD KEY `map_id` (`map_id`);

--
-- A tábla indexei `map_weapons`
--
ALTER TABLE `map_weapons`
  ADD PRIMARY KEY (`map_id`,`weapon_id`),
  ADD KEY `weapon_id` (`weapon_id`);

--
-- A tábla indexei `music_packs`
--
ALTER TABLE `music_packs`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`username`),
  ADD KEY `most_used_music_id` (`most_used_music_id`),
  ADD KEY `music_pack_id` (`music_pack_id`),
  ADD KEY `fk_players_player_skins` (`active_skin_id`);

--
-- A tábla indexei `player_login`
--
ALTER TABLE `player_login`
  ADD PRIMARY KEY (`username`);

--
-- A tábla indexei `player_skins`
--
ALTER TABLE `player_skins`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `player_skin_inventory`
--
ALTER TABLE `player_skin_inventory`
  ADD PRIMARY KEY (`player_id`,`skin_id`),
  ADD KEY `skin_id` (`skin_id`);

--
-- A tábla indexei `player_weapon_skin_inventory`
--
ALTER TABLE `player_weapon_skin_inventory`
  ADD PRIMARY KEY (`player_id`,`weapon_skin_id`),
  ADD KEY `weapon_skin_id` (`weapon_skin_id`);

--
-- A tábla indexei `rarities`
--
ALTER TABLE `rarities`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `weapons`
--
ALTER TABLE `weapons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rarity_id` (`rarity_id`);

--
-- A tábla indexei `weapon_skins`
--
ALTER TABLE `weapon_skins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `weapon_id` (`weapon_id`),
  ADD KEY `rarity` (`rarity`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `maps`
--
ALTER TABLE `maps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `map_assets`
--
ALTER TABLE `map_assets`
  MODIFY `asset_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `music_packs`
--
ALTER TABLE `music_packs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `player_skins`
--
ALTER TABLE `player_skins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `rarities`
--
ALTER TABLE `rarities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `weapons`
--
ALTER TABLE `weapons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `weapon_skins`
--
ALTER TABLE `weapon_skins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
