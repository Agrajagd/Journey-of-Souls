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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areas`
--

LOCK TABLES `areas` WRITE;
/*!40000 ALTER TABLE `areas` DISABLE KEYS */;
INSERT INTO `areas` VALUES (1,'immortal','Immortals\' Private Area','JoS Immortals','None');
/*!40000 ALTER TABLE `areas` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `character_skills`
--

LOCK TABLES `character_skills` WRITE;
/*!40000 ALTER TABLE `character_skills` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_skills` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `commands`
--

LOCK TABLES `commands` WRITE;
/*!40000 ALTER TABLE `commands` DISABLE KEYS */;
INSERT INTO `commands` VALUES ('say','communication','Say',0,0),('reboot','wizard','Reboot',3,1),('shutdown','wizard','Shutdown',3,1),('quit','communication','Quit',0,0),('who','communication','Who',0,0),('emote','communication','Emote',0,0),('reload','wizard','Reload',2,0),('force','wizard','Force',1,0),('commands','information','Commands',0,0),('socials','information','Socials',0,0),('look','communication','Look',0,0),('memory','wizard','Memory',3,0),('promote','wizard','Promote',3,1),('demote','wizard','Demote',3,1),('quitmenu','communication','Quitmenu',0,0),('save','information','Save',0,0),('echo','wizard','Echo',2,0),('disconnect','wizard','Disconnect',2,0),('tp','wizard','Teleport',1,0),('join','wizard','Join',1,0),('gecho','wizard','Gecho',2,0),('room','olc','Room',2,0),('rsave','olc','Rsave',2,0),('rarea','olc','Rarea',2,0),('rname','olc','Rname',2,0),('rdesc','olc','Rdesc',2,0),('list','olc','List',2,0),('rid','olc','Rid',2,0),('area','olc','Area',2,0),('rdelete','olc','Rdelete',2,0),('aname','olc','Aname',2,0),('asname','olc','Asname',2,0),('addcommand','wizard','Addcommand',3,0),('exit','olc','Exit',2,0),('position','olc','Position',2,0),('pdelete','olc','Pdelete',2,0),('move','movement','Move',0,0),('testeditor','wizard','Testeditor',2,0),('exits','information','Exits',0,0);
/*!40000 ALTER TABLE `commands` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exits`
--

LOCK TABLES `exits` WRITE;
/*!40000 ALTER TABLE `exits` DISABLE KEYS */;
INSERT INTO `exits` VALUES (2,2,4,1,'Blah.'),(5,2,1,25,'Blah.'),(4,2,3,5,'Blah.'),(7,1,4,25,'None.'),(8,4,1,26,'None.'),(11,12,2,13,'An exit leading northeastup.'),(12,2,12,24,'None.'),(13,12,5,7,'An exit leading northwest.'),(14,5,12,6,'None.'),(15,1,12,3,'An exit leading east.'),(16,12,1,4,'An exit leading west.'),(27,12,1,3,'An exit leading east.'),(28,1,12,4,'An exit leading west.'),(29,12,12,25,'An exit leading up.'),(30,12,12,26,'An exit leading down.'),(31,12,2,17,'An exit leading northdown.'),(32,2,12,10,'An exit leading southup.'),(33,12,1,24,'An exit leading southwestdown.'),(34,1,12,13,'\"Huh?\"'),(35,1,1,7,'An exit leading northwest.'),(36,1,1,6,'Exit leading southeast.'),(37,1,3,8,'To the southwest, by some strange power, the void shapes into a dark corner.'),(38,3,1,5,'To the northeast, the corner breaks into an endless void.'),(39,4,1,8,'A simple wooden door leads out of the room to the southwest.');
/*!40000 ALTER TABLE `exits` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `races`
--

LOCK TABLES `races` WRITE;
/*!40000 ALTER TABLE `races` DISABLE KEYS */;
INSERT INTO `races` VALUES (1,'Human','1.00','1.00','1.00','1.00','1.00','1.00','1.00','1.10','1.00','1.00','1.00','1.00','1.00',0,0,0),(2,'Dwarf','1.00','1.20','1.15','0.90','1.00','0.88','1.10','0.90','1.10','0.10','1.05','0.92','0.82',0,0,0),(3,'Elf','0.85','1.00','0.90','1.10','1.20','1.10','1.05','1.00','1.20','1.20','1.00','1.10','1.10',0,0,0);
/*!40000 ALTER TABLE `races` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1,1,'The Void','There is nothingness all around you.','None','');
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `socials`
--

LOCK TABLES `socials` WRITE;
/*!40000 ALTER TABLE `socials` DISABLE KEYS */;
INSERT INTO `socials` VALUES ('applaud','$n applauds.','You applaud.','$n applauds %s.','You applaud %s.','$n applauds for $N.','You applaud for $N.','$n applauds for you.','$n applauds %s for $N.','You applaud %s for $N.','$n applauds %s for you.'),('agree','$n agrees.','You agree.','$n agrees %s.','You agree %s.','$n agrees with $N.','You agree with $N.','$n agrees with you.','$n agrees %s with $N.','You agree %s with $N.','$n agrees %s with you.'),('blubber','$n blubbers.','You blubber.','$n blubbers %s.','You blubber %s.','$n blubbers at $N.','You blubber at $N.','$n blubbers at you.','$n blubbers %s at $N.','You blubber %s at $N.','$n blubbers %s at you.'),('bounce','$n bounces.','You bounce.','$n bounces %s.','You bounce %s.','$n bounces towards $N.','You bounce towards $N.','$n bounces towards you.','$n bounces %s towards $N.','You bounce %s towards $N.','$n bounces %s towards you.'),('bow','$n bows.','You bow.','$n bows %s.','You bow %s.','$n bows to $N.','You bow to $N.','$n bows to you.','$n bows %s to $N.','You bow %s to $N.','$n bows %s to you.'),('burp','$n burps.','You burp.','$n burps %s.','You burp %s.','$n burps on $N.','You burp on $N.','$n burps on you.','$n burps %s on $N.','You burp %s on $N.','$n burps %s on you.'),('cackle','$n cackles.','You cackle.','$n cackles %s.','You cackle %s. ','$n cackles at $N.','You cackle at $N.','$n cackles at you.','$n cackles %s at $N.','You cackle %s at $N.','$n cackles %s at you.'),('cheer','$n cheers.','You cheer.','$n cheers %s.','You cheer %s.','$n cheers for $N.','You cheer for $N.','$n cheers for you.','$n cheers %s for $N.','You cheer %s for $N.','$n cheers %s for you.'),('chortle','$n chortles.','You chortle.','$n chortles %s.','You chortle %s.','$n chortles at $N.','You chortle at $N.','$n chortles at you.','$n chortles %s at $N.','You chortle %s at $N.','$n chortles %s at you.'),('hop','$n hops.','You hop.','$n hops %s.','You hop %s.','$n hops towards $N.','You hop towards $N.','$n hops towards you.','$n %s  hops towards $N.','You %s hop towards $N.','$n %s hops towards you.'),('chuckle','$n chuckles.','You chuckle.','$n chuckles %s.','You chuckle %s.','$n chuckles at $N.','You chuckle at $N.','$n chuckles at you.','$n chuckles %s at $N.','You chuckle %s at $N.','$n chuckles %s at you.'),('hack','$n hacks up a storm.','You hack up a storm.','$n %s hacks up a storm.','You %s hack up a storm.','$n hacks up a storm on $N.','You hack up a storm on $N.','$n hacks up a storm on you.','$n %s hacks up a storm on $N.','You %s hack up a storm on $N.','$n %s hacks up a storm on you.'),('clap','$n claps.','You clap.','$n claps %s.','You clap %s.','$n claps for $N.','You clap for $N.','$n claps for you.','$n claps %s for $N.','You clap %s for $N.','$n claps %s for you.'),('cough','$n coughs.','You cough.','$n coughs %s.','You cough %s.','$n coughs at $N.','You cough at $N.','$n coughs at you.','$n coughs %s at $N.','You cough %s at $N.','$n coughs %s at you.'),('cower','$n cowers.','You cower.','$n cowers %s.','You cower %s.','$n cowers from $N.','You cower from $N.','$n cowers from you.','$n cowers %s from $N.','You cower %s from $N.','$n cowers %s from you.'),('growl','$n growls.','You growl.','$n growls %s.','You growl %s.','$n growls at $N.','You growl at $N.','$n growls at you.','$n growls %s at $N.','You growl %s at $N.','$n growls %s at you.'),('curse','$n curses.','You curse.','$n curses %s.','You curse %s.','$n curses $N.','You curse $N.','$n curses you.','$n curses $N %s.','You curse $N %s.','$n curses you %s.'),('curtsy','$n curtsies.','You curtsy.','$n curtsies %s.','You curtsy %s.','$n curtsies to $N.','You curtsy to $N.','$n curtsies to you.','$n curtsies %s to $N.','You curtsy %s to $N.','$n curtseys %s to you.'),('dance','$n dances.','You dance.','$n dances %s.','You dance %s.','$n dances with $N.','You dance with $N.','$n dances with you.','$n dances %s with $N.','You dance %s with $N.','$n dances %s with you.'),('episode','$n hops about in a frenzy, shouting incoherently.','You hop about in a frenzy, shouting incoherently.','$n %s hops about in a frenzy, shouting incoherently.','You %s hop about in a frenzy, shouting incoherently.','$n hops about in a frenzy, shouting incoherently at $N.','You hop about in a frenzy, shouting incoherently at $N.','$n hops about in a frenzy, shouting incoherently at you.','$n %s hops about in a frenzy, shouting incoherently at $N.','You %s hop about in a frenzy, shouting incoherently at $N.','$n %s hops about in a frenzy, shouting incoherently at you.'),('hum','$n hums.','You hum.','$n hums %s.','You hum %s.','$n hums to $N.','You hum to $N.','$n hums to you.','$n hums %s to $N.','You hum %s to $N.','$n hums %s to you.'),('grin','$n grins.','You grin.','$n grins %s.','You grin %s.','$n grins at $N.','You grin at $N.','$n grins at you.','$n grins %s at $N.','You grin %s at $N.','$n grins %s at you.'),('gasp','$n gasps!','You gasp!','$n gasps %s!','You gasp %s!','$n gasps at $N!','You gasp at $N!','$n gasps at you!','$n gasps %s at $N!','You gasp %s at $N!','$n gasps %s at you!'),('hmph','$n goes \'hmph!\'','You go \'hmph!\'','$n %s goes \'hmph!\'','You %s go \'hmph!\'','$n goes \'hmph!\' at $N.','You go \'hmph!\' at $N.','$n goes \'hmph!\' at you.','$n %s goes \'hmph!\' at $N.','You %s go \'hmph!\' at $N.','$n %s goes \'hmph!\' at you.'),('frown','$n frowns.','You frown.','$n frowns %s.','You frown %s.','$n frowns at $N.','You frown at $N.','$n frowns at you.','$n frowns %s at $N.','You frown %s at $N.','$n frowns %s at you.'),('jump','$n jumps.','You jump.','$n jumps %s.','You jump %s.','$n jumps at $N.','You jump at $N.','$n jumps at you.','$n jumps %s at $N.','You jump %s at $N.','$n jumps %s at you.'),('eyebrow','$n raises an eyebrow.','You raise an eyebrow.','$n %s raises an eyebrow.','You %s raise an eyebrow.','$n raises an eyebrow at $N.','You raise an eyebrow at $N.','$n raises an eyebrow at you.','$n %s raises an eyebrow at $N.','You %s raise an eyebrow at $N.','$n %s raises an eyebrow at you.'),('fart','$n farts. Eww, it smells rancid!','You fart, how pleasant. ','$n farts %s. Eww, it smells rancid!','You fart %s, how pleasant.','$n farts on $N. Eww, it smells rancid!','You fart on $N, how pleasant.','$n farts on you. Eww, that\'s disgusting!','$n farts %s on $N. Eww, it smells rancid! ','You fart %s on $N, how pleasant.','$n farts %s on you. Eww, that\'s disgusting!'),('feel','$n feels around with outstretched arms.','You feel around with outstretched arms.','$n %s feels around with outstretched arms.','You %s feel around with outstretched arms.','$n feels around for $N with outstretched arms.','You feel around for $N with outstretched arms.','$n feels around for you with outstretched arms.','$n %s feels around for $N with outstretched arms.','You %s feel around for $N with outstretched arms.','$n %s feels around for you with outstretched arms.'),('explode','$n gets red in the face and screams.','You get red in the face and scream.','$n gets red in the face and screams %s.','You get red in the face and scream %s.','$n gets red in the face and screams at $N.','You get red in the face and scream at $N.','$n gets red in the face and screams at you.','$n gets red in the face and screams %s at $N.','You get red in the face and scream %s at $N.','$n gets red in the face and screams %s at you.'),('nod','$n nods.','You nod.','$n nods %s.','You nod %s.','$n nods to $N.','You nod to $N.','$n nods to you.','$n nods %s to $N.','You nod %s to $N.','$n nods %s to you.'),('laugh','$n laughs.','You laugh.','$n laughs %s.','$n laugh %s.','$n laughs at $N.','You laugh at $N.','$n laughs at you.','$n laughs %s at $N.','You laugh %s at $N.','$n laughs %s at you.'),('smile','$n smiles.','You smile.','$n smiles %s.','You smile %s.','$n smiles at $N.','You smile at $N.','$n smiles at you.','$n smiles %s at $N.','You smile %s at $N.','$n smiles %s at you.'),('snicker','$n snickers.','You snicker.','$n snickers %s.','You snicker %s.','$n snickers at $N.','You snicker at $N.','$n snickers at you.','$n snickers %s at $N.','You snicker %s at $N.','$n snickers %s at you.'),('sigh','$n sighs.','You sigh.','$n sighs %s.','You sigh %s.','$n sighs at $N.','You sigh at $N.','$n sighs at you.','$n sighs %s at $N.','You sigh %s at $N.','$n sighs %s at you.'),('hmm','$n goes \'hmmm\'.','You go \'hmmm\'.','$n %s goes \'hmmm\'.','You %s go \'hmmm\'.','$n goes \'hmmm\'.','You go \'hmmm\'.','$n goes \'hmmm\'.','$n %s goes \'hmmm\'.','You %s go \'hmmm\'.','$n %s goes \'hmmm\'.'),('slap','','Slap whom?','','Slap whom?','$n slaps $N.','You slap $N.','$n slaps you.','$n slaps $N %s.','You slap $N %s.','$n slaps you %s.'),('smirk','$n smirks.','You smirk.','$n smirks %s.','You smirk %s.','$n smirks at $N.','You smirk at $N.','$n smirks at you.','$n smirks %s at $N.','You smirk %s at $N.','$n smirks %s at you.'),('shiver','$n shivers.','You shiver.','$n shivers %s.','You shiver %s.','$n shivers.','You shiver.','$n shivers.','$n shivers %s.','You shiver %s.','$n shivers %s.'),('cringe','$n cringes.','You cringe.','$n cringes %s.','You cringe %s.','$n cringes.','You cringe.','$n cringes.','$n cringes %s.','You cringe %s.','$n cringes %s.'),('whistle','$n whistles.','You whistle.','$n whistles %s.','You whistle %s.','$n whistles at $N.','You whistle at $N.','$n whistles at you.','$n whistles %s at $N.','You whistle %s at $N.','$n whistles %s at you.'),('shrug','$n shrugs.','You shrug.','$n shrugs %s.','You shrug %s.','$n shrugs at $N.','You shrug at $N.','$n shrugs at you.','$n shrugs %s at $N.','You shrug %s at $N.','$n shrugs %s at you.'),('yawn','$n yawns.','You yawn.','$n yawns %s.','You yawn %s.','$n yawns.','You yawn.','$n yawns.','$n yawns %s.','You yawn %s.','$n yawns %s.'),('flare','$n flares $s nostrils.','You flare your nostrils.','$n %s flares $s nostrils.','You %s flare your nostrils.','$n flares $s nostrils at $N.','You flare your nostrils at $N.','$n flares $s nostrils at you.','$n %s flares $s nostrils at $N.','You %s flare your nostrils at $N.','$n %s flares $s nostrils at you.'),('hug','','Hug whom?','','Hug whom?','$n hugs $N.','You hug $N.','$n hugs you.','$n hugs $N %s.','You hug $N %s.','$n hugs you %s.'),('snap','$n snaps $s fingers.','You snap your fingers.','$n %s snaps $s fingers.','You %s snap your fingers.','$n snaps $s fingers at $N.','You snap your fingers at $N.','$n snaps $s fingers at you.','$n %s snaps $s fingers at $N.','You %s snap your fingers at $N.','$n %s snaps $s fingers at you.'),('snuggle','','Snuggle up to whom?','','Snuggle up to whom?','$n snuggles up to $N.','You snuggle up to $N.','$n snuggles up to you.','$n %s snuggles up to $N.','You %s snuggle up to $N.','$n %s snuggles up to you.'),('pat','','Pat whom?','','Pat whom?','$n pats $N on $S head.','You pat $N on $S head.','$n pats you on your head.','$n %s pats $N on $S head.','You %s pat $N on $S head.','$n %s pats you on your head.'),('ponder','$n ponders.','You ponder.','$n ponders %s.','You ponder %s.','$n ponders.','You ponder.','$n ponders.','$n ponders %s.','You ponder %s.','$n ponders %s.'),('poke','','Poke whom?','','Poke whom?','$n pokes $N in $S ribs.','You poke $N in $S ribs.','$n pokes you in your ribs.','$n %s pokes $N in $S ribs.','You %s poke $N in $S ribs.','$n %s pokes you in your ribs.'),('grumble','$n grumbles.','You grumble.','$n grumbles %s.','You grumble %s.','$n grumbles at $N.','You grumble at $N.','$n grumbles at you.','$n grumbles %s at $N.','You grumble %s at $N.','$n grumbles %s at you.'),('bonk','','Bonk whom?','','Bonk whom?','$n bonks $N on $S head.','You bonk $N on $S head.','$n bonks you on your head.','$n %s bonks $N on $S head.','You %s bonk $N on $S head.','$n %s bonks you on your head.'),('ruffle','','Ruffle whom?','','Ruffle whom?','$n ruffles $N\'s hair.','You ruffle $N\'s hair.','$n ruffles your hair.','$n %s ruffles $N\'s hair.','You %s ruffle $N\'s hair.','$n %s ruffles your hair.'),('shudder','$n shudders.','You shudder.','$n shudders %s.','You shudder %s.','$n shudders.','You shudder.','$n shudders.','$n shudders %s.','You shudder $s.','$n shudders %s.'),('sneeze','$n sneezes.','You sneeze.','$n sneezes %s.','You sneeze %s.','$n sneezes on $N!','You sneeze on $N!','$n sneezes on you! Blech!','$n sneezes %s on $N!','You sneeze %s on $N!','$n sneezes %s on you! Blech!'),('comfort','','Comfort whom?','','Comfort whom?','$n comforts $N.','You comfort $N.','$n comforts you.','$n %s comforts $N.','You %s comfort $N.','$n %s comforts you.'),('eyeroll','$n rolls $s eyes.','You roll your eyes.','$n %s rolls $s eyes.','You %s roll your eyes.','$n rolls $s eyes at $N.','You roll your eyes at $N.','$n rolls $s eyes at you.','$n %s rolls $s eyes at $N.','You %s roll your eyes at $N.','$n %s rolls $s eyes at you.'),('peer','$n peers around.','You peer around.','$n %s peers around.','You %s peer around.','$n peers around.','You peer around.','$n peers around.','$n %s peers around.','You %s peer around.','$n %s peers around.'),('wink','$n winks.','You wink.','$n winks %s.','You wink %s.','$n winks at $N.','You wink at $N.','$n winks at you.','$n winks %s at $N.','You wink %s at $N.','$n winks %s at you.'),('glare','','Glare at whom?','','Glare at whom?','$n glares at $N.','You glare at $N.','$n glares at you.','$n glares %s at $N.','You glare %s at $N.','$n glares %s at you.'),('kiss','','Kiss whom?','','Kiss whom?','$n kisses $N.','You kiss $N.','$n kisses you.','$n kisses $N %s.','You kiss $N %s.','$n kisses you %s.'),('sniff','$n sniffs.','You sniff.','$n sniffs %s.','You sniff %s.','$n sniffs $N.','You sniff $N.','$n sniffs you.','$n sniffs $N %s.','You sniff $N %s.','$n sniffs you %s.'),('cry','$n starts to cry.','You start to cry.','$n starts to cry %s.','You start to cry %s.','$n starts to cry.','You start to cry.','$n starts to cry.','$n starts to cry %s.','You start to cry %s.','$n starts to cry %s.'),('shake','$n shakes $s head.','You shake your head.','$n %s shakes $s head.','You %s shake your head.','$n shakes $s head at $N.','You shake your head at $N.','$n shakes $s head at you.','$n %s shakes $s head at $N.','You %s shake your head at $N.','$n %s shakes $s head at you.'),('stretch','$n stretches.','You stretch.','$n stretches %s.','You stretch %s.','$n stretches.','You stretch.','$n stretches.','$n stretches %s.','You stretch %s.','$n stretches %s.'),('sob','$n sobs.','You sob.','$n sobs %s.','You sob %s.','$n sobs.','You sob.','$n sobs.','$n sobs %s.','You sob %s.','$n sobs %s.'),('wave','$n waves.','You wave.','$n waves %s.','You wave %s.','$n waves to $N.','You wave to $N.','$n waves to you.','$n waves %s to $N.','You wave %s to $N.','$n waves %s to you.'),('argh','$n pulls $s hair in frustration.','You pull your hair in frustration.','$n %s pulls $s hair in frustration.','You %s pull your hair in frustration.','$n pulls $s hair in frustration.','You pull your hair in frustration.','$n pulls $s hair in frustration.','$n %s pulls $s hair in frustration.','You %s pull your hair in frustration.','$n %s pulls $s hair in frustration.'),('beckon','','Beckon to whom?','','Beckon to whom?','$n beckons to $N.','You beckon to $N.','$n beckons to you.','$n %s beckons to you.','You %s beckon to $N.','$n %s beckons to you.'),('beg','','Beg whom?','','Beg whom?','$n gets on one knee and begs $N.','You get on one knee and beg $N.','$n gets on one knee and begs you.','$n gets on one knee and begs $N %s.','You get on one knee and beg $N %s.','$n gets on one knee and begs you %s.'),('blowkiss','','Blow a kiss to whom?','','Blow a kiss to whom?','$n blows a kiss to $N.','You blow a kiss to $N.','$n blows a kiss to you.','$n %s blows a kiss to $N.','You %s blow a kiss to $N.','$n %s blows a kiss to you.'),('blush','$n\'s cheeks turn a deep shade of crimson.','Your cheeks turn a deep shade of crimson.','$n\'s cheeks turn a deep shade of crimson.','Your cheeks turn a deep shade of crimson.','$n\'s cheeks turn a deep shade of crimson.','Your cheeks turn a deep shade of crimson.','$n\'s cheeks turn a deep shade of crimson.','$n\'s cheeks turn a deep shade of crimson.','Your cheeks turn a deep shade of crimson.','$n\'s cheeks turn a deep shade of crimson.'),('brighten','$n\'s face brightens up.','Your face brightens up.','$n\'s face %s brightens up.','Your face %s brightens up.','$n\'s face brightens up.','Your face brightens up.','$n\'s face brightens up.','$n\'s face %s brightens up.','Your face %s brightens up','$n\'s face %s brightens up.'),('brush','$n brushes $mself off.','You brush yourself off.','$n %s brushes $mself off.','You %s brush yourself off.','$n brushes $mself off.','You brush yourself off.','$n brushes $mself off.','$n %s brushes $mself off.','You %s brush yourself off.','$n %s brushes 4mself off.'),('caress','','Caress whom?','','Caress whom?','$n caresses $N\'s cheek.','You caress $N\'s cheek.','$n caresses your cheek.','$n caresses $N\'s cheek %s.','You caress $N\'s cheek %s.','$n caresses your cheek %s.'),('blame','','Blame whom?','','Blame whom?','$n points a blaming finger at $N.','You point a blaming finger at $N.','$n points a blaming finger at you.','$n %s points a blaming finger at $N.','You %s point a blaming finger at $N.','$n %s points a blaming finger at you.'),('clench','$n clenches $s fists.','You clench your fists.','$n clenches $s fists %s.','You clench your fists %s.','$n clenches $s fists and glares at $N.','You clench your fists and glare at $N.','$n clenches $s fists and glares at you.','$n clenches $s fists %s and glares at $N.','You clench your fists %s and glare at $N.','$n clenches $s fists %s and glares at you.'),('cling','','Cling to whom?','','Cling to whom?','$n clings to $N.','You cling to $N.','$n clings to you.','$n clings %s to $N.','You cling %s to $N.','$n clings %s to you.'),('crack','$n cracks $s knuckles.','You crack your knuckles.','$n %s cracks $s knuckles.','You %s crack your knuckles.','$n cracks $s knuckles.','You crack your knuckles.','$n cracks $s knuckles.','$n %s cracks $s knuckles.','You %s crack your knuckles.','$n %s cracks $s knuckles.'),('crosseye','$n crosses $s eyes.','You cross your eyes.','$n %s crosses $s eyes.','You %s cross your eyes.','$n crosses $s eyes while looking at $N.','You cross your eyes while looking at $N.','$n crosses $s eyes while looking at you.','$n %s crosses $s eyes while looking at $N.','You %s cross your eyes while looking at $N.','$n %s crosses $s eyes while looking at you.'),('cuddle','','Cuddle with whom?','','Cuddle with whom?','$n cuddles with $N.','You cuddle with $N.','$n cuddles with you.','$n cuddles with $N %s.','You cuddle with $N %s.','$n cuddles with you %s.'),('daydream','$n seems to be spacing off.','You start spacing off.','$n seems to be spacing off %s.','You start spacing off %s.','$n seems to be spacing off.','You start spacing off.','$n seems to be spacing off.','$n seems to be spacing off %s.','You start spacing off %s.','$n seems to be spacing off %s.'),('despair','$n\'s eyes glaze over in despair.','Your eyes glaze over in despair.','$n\'s eyes %s glaze over in despair.','Your eyes %s glaze over in despair.','$n\'s eyes glaze over in despair.','Your eyes glaze over in despair.','$n\'s eyes glaze over in despair.','$n\'s eyes %s glaze over in despair.','Your eyes %s glaze over in despair.','$n\'s eyes %s glaze over in despair.'),('drool','$n starts to drool.','You start to drool.','$n starts to drool %s.','You start to drool %s.','$n drools over $N.','You drool over $N.','$n drools over you.','$n drools %s over $N.','You drool %s over $N.','$n drools %s over you.'),('duh','$n smacks $s forehead.','You smack your forehead.','$n smacks $s forehead %s.','You smack your forehead %s.','$n smacks $s forehead.','You smack your forehead.','$n smacks $s.','$n smacks $s forehead %s.','You smack your forehead %s.','$n smacks $s forehead %s.'),('eeks','$n screams in a deafeningly high pitch.','You scream in a deafeningly high pitch.','$n %s screams in a deafeningly high pitch.','You %s scream in a deafeningly high pitch.','$n screams in a deafeningly high pitch at $N.','You scream in a deafeningly high pitch at $N.','$n screams in a deafeningly high pitch at you.','$n %s screams in a deafeningly high pitch at $N.','You %s scream in a deafeningly high pitch at $N.','$n %s screams in a deafeningly high pitch at you.'),('fawn','','Fawn over whom?','','Fawn over whom?','$n fawns over $N.','You fawn over $N.','$n fawns over you.','$n %s fawns over $N.','You %s fawn over $N.','$n %s fawns over you.'),('flex','$n flexes $s muscles.','You flex your muscles.','$n %s flexes $s muscles.','You %s flex your muscles.','$n flexes $s muscles.','You flex your muscles.','$n flexes $s muscles.','$n %s flexes $s muscles.','You %s flex your muscles.','$n %s flexes $s muscles.'),('flick','','Flick whom?','','Flick whom?','$n flicks $N on the nose.','You flick $N on the nose.','$n flicks you on the nose.','$n %s flicks $N on the nose.','You %s flick $N on the nose.','$n %s flicks you on the nose.'),('flinch','$n flinches.','You flinch.','$n flinches %s.','You flinch %s.','$n flinches.','You flinch.','$n flinches.','$n flinches %s.','You flinch %s.','$n flinches %s.'),('fondle','','Fondle whom?','','Fondle whom?','$n fondles $N.','You fondle $N.','$n fondles you.','$n fondles $N %s.','You fondle $N %s.','$n fondles you %s.'),('french','','French kiss whom?','','French kiss whom?','$n gives $N a slow, passionate french kiss.','You give $N a slow, passionate french kiss.','$n gives you a slow, passionate french kiss.','$n gives $N a slow, passionate french kiss.','You give $N a slow, passionate french kiss.','$n gives you a slow, passionate french kiss.'),('fume','$n fumes.','You fume.','$n fumes %s.','You fume %s.','$n fumes at $N.','You fume at $N.','$n fumes at you.','$n fumes %s at $N.','You fume %s at $N.','$n fumes %s at you.'),('glow','$n\'s face seems to be glowing.','Your face is glowing.','$n\'s face seems to be glowing %s.','Your face is glowing %s.','$n\'s face seems to be glowing.','Your face is glowing.','$n\'s face seems to be glowing.','$n\'s face seems to be glowing %s.','Your face is glowing %s.','$n\'s face seems to be glowing %s.'),('gag','$n starts to gag.','You start to gag.','$n starts to gag %s.','You start to gag %s.','$n starts to gag.','You start to gag.','$n starts to gag.','$n starts to gag %s.','You start to gag %s.','$n starts to gag %s.'),('giggle','$n giggles.','You giggle.','$n giggles %s.','You giggle %s.','$n giggles at $N.','You giggle at $N.','$n giggles at you.','$n giggles %s at $N.','You giggle %s at $N.','$n giggles %s at you.'),('goof','$n makes a somewhat goofy face.','You make a somewhat goofy face.','$n %s makes a somewhat goofy face.','You %s make a somewhat goofy face.','$n makes a somewhat goofy face at $N.','You make a somewhat goofy face at $N.','$n makes a somewhat goofy face at you.','$n %s makes a somewhat goofy face at $N.','You %s make a somewhat goofy face at $N.','$n %s makes a somewhat goofy face at you.'),('grind','$n grinds $s teeth in anger.','You grind your teeth in anger.','$n %s grinds $s teeth in anger.','You %s grind your teeth in anger.','$n grinds $s teeth in anger.','You grind your teeth in anger.','$n grinds $s teeth in anger.','$n %s grinds $s teeth in anger.','You %s grind your teeth in anger.','$n %s grinds $s teeth in anger.'),('groan','$n groans.','You groan.','$n groans %s.','You groan %s.','$n groans at $N.','You groan at $N.','$n groans at you.','$n groans %s at $N.','You groan %s at $N.','$n groans %s at you.'),('grope','','Grope whom?','','Grope whom?','$n gropes $N.','You grope $N.','$n gropes you.','$n %s gropes $N.','You %s grope $N.','$n %s gropes you.'),('grovel','','Grovel to whom?','','Grovel to whom?','$n grovels at $N\'s feet.','You grovel at $N\'s feet.','$n grovels at your feet.','$n %s grovels at $N\'s feet.','You %s grovel at $N\'s feet.','$n %s grovels at your feet.'),('gulp','$n gulps.','You gulp.','$n gulps %s.','You gulp %s.','$n gulps.','You gulp.','$n gulps.','$n gulps %s.','You gulp %s.','$n gulps %s.'),('throat','$n clears $s throat.','You clear your throat.','$n %s clears $s throat.','You %s clear your throat.','$n clears $s throat.','You clear your throat.','$n clears $s throat.','$n %s clears $s throat.','You %s clear your throat.','$n %s clears $s throat.'),('gurgle','$n makes a gurgling noise.','You make a gurgling noise.','$n %s makes a gurgling noise.','You %s make a gurgling noise.','$n makes a gurgling noise.','You make a gurgling noise.','$n makes a gurgling noise.','$n %s makes a gurgling noise.','You %s make a gurgling noise.','$n %s makes a gurgling noise.'),('hiccup','$n hiccups.','You hiccup.','$n hiccups %s.','You hiccup %s.','$n hiccups.','You hiccup.','$n hiccups.','$n hiccups %s.','You hiccup %s.','$n hiccups %s.'),('highfive','','High five whom?','','High five whom?','$n gives $N a high five.','You give $N a high five.','$n gives you a high five.','$n %s gives $N a high five.','You %s give $N a high five.','$n %s gives you a high five.'),('hold','','Hold whom?','','Hold whom?','$n holds $N in $s arms.','You hold $N in your arms.','$n holds you in $s arms.','$n holds $N %s in $s arms.','You hold $N %s in your arms.','$n holds you %s in $s arms.'),('itch','$n scratches at an itch.','You scratch at an itch.','$n %s scratches at an itch.','You %s scratch at an itch.','$n scratches at an itch.','You scratch at an itch.','$n scratches at an itch.','$n %s scratches at an itch.','You %s scratch at an itch.','$n %s scratches at an itch.'),('jab','','Jab whom?','','Jab whom?','$n jabs $N in the stomach.','You jab $N in the stomach.','$n jabs you in the stomach.','$n jabs $N %s in the stomach.','You jab $N %s in the stomach.','$n jabs you %s in the stomach.'),('jiggle','$n jiggles $s bottom.','You jiggle your bottom.','$n jiggles $s bottom %s.','You jiggle your bottom %s.','$n jiggles $s bottom at $N.','You jiggle your bottom at $N.','$n jiggles $s bottom at you.','$n jiggles $s bottom %s at $N.','You jiggle your bottom %s at $N.','$n jiggles $s bottom %s at you.'),('lick','','Lick whom?','','Lick whom?','$n licks $N.','You lick $N.','$n licks you.','$n licks $N %s.','You lick $N %s.','$n licks you %s.'),('listen','$n listens.','You listen.','$n listens %s.','You listen %s.','$n listens to $N.','You listen to $N.','$n listens to you.','$n listens to $N %s.','You listen to $N %s.','$n listens to you %s.'),('moan','$n moans.','You moan.','$n moans %s.','You moan %s.','$n moans at $N.','You moan at $N.','$n moans at you.','$n moans %s at $N.','You moan %s at $N.','$n moans %s at you.'),('mumble','$n mumbles to $mself.','You mumble to yourself.','$n mumbles %s to $mself.','You mumble %s to yourself.','$n mumbles to $mself.','You mumble to yourself.','$n mumbles to $mself.','$n mumbles %s to $mself.','You mumble %s to yourself.','$n mumbles %s to $mself.'),('blink','$n blinks.','You blink.','$n blinks %s.','You blink %s.','$n blinks at $N.','You blink at $N.','$n blinks at you.','$n blinks %s at $N.','You blink %s at $N.','$n blinks %s at you.'),('wobble','$n’s knees start to wobble.','Your knees start to wobble.','$n’s knees start to wobble %s.','Your knees start to wobble %s.','$n’s knees start to wobble.','Your knees start to wobble.','$n’s knees start to wobble.','$n’s knees start to wobble %s.','Your knees start to wobble %s.','$n’s knees start to wobble %s.'),('whine','$n whines.','You whine.','$n whines %s.','You whine %s.','$n whines at $N.','You whine at $N.','$n whines at you.','$n whines %s at $N.','You whine %s at $N.','$n whines %s at you.'),('whimper','$n whimpers.','You whimper.','$n whimpers %s.','You whimper %s.','$n whimpers at $N.','You whimper at $N.','$n whimpers at you.','$n whimpers %s at $N.','You whimper %s at $N','$n whimpers %s at you.'),('pout','$n sticks $s lip out and pouts.','You stick your lip out and pout.','$n %s sticks $s lip out and pouts.','You %s stick your lip out and pout.','$n sticks $s lip out at $N at pouts.','You stick your lip out at $N and pout.','$n sticks $s lip out at you and pouts.','$n %s sticks $s lip out at $N and pouts.','You %s stick your lip out at $N and pout.','$n %s sticks $s lip out at you and pouts.'),('wail','$n wails like a baby. WAHHH!','You start to wail. Don\'t be such a crybaby.','$n %s starts to wail like a baby. WAHHH!','You %s start to wail. Don\'t be such a crybaby.','$n wails like a baby at $N. WAHHH!','You start to wail at $N. Don\'t be such a crybaby.','$n wails like a baby at you. WAHHH!','$n %s wails like a baby at $N. WAHHH!','You %s start to wail at $N. Don\'t be such a crybaby.','$n %s wails like a baby at you. WAHHH!'),('ugh','$n makes a disgusted noise.','You make a disgusted noise.','$n %s makes a disgusted noise.','You %s make a disgusted noise.','$n makes a disgusted noise at $N.','You make a disgusted noise at $N.','$n makes a disgusted noise at you.','$n %s makes a disgusted noise at $N.','You %s make a disgusted noise at $N.','$n %s makes a disgusted noise at $N.'),('twirl','$n twirls around in a circle!','You twirl around in a circle! WHEEEEEEE!','$n %s twirls around in a circle!','You %s twirl around in a circle! WHEEEEEEE!','$n twirls around in a circle with $N!','You twirl around in a circle with $N! WHEEEEEEE!','$n twirls around in a circle with you! WHEEEEEEE!','$n %s twirls around in a circle with $N!','You %s twirl around in a circle with $N! WHEEEEEEE!','$n %s twirls around in a circle with you! WHEEEEEEE!'),('tongue','$n sticks $s tongue out. NYAH!','You stick your tongue out. NYAH!','$n %s sticks $s tongue out. NYAH!','You %s stick your tongue out. NYAH!','$n sticks $s tongue out at $N. NYAH!','You stick your tongue out at $N. NYAH!','$n sticks $s tongue out at you. NYAH!','$n %s sticks $s tongue out at $N. NYAH!','You %s stick your tongue out at $N. NYAH!','$n %s sticks $s tongue out at you. NYAH!'),('twiddle','$n twiddles $s thumbs.','You twiddle your thumbs.','$n %s twiddles $s thumbs.','You %s twiddle your thumbs.','$n twiddles $s thumbs.','You twiddle your thumbs.','$n twiddles $s thumbs.','$n %s twiddles $s thumbs.','You %s twiddle your thumbs.','$n %s twiddles $s thumbs.'),('tremble','$n trembles.','You tremble.','$n %s trembles.','You %s tremble.','$n trembles.','You tremble.','$n trembles.','$n %s trembles.','You %s tremble.','$n %s trembles.'),('tickle','','Tickle whom?','','Tickle whom?','$n tickles $N!','You tickle $N!','$n tickles you! Hehe!','$n %s tickles $N!','You %s tickle $N!','$n %s tickles you! Hehe!'),('tap','$n taps $s foot.','You tap your foot.','$n %s taps $s foot.','You %s tap your foot.','$n taps $s foot, waiting on $N.','You tap your foot, waiting on $N.','$n taps $s foot, waiting on you.','$n %s taps $s foot, waiting on $N.','You %s tap your foot, waiting on $N.','$n %s taps $s foot, waiting on you.'),('thank','','Thank whom?','','Thank whom?','$n thanks $N.','You thank $N.','$n thanks you.','$n %s thanks $N.','You %s thank $N.','$n %s thanks you.'),('sweat','$n starts sweating.','You start to sweat.','$n starts sweating %s.','You start to sweat %s.','$n starts sweating.','You start to sweat.','$n starts sweating.','$n starts sweating %s.','You start to sweat %s.','$n starts sweating %s.'),('think','$n rubs $s chin as a thoughtful expression comes over $s face.','You rub your chin in thought.','$n %s rubs $s chin as a thoughtful expression comes over $s face.','You %s rub your chin in thought.','$n rubs $s chin as a thoughtful expression comes over $s face.','You rub your chin in thought.','$n rubs $s chin as a thoughtful expression comes over $s face.','$n %s rubs $s chin as a thoughtful expression comes over $s face.','You %s rub your chin in thought.','$n %s rubs $s chin as a thoughtful expression comes over $s face.'),('sway','$n begins to sway.','You begin to sway.','$n begins to %s sway.','You begin to %s sway.','$n begins to sway.','You begin to sway.','$n begins to sway.','$n begins to %s sway.','You begin to %s sway.','$n begins to %s sway.'),('stumble','$n stumbles and nearly loses $s balance.','You stumble and nearly topple over.','$n %s stumbles and nearly loses $s balance.','You %s stumble and nearly topple over.','$n stumbles into $N and nearly knocks $M over.','You stumble into $N and nearly knock $M over!','$n stumbles into you and nearly knocks you over!','$n %s stumbles into $N and nearly knocks $M over.','You %s stumble into $N and nearly knock $M over!','$n %s stumbles into you and nearly knocks you over!'),('strut','$n struts around.','You strut around.','$n %s struts around.','You %s strut around.','$n struts around.','You strut around.','$n struts around.','$n %s struts around.','You %s strut around.','$n %s struts around.'),('sulk','$n sulks.','You sulk.','$n sulks %s.','You sulk %s.','$n sulks.','You sulk.','$n sulks.','$n sulks %s.','You sulk %s.','$n sulks %s.'),('stroke','','Stroke whom?','','Stroke whom?','$n strokes $s finger across $N\'s face.','You stroke your finger across $N\'s face.','$n strokes $s finger across your face.','$n %s strokes $s finger across $N\'s face.','You %s stroke your finger across $N\'s face.','$n %s strokes $s finger across your face.'),('stomp','$n stomps $s feet.','You stomp your feet.','$n %s stomps $s feet.','You $s stomp your feet.','$n stomps $s feet.','You stomp your feet.','$n stomps $s feet.','$n %s stomps $s feet.','You %s stomp your feet.','$n %s stomps $s feet.'),('stare','$n stares into the distance.','You stare off into the distance.','$n %s stares into the distance.','You %s stare off into the distance.','$n stares at $N.','You stare at $N.','$n stares at you.','$n stares %s at $N.','You stare %s at $N.','$n stares %s at you.'),('squeeze','','Squeeze whom?','','Squeeze whom?','$n squeezes $N.','You squeeze $N.','$n squeezes you.','$n %s squeezes $N.','You %s squeeze $N.','$s %s squeezes you.'),('spit','$n spits.','You spit.','$n %s spits.','You %s spit.','$n spits in $N’s face!','You spit in $N’s face!','$n spits in your face!','$n %s spits in $N’s face!','You %s spit in $N’s face!','$n %s spits in your face!'),('nudge','','Nudge whom?','','Nudge whom?','$n nudges $N.','You nudge $N.','$n nudges you.','$n %s nudges $N.','You %s nudge $N.','$n %s nudges you.'),('snarl','$n snarls.','You snarl.','$n snarls %s.','You snarl %s.','$n snarls at $N.','You snarl at $N.','$n snarls at you.','$n snarls %s at $N.','You snarl %s at $N.','$n snarls %s at you.'),('shuffle','$n shuffles $s feet.','You shuffle your feet.','$n %s shuffles $s feet.','You %s shuffle your feet.','$n shuffles $s feet.','You shuffle your feet.','$n shuffles $s feet.','$n %s shuffles $s feet.','You %s shuffle your feet.','$n %s shuffles $s feet.'),('shift','$n shifts around.','You shift around.','$n %s shifts around.','You %s shift around.','$n shifts around.','You shift around.','$n shifts around.','$n %s shifts around.','You %s shift around.','$n %s shifts around.'),('scratch','$n scratches $s head.','You scratch your head.','$n %s scratches $s head.','You %s scratch your head.','$n scratches $s head.','You scratch your head.','$n scratches $s head.','$n %s scratches $s head.','You %s scratch your head.','$n %s scratches $s head.'),('quiver','$n\'s body quivers and quakes.','Your body quivers and quakes.','$n\'s body quivers and quakes %s.','Your body quivers and quakes %s.','$n\'s body quivers and quakes.','Your body quivers and quakes.','$n\'s body quivers and quakes.','$n\'s body quivers and quakes %s.','Your body quivers and quakes %s.','$n\'s body quivers and quakes %s.'),('salute','$n puts $s hand to $s forehead in a salute.','You put your hand to your forehead in a salute.	','$n %s puts $s hand to $s forehead in a salute.','You %s put your hand to your forehead in a salute.','$n puts $s hand to $s forehead in a salute to $N.','You put your hand to your forehead in a salute to $N.','$n puts $s hand to $s forehead in a salute to you.','$n %s puts $s hand to $s forehead in a salute to $N.','You %s put your hand to your forehead in a salute to $N.','$n %s puts $s hand to $s forehead in a salute to you.'),('pose','$n strikes a pose! How graceful!','You strike a pose! How graceful!','$n %s strikes a pose! How graceful!','You %s strike a pose! How graceful!','$n strikes a pose! How graceful!','You strike a pose! How graceful!','$n strikes a pose! How graceful!','$n %s strikes a pose! How graceful!','You %s strike a pose! How graceful!','$n %s strikes a pose! How graceful!'),('pale','$n’s face starts to pale.','Your face starts going pale.','$n’s face %s starts to pale.','Your face %s starts going pale.','$n\'s face starts to pale.','Your face starts going pale.','$n\'s face starts to pale.','$n\'s face %s starts to pale.','Your face %s starts to pale.','$n\'s face %s starts to pale.'),('snore','$n snores.','You snore.','$n snores %s.','You snore %s.','$n snores.','You snore.','$n snores.','$n snores %s.','You snore %s.','$n snores %s.'),('wiggle','$n wiggles $s fingers.','You wiggle your fingers.','$n %s wiggles $s fingers.','You %s wiggle your fingers.','$n wiggles $s fingers at $N.','You wiggle your fingers at $N.','$n wiggles $s fingers at you.','$n %s wiggles $s fingers at $N.','You %s wiggle your fingers at $N.','$n %s wiggles $s fingers at you.'),('grunt','$n grunts.','You grunt.','$n grunts %s.','You grunt %s.','$n grunts at $N.','You grunt at $N.','$n grunts at you.','$n grunts %s at $N.','You grunt %s at $N.','$n grunts %s at you.'),('snort','$n snorts.','You snort.','$n snorts %s. ','You snort %s.','$n snorts at $N.','You snort at $N.','$n snorts at you.','$n snorts %s at $N.','You snort %s at $N.','$n snorts %s at you.');
/*!40000 ALTER TABLE `socials` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `stats`
--

LOCK TABLES `stats` WRITE;
/*!40000 ALTER TABLE `stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `stats` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','21232f297a57a5a743894a0e4a801fc3','admin@josmud.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

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

-- Dump completed on 2011-01-14  9:59:01
