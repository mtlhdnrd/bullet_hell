-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2025 at 10:50 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bullet_hell`
--
CREATE DATABASE IF NOT EXISTS `bullet_hell` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci;
USE `bullet_hell`;

-- --------------------------------------------------------

--
-- Table structure for table `maps`
--

CREATE TABLE `maps` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `file_name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `music_pack_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- Dumping data for table `maps`
--

INSERT INTO `maps` (`id`, `name`, `file_name`, `description`, `music_pack_id`) VALUES
(1, 'Slaughterhouse', 'slaughterhouse.png', 'This is the kind of place you really shouldn\'t go into, but out of sheer curiosity, you step in. The scent of blood and what you see overloads your senses. You will never get out.', 3),
(3, 'Palace of the Setting Sun', 'medieval_japan.png', 'I live by the sword, you die by my sword.', 2),
(4, 'Limitless', 'practice.png', 'Every weapon deserves a chance to shine. Even if they are trash. But you never know.', 5);

-- --------------------------------------------------------

--
-- Table structure for table `map_assets`
--

CREATE TABLE `map_assets` (
  `asset_id` int(11) NOT NULL,
  `map_id` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `map_weapons`
--

CREATE TABLE `map_weapons` (
  `map_id` int(11) NOT NULL,
  `weapon_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- Dumping data for table `map_weapons`
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
-- Table structure for table `music_packs`
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
-- Dumping data for table `music_packs`
--

INSERT INTO `music_packs` (`id`, `name`, `cover_image`, `anthem`, `main_menu_theme1`, `main_menu_theme2`, `description`) VALUES
(1, 'Dusqk', 'dusqk_coverart.png', 'kit_crt1/crt_head - Night Ops.wav', 'kit_crt1/crt_head - Electrosphere.wav', 'kit_crt1/crt_head - Gunstar Heroes.wav', 'Floaty, angelic voices and electric beats assist you in your fight with your opponent.\nby Dusqk'),
(2, 'CRT_HEAD1', 'crt1_coverart.png', 'kit_crt1/crt_head - Night Ops.wav', 'kit_crt1/crt_head - Electrosphere.wav', 'kit_crt1/crt_head - Gunstar Heroes.wav', 'Adrenaline and bloodthirst come together in this engaging kit, if it makes your skin crawl, it\'s already made the difference.'),
(3, 'CRT_HEAD2', 'crt2_coverart.png', 'kit_crt2/azure.ogg', 'kit_crt2/boctok.ogg', 'kit_crt2/deja_vu.ogg', 'The slaughterhouse has produced another set of electric screams just for you to consume.'),
(4, 'hellstar plus', 'hellstar_plus.png', 'kit_hellstar.plus/red_raw_against_the_grain.ogg', 'kit_hellstar.plus/heretical_priestess.ogg', 'kit_hellstar.plus/sever.ogg', 'Adjust your heart rate to the beat, and you are guaranteed to see things in slow motion. Use your time gains, practice makes perfect.'),
(5, 'Mute City', 'mutecity1_coverart.png', 'kit_mutecity1/loser_talk.ogg', 'kit_mutecity1/how_to_disassociate_completely.ogg', 'kit_mutecity1/compliance.ogg', 'Mute City is the place you stand, all alone, after beating every one of your brothers. You may think to yourself: \"Where do we go from here?\"... Who said you can\'t do it again?');

-- --------------------------------------------------------

--
-- Table structure for table `players`
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
-- Dumping data for table `players`
--

