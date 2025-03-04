-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Már 04. 12:04
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.0.30

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
CREATE DATABASE IF NOT EXISTS `bullet_hell` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci;
USE `bullet_hell`;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `maps`
--

INSERT INTO `maps` (`id`, `name`, `file_name`, `description`, `music_pack_id`) VALUES
(1, 'Slaughterhouse', 'slaughterhouse.png', 'This is the kind of place you really shouldn\'t go into, but out of sheer curiosity, you step in. The scent of blood and what you see overloads your senses. You will never get out.', 3),
(3, 'Palace of the Setting Sun', 'medieval_japan.png', 'I live by the sword, you die by my sword.', 2),
(4, 'Limitless', 'practice.png', 'Every weapon deserves a chance to shine. Even if they are trash. But you never know.', 5);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `map_assets`
--

CREATE TABLE `map_assets` (
  `asset_id` int(11) NOT NULL,
  `map_id` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `map_weapons`
--

CREATE TABLE `map_weapons` (
  `map_id` int(11) NOT NULL,
  `weapon_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

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

CREATE TABLE `music_packs` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `cover_image` varchar(40) NOT NULL,
  `anthem` varchar(50) NOT NULL,
  `main_menu_theme1` varchar(50) NOT NULL,
  `main_menu_theme2` varchar(50) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `music_packs`
--

INSERT INTO `music_packs` (`id`, `name`, `cover_image`, `anthem`, `main_menu_theme1`, `main_menu_theme2`, `description`) VALUES
(1, 'Dusqk', 'dusqk_coverart.png', 'relative path', 'relative path', 'relative path', 'Floaty, angelic voices and electric beats assist you in your fight with your opponent.\nby Dusqk'),
(2, 'CRT_HEAD1', 'crt1_coverart.png', 'relative path', 'relative path', 'relative path', 'Imagine a russian bloke on crack. This figure plays his favorite music while you disfigure your enemy.\nby crt_head1'),
(3, 'CRT_HEAD2', '', 'night ops', 'electrosphere', 'mecha grey', 'Imagine a russian bloke on crack. This figure plays his favorite music while you disfigure your enemy.\nby crt_head2'),
(4, 'hellstar plus', 'hellstar_plus.png', 'hellstar plus', 'heretical priestess', 'sever', 'You are about to fight the most important battle of your life!'),
(5, 'Mute City', 'mutecity1_coverart.png', 'Mute City', 'Mute City', 'Mute City', 'Being the last one standing is not so easy. Knowing your opponent as well as yourself is where the victory lies.');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `players`
--

CREATE TABLE `players` (
  `username` varchar(255) NOT NULL,
  `points` int(11) NOT NULL DEFAULT 0,
  `winrate` double NOT NULL DEFAULT 0,
  `all_games_played` int(11) NOT NULL DEFAULT 0,
  `kills` int(11) NOT NULL DEFAULT 0,
  `deaths` int(11) NOT NULL DEFAULT 0,
  `most_used_music_id` int(11) DEFAULT NULL,
  `music_pack_id` int(11) DEFAULT NULL,
  `active_skin_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `players`
--

INSERT INTO `players` (`username`, `points`, `winrate`, `all_games_played`, `kills`, `deaths`, `most_used_music_id`, `music_pack_id`, `active_skin_id`) VALUES
('0UOVJp9mgasjSjB07tT9Nw02YnyNad', 50, 41.77698516845703, 129, 3, 2, 3, 5, 3),
('1XEgRlZwvLuF6IJrH0rAeRDV4JrBr5', 21, 15.154964447021484, 507, 1, 4, 5, 4, 3),
('5mpvzq9T66LfJBJtmfMapNEhpdA4yq', 68, 30.540184020996094, 504, 1, 4, 5, 5, 3),
('7IPAJVY02SbCd0aAekhGRWuaPh8yLL', 83, 36.133140563964844, 161, 1, 4, 4, 5, 1),
('7MGL6QcheQSv0dbI8TKJebgItQEcSr', 49, 4.064878940582275, 401, 5, 2, 5, 3, 5),
('8rFHuW9smA1EMQDUU7jDrOwXiyZuni', 33, 39.22524642944336, 509, 5, 3, 5, 1, 1),
('9eQNJAlYYqfwhstB4qLT1pGhKW0kuH', 2, 28.762685775756836, 246, 1, 1, 2, 1, 4),
('A8lRbjVRCFMtJb8XK8qVkTpt90s1gA', 50, 36.46913528442383, 408, 5, 2, 2, 3, 3),
('batyu', 21, 45, 12, 7, 3, 1, 1, 1),
('batyuzo', 0, 0, 0, 0, 0, NULL, 2, 1),
('bdzhn4D3qWYp5C9zqvDeOvdTjGbxK6', 86, 17.450258255004883, 70, 5, 3, 3, 2, 5),
('BPWnsfTiPiOP59PA2kJGYprai4ws07', 30, 35.900230407714844, 279, 4, 3, 5, 5, 2),
('Cs8bHUjGsAdoRLngWNCTXnaz3uvZj9', 90, 91.19032287597656, 464, 4, 5, 2, 4, 1),
('DbqVpK85XhHere27pCWG6ZCiXW4qII', 63, 81.4522705078125, 153, 3, 3, 3, 1, 4),
('dOmusUvUGy5OnUx4otMcz2GevVeuUu', 73, 61.5135612487793, 466, 4, 2, 3, 2, 2),
('DQRClP7zyVurtkXFuuE6sNOJ8qKh1Y', 98, 38.00971603393555, 181, 4, 4, 1, 2, 1),
('G00fXxkwkI2PNgE2JN8YpxhuR0rxxM', 62, 51.918216705322266, 212, 1, 3, 3, 1, 5),
('gembarnus', 0, 0, 0, 0, 0, NULL, 3, 1),
('girmany', 0, 0, 0, 0, 0, NULL, 4, 1),
('gizmo', 0, 0, 0, 0, 0, NULL, 1, 2),
('gxZkhGOHhGY8AAl7IVPnVTfd6yG9lx', 30, 15.197288513183594, 253, 1, 3, 5, 4, 2),
('h98MiX1ZbTD6YThOJBXNy4ms5JmbWB', 77, 38.886085510253906, 11, 1, 4, 4, 1, 2),
('He7rzTIvIZGXvi2aGT0G17e3XQxiV3', 36, 39.222408294677734, 343, 1, 1, 1, 2, 1),
('HIziwmi4HqCrDF00CrlPMWdtHDHTzT', 91, 48.373817443847656, 23, 4, 4, 5, 1, 4),
('iRHjgye0cDiuGimdtSgrj9EAPDX0MP', 7, 83.27397918701172, 307, 2, 4, 5, 4, 2),
('J7EhIEtEebdENtNbsirqjX85AefgMh', 83, 75.12032318115234, 201, 1, 5, 4, 4, 4),
('J8iX2507VOI0OsCkfoy0qgyNsAKOUe', 1, 66.74645233154297, 401, 2, 5, 2, 1, 4),
('jebo5EzxRxhaLJoWkJpqwlF1EeiVyX', 29, 48.54984664916992, 322, 1, 3, 2, 5, 5),
('JQKl4p0Rp89cLonpGomgFicCh3uNSO', 44, 11.34223747253418, 470, 4, 2, 4, 1, 2),
('jyzQiwrJKhU2QfqI6IHih45eyXvyIX', 12, 75.3410873413086, 59, 4, 4, 3, 2, 2),
('k3gYvY8JLoEGP18nN4IRkpzDqB5kIF', 23, 36.241302490234375, 347, 3, 1, 4, 4, 2),
('KqZuDHRy9xTnAkCKBVLpKZOdHHinZm', 94, 56.35164260864258, 261, 2, 2, 1, 1, 1),
('KZSehUFnt1ToY3USmkFhMvdbKSGgzz', 53, 0.592430830001831, 456, 4, 1, 1, 3, 4),
('Mej3xyJWWWAcBLdH91fSx0i5yS137E', 41, 75.63509368896484, 472, 1, 4, 4, 1, 3),
('Mfs3EsSOp6dcgozlKfLcsMj52ZkIJi', 4, 31.079811096191406, 132, 4, 1, 5, 3, 5),
('nigabiga', 0, 0, 0, 0, 0, NULL, NULL, NULL),
('NYiTweXCCVGML3vsRfw40ndGFZx3Nt', 96, 65.0289306640625, 226, 5, 5, 3, 5, 5),
('ohNwD802CuoQKyf0WRDQE0gcUK3Us9', 25, 56.55437088012695, 277, 4, 3, 5, 4, 2),
('oNfjbLCGpBGaH7w0zFfcnWJfPLMcPT', 2, 65.17821502685547, 144, 2, 5, 2, 4, 4),
('OOenYf7xAnXJnqK9CtfSnIaSUPOisY', 60, 25.052730560302734, 156, 4, 5, 1, 4, 3),
('OvVyTPYG8XdrqZVcsJqna7fwhbasKA', 73, 65.5709457397461, 229, 4, 5, 4, 5, 1),
('qCMJiljX1910gXkZpIsORk5VBhJNHd', 19, 54.52793884277344, 357, 3, 1, 4, 5, 4),
('rLoyjhI0KN2At8927arZe4tQAQYXTy', 38, 78.27406311035156, 202, 2, 4, 1, 1, 3),
('sdfsdf', 0, 0, 0, 0, 0, NULL, NULL, NULL),
('TwfnirIqDdvCRrmiBe5FEZpzUKevrg', 52, 18.304332733154297, 44, 5, 2, 1, 5, 3),
('UjTrjG2jK5LHT084kHURHqq2PlteR4', 27, 25.240238189697266, 273, 1, 5, 1, 1, 3),
('ungabunga', 0, 0, 0, 0, 0, NULL, NULL, NULL),
('v6EdM2Vih8k9QXOBPoclKOrBToibu6', 65, 51.401607513427734, 480, 2, 5, 4, 4, 2),
('vmTug6hNxT10Xhpo5VqwK3TDILYh0P', 52, 82.88151550292969, 233, 2, 5, 2, 5, 4),
('waFPFwuUR3cdlHpcKG5QJBDtVecHSG', 72, 7.587141990661621, 304, 5, 3, 3, 2, 5),
('wbgFbFlhIRIKz2dmYbDof4M1JWld39', 87, 0.1745372712612152, 49, 3, 1, 1, 4, 1),
('WRZ71saFJxV4uZkL6CeKwZ0K2RQ38t', 22, 22.860816955566406, 336, 2, 1, 1, 3, 1),
('XG6Gpz1um3RBA8fq5f4e14el9RfkmH', 56, 34.42549133300781, 207, 2, 2, 2, 3, 2),
('Xnk8XtqEWD97v1YI78lsf4k9lDAvkA', 40, 83.60645294189453, 398, 4, 3, 2, 3, 3),
('XPTUo2FxLj3KrYLlh0chxE0ydeQbc8', 36, 86.71939086914062, 152, 5, 2, 5, 5, 2),
('y6crodpU9KYU1dtdgbg8YIzgwQIAgt', 52, 71.87977600097656, 297, 4, 5, 1, 1, 4),
('YSW2Vj0n7Ao6B7V8s7z9uBR9YTt0ki', 18, 34.63212203979492, 235, 2, 5, 1, 3, 5),
('zTp61hQudysT7RL2GtmPRjDVlVHWSc', 38, 9.004270553588867, 220, 5, 3, 5, 2, 3);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `player_login`
--

CREATE TABLE `player_login` (
  `username` varchar(255) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_admin` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `player_login`
--

INSERT INTO `player_login` (`username`, `password`, `is_admin`) VALUES
('0UOVJp9mgasjSjB07tT9Nw02YnyNad', 'vGr4ufzNc1AumZOa904V3uzef8Giq9iGmUOukPWsC5BbfMrqNzpI7POcqe8WYhLSoWKrt93iKRs2M670LFhBAvNyurOHrphcpXgpttwvmimkfkvlCM7BYDZaGPVxQK5t', 0),
('1XEgRlZwvLuF6IJrH0rAeRDV4JrBr5', 'EfBdVj59Yu8NAFmqXz55AgZObs5NGvPI96AYknzkQdilaWAI8ly7gtTeXFDRFRi1YSoXMcjYumyYGai1LnDfHyJuUJcEa5H1XoSLf35aN2QhCBDO4yONkd6rJQetXlTh', 0),
('5mpvzq9T66LfJBJtmfMapNEhpdA4yq', 'Ts2e07peTQq1CiE3ajrBzLv668nR7P9vsST2SuF38atwcWUF5l4OjZGa1bw7Atnofg4mllnbBfJR2ITLa6ukWYWz1Ko6dQmLGrHOrz9gOOmLWjjYEkvMhNmaxgIodnrE', 0),
('7IPAJVY02SbCd0aAekhGRWuaPh8yLL', '4wZKedXfwv3onHoPbBGwTGATL79s0H06PBUuPOsuCLlLOnD23yDsju71Tc27Rxnf1HEK0Ua5n4Xg5dDfGCyRd0N1fahsEd595EWUWa8diedKWzsFV0hlc6tVafsJ4IrR', 0),
('7MGL6QcheQSv0dbI8TKJebgItQEcSr', 'Ts9cef3p64Pe8pncv74Ed6PFL16DWSdvYIm3xhTSdc85VzCzTN9F3TPSzW7ZlRky161VmDaN4ZqzwWaIG1NXfIHV6EIEiPdYzhD0KfZ7l5qxvybPLz6wP16lTGrQD6uC', 0),
('8rFHuW9smA1EMQDUU7jDrOwXiyZuni', 'XaNEbAsv5VyQ5AqOhMvCPQMZ67pv8WXQv9HVSyYvgdXK70OvZCUDebWMZP7CUR0Z5T769Mmtm8fvaO8XBIdJtP6lUz6Z7nGzP3wdqkNulgIkp4yErWNrJBMvV86cIML7', 0),
('9eQNJAlYYqfwhstB4qLT1pGhKW0kuH', '7RIsjkHLqmZ3LdNAfoT8qXcwKlSLUkJqevTitWZaTJwMuj53QYB3jPxhIpiU5bfxmy82gwl1o6WfIIzm1C3YIUH9YIKmfVkhK2e18jvOQvly52uwcWhvNexmiOYwVuq6', 0),
('A8lRbjVRCFMtJb8XK8qVkTpt90s1gA', '0RgPJycMqlL8eNfxPV4xbDCjlrhqxxvtVM03e81JncTjBHttDhDLzLiYQDNVOyiK5wa9QPTAV5wQtQhQPznzdCeU9oEdQkdS7MlfW8X8woo7AZfrIW7LKrdGUECApRHK', 0),
('batyu', 'batyucsakbatyu', 0),
('batyuzo', 'batyuzik', 0),
('bdzhn4D3qWYp5C9zqvDeOvdTjGbxK6', 'W2Xcs02wMx0Ic2JTjI0tb5Cf0KVqeDxrXp8sqGH5VDAGcJ9VTTtFlrKYsFeikYEWzQkp7jIYpR3w0aweriLO4Eo2eFuvs9QjjV3zPOOom8Tfne5rooEfy6YT4LMYxXD6', 0),
('BPWnsfTiPiOP59PA2kJGYprai4ws07', 'XXxiVEjszm0mKVlysOHcwjOb6xoBjHhf1HQygwFyNdf6xXb5AtBSrLRZz4GafwcJRsg5E9LPdsp1NM5tMms17YR8m2gGJEkYklvtPDrHEbI36VMFxeYnGdFlMfdTUWaz', 0),
('Cs8bHUjGsAdoRLngWNCTXnaz3uvZj9', 'sTo9ShEinMQjTNoRIDQKCvj8hA8XBcALh7YAsppr9XfWWJlXg5DVsDR1zPAI8otdrwOhVDXlx7OGTRClL9A6BM5n86lwHg80Iq4KWGVMS1iyPQPcrOZ0zz5dUdKpeAuU', 0),
('DbqVpK85XhHere27pCWG6ZCiXW4qII', 'E75ctP9iyJv8qnT9QoC5Oabll6fCnriUQPoaQMfUl6td3GLoCPhRByqGXH2pg13NlsvUu6CqYMSBl4iwFL2LzBQ3R5RMvbIPYtJVYa9v21oxyzfd986FRcwDi7IEwujQ', 0),
('dOmusUvUGy5OnUx4otMcz2GevVeuUu', 'mZ8lTjDgUUfddxhv8Jvy74XcFUrj7ew13O4m0r9igdxfru6dPsLl9vuS1Ypw52dSU4ye7JtUp3QIli697Q9q5sUydjaGtB3816i9xlUIVRqi2WsMMZA1lp54LP8rU0qJ', 0),
('DQRClP7zyVurtkXFuuE6sNOJ8qKh1Y', 'fihI0i4iu3W2ut4ZQDRQUQyfxYwQgR5L9omlGdqablMqUaaHURRawbuZ2jGr9Kt9DkTqVP81YlFVFbOCzbv1v1ibXSSNqq2MPS88Pugdpqu2RDVuRjUSbl4DMIogFZwD', 0),
('G00fXxkwkI2PNgE2JN8YpxhuR0rxxM', 'JNN01123NkaFE8R0hYVhrFW3t0Zxj5SeGvUoTw4ZOMkbFlNqauJXwempvKUDl2Xyard8hATVMiARWkQYGOUJuYTkcUvkE0l3ibBV51QNQRgIVdC7tHwRz9WoCQqQW7S0', 0),
('gembarnus', 'gembarnus', 0),
('girmany', 'girmany', 1),
('gizmo', 'gizmo', 0),
('gxZkhGOHhGY8AAl7IVPnVTfd6yG9lx', 'jY0uj7YAbpOFcJKrbmpd3vXJOoWEau1iWF8VIAvO3yAKs6EdFMHVO97NbLjmWtC5O9LuyGihcq20B65hg1ulGeTlTRgffZjN271TfobTojElgpnHag3ePZYGDfBnohIv', 0),
('h98MiX1ZbTD6YThOJBXNy4ms5JmbWB', 'FtErHEjtSzZfoZtFsmVqQduj0dfEOST3FCozCRh6sn68XcrYHz3WG1JX92AroF8nkg8LktdmJ4Q6W4eMrnjA3wR29D9rsUlqUXOKtm80L1W0uCp0b84OlO6SIbFdmnfc', 0),
('He7rzTIvIZGXvi2aGT0G17e3XQxiV3', '1PxI2uXmpEN5psR4J3eHF5DFvshPzi8RmCMKLKv8s4Z9CYiIIziCfcVaSF72w92FBV3n8XzXTyXrfn5Vp8JhADaHpYXUjmsH10pO7mnS86sPvNbqpmo54ipQsy7uRzgG', 0),
('HIziwmi4HqCrDF00CrlPMWdtHDHTzT', 'ehwRoYl6mIqMdBm25kDCMXl4gqeH66IqM0P0EJ0wl1dQ8ijVba2wawK70aB3GEfxID7Zeb3Sx2K6fgDw9BX1xQuVPk1nX8jAF4lXQHl0sMANNkUFjBhlmLQg5ryYeVHd', 0),
('iRHjgye0cDiuGimdtSgrj9EAPDX0MP', 'B3J3eDzI565XrBXYIDKb38up7QjulcdEdarYnnAzbOh44CElJSApBqgevIpUbAdmqLiWAhoQAeopk4TZklkA5Lqq17bLMFykjjNTiBLb8EMwFSj4gEbpwyFuDAXCRUw3', 0),
('J7EhIEtEebdENtNbsirqjX85AefgMh', 'zsMs1uC4pSXTVzpoEvPHtIXTZ16T6EvzmhlgXCt9TsXGiWPIlBVopRMNoqK5iXNTo0IP8Z1viE9pN7YMFqPFvBpsnSxH2DOXOPAmeFHtXeol2WZCPbrGNqIpSzKisjAl', 0),
('J8iX2507VOI0OsCkfoy0qgyNsAKOUe', 'nYprdix8PZ6gfGhoGY6E9zXh1OcE55OKGZAc2rM22JF5EC5psPDNsX9iOyV123qCmTQEFOmfCSpKya4RoqL3OeJ9SXj9hFIojpzo7GA1uYzZQx0iqttOOCv19yIBtWyC', 0),
('jebo5EzxRxhaLJoWkJpqwlF1EeiVyX', 'WDfC6Et1T8eZgnayCn9T21xUZsZFOp9i6EHkQJlD4Wy4kPXXOGGtHPxzr91RaSEEsLUtTijAWN2XA1CYzFcvzrb44HlrdcHXrlWbXFnHWErBnhB8WfAQfmz2Eys9KTpS', 0),
('JQKl4p0Rp89cLonpGomgFicCh3uNSO', 'zWKqDR0qTjL9dWylHRuNLW7bIWC9Cxt9UytRlJ3kEdAs91eVEZY1tQ63NEZVgayOW1HeeiNlf7bn2WoeKo1bWos8sLRL6N7loi4xAdJFehgQ5eIXVFXo88yfgyJhvCMg', 0),
('jyzQiwrJKhU2QfqI6IHih45eyXvyIX', 'UNZqsgjOpSoqR8jujUJ0Grpd0gJQ3ZvBhZ5v5OP82U81owp2FfHAVf29sBwYVNDmeSXbAtwzi1nw4EXLzWkEezzb4D7WKlytiqKT6nVpeOfSkvrISIhzsy7eOvN2FINm', 0),
('k3gYvY8JLoEGP18nN4IRkpzDqB5kIF', 'YmG4uTjWJyQuy0RbbYQR35Tcz8P6QEVF1QouOKU3r3vkmMoC9YjMUT6TVKFCzWmG080deYw45qTAhRGyMu458e8fENBLipOAmARoJ3z5ymCjSvT4GU9dfSSOU8juygTc', 0),
('KqZuDHRy9xTnAkCKBVLpKZOdHHinZm', 'e3VbUyo4sGPoKdpvU4k2rM3nfbqyZEPFWYI403Bb4ABvVtjfIxg31hbYAf1RoLg3TKvbdoLA6fJPo6oDj4BfVNiRvrUcIQQryuHxwdfcniMflNI5nfDn5Wq4GpeIfqOY', 0),
('KZSehUFnt1ToY3USmkFhMvdbKSGgzz', '3cyxjcmGwvBALuTRdUPzSFxlarx3m1a0OzSLnS9ORmnT5D5Y4VNDj0bTKRpoZm3x3ELdQwH0TzgCgyQiQV6PsOmdaDNRovbBsKUq8XttcBGyxumjce3s7myUcP5dkvY2', 0),
('Mej3xyJWWWAcBLdH91fSx0i5yS137E', '8H9QS9W5oNIeidF6UdW9Q8NvY5crLn2uBsA0LkNBWBKjREn6rnG1LimU34AnfWatM6LrMXORAZSjavIlE25tpzQOo3ziowbbz20Kmd4s4gc7qb0vRlFXTM3UOn3hcNca', 0),
('Mfs3EsSOp6dcgozlKfLcsMj52ZkIJi', 'ijgdZV25ZT6JmDHSkuKRT2eqMcizvcPUK4rBbHNFn7DR0pBJTURxKADaFgMdRwEpayIPP5rgKC04Q7T8OwqT5dq4D4wlBcHaBlXVaPZr3p5GOa5b1pUMtIjtvjjRRZWb', 0),
('NYiTweXCCVGML3vsRfw40ndGFZx3Nt', 'EacCtX1Us1UVidLFAHgfDnJNeQlvJ4y9Oa2vEI4v0dG7qEnvs0uEPMECyJM3IrGyESSn0fZzQmWn3l4LAtDjnHylM2atLJ5DsIkFQdA2OUDbJAtp0M12jYgnvQAdgnNT', 0),
('ohNwD802CuoQKyf0WRDQE0gcUK3Us9', 'zoCzXlnLmIBPeaV35ynBihsttIJVYvyS2dRQwgM7ir9VqXqLWUokKtnoCyVxZGwVmRviedKodXopy8ZBYLzHAker1CaPvVxJI8wBwzh1BQhc0xTG4RleYBDfYNJGYfY0', 0),
('oNfjbLCGpBGaH7w0zFfcnWJfPLMcPT', 'j8jvisMgijmjvysWnavHCdbLmWLIM2nVzP0LpsS8VfyvpeLbq0azN3dBEJxxgHDtpB8r93k6dwNT19ah27gmnGFKWjgzN8d6gwEUp9D8lVv5FtePMJfaZUjFmZwlKVIm', 0),
('OOenYf7xAnXJnqK9CtfSnIaSUPOisY', 'cm0SkzJADyRRqS3Ec2KAxcGfWLDkWre6fSfJVwcYLkrLTfsiRUxLcoo289kffHPco7UqIfg7NDhwq4hxmcsQi2SmjgRNoKXnTfw0V0RHkWgtgq8mJnKPhWrdo5f41Sc4', 0),
('OvVyTPYG8XdrqZVcsJqna7fwhbasKA', 'ocXgh5rv1xMtfkcLKhyoqhyCjQ0Ru6vQQOIEsndR9iDU15Rn18Zwin43C1KMFiXR4FPEEmggQrMN6LoqoToVojuuRqWg9d6Yz3ncXrfBgEfUE8A0FETAJ3OlAbtlXQUB', 0),
('qCMJiljX1910gXkZpIsORk5VBhJNHd', 'eZyDNLXYHlPYqb5kWc6FeyQ4TZVphtbx7pgHbyR9x22WFJ8JkZqNY0GK80ZKvZ3JjItkZHyoNx5HeXPTg0iv0FzO5D3Eo6ybH54lh1Mbh0KXyugXuCvaY1ALD4QyzzxN', 0),
('rLoyjhI0KN2At8927arZe4tQAQYXTy', 'wRgVQmP7GXcfDbhA3bn8DqBLl3q01fx3xS884Xvj2cSJWITot942VpQILDSkOGqqvejsxTEy0wowBgwE4AyxAXlV7Fdmp3mn0mLb4MAkYhrJccbo5STyGLiGPGXWtsll', 0),
('TwfnirIqDdvCRrmiBe5FEZpzUKevrg', 'teYZ9X5GPxgJarVfZLuJilNAB0d12l4KnBZ1oCH1O649J9uUr3iPdurhP3WyQtcWrl3zbaRZk8MZq9JkbWtWlDDGing2X845vAUMapRrvB3P6xSU0BzIMdwdz91hHzdX', 0),
('UjTrjG2jK5LHT084kHURHqq2PlteR4', 'TinQlPRanhqq5K3hZypDDonM62bHYGDUFWTRRPawloe5WyKN7BV3TVAGnKuwIfijmV2lY8fHkuKio7mxq9QosWr9Rk7erqaWPdDvBDn86vyEx1Wn8DOTPqXd9lv2L02Q', 0),
('v6EdM2Vih8k9QXOBPoclKOrBToibu6', '9HiZPMLJQMXBUpvGAhecibXBIXyZpGNF11abve5uUnovV6JY5FlHVZDYUvyZwpmX7C3MVgUzhYY9DwH19Bfvw5DJ93jKwy7tiFuxa3ZOdh8dXphdqfQonysCnjhWE3Sg', 0),
('vmTug6hNxT10Xhpo5VqwK3TDILYh0P', 'K1bbJXFb4Xuz6262DEOz6lds1GGBRfeNXw4nNLu2G9lLxk1maUTERyxJtE5OefDWej5yQRtxYemuLfx1uwNkKQxub7679ebYkN6yy45HDBYOtV6696g8EYx2h4B9DbRW', 0),
('waFPFwuUR3cdlHpcKG5QJBDtVecHSG', '5SAmxrMhk05gdmk13C9QAjnDnC5WWrF1mCPvD3LqkNPv3onQu1aCIsfRQ16jFAg9Sdt8AWw0bfNz4pXjqlc5bOgKKwo68n8NzMgeRAmHZnKE4pz14Yb2xIV7H5i61cNB', 0),
('wbgFbFlhIRIKz2dmYbDof4M1JWld39', 'aiRgkeIeqSu6IXkGyspVfbFr9fWWvAfmpMENOprDe8tG34oqe1FTb8qp1ScXGgRVb7TCnvn8LyYDdgTGYPAsRwS8ujPFQK9WB05VxDE2XdgyeEVvIZsXDZbKYo0dhy0v', 0),
('WRZ71saFJxV4uZkL6CeKwZ0K2RQ38t', 'rIXg2oM4New7oBUYdcOiIlJWsif0cNia702WssdAKBTElA1qBW7RwjK6FkqhG6P2aRMCzottYST4wgHYFeRf4RQoeIYwvpg0wMftgA1al4ESEK812glAVGcoXvfBUAR9', 0),
('XG6Gpz1um3RBA8fq5f4e14el9RfkmH', 's2NhWmUQ1BASYOMrY7jqbszRKwoDW94fxDBj8GV9liqcrlWLOUArU0RgPq5G7NuMoHGUpHu5U7nqK4IVfZ9FoL2WtZmNCh5odNly5XC8VFxWAq8a1RPTh0FWYNZb0lRw', 0),
('Xnk8XtqEWD97v1YI78lsf4k9lDAvkA', '9k5dtRk1lF0WJgLP74YEfNEMVFSnZ8zDcint2WHRYSTv5PshxCvthW80WHq5iSbFNAQTQPB29uCbrgcwbBTIzUukTrMVMzcdKejEpvAG3WtweWz6o2gU71gvMzMwc2yB', 0),
('XPTUo2FxLj3KrYLlh0chxE0ydeQbc8', 'RnlKmhBlNTFP403YLKUdP2OlyGLaqbJApv5a6L0nkyvr8tfRtyGr6Eug7n5PIRYC6wwn3FnPKdzAdmkenwmB3dyyGsqxDaXSp9NIEf05bV8HxX950HiGNam1lillOeTa', 0),
('y6crodpU9KYU1dtdgbg8YIzgwQIAgt', 'ekHKbrrWVOKuQ2Ud1SoIuSRA9Incoyhw7EGilv6L429Wzh56lhvlPyrzMqVWVfhe5E7uWuGG1R8mJ4OUduRpb99g3I00mp91gdn1vK1i0aFoKhAKhDPwcQahsm7P79Fe', 0),
('YSW2Vj0n7Ao6B7V8s7z9uBR9YTt0ki', 'nEYBr4eqO78LVFaHvKf23A86j05IupIE5t1EuOBH3WfYnuWD3XDMQkm1CB0RHBulsPU5MjBhpy0eERCo2os4iJcM5OffZlNwnm0uQvIG7Fi3zgYtbLZ8BzLS6Aao6mEX', 0),
('zTp61hQudysT7RL2GtmPRjDVlVHWSc', 'LyXZRDXEZFEDZ5xb8EDJuxV4ryUbm4cwvFu7i0DUPjanoBYwoWaSZau9RUe75R2xX4lkp4CCavLOeNgDoLJ2OHI48RrHP1ZsWnES67Omg4aSSxDCdkeVxKzp858CuMxY', 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `player_skins`
--

CREATE TABLE `player_skins` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_image` varchar(255) NOT NULL,
  `background_image` varchar(100) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `player_skins`
--

INSERT INTO `player_skins` (`id`, `name`, `display_image`, `background_image`, `description`) VALUES
(1, 'Knight', 'knight.png', '', 'The most common soldier'),
(2, 'Rogue', 'rogue.png', '', 'Beheaded his own master. Imagine what he can do to you...'),
(3, 'Samurai', 'samurai.png', '', 'Bound by loyalty, but not by law. Beware!'),
(4, 'Entity', 'entity.png', '', 'Zero identity, defined only by its boundaries.'),
(5, 'Butcher', 'butcher.png', '', 'Set free from the Váci hentes, on his way to kill the furries. (He killed the Duolingo Owl btw)');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `player_skin_inventory`
--

CREATE TABLE `player_skin_inventory` (
  `player_id` varchar(255) NOT NULL,
  `skin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `player_skin_inventory`
--

INSERT INTO `player_skin_inventory` (`player_id`, `skin_id`) VALUES
('gembarnus', 1),
('gembarnus', 2),
('gembarnus', 3),
('gembarnus', 4),
('girmany', 1),
('girmany', 2);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rarities`
--

CREATE TABLE `rarities` (
  `id` int(11) NOT NULL,
  `rarity` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

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

CREATE TABLE `weapons` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `damage` int(11) NOT NULL,
  `fire_rate` float NOT NULL,
  `semi_auto` tinyint(1) NOT NULL,
  `rarity_id` int(11) NOT NULL,
  `projectile_speed` float DEFAULT NULL,
  `mag` int(11) DEFAULT NULL,
  `description` text DEFAULT 'A deadly weapon',
  `devinfo` text DEFAULT 'FIRE:'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `weapons`
--

INSERT INTO `weapons` (`id`, `name`, `file_name`, `damage`, `fire_rate`, `semi_auto`, `rarity_id`, `projectile_speed`, `mag`, `description`, `devinfo`) VALUES
(11, 'Scythe', 'def_scythe.png', 100, 1, 1, 3, NULL, NULL, 'A lethal and cool-looking weapon wielded by Death itself', 'FIRE: melee attack\nALTFIRE: take away enemy weapon\nUNEQUIP: default'),
(12, 'Nailgun', 'def_nailgun.png', 20, 3, 2, 2, 0.8, 13, 'Safety instructions would suggest you NOT to pin coworkers to a wall...', 'FIRE: shoot (gravity)\nALTFIRE: -\nUNEQUIP: default'),
(13, 'Cleaver', 'def_cleaver.png', 70, 0.8, 1, 1, 0.4, NULL, 'Chop things up with this very nuanced instrument of destruction. Don\'t cut your finger.', 'FIRE: melee attack\nALTFIRE: -\nUNEQUIP: default'),
(14, 'Chainsaw', 'def_chainsaw.png', 3, 20, 2, 2, NULL, 200, 'Ever heard of Mick Gordon? The Doom Slayer? Hell, maybe?', 'FIRE: rev, damage on\nALTFIRE: -\nUNEQUIP: default'),
(15, 'Taser', 'def_taser.png', 50, 1, 1, 1, NULL, NULL, 'Some crackhead clunker cranked the crap out of this cruel (but previously non-lethal) critter.', 'FIRE: check triggerbox in front of muzzle\nALTFIRE: -\nUNEQUIP: default'),
(16, 'Knife', 'def_knife.png', 50, 1.5, 3, 1, 0.4, NULL, 'If the glove don\'t fit, stop wearing them and continue stabbing', 'FIRE: melee attack\nALTFIRE: throw (gravity)\nUNEQUIP: default'),
(21, 'The Power of Words', 'def_hatespeech.png', 10, 30, 2, 3, 343, 90, 'SPREAD AWARENESS IN A CONE', 'FIRE: check triggerbox in front of muzzle\nALFTIRE: -\nUNEQUIP: default'),
(22, 'Pistol', 'def_pistol.png', 35, 3, 1, 1, 1, 12, '9 millimeters is a LOT.', 'FIRE: shoot particle\nALTFIRE: -\nUNEQUIP: default'),
(23, 'Shotgun', 'def_shotgun.png', 15, 0.75, 1, 2, 0.85, 7, 'If you get the general direction right, you\'ll have no problems with this one', 'FIRE: shoot particles(7)\nALTFIRE: -\nUNEQUIP: default'),
(24, 'Pressure!', 'def_sawedoff.png', 7, 4, 1, 2, 0.85, 2, 'You already massacred a perfectly good metal tube, so everyone knows you have the resolve', 'FIRE: shoot particles(15)\nALTFIRE: -\nUNEQUIP: default'),
(31, 'Wrath of Nobunaga', 'def_musket.png', 400, 1, 1, 3, 0.8, 1, 'The legendary daimyo left you a present. He will smile upon you if you put it to good use!', 'FIRE: shoot particle (3 ricochet, every bounce halves damage)\nALTFIRE: -\nUNEQUIP: default'),
(32, 'Bow', 'def_bow.png', 70, 0.3, 1, 2, 0.6, 1, 'Ranged weapon against pointy sticks, who would win?', 'FIRE: shoot particle (gravity)\nALTFIRE: refill\nUNEQUIP: default'),
(33, 'Kunai', 'def_kunai.png', 40, 1, 1, 1, 0.6, NULL, 'If your arms aren\'t long enough... damn that\'s a straight line...', 'FIRE: melee attack\nALTFIRE: throw\nUNEQUIP: default'),
(34, 'Dagger', 'def_dagger.png', 50, 1.5, 3, 1, NULL, NULL, 'If all else fails...', 'FIRE: melee attack\nALTFIRE: -\nUNEQUIP: default'),
(35, 'Katana', 'def_katana.png', 75, 1, 3, 2, NULL, NULL, 'Craftsmanship and lethality meet in your hands.', 'FIRE: melee attack\nALTFIRE: stab\nUNEQUIP: default'),
(36, 'Kusarigama', 'def_kusarigama.png', 50, 0.6, 3, 1, 0.4, NULL, 'A deadly weapon...', 'FIRE: melee attack\nALTFIRE: throw (gravity)\nUNEQUIP: default');

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
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `maps`
--
ALTER TABLE `maps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT a táblához `map_assets`
--
ALTER TABLE `map_assets`
  MODIFY `asset_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `music_packs`
--
ALTER TABLE `music_packs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `player_skins`
--
ALTER TABLE `player_skins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `rarities`
--
ALTER TABLE `rarities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `weapons`
--
ALTER TABLE `weapons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

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
-- Megkötések a táblához `weapons`
--
ALTER TABLE `weapons`
  ADD CONSTRAINT `weapons_ibfk_1` FOREIGN KEY (`rarity_id`) REFERENCES `rarities` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
