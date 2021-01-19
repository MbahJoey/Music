-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 19 яну 2021 в 16:14
-- Версия на сървъра: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `musicdb`
--

-- --------------------------------------------------------

--
-- Структура на таблица `app_role`
--

CREATE TABLE `app_role` (
  `ROLE_ID` bigint(20) NOT NULL,
  `ROLE_NAME` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Схема на данните от таблица `app_role`
--

INSERT INTO `app_role` (`ROLE_ID`, `ROLE_NAME`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_USER');

-- --------------------------------------------------------

--
-- Структура на таблица `app_user`
--

CREATE TABLE `app_user` (
  `USER_ID` bigint(20) NOT NULL,
  `USER_NAME` varchar(36) NOT NULL,
  `ENCRYTED_PASSWORD` varchar(128) NOT NULL,
  `ENABLED` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Схема на данните от таблица `app_user`
--

INSERT INTO `app_user` (`USER_ID`, `USER_NAME`, `ENCRYTED_PASSWORD`, `ENABLED`) VALUES
(1, 'admin', '$2a$10$PrI5Gk9L.tSZiW9FXhTS8O8Mz9E97k2FZbFvGFFaSsiTUIl.TCrFu', b'1'),
(2, 'user', '$2a$10$PrI5Gk9L.tSZiW9FXhTS8O8Mz9E97k2FZbFvGFFaSsiTUIl.TCrFu', b'1');

-- --------------------------------------------------------

--
-- Структура на таблица `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Схема на данните от таблица `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(13);

-- --------------------------------------------------------

--
-- Структура на таблица `music`
--

CREATE TABLE `music` (
  `music_id` bigint(20) NOT NULL,
  `music_genre` varchar(255) DEFAULT NULL,
  `music_name` varchar(255) DEFAULT NULL,
  `music_singer` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

-- --------------------------------------------------------

--
-- Структура на таблица `persistent_logins`
--

CREATE TABLE `persistent_logins` (
  `username` varchar(64) NOT NULL,
  `series` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

-- --------------------------------------------------------

--
-- Структура на таблица `tbl_music`
--

CREATE TABLE `tbl_music` (
  `music_id` int(64) NOT NULL,
  `music_genre` varchar(64) NOT NULL,
  `music_singer` varchar(64) NOT NULL,
  `music_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Схема на данните от таблица `tbl_music`
--

INSERT INTO `tbl_music` (`music_id`, `music_genre`, `music_singer`, `music_name`) VALUES
(8, 'genre', 'Singer', 'Name'),
(9, 'Genre ', 'Singer 2', 'Song Name 2'),
(10, 'Chill Genre', 'Chill Singer', 'Chill Song'),
(11, 'Party Genre', 'Party Singer', 'Party Song'),
(12, 'Gaming Genre', 'Gaming Singer', 'Gaming Song');

-- --------------------------------------------------------

--
-- Структура на таблица `user_role`
--

CREATE TABLE `user_role` (
  `ID` bigint(20) NOT NULL,
  `USER_ID` bigint(20) NOT NULL,
  `ROLE_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Схема на данните от таблица `user_role`
--

INSERT INTO `user_role` (`ID`, `USER_ID`, `ROLE_ID`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_role`
--
ALTER TABLE `app_role`
  ADD PRIMARY KEY (`ROLE_ID`),
  ADD UNIQUE KEY `APP_ROLE_UK` (`ROLE_NAME`);

--
-- Indexes for table `app_user`
--
ALTER TABLE `app_user`
  ADD PRIMARY KEY (`USER_ID`),
  ADD UNIQUE KEY `APP_USER_UK` (`USER_NAME`);

--
-- Indexes for table `music`
--
ALTER TABLE `music`
  ADD PRIMARY KEY (`music_id`);

--
-- Indexes for table `persistent_logins`
--
ALTER TABLE `persistent_logins`
  ADD PRIMARY KEY (`series`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `USER_ROLE_UK` (`USER_ID`,`ROLE_ID`),
  ADD KEY `USER_ROLE_FK2` (`ROLE_ID`);

--
-- Ограничения за дъмпнати таблици
--

--
-- Ограничения за таблица `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `USER_ROLE_FK1` FOREIGN KEY (`USER_ID`) REFERENCES `app_user` (`USER_ID`),
  ADD CONSTRAINT `USER_ROLE_FK2` FOREIGN KEY (`ROLE_ID`) REFERENCES `app_role` (`ROLE_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