INSERT INTO `players` (`username`, `points`, `winrate`, `all_games_played`, `kills`, `deaths`, `most_used_music_id`, `music_pack_id`, `active_skin_id`) VALUES
('1L8Y3YgHyyQcYL4sQL7iTClB1kMHuK', 0, 48.11907958984375, 339, 1, 1, 1, 5, 1),
('1m1tI3L062gBsMgYcO0Jnn53K4sobv', 40, 85.78626251220703, 340, 4, 5, 2, 2, 5),
('2BfNgWsFKsQCL8gZppUjHI3Gs5eRJv', 87, 59.23424530029297, 464, 2, 1, 3, 1, 3),
('305g7suEStTzgn85HDZUREnKCAvR8u', 34, 57.1812858581543, 456, 5, 5, 1, 4, 4),
('3HHc9Au7bUzw1qNazuzqNFWe3pJkLf', 15, 5.283454418182373, 25, 5, 2, 3, 2, 3),
('3YXo10e5h1xhX3CEY2OValjUY1Z2fW', 23, 14.273298263549805, 293, 3, 5, 5, 2, 5),
('3zoon1ewiUV1f6zug6DkpRFQ5MhlKH', 85, 8.324136734008789, 270, 1, 3, 1, 5, 5),
('4AxrgYipFNN2i8FzssJZyIiEuYpY8L', 22, 53.56177520751953, 501, 4, 3, 4, 2, 1),
('5E5gWNjojNniwL1BivRF34MwQeY7Cf', 87, 27.17460823059082, 62, 2, 4, 3, 5, 4),
('646S3tqSif2eiXvHbF8ambvvtsCjmX', 93, 0.3915727436542511, 151, 3, 5, 5, 5, 2),
('6fYPHpUkbmCs1K7DOOShnXu0ILfJtn', 47, 73.56202697753906, 18, 5, 5, 4, 5, 2),
('6PVDoQo3zE70zxV20YjI0phyq20p1S', 77, 36.19692611694336, 277, 1, 3, 1, 1, 4),
('7OScroYo3gEUOc4yfAENEZBVGw9HM8', 34, 9.325675964355469, 455, 1, 2, 3, 2, 1),
('8hSrFgjOCBNTCa4yoa5jr6wKbbz8Vb', 74, 52.22958755493164, 25, 1, 1, 3, 4, 5),
('8JzCn2HqlCWkAcyU70rFbEBJxBb2pi', 94, 63.92066192626953, 355, 4, 3, 2, 4, 3),
('8ORIAMn0TYSEgiQ9tid7kLp0SubONP', 92, 26.019588470458984, 206, 3, 2, 2, 4, 5),
('8R1gTeEXoXZWMvZvxNQam1Gf71JSj1', 55, 78.61824798583984, 391, 5, 2, 1, 1, 4),
('92bv0nnq1RfjnHGIcIwsvVORYbreJT', 35, 89.52974700927734, 382, 1, 4, 3, 4, 2),
('9tdXt0AfvESjC1PSjRTJxc4xfIe7If', 84, 27.323301315307617, 111, 3, 1, 1, 1, 3),
('A5LChEKM8VPBuwlviFgDlX8IUEqOwu', 41, 90.1505126953125, 136, 3, 3, 2, 1, 3),
('Ac9ufadx2722H30eACn2NfEW1mExlv', 45, 46.00093078613281, 253, 5, 2, 4, 5, 5),
('AIbApDvmikugKOxND42n99WcpWA24F', 26, 87.32313537597656, 72, 1, 1, 4, 5, 4),
('B1eSKklBqaQSjTlUP7M1BEQZIVan01', 86, 58.964210510253906, 362, 3, 3, 1, 1, 3),
('batyuzo', 0, 0, 0, 0, 0, 1, 5, 2),
('BQJciB6R4dI36I8YCIAVYcKceBwSpN', 89, 26.170578002929688, 28, 1, 1, 1, 2, 5),
('BQPrvoXcMmGKYBAalsWMqTf9vKtw5L', 92, 26.301855087280273, 8, 5, 2, 3, 2, 1),
('d1Ed6nneGM7tYm7kNe6BikRz7XFdlm', 10, 74.65819549560547, 45, 1, 5, 5, 5, 2),
('DbRKCpu6rIbiipKXLFS2p2rYbIgp6p', 91, 66.20183563232422, 147, 3, 4, 4, 5, 5),
('dEVlbX8PmrxBXETd3gRpiNZG50NYhJ', 39, 85.34215545654297, 224, 3, 2, 2, 5, 2),
('doXiXSG9hfWJZnAaI50g9pyM3RBERj', 3, 87.22749328613281, 23, 3, 1, 3, 3, 3),
('EibZx409KVxwgTQw9MjcC7nqUvxuuy', 0, 67.94385528564453, 285, 5, 1, 2, 1, 4),
('eM5OXfMclkP3y7PXzz2sY8XQd5meZf', 61, 18.041112899780273, 447, 5, 2, 4, 5, 5),
('Ermq4UHRGce1vv870Bu93aPfI3aDYU', 64, 84.69005584716797, 273, 5, 2, 5, 1, 2),
('EsMpVNMrpe86ND15Y83agxpBhYBjRZ', 65, 45.45181655883789, 328, 1, 5, 1, 4, 1),
('FcjNSo2s3V7XUDZLxmhvUahTVpGFJm', 90, 1.437209129333496, 417, 4, 1, 4, 1, 1),
('FFmknezxDsOa1WDfxxLBhESdePvIcG', 83, 38.79008865356445, 506, 3, 1, 2, 5, 1),
('fzcXct8fHuDX4zYIk04ZJzQtq92NtC', 75, 37.88502502441406, 77, 3, 3, 4, 3, 1),
('G9rsK2uZAlBbRUfWunJM3D2Fd6CMyu', 83, 63.79164505004883, 310, 1, 3, 3, 1, 2),
('GEJ25qlmv790IUukzc0OPYzBpj2sII', 19, 3.70985746383667, 327, 1, 5, 1, 1, 4),
('girmany', 0, 0, 0, 0, 0, 1, 2, 1),
('GoRI8gtpAw0eGzJcrjvpkMA7gbGV5a', 99, 32.50837707519531, 353, 4, 3, 5, 4, 1),
('gqRYIffFtBm5pitEBsyjs0leStBLmf', 71, 8.398913383483887, 299, 2, 5, 5, 2, 5),
('GwaVl5UvMnuaFxDCI0qqMV1Geh4xlm', 8, 27.295448303222656, 373, 5, 5, 5, 3, 2),
('GyreUnY65NFkk9ZKMIFsTmE3C8nvQk', 21, 86.69529724121094, 34, 1, 1, 5, 3, 4),
('hpu4fqkAUPE0Nj9hwq0VMwhpISE0MD', 97, 36.1702766418457, 176, 5, 2, 3, 4, 4),
('IlucTQFAAyHpm1ODBEFWiXwNCn1Qea', 62, 54.95365905761719, 433, 5, 3, 1, 4, 1),
('Iw43BAeocVF4gJsfT8iwhgcgdzwnzv', 8, 26.81791114807129, 311, 3, 1, 4, 4, 1),
('jd8mHEuq6doS7tgoTN5deNR22pvLKD', 7, 4.668888092041016, 360, 1, 2, 3, 5, 5),
('JHkNVJC0lfIOoh4RzDhHODSmLUTWS6', 22, 68.26019287109375, 120, 4, 1, 5, 3, 5),
('jiJrg8AXrRL7kwRFNFxEeVyUVYI7AK', 90, 20.248367309570312, 241, 4, 5, 4, 4, 4),
('jjUVAHjhvIUT3kJSVf5ELKn7qSawGn', 27, 29.582035064697266, 289, 1, 5, 2, 5, 4),
('jMzNQwv95mKgnbvlfTZ8NBguNTzshm', 77, 71.1164779663086, 395, 5, 3, 5, 5, 4),
('JpeQYmVG7bBT2EcszHpRP6RwlQlNis', 23, 16.057592391967773, 418, 5, 4, 4, 2, 5),
('jwMIqaJSqiylvVYK0MejPGM4NyWNII', 58, 85.62911224365234, 419, 3, 2, 1, 3, 3),
('KcM4jrZVIqk9iyklEGmHLgkpQbygDA', 61, 55.03556823730469, 251, 5, 5, 2, 2, 4),
('kcYCQGsdMW2T9VPCvLCcyyzgdJEhLT', 85, 28.136606216430664, 119, 4, 2, 1, 2, 1),
('KP55s4aVIpDxfYZFy4jHhgjb4zo06w', 80, 22.955520629882812, 131, 3, 2, 3, 1, 3),
('kTyzbKKELENEGZHsXDSUbAz3KtuDT4', 65, 41.51688766479492, 472, 4, 5, 1, 3, 5),
('l63LKjRsvnmX3Vb911mkPLZrZXDkRS', 16, 5.656457901000977, 121, 5, 3, 4, 2, 1),
('LAgbdlAVm0ijUUk45Yi6qHY4qJVMAK', 39, 73.39669799804688, 391, 4, 4, 3, 1, 3),
('LgqFGXkbGaLeUD88eXfCKuwY5CUIeJ', 81, 6.598050117492676, 478, 1, 2, 2, 3, 1),
('loRnvE3N2fNXKak5qBgKoeNaYJiyXJ', 9, 54.85017013549805, 386, 5, 4, 1, 5, 5),
('M3gPkEBSMR68DLo0JBQ8df5CPzLDb3', 99, 90.84004974365234, 381, 2, 3, 4, 1, 5),
('mJcyf5nXAZrAHoovkb1HcZLM49OZ85', 64, 63.73416519165039, 123, 3, 5, 2, 2, 2),
('mOqMbXXztnM8EJTmAtdWku7w8rQUc1', 75, 13.721451759338379, 283, 2, 2, 3, 3, 5),
('n2s1cQS9jN3bdZQ37V20obLJNbVVi0', 49, 76.76345825195312, 77, 5, 5, 1, 4, 3),
('Nu7ERH9Nnsl7TbIU4JbIkzl17puUqf', 84, 38.41058349609375, 287, 5, 2, 4, 5, 4),
('nVokFVU5yBctd2uWdsibAApz7fzcVn', 37, 10.1513090133667, 457, 5, 3, 4, 2, 1),
('O47pMVD9H6ctdoqJYYNHCQhxhboIKu', 10, 62.8253173828125, 384, 2, 4, 4, 3, 1),
('o4kws3zITZ3Nmul4QlfKiBiF4eY6a2', 83, 40.491851806640625, 385, 4, 4, 4, 1, 5),
('O9Hx5zKhSKcHVgvfxhSVUvdV3zSMl8', 78, 2.2491867542266846, 115, 3, 1, 1, 3, 1),
('OBeRuHrKM3sbvVYsWYTgQevLVlFcub', 91, 77.70797729492188, 460, 2, 2, 3, 4, 3),
('OHuYRYbRUf6ug5nOFLQN5qPzUzygaI', 57, 84.48912811279297, 162, 2, 4, 4, 3, 5),
('PFU10T7u1TRqE8Nv0HU1rzqJMbrHag', 91, 70.0355453491211, 498, 5, 1, 1, 5, 3),
('PtRp6vW4y4Ax7mkn5LjF5rh5wDnTh3', 86, 90.04255676269531, 1, 1, 5, 5, 3, 4),
('PXVMkw57AXZ0KALQ3mU0lyJogiHj1s', 47, 16.48195457458496, 382, 4, 5, 3, 4, 4),
('QBcQvIRunjqqh5IgnNhd0LLICuz941', 16, 74.30912017822266, 489, 5, 1, 4, 3, 1),
('QXyeYicDpnp38skGYMnTw7XpTorxNF', 98, 48.77619934082031, 286, 5, 4, 5, 4, 5),
('rMVfYQGJjN8XwByPdAAikeMAfTpWRo', 78, 13.773506164550781, 389, 3, 5, 4, 2, 4),
('suiN4blH7ft1ZWmE0gDTs3qJDBZCx4', 41, 14.962336540222168, 360, 5, 3, 3, 5, 4),
('sXFcdzuzdPNKRj6nwMiP9PNUjE3Lkz', 76, 51.481624603271484, 123, 5, 3, 2, 4, 3),
('t1rH64wUHDdCCvFRUnGb29j70v4Dno', 4, 50.038143157958984, 425, 3, 4, 4, 1, 3),
('tCLaCGLnrMngbghdTFHvmOhORG84ED', 77, 41.249080657958984, 386, 5, 2, 3, 2, 2),
('TzLxo1VTUrcLka7M5j8sFdSHoIZcmr', 35, 64.46807861328125, 72, 1, 5, 2, 3, 4),
('U3GFTHCUej2W8NEbJg4vNZBSnGJc52', 26, 55.17939376831055, 360, 4, 1, 5, 3, 5),
('UIFqSfbVFD79PpkRaQfugzuMujgxiz', 30, 79.68014526367188, 379, 1, 4, 3, 2, 4),
('UxNqByyTHk7cg049yhErfLdHYTDkUL', 21, 18.37464141845703, 72, 2, 5, 4, 1, 5),
('uyj2OS0ivkmnlpaF4qHsibupb8wOhg', 41, 61.73285675048828, 371, 3, 5, 5, 3, 3),
('ve6k3dz1eb3AscGEpuUPJpCClw2RzB', 13, 41.86898422241211, 485, 1, 2, 1, 4, 3),
('W4b2iV036yJATmERqtCn2KsZgM80A0', 97, 42.20929718017578, 383, 4, 1, 4, 2, 4),
('wa2jQj2SZDyG43dJ23P9TMaqZ5snEG', 1, 54.789363861083984, 269, 2, 4, 3, 2, 5),
('wdcDVVDUSYOa0t90PlChuwFE7AbPr1', 99, 34.141357421875, 362, 4, 3, 3, 2, 4),
('wZBEFyrCDUUnlmXMdV3zyvtXYTqd1K', 25, 72.39051055908203, 125, 4, 3, 4, 3, 4),
('y80c28Bmj8xF9B1PAilYtqljpnLwpC', 12, 37.13568115234375, 72, 5, 2, 5, 1, 4),
('YfdeyveGokeVMOKqmbWxqA6xye0T5v', 68, 41.31850814819336, 454, 2, 1, 3, 2, 5),
('YUzLxHSbj0ibeGv2Zoiuj4l9SSstI8', 6, 58.52395248413086, 409, 4, 5, 5, 3, 2),
('ZaM39cVV1t2FHzb0QNB9ohDXTvy5Sn', 10, 88.75666809082031, 422, 2, 3, 1, 5, 3),
('zb5cycJXuq5NilOtJgWfVzOd2FvJ7O', 71, 0.9022035002708435, 502, 2, 3, 3, 2, 3),
('zBwnn7o8UjFMCSG0xno9fuPslTyRdK', 0, 32.41590118408203, 328, 5, 5, 3, 5, 5),
('zi9hxNs4oDlf4P50BTT4fvAhA1UjHf', 22, 1.7086039781570435, 14, 5, 2, 2, 3, 1),
('zqc5c2sKZeRnOn9JTCEo9WitPNlA8j', 56, 83.03341674804688, 177, 4, 3, 1, 1, 1),
('zz1SDRrtAa6mPN8XKvhMNpMaRAFLbN', 66, 26.61227035522461, 390, 3, 2, 1, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `player_login`
--

CREATE TABLE `player_login` (
  `username` varchar(255) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_admin` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- Dumping data for table `player_login`
--

INSERT INTO `player_login` (`username`, `password`, `is_admin`) VALUES
('1L8Y3YgHyyQcYL4sQL7iTClB1kMHuK', 'a8faa90c28d2b0cc5978eead566ccbb0befefabc57b283bc474f4c147645f5497b3fe26b462b4a147e52b811510c9e415513a671a8b650d11a311bd3479d1217', 0),
('1m1tI3L062gBsMgYcO0Jnn53K4sobv', '00c922e0657a93894e7414566e2950974bfdd555c6d35145abf72acef25ee99888236f4e35dad75a9f4f24f968e5ec4e470a6d939134916c8a9d08d9e4734675', 0),
('2BfNgWsFKsQCL8gZppUjHI3Gs5eRJv', '4d2e45d7c340d1b9509f42696a9ff7865ac994cf81f8843458801aef6ec011f32668df205cfa6a4c8202bc10339f30229b5eb7cda5fae1976a988514743c999f', 0),
('305g7suEStTzgn85HDZUREnKCAvR8u', '4abc2cb37be827d62a3ca06a3aeb6785db8854591141555cc5ee25dff785a0303167467bc4e5438c25515e2ecefec1fbb993dc8b8741f7de22546197cad39e20', 0),
('3HHc9Au7bUzw1qNazuzqNFWe3pJkLf', '61bf3ba8f4acd93db86092d5f0a9547256501b38142028955280317729333cad57c179b174be6a9267cd7864d5b8bd76dcd059f9d2ff245db67e34f70fe76934', 0),
('3YXo10e5h1xhX3CEY2OValjUY1Z2fW', 'f8f2dd022afa31e4d4517e94c5fd261c1f51e417ce8474a3c9820b97cd03f39f27298d1587fe6d326c7a7d66511ef57c0676828f4d4f7d11261a7499fe6df8e7', 0),
('3zoon1ewiUV1f6zug6DkpRFQ5MhlKH', 'be315897ece076135cc18079686f89372cb8e1343f145349021e5facf5295427de102574e52e8ac0a497cdfd4314a4b4645a52b27450bd2183db07ad9cf27c8c', 0),
('4AxrgYipFNN2i8FzssJZyIiEuYpY8L', 'eb1921dd1098cd9475c6069a81a17e0bd0e90af2207dc8c183b22a196a6d84503d22905eed04215028500ea4fdd90eaca70d5456161987768853709ad0390dcc', 0),
('5E5gWNjojNniwL1BivRF34MwQeY7Cf', '0a1e20154ebef4790e75461354f6b83bb014c17d4477eab57ffe8caf42b0fe8773a027e98b5f4ebcd070da4e83cb365f4a1f889123f201a8dfcf0c0ceda1b518', 0),
('646S3tqSif2eiXvHbF8ambvvtsCjmX', 'f41b60e7ac3af32c42dcc958566c216fdd51c74fd5598456bf81c9d56d4f3e40b38c4364b0ac8d0087daa611b2a8ec01ab241ff9d1510d628a7032ef63c3ed26', 0),
('6fYPHpUkbmCs1K7DOOShnXu0ILfJtn', '95f9d1afd3e4ca7d2da4907302968e364a97f211ec4f5cfb2171c91a521d441285d63a828dde072f195c2b39405da3e3578cb1f0c6dbaa9ce3436be54ae6f9bf', 0),
('6PVDoQo3zE70zxV20YjI0phyq20p1S', 'fa897a966a4f2e5f0eac918a615a80997c078ac0e8417c2f656e5b903051aa58a294dacb88bc26640bb01f7d54304b90c8b1f5889adbbc17298b1c92c8e07ad3', 0),
('7OScroYo3gEUOc4yfAENEZBVGw9HM8', 'fc339f7483039b0c718077c0e831dcfb27dba6db6c810d819a01e6f65b3843f4c9670118a486cb2997bbc9e34b2fc1cf961110b69785675b9edfce7ded5aba6a', 0),
('8hSrFgjOCBNTCa4yoa5jr6wKbbz8Vb', '794f111f4f4d29a0047ca84aafc1ebaa28898131a73ceafaa0ab5e89d7840d66f11d91a48767d5f8d0a9478bdd2188f69dc4c2f3709b5cee450cc27403e0d299', 0),
('8JzCn2HqlCWkAcyU70rFbEBJxBb2pi', 'c8b1e4ad97876fd0038ad823e6c5af706fe1594d8a8e98402d2baffdfaa31ecf039f14ebaa4fa25e82ed91c2a6a06f1792efc4d63790296abd33654adc301241', 0),
('8ORIAMn0TYSEgiQ9tid7kLp0SubONP', '70a55c5a7a5b862e024f481545d1227b60eb1fab29223a7db5cc4a0fdfa3e313fc326258def3523f63836776cfb7813ed7f24a5fb32cae86b5e97f64cd80f279', 0),
('8R1gTeEXoXZWMvZvxNQam1Gf71JSj1', 'f49d04ccb2886dc20a01a2531e50dae72bfe7db3d55773937e4c06cec1c4a94d626e64b2c4ce0e77a6069c1ed9e55548f90fef7926143ad6f4507c9919aa1e5a', 0),
('92bv0nnq1RfjnHGIcIwsvVORYbreJT', '1d81a1a06cdbf29b4638a6abe7d3c3131b243f088105e2abf284220fd200860d36ba104a33685905112a66a495713485e906f1f231f6eaaf4cfb7abee2592f8b', 0),
('9tdXt0AfvESjC1PSjRTJxc4xfIe7If', '1638329499e4d365ec10d9fe1221f4c0e6ea1b688465de49305b64377f5ab39a2494ee349fce13a31da1bee6b100bec2e60bedf493c69759bd2d4d4d613e6f4f', 0),
('A5LChEKM8VPBuwlviFgDlX8IUEqOwu', 'be26cf46989d7f5b24bbbde2757b3e02e766c0d187e0ef8a3e3dbee5de7e17ffa6b9a0f2d0264db1c659a8944ff0f6f09085aba4a5af278b10ba3595d285167c', 0),
('Ac9ufadx2722H30eACn2NfEW1mExlv', '25e2ec77c5593078508d4a96f6f26fb0482a4e1fd7f9f245e6694683493e5ef2355d3437f908d34d457c02154e58b4a36b313d9ef7cb136946f676ef991c4979', 0),
('AIbApDvmikugKOxND42n99WcpWA24F', '8472286eb290402d4e70e2bac45121f6185f3acdbe2df15dc4fe829deca163c5cc243e43b448bf2543b3de98675ec836a64127c51ad0079f8e78d6d6b7a1c2df', 0),
('B1eSKklBqaQSjTlUP7M1BEQZIVan01', '1deafd35f10b4966ea5301859ceae7f4baaeb85708d7717a12138fd01df2f5f90c1650bf7f373872be9551322166fba5056a1e8bd09481e69af15bc0598dd907', 0),
('batyuzo', '2d8555fc6d8b5e60baef404b48647f85773ceda476b9cf970b0c1d31eb49094988cde5a7fba16284e1328ccee855509fa6ed0a5f9aba6e340dd3e2d3c5e62216', 0),
('BQJciB6R4dI36I8YCIAVYcKceBwSpN', 'b3cd4686758a3c5f15ad29cebcc4216dab654702e779945c6e55f528c025cf66022a248bc2096fd7ed14db3525a48d0a5d7b8e14e242a08ded1157b5d6241260', 0),
('BQPrvoXcMmGKYBAalsWMqTf9vKtw5L', 'a09430bd41b788ae71b1e346d826da99afc09fcb3b135aa92c466a07b85cb3061cdbe905b7242085e4b4cf7f40a26c2722faceb998e511983f693f63f97a4f2b', 0),
('d1Ed6nneGM7tYm7kNe6BikRz7XFdlm', 'a8a8019db4ced932c0a2e14532734e13b04f32e3cefab989e11f24f1f8aa193b8b8f6737f570596c837531944050b71e04833438792324fa7acef26f722d722e', 0),
('DbRKCpu6rIbiipKXLFS2p2rYbIgp6p', '46C2E651C8ABD521A2C6638E7AA65B5AD85B6AC57EBA9683EF42B7B85DE3EE2EC91E0A9CCD9860981766EEF88FB140673FFC4590B4BD25E5C4C19032FC49A50C', 0),
('dEVlbX8PmrxBXETd3gRpiNZG50NYhJ', '73a37d061ddcd8192e0ee31dc877f9f77638b3b34b6d25787ba3df6091597cd11fabffe2596b08eee1df654ebccae674a88af77845a7932667910141e7258d5e', 0),
('doXiXSG9hfWJZnAaI50g9pyM3RBERj', '6cbb32871eb9cbeca676a089552d2006fe9546ba6a322af724f7e1f39e438e94168ac3c4750d52025d86ab9763d97c83f03d581b724c78b77be58f9216c73c77', 0),
('EibZx409KVxwgTQw9MjcC7nqUvxuuy', 'e9cde1c4eb51993075f5f5c37e96828849a174fd2ff129cc38cdaf5f2b3c455d1ff551313cb5e5dc19d1087ce0aabef09c08ed46242f8c245d9fe8e467d27405', 0),
('eM5OXfMclkP3y7PXzz2sY8XQd5meZf', '951cf3eec93db023b41a725c81099572d43cc2d1abbb80952af507bd713c6833f1b49c0ecceaf97145f1ce1e9b76fde02226f4373eb8bd783eafeadb5b48ce11', 0),
('Ermq4UHRGce1vv870Bu93aPfI3aDYU', 'c92b5f415c535efefeddb6ed8d2febfdd6a8855dd8947f363a454e2042fa63e761a7e6ef1851564130533f1ddf41312a487dcdd3926c033452095d68bead9e6c', 0),
('EsMpVNMrpe86ND15Y83agxpBhYBjRZ', '722ca215c85d9d8bbe86316da283c5a61afb929c0c1e150583569b2822397803e6a87f6c04d9f3098926c18d3068bf4524e493fa7a2553443c0916fb289af329', 0),
('FcjNSo2s3V7XUDZLxmhvUahTVpGFJm', '3933789761ec8433f37590b8fa2e3a561c6a3f022b812c10c00955c52d588312cf9af0e12960612978f613d4139ac39fae168103e6d0963d84a1a4fed62d9714', 0),
('FFmknezxDsOa1WDfxxLBhESdePvIcG', '8d45748ebda5ffad500a7333fa7c59364b1c7092f9e3a65ce9d3a1983a680256a9d8b57ad89f2a4b4d0375dd1f3026f8d2f1a61ac89c7c067d19b27a0d20b0dc', 0),
('fzcXct8fHuDX4zYIk04ZJzQtq92NtC', '28018bc13184039fe4dcdb2c0c51f2a33dca46e9447652c6335f46fb83c06fe594547462779bcde09fe2367c5400f68e13ccf35c1541977907eff9b2e1f3ce25', 0),
('G9rsK2uZAlBbRUfWunJM3D2Fd6CMyu', '9ca3368ab5e2e244aabd1adcf20b5b19793eef629acbefd31230e59b5e304df32f531b6fa88366fcc17dc74f7b8ac839d76d2c0ee7386392a7c3f241003c8fd1', 0),
('GEJ25qlmv790IUukzc0OPYzBpj2sII', 'b9ec678c5bb23637640f9c5a70deee4281a9ce3e9207ca61db0ef8a37f3b5e3a6b78efd4c4a9174ed480740684b7e0944604dd339c78d5a3d0d104295a672be7', 0),
('girmany', '6a8116f0149f7b23d468ef490537a27330e325ac60397ecb41e704e3611f898c26b402637a9e1e626e5f6acadc6711d6bf672f8eea6f6fb48e9897b4cd7d8272', 1),
('GoRI8gtpAw0eGzJcrjvpkMA7gbGV5a', '19fbdc2ec8e829180255f870ed06427eb1ab0b483ad07b81a4998bfad3a27c389e778f18098e1e11b0c451a906f18995dbde3078551c177d940a2d6fb45646d0', 0),
('gqRYIffFtBm5pitEBsyjs0leStBLmf', '72cc1ba861e5c1b4ac742d9178cfc29eda9f40b1e3aeacb207969271f0c22404ef99b6c8c9fafb3cc9ec167a447c018df5f707f63ba875e88402f239b01a9afc', 0),
('GwaVl5UvMnuaFxDCI0qqMV1Geh4xlm', '634ad7545e0e164bdc1545ffa469250c28288e22a4a1f508c6167669c006587f1b035a97622509f63ed8e1508eb1860856417c36411f9d59c8d7fcb34d4be909', 0),
('GyreUnY65NFkk9ZKMIFsTmE3C8nvQk', '84aaa292cf471aee9bc5796c301b00828ccd457235a7e8cceafc1ca7d60aa95ea9b4f3827d255550bf5e8d0397cca4cf0f8fe71804355f9cdb91c53d324ce75c', 0),
('hpu4fqkAUPE0Nj9hwq0VMwhpISE0MD', '9fb1bf888811c1d869558e1e0ba2e8ea2a52bc96d39da8bdee63e3fc4a56ddb82de812bfecf43116f45b9b0bf94aa232d6f8dd0360421531211b5ec8cc79ca1b', 0),
('IlucTQFAAyHpm1ODBEFWiXwNCn1Qea', 'aeaa3075f78360cfe7d11e98c629784e9f6073ab0ee32ba570276a4e8d0f135196aaa92a4b03547487970341a6595bcb6f155ad02a44e1d1ea83dcc5103620d4', 0),
('Iw43BAeocVF4gJsfT8iwhgcgdzwnzv', '86afcea5abe081bd8bb4706900a413bf782e310cef12fb6623dd0395daebd094ec5e4ef3ecdef93665e09c9751ea12ee3af269676879694db6601227b1acc4c5', 0),
('jd8mHEuq6doS7tgoTN5deNR22pvLKD', 'b50098f4926f9b2892ecfcfc07b8027fea02d835f5cf8764442a7a76fb9ba1fe86d38ffded3b137394aebd4774d5a44c806c4d0783bc4bf203e77f940bac771c', 0),
('JHkNVJC0lfIOoh4RzDhHODSmLUTWS6', '7bbd1fcf3fd8b0b27a8bbe23e04fd928eda87c1175d28da9d68c49ff69169929c6a31d97adbc7d6d078f9beced064c4ea76803645ae97f319e9d8b88f19757aa', 0),
('jiJrg8AXrRL7kwRFNFxEeVyUVYI7AK', '4ec268b2cac6870a6a68df3ccad7694a5fd5230d851e48eb610aac8ed18f1c382256e2e93f3a1ca3c9c08a45628dd39d98af6c675678c9183fc3b897b8f84bc0', 0),
('jjUVAHjhvIUT3kJSVf5ELKn7qSawGn', 'e5073379e81572b063d03f01ed10e98ce00bd53a79251cf05545ea0e01d87f693cf4190ead53cdcb0a6c65dbe6e45dd8c522c19f78def686fd520f17d68ddfa7', 0),
('jMzNQwv95mKgnbvlfTZ8NBguNTzshm', '567dc3d4ce31296a9c53259167e710185ea744048d274b084274ee5b460ef8ac902d84f3de67c55f5805277d27d03f96aa20867fc123da810dd8b813a59738fd', 0),
('JpeQYmVG7bBT2EcszHpRP6RwlQlNis', '464ecf8aedf4e7f844824ebbab750fe0cc9d2a0b3d6e186b14b3456230a683a764a2ee27a4c853416edc96960972139c949cb4f46aa2b92a095f13a36052c8f9', 0),
('jwMIqaJSqiylvVYK0MejPGM4NyWNII', '9d770e0a8e011131dd5fcf6a81b8d42c6e98f834331a0022235323290b3de2b085cd0c00965f38185e13a20a317de8dc5ddf7f6af56331b925428796d5c8cbb9', 0),
('KcM4jrZVIqk9iyklEGmHLgkpQbygDA', 'e83b5d8d03094af752a26e483ba3c9c7f64bc5d6725c9429177cb877af0c911c09204d14c1847b0561c9350f58e76ffcb99c8e32ea7f5129c120d0be87ee02d7', 0),
('kcYCQGsdMW2T9VPCvLCcyyzgdJEhLT', '07a6273802093ec86aa688cad82e6b2cb6b776c18e337a12a235faeb99569ec8e5c5c1e5ac22f1034b72e348289978daf95797a1cdae662362051337e2b3c002', 0),
('KP55s4aVIpDxfYZFy4jHhgjb4zo06w', 'e2353e23fd00f27c147c49f3543f3f20c5c9878dd4c04d91b6c42c81c1204d09a01e87e0da3da3976b04aada2b71e39d6f3243702dc2b12d971d9b4b2fcc78b2', 0),
('kTyzbKKELENEGZHsXDSUbAz3KtuDT4', '3b675d38b8bb8572bf47d07fed965f47946e74c58d9288e449ff5159fac1df63e1d13fac6effda0f850ee548cabc01d9aa3da26977f460abcff93812c5ac2097', 0),
('l63LKjRsvnmX3Vb911mkPLZrZXDkRS', 'bb80acf5edb7133014e80876ebb04c965935b8f5763ac099c6d6ff8c1aea9a162b8ff3e230cba8049dd1d2a2a145c653a9229333bac0f151d7b2dce2cd82f409', 0),
('LAgbdlAVm0ijUUk45Yi6qHY4qJVMAK', '055ad365eb9c2227bcec3dff1cc9614241650dad514b493d4b47f0ffdaa8baebdbf841cf41f7b96a9b7d72e2915bc1006e0742989717a9ac278009f065eed23d', 0),
('LgqFGXkbGaLeUD88eXfCKuwY5CUIeJ', '272e94946687b7feee39eec61c2c8a972c892769a057234ac74e57ae0e180fb1600fea97ec64f665a7b180cf7114fa278be314dd0ebc27711819cd952d59a30c', 0),
('loRnvE3N2fNXKak5qBgKoeNaYJiyXJ', '21595f12a8422b6b1c6dc487a06968c89e2c44da056d6eaa8a840b8e32691d1c55191223752f55bd70e708a3f76531e6c5e762cbe3fa0522a7ef2bbdb8f29864', 0),
('M3gPkEBSMR68DLo0JBQ8df5CPzLDb3', '853af5716d5fc24472947dc8d34958827636d813e8ef4d35d64df8977867f934a2852715065369d7d94f38a6e874bc8c416ce3c2d0c4258e8d61dc0d8b32efa1', 0),
('mJcyf5nXAZrAHoovkb1HcZLM49OZ85', '432674a3d22027d8462c81be933b13d1fcb7903b5f23eba9c766b51c6d705f850c68b656e7ef51afb5c9533a4b70f9a876725eebb8261117e2293e11fbbd86a1', 0),
('mOqMbXXztnM8EJTmAtdWku7w8rQUc1', '17a4d1132f3072139f6a401b6acee074bf0808fe29fab6d4575aca200c401256f60afe16a859c2d688c25fa812439325fbf1de9424ade4474cdc715b25057217', 0),
('n2s1cQS9jN3bdZQ37V20obLJNbVVi0', '2df409169b96fdaa04d1e953e62f24219860ebd51fa6932f2b147a00872fa6ada1143fea68458c80480c16e20628f5594346f6a4ddd83033bc4b9dd9fd4ab1c0', 0),
('Nu7ERH9Nnsl7TbIU4JbIkzl17puUqf', '1d0b1b505feb090aa0c4a87ee8d8f9ef1b0a5d55b555c306e0982ec97e465caa032466a3ffc9fee11184dddf55f5b5e68ea35117f62c5287eef916e9a989e125', 0),
('nVokFVU5yBctd2uWdsibAApz7fzcVn', 'd65d8cd77de5f6cf70a43c9fe9abd5fd3c10adde26a3cabbbe2039ff30a407b28d0aa8ce8b72af5e36b9901f23c62ef54e30ce68280bcbc6c9dbaa54442071ef', 0),
('O47pMVD9H6ctdoqJYYNHCQhxhboIKu', '0b5eb70f5d3651fc2b7d8c8cf096736e9221dbc55517b99b140f93b17fc51d36911cd0f58ef47e22839f3f4e06a2222760825bea29cfdda5ebc1cbee7ecf7800', 0),
('o4kws3zITZ3Nmul4QlfKiBiF4eY6a2', 'e9bcfd8ff0792325519906d91e4fe9c03d815929061a3e2be5e54aad2e93fd4874d5ece376937fac3052b03844e58c594758f90d8af490bde907a268b62dcaca', 0),
('O9Hx5zKhSKcHVgvfxhSVUvdV3zSMl8', 'cb4f1774b469a46987a408f8265c586842b027414e31a1443a81b365d17a1e8594d087829d97010401aaf3e7ab807ba64a3631d3003232bf5e9159b858185d42', 0),
('OBeRuHrKM3sbvVYsWYTgQevLVlFcub', '46ac65caf63310e816a4c646a280e1efed61568c5efd81a87d0a53517597dd3df17a03085dd0cd53b2fde6d4c7302be482d9e9b1c158f389c38b7a1be53bc678', 0),
('OHuYRYbRUf6ug5nOFLQN5qPzUzygaI', 'eb292789c68c415aee4d0cbe2c23107c4f295b0480962247100ed43913694d0c5ed45f1c22d7f1e1dea143a23a8f9e65e66805d2637bdf0d19466dd6b05b44a7', 0),
('PFU10T7u1TRqE8Nv0HU1rzqJMbrHag', '52d73dd67ac49672589f8fcc3cc5c159d287b074b0fa566107832692d66439088113d16f7e23674fac98c6a35a90a90e315d4de93e8a46d323cf24288be803bd', 0),
('PtRp6vW4y4Ax7mkn5LjF5rh5wDnTh3', '21796167b24320f858fc1226b0e10fd9cc9c51425b3aafea317163f43a3f9660e94c5342bcd9e41238aee9c6a2ba4c24d22cce41ee1f5c1e6e4061a39f63e2a3', 0),
('PXVMkw57AXZ0KALQ3mU0lyJogiHj1s', '92d44079b8e3abdf262ceba0e3f5cf1dc978b7d1609a489bbc37ea04175eadcd463b3151b0d624e1836b9e2e81b16d9169cc7c46bb73ebb848d8bb9497010138', 1),
('QBcQvIRunjqqh5IgnNhd0LLICuz941', 'b931646b696282643850da7a9ae5bf0eae97195f248448bb8f64cdf477cdad5584a6201d4e0b5eeffecd1013ae5cf45566724c03a9ef53409f497add9e7ab1f3', 0),
('QXyeYicDpnp38skGYMnTw7XpTorxNF', 'bb05b195013722d4c90ef4b963d647210b824eb6fd8f5cc51035a3725fbf234bbb219e4e7cd0463f198b1551fa3840ae7e28725f8af6658032e972818cbad94f', 0),
('rMVfYQGJjN8XwByPdAAikeMAfTpWRo', '8d3362623254e70d7a7872041e767621a1f6a0e9dc3e97d5a950782225d77529b5c9b439c61a035c2d8e9123dbf94ca2fdc413214f0cf96b167fddffe8d17f17', 0),
('suiN4blH7ft1ZWmE0gDTs3qJDBZCx4', 'e75e6d741d99fdab005d177aaffe245b9b4a487be4563ebfc1c9b474310c6fbf3b2e9f8f04ffc21512bc8e4109051cfbbf04f4e27c6a6f5ba43a7e84eaaae724', 0),
('sXFcdzuzdPNKRj6nwMiP9PNUjE3Lkz', '90b048329ffdff0e6bd59e066a6b2507ffdd05a64ad6848a4e48270f97cce09fe5f5b048a08418e01d82e6a626852d01e56b8d3ce85a1f2c69c44ba509f02c66', 0),
('t1rH64wUHDdCCvFRUnGb29j70v4Dno', 'b3b62f8c91b5e0717b6d9cede9e67e7593a099af724ac7ced35611da8b9765d6a5c51a9bbf7ffb6d8503eaf7f477243a829d521b589f06def4f9fef413e4a5e6', 0),
('tCLaCGLnrMngbghdTFHvmOhORG84ED', '29b193e29ddaaaa9d2f529fe9390dd9199049fc6569d9bc64fcafcc8bfad04777c9843463c6050d354bf04ef1497b147fec42d9cb56b9aa7cf0a11317591fc56', 0),
('TzLxo1VTUrcLka7M5j8sFdSHoIZcmr', '4e6ef1c0e85cc84d4af870dd9cb32d2140a5520cdd15eb443e307e77e85fa072285484240de7c5abddb83f0cf4c60b04902d6b38c11f662505e6464a152f9d4b', 0),
('U3GFTHCUej2W8NEbJg4vNZBSnGJc52', '7f98e3c386e83fb78fc2791f0bb46fbc2cae0fff44e7e1c8090b349ab76084c6d73195d3daf9948ec4d9be987287573c5feb3fbd4dbad478e8cdcf77637fb96f', 0),
('UIFqSfbVFD79PpkRaQfugzuMujgxiz', '15d30eacd4c6d12ec6de48735cdebc44deea47ecb71da3a2a6e02b02fccd46b14b4b60790ca2d3330c6da26d6380adb61eca14f991dce6fc07a2bb10ee5c0db5', 0),
('UxNqByyTHk7cg049yhErfLdHYTDkUL', 'ab6829a0bc61e1243fa8bfc907927822dddec7085b80fb857283b087ad2ace97d3b9b769f344fc7dddb7e6d925ba333784cd3a63b2cc9cc40c7e28034ad92c56', 0),
('uyj2OS0ivkmnlpaF4qHsibupb8wOhg', '2c23c2ff16ad67b7bc84ed6e888597f15d89f774c86841b6e254395f78ed790d693d1b2555681a6aeb72fca562c8f33432921e044c75e8e21b2a5084ea1fcada', 0),
('ve6k3dz1eb3AscGEpuUPJpCClw2RzB', 'eb4d867ffa430c41e5ae2a5c06c3b9da9369959222e91964354fcdfd4b4562e97567565f61b1f78c7db21c662cf320f98a7390ec389bb3a9f502086bb974ca84', 0),
('W4b2iV036yJATmERqtCn2KsZgM80A0', 'b372b098a57ff2ccda7b9fb57a6d5f655e229e2add52b0645abad5666a5feb9c0f5c0dbe005d49c80d54d65fa581f343cbe24359b29623b48e3a9e6056b11dd8', 0),
('wa2jQj2SZDyG43dJ23P9TMaqZ5snEG', '202792be757f0a7908d8159ae1705c86ecb33c0a811d07deb30ffa3807445e87422295e8c6bcc519e000e86790667e6fc72d3ecc5eed9890c43262e0f3d55d4e', 0),
('wdcDVVDUSYOa0t90PlChuwFE7AbPr1', 'b5325dc7c752f563bf9191e4840a397a3ccdcabd40ce74d2e1c1d4080d9ab405c658ad9c6d99b6e02d133fb7024665a40ffdd4dbb65159fffd0f3d1662287e0e', 0),
('wZBEFyrCDUUnlmXMdV3zyvtXYTqd1K', '24dd9decb9ba454bb71eb31bf92ba4d4d9b14167079d4ccc6d0b737a086497bb7a2f2ad116eb74e86d7f74326402931da38eccf5f6b3113ea6229190dcb183c5', 0),
('y80c28Bmj8xF9B1PAilYtqljpnLwpC', '4b0aee3f338d55be850a36857bf53ed0b41e6f94773297aeb3bfdfec7327620677c6844cac575b4d5a3b45b1781838e23decbc9a5d9093d1264ad5b72ccef718', 0),
('YfdeyveGokeVMOKqmbWxqA6xye0T5v', '7dc73ad29895842d61901d61929ad717da44f83107a9d28e606dd73e9ac5baa4e00f9d9276b5f7cd45d104acb535574a3ad45924733ad3c02a5a9541aae9e175', 0),
('YUzLxHSbj0ibeGv2Zoiuj4l9SSstI8', 'f4244b9182f104fda857aff2f1c322f75f738b81a8ee2a0c393e92bd31c927f67b78f745db6cc81424590f4f9a72de8451493c9119c2ac9b6af4ab809466fae7', 0),
('ZaM39cVV1t2FHzb0QNB9ohDXTvy5Sn', 'd7fa98eb5295335d1ea7f59e55529eb3b85bb8b9a7c020eb87a06b98d68d99a706f3e52e38e6431a66627a73424adcdd45244df1e2ed8ba9995112c2b7f92d9b', 0),
('zb5cycJXuq5NilOtJgWfVzOd2FvJ7O', '172741c690d7cbb35893c828286ceb2caabf039083589ebc1d4bce931c3f3597d9d1e6bd1bba8f9a2d2787e2ddd3a3ea9cfc11b9f10fa2afed0e3b1d3df9fd22', 0),
('zBwnn7o8UjFMCSG0xno9fuPslTyRdK', '32fd36ce789c088bf8cc0a9a252fa5032e2423d335dc4f9892a428c9e2a395f330259fa795576d6cc11bc935fc7bf35028e02a39b4e6737a03921f036a56e4f2', 0),
('zi9hxNs4oDlf4P50BTT4fvAhA1UjHf', 'e2d461a6cff8dbaadbde0bff39c3ba0895145c2238cb2719665ad9ba6cb26a0614294c09a9088ac06581bfe6da596d4f87f755471ba9f9007fd6d8b913b58996', 0),
('zqc5c2sKZeRnOn9JTCEo9WitPNlA8j', '89cb3a640338eea38c0497c4d9b0e9dc293c46de7d2e991a089cbc91c50c82ecfe4a1278511e67708bc0113d724c0c4ee0ad7bce9fba61a5f72c355bc2f5ab19', 0),
('zz1SDRrtAa6mPN8XKvhMNpMaRAFLbN', 'ccbc8b3c005d1841729fa950373086ef5381f5c07886527d706df3d130dc0ca8b6787a1cda2d242e24d99c9bfd258a11ca3099c694ff8c2436eb0cfd483b19ee', 0);

-- --------------------------------------------------------

--
-- Table structure for table `player_music_inventory`
--

CREATE TABLE `player_music_inventory` (
  `player_id` varchar(255) NOT NULL,
  `music_pack_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- Dumping data for table `player_music_inventory`
--

INSERT INTO `player_music_inventory` (`player_id`, `music_pack_id`) VALUES
('batyuzo', 5),
('girmany', 2),
('girmany', 3);

-- --------------------------------------------------------

--
-- Table structure for table `player_skins`
--

CREATE TABLE `player_skins` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_image` varchar(255) NOT NULL,
  `background_image` varchar(100) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- Dumping data for table `player_skins`
--

INSERT INTO `player_skins` (`id`, `name`, `display_image`, `background_image`, `description`) VALUES
(1, 'Knight', 'knight.png', '', 'The most common soldier'),
(2, 'Rogue', 'rogue.png', '', 'Beheaded his own master. Imagine what he can do to you...'),
(3, 'Samurai', 'samurai.png', 'samurai_1_00000.png', 'Bound by loyalty, but not by law. Beware!'),
(4, 'Entity', 'entity.png', '', 'Zero identity, defined only by its boundaries.'),
(5, 'Butcher', 'butcher.png', '', 'Set free from the Váci hentes, on his way to kill the furries. (He killed the Duolingo Owl btw)');

-- --------------------------------------------------------

--
-- Table structure for table `player_skin_inventory`
--

CREATE TABLE `player_skin_inventory` (
  `player_id` varchar(255) NOT NULL,
  `skin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rarities`
--

CREATE TABLE `rarities` (
  `id` int(11) NOT NULL,
  `rarity` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- Dumping data for table `rarities`
--

INSERT INTO `rarities` (`id`, `rarity`) VALUES
(1, 'Common'),
(2, 'Rare'),
(3, 'Unique');

-- --------------------------------------------------------

--
-- Table structure for table `weapons`
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
-- Dumping data for table `weapons`
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
-- Indexes for dumped tables
--

--
-- Indexes for table `maps`
--
ALTER TABLE `maps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `music_pack_id` (`music_pack_id`);

--
-- Indexes for table `map_assets`
--
ALTER TABLE `map_assets`
  ADD PRIMARY KEY (`asset_id`),
  ADD KEY `map_id` (`map_id`);

--
-- Indexes for table `map_weapons`
--
ALTER TABLE `map_weapons`
  ADD PRIMARY KEY (`map_id`,`weapon_id`),
  ADD KEY `weapon_id` (`weapon_id`);

--
-- Indexes for table `music_packs`
--
ALTER TABLE `music_packs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`username`),
  ADD KEY `most_used_music_id` (`most_used_music_id`),
  ADD KEY `music_pack_id` (`music_pack_id`),
  ADD KEY `fk_players_player_skins` (`active_skin_id`);

--
-- Indexes for table `player_login`
--
ALTER TABLE `player_login`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `player_music_inventory`
--
ALTER TABLE `player_music_inventory`
  ADD PRIMARY KEY (`player_id`,`music_pack_id`),
  ADD KEY `music_pack_id` (`music_pack_id`);

--
-- Indexes for table `player_skins`
--
ALTER TABLE `player_skins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `player_skin_inventory`
--
ALTER TABLE `player_skin_inventory`
  ADD PRIMARY KEY (`player_id`,`skin_id`),
  ADD KEY `skin_id` (`skin_id`);

--
-- Indexes for table `rarities`
--
ALTER TABLE `rarities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `weapons`
--
ALTER TABLE `weapons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rarity_id` (`rarity_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `maps`
--
ALTER TABLE `maps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `map_assets`
--
ALTER TABLE `map_assets`
  MODIFY `asset_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `music_packs`
--
ALTER TABLE `music_packs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `player_skins`
--
ALTER TABLE `player_skins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `rarities`
--
ALTER TABLE `rarities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `weapons`
--
ALTER TABLE `weapons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `maps`
--
ALTER TABLE `maps`
  ADD CONSTRAINT `maps_ibfk_1` FOREIGN KEY (`music_pack_id`) REFERENCES `music_packs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `map_assets`
--
ALTER TABLE `map_assets`
  ADD CONSTRAINT `map_assets_ibfk_1` FOREIGN KEY (`map_id`) REFERENCES `maps` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `map_weapons`
--
ALTER TABLE `map_weapons`
  ADD CONSTRAINT `map_weapons_ibfk_1` FOREIGN KEY (`map_id`) REFERENCES `maps` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `map_weapons_ibfk_2` FOREIGN KEY (`weapon_id`) REFERENCES `weapons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `fk_players_player_skins` FOREIGN KEY (`active_skin_id`) REFERENCES `player_skins` (`id`),
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`most_used_music_id`) REFERENCES `music_packs` (`id`),
  ADD CONSTRAINT `players_ibfk_2` FOREIGN KEY (`music_pack_id`) REFERENCES `music_packs` (`id`);

--
-- Constraints for table `player_login`
--
ALTER TABLE `player_login`
  ADD CONSTRAINT `player_login_ibfk_1` FOREIGN KEY (`username`) REFERENCES `players` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `player_music_inventory`
--
ALTER TABLE `player_music_inventory`
  ADD CONSTRAINT `player_music_inventory_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`username`),
  ADD CONSTRAINT `player_music_inventory_ibfk_2` FOREIGN KEY (`music_pack_id`) REFERENCES `music_packs` (`id`);

--
-- Constraints for table `player_skin_inventory`
--
ALTER TABLE `player_skin_inventory`
  ADD CONSTRAINT `player_skin_inventory_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `weapons`
--
ALTER TABLE `weapons`
  ADD CONSTRAINT `weapons_ibfk_1` FOREIGN KEY (`rarity_id`) REFERENCES `rarities` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
