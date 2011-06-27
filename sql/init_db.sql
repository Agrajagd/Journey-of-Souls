-- MySQL dump 10.13  Distrib 5.1.54, for apple-darwin10.3.0 (i386)
--
-- Host: 127.0.0.1    Database: josmud
-- ------------------------------------------------------
-- Server version	5.1.54

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
-- Table structure for table `areas`
--

DROP TABLE IF EXISTS `areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `areas` (
  `area_id` int(10) NOT NULL AUTO_INCREMENT,
  `area_short_name` varchar(16) NOT NULL,
  `area_long_name` varchar(128) NOT NULL,
  `area_credits` text NOT NULL,
  `area_difficulty` varchar(128) NOT NULL,
  PRIMARY KEY (`area_id`),
  UNIQUE KEY `area_short_name` (`area_short_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `character_skills`
--

DROP TABLE IF EXISTS `character_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_skills` (
  `char_id` int(10) NOT NULL,
  `char_skill_id` int(10) NOT NULL,
  `char_skill_points` smallint(5) NOT NULL,
  PRIMARY KEY (`char_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `characters`
--

DROP TABLE IF EXISTS `characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `characters` (
  `character_id` int(10) NOT NULL AUTO_INCREMENT,
  `owner_id` int(10) NOT NULL,
  `character_name` varchar(64) NOT NULL,
  `race_id` int(10) NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `level` tinyint(1) NOT NULL DEFAULT '0',
  `in_room` int(10) NOT NULL DEFAULT '1',
  `in_position` varchar(64) NOT NULL,
  PRIMARY KEY (`character_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commands`
--

DROP TABLE IF EXISTS `commands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commands` (
  `command_name` varchar(64) NOT NULL,
  `command_package` varchar(512) NOT NULL,
  `command_class` varchar(128) NOT NULL,
  `command_usable_by` tinyint(1) NOT NULL,
  `command_log` tinyint(1) NOT NULL,
  PRIMARY KEY (`command_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exits`
--

DROP TABLE IF EXISTS `exits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exits` (
  `exit_id` int(10) NOT NULL AUTO_INCREMENT,
  `exit_room_id` int(10) NOT NULL,
  `exit_to_room_id` int(10) NOT NULL,
  `exit_direction` int(10) NOT NULL,
  `exit_description` text NOT NULL,
  PRIMARY KEY (`exit_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `races`
--

DROP TABLE IF EXISTS `races`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `races` (
  `race_id` int(10) NOT NULL AUTO_INCREMENT,
  `race_name` varchar(32) NOT NULL,
  `phys_str_mod` decimal(5,2) NOT NULL,
  `endur_mod` decimal(5,2) NOT NULL,
  `con_mod` decimal(5,2) NOT NULL,
  `speed_mod` decimal(5,2) NOT NULL,
  `acc_mod` decimal(5,2) NOT NULL,
  `agi_mod` decimal(5,2) NOT NULL,
  `dex_mod` decimal(5,2) NOT NULL,
  `int_mod` decimal(5,2) NOT NULL,
  `wis_mod` decimal(5,2) NOT NULL,
  `psychic_mod` decimal(5,2) NOT NULL,
  `focus_mod` decimal(5,2) NOT NULL,
  `men_endur_mod` decimal(5,2) NOT NULL,
  `men_con_mod` decimal(5,2) NOT NULL,
  `immunity` int(10) NOT NULL,
  `resistence` int(10) NOT NULL,
  `vulnerability` int(10) NOT NULL,
  PRIMARY KEY (`race_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rooms` (
  `room_id` int(10) NOT NULL AUTO_INCREMENT,
  `room_area_id` int(10) NOT NULL,
  `room_name` varchar(128) NOT NULL,
  `room_description` text NOT NULL,
  `room_owner` varchar(32) NOT NULL DEFAULT 'None',
  `room_positions` text NOT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skills` (
  `skill_id` int(10) NOT NULL AUTO_INCREMENT,
  `skill_name` varchar(64) NOT NULL,
  `skill_description` text NOT NULL,
  `skill_stats_csv` varchar(64) NOT NULL,
  PRIMARY KEY (`skill_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `socials`
--

DROP TABLE IF EXISTS `socials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socials` (
  `social_name` varchar(32) NOT NULL,
  `social_format_1` varchar(256) NOT NULL,
  `social_format_2` varchar(256) NOT NULL,
  `social_format_3` varchar(256) NOT NULL,
  `social_format_4` varchar(256) NOT NULL,
  `social_format_5` varchar(256) NOT NULL,
  `social_format_6` varchar(256) NOT NULL,
  `social_format_7` varchar(256) NOT NULL,
  `social_format_8` varchar(256) NOT NULL,
  `social_format_9` varchar(256) NOT NULL,
  `social_format_10` varchar(256) NOT NULL,
  UNIQUE KEY `social_name` (`social_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stats`
--

DROP TABLE IF EXISTS `stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stats` (
  `stat_char_id` int(10) NOT NULL,
  `stat_phys_str` decimal(10,8) NOT NULL,
  `stat_endur` decimal(10,8) NOT NULL,
  `stat_con` decimal(10,8) NOT NULL,
  `stat_speed` decimal(10,8) NOT NULL,
  `stat_acc` decimal(10,8) NOT NULL,
  `stat_agi` decimal(10,8) NOT NULL,
  `stat_dex` decimal(10,8) NOT NULL,
  `stat_int` decimal(10,8) NOT NULL,
  `stat_wis` decimal(10,8) NOT NULL,
  `stat_psychic` decimal(10,8) NOT NULL,
  `stat_focus` decimal(10,8) NOT NULL,
  `stat_men_endur` decimal(10,8) NOT NULL,
  `stat_men_con` decimal(10,8) NOT NULL,
  PRIMARY KEY (`stat_char_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_name` text NOT NULL,
  `user_password` varchar(32) NOT NULL,
  `user_email` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'josmud'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-06-27  7:26:59
