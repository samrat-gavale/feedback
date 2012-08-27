-- MySQL dump 10.13  Distrib 5.1.41, for debian-linux-gnu (i486)
--
-- Host: localhost    Database: crcdb
-- ------------------------------------------------------
-- Server version	5.1.41-3ubuntu12.10-log

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
-- Table structure for table `crc_attendance`
--

DROP TABLE IF EXISTS `crc_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crc_attendance` (
  `attendance_id` int(11) NOT NULL AUTO_INCREMENT,
  `attendance_student_schedule_id` int(11) NOT NULL DEFAULT '0',
  `attendance_date_id` int(11) NOT NULL DEFAULT '0',
  `attendance_check` char(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`attendance_id`)
) ENGINE=MyISAM AUTO_INCREMENT=144 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crc_attendance`
--

LOCK TABLES `crc_attendance` WRITE;
/*!40000 ALTER TABLE `crc_attendance` DISABLE KEYS */;
INSERT INTO `crc_attendance` VALUES (75,43,15,'P'),(77,41,15,'P'),(79,43,17,'A'),(81,41,17,'P'),(83,41,19,'A'),(85,43,19,'A'),(87,37,19,'A'),(89,39,19,'A'),(91,49,21,'P'),(93,45,21,'P'),(95,37,21,'P'),(97,39,21,'A'),(99,49,23,'A'),(101,45,23,'A'),(103,37,23,'A'),(105,39,23,'A'),(107,49,25,'P'),(109,53,25,'P'),(111,45,25,'P'),(113,37,25,'P'),(115,39,25,'P'),(117,57,25,'A'),(119,51,27,'A'),(121,47,27,'A'),(123,55,27,'A'),(125,43,27,'A'),(127,41,27,'A'),(129,59,27,'A'),(131,61,29,'P'),(133,49,29,'P'),(135,45,29,'P'),(137,37,29,'P'),(139,57,29,'P'),(141,53,29,'P'),(143,39,29,'A');
/*!40000 ALTER TABLE `crc_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crc_courses`
--

DROP TABLE IF EXISTS `crc_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crc_courses` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(100) NOT NULL DEFAULT '',
  `course_desc` varchar(255) DEFAULT '',
  `course_active` tinyint(1) NOT NULL DEFAULT '0',
  `course_fee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`course_id`,`course_name`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crc_courses`
--

LOCK TABLES `crc_courses` WRITE;
/*!40000 ALTER TABLE `crc_courses` DISABLE KEYS */;
INSERT INTO `crc_courses` VALUES (13,'CS-201','Computer Organisation 1',0,0),(15,'EE-203','Network Theory',0,0);
/*!40000 ALTER TABLE `crc_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crc_date`
--

DROP TABLE IF EXISTS `crc_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crc_date` (
  `date_id` int(11) NOT NULL AUTO_INCREMENT,
  `date_day` char(2) NOT NULL DEFAULT '',
  `date_month` char(2) NOT NULL DEFAULT '',
  `date_year` varchar(4) NOT NULL DEFAULT '',
  PRIMARY KEY (`date_id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crc_date`
--

LOCK TABLES `crc_date` WRITE;
/*!40000 ALTER TABLE `crc_date` DISABLE KEYS */;
INSERT INTO `crc_date` VALUES (15,'29','08','2011'),(17,'30','08','2011'),(19,'05','09','2011'),(21,'07','09','2011'),(23,'10','09','2011'),(25,'12','09','2011'),(27,'14','09','2011'),(29,'15','09','2011');
/*!40000 ALTER TABLE `crc_date` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crc_feedback`
--

DROP TABLE IF EXISTS `crc_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crc_feedback` (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `feedback_profile_id` int(11) NOT NULL DEFAULT '0',
  `feedback_schedule_id` int(11) NOT NULL DEFAULT '0',
  `feedback_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `feedback_active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`feedback_id`),
  KEY `feedback_profile_id` (`feedback_profile_id`,`feedback_schedule_id`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=latin1 COMMENT='This table is facility to store feddback information from st';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crc_feedback`
--

LOCK TABLES `crc_feedback` WRITE;
/*!40000 ALTER TABLE `crc_feedback` DISABLE KEYS */;
INSERT INTO `crc_feedback` VALUES (21,29,37,'2011-08-29 07:04:12',0),(23,31,39,'2011-08-29 10:34:47',0),(25,29,41,'2011-09-05 09:12:32',0),(27,31,43,'2011-09-07 10:08:08',0),(29,33,47,'2011-09-10 04:06:23',0),(31,33,45,'2011-09-10 04:21:56',0),(33,37,53,'2011-09-12 08:46:17',0),(35,39,57,'2011-09-12 08:58:29',0),(37,35,49,'2011-09-14 04:19:31',0),(39,35,51,'2011-09-14 04:20:53',0),(41,39,59,'2011-09-14 04:25:25',0),(43,41,61,'2011-09-15 05:30:51',0),(45,41,63,'2011-09-15 05:55:38',0),(47,43,65,'2011-09-16 06:43:57',0);
/*!40000 ALTER TABLE `crc_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crc_feedback_answers`
--

DROP TABLE IF EXISTS `crc_feedback_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crc_feedback_answers` (
  `feedback_answers_id` int(11) NOT NULL AUTO_INCREMENT,
  `feedback_answers_feedback_id` int(11) NOT NULL DEFAULT '0',
  `feedback_answers_questions_id` int(11) NOT NULL DEFAULT '0',
  `feedback_answers_answer` text NOT NULL,
  `feedback_answers_active` tinyint(4) NOT NULL DEFAULT '0',
  `feedback_answers_comments` text NOT NULL,
  PRIMARY KEY (`feedback_answers_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1172 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crc_feedback_answers`
--

LOCK TABLES `crc_feedback_answers` WRITE;
/*!40000 ALTER TABLE `crc_feedback_answers` DISABLE KEYS */;
INSERT INTO `crc_feedback_answers` VALUES (449,21,1,'5',0,''),(451,21,2,'5',0,''),(453,21,3,'5',0,''),(455,21,4,'5',0,''),(457,21,5,'1',0,''),(459,21,6,'5',0,''),(461,21,7,'5',0,''),(463,21,8,'5',0,''),(465,21,9,'5',0,''),(467,21,10,'5',0,''),(469,21,11,'5',0,''),(471,21,12,'5',0,''),(473,21,13,'5',0,''),(475,21,14,'5',0,''),(477,21,15,'5',0,''),(479,21,16,'5',0,''),(481,21,17,'5',0,''),(483,21,18,'5',0,''),(485,21,19,'5',0,''),(487,21,20,'5',0,''),(489,21,21,'0',0,''),(491,21,22,'0',0,''),(493,21,23,'0',0,''),(495,23,1,'4',0,''),(497,23,2,'5',0,''),(499,23,3,'1',0,''),(501,23,4,'4',0,''),(503,23,5,'1',0,''),(505,23,6,'5',0,''),(507,23,7,'1',0,''),(509,23,8,'1',0,''),(511,23,9,'1',0,''),(513,23,10,'5',0,''),(515,23,11,'1',0,''),(517,23,12,'1',0,''),(519,23,13,'1',0,''),(521,23,14,'5',0,''),(523,23,15,'1',0,''),(525,23,16,'1',0,''),(527,23,17,'1',0,''),(529,23,18,'1',0,''),(531,23,19,'5',0,''),(533,23,20,'5',0,''),(535,23,21,'0',0,''),(537,23,22,'0',0,''),(539,23,23,'0',0,''),(541,25,1,'1',0,''),(543,25,2,'1',0,''),(545,25,3,'1',0,''),(547,25,4,'1',0,''),(549,25,5,'1',0,''),(551,25,6,'1',0,''),(553,25,7,'1',0,''),(555,25,8,'1',0,''),(557,25,9,'1',0,''),(559,25,10,'1',0,''),(561,25,11,'1',0,''),(563,25,12,'1',0,''),(565,25,13,'1',0,''),(567,25,14,'1',0,''),(569,25,15,'1',0,''),(571,25,16,'1',0,''),(573,25,17,'1',0,''),(575,25,18,'1',0,''),(577,25,19,'1',0,''),(579,25,20,'1',0,''),(581,25,21,'0',0,'wer'),(583,25,22,'0',0,'werew'),(585,25,23,'0',0,'ewrw'),(587,27,1,'5',0,''),(589,27,2,'5',0,''),(591,27,3,'5',0,''),(593,27,4,'0',0,''),(595,27,5,'0',0,''),(597,27,6,'0',0,''),(599,27,7,'0',0,''),(601,27,8,'0',0,''),(603,27,9,'0',0,''),(605,27,10,'0',0,''),(607,27,11,'0',0,''),(609,27,12,'0',0,''),(611,27,13,'0',0,''),(613,27,14,'0',0,''),(615,27,15,'0',0,''),(617,27,16,'0',0,''),(619,27,17,'0',0,''),(621,27,18,'0',0,''),(623,27,19,'0',0,''),(625,27,20,'0',0,''),(627,27,21,'0',0,''),(629,27,22,'0',0,''),(631,27,23,'0',0,''),(633,29,1,'0',0,''),(635,29,2,'0',0,''),(637,29,3,'5',0,''),(639,29,4,'5',0,''),(641,29,5,'5',0,''),(643,29,6,'4',0,''),(645,29,7,'4',0,''),(647,29,8,'4',0,''),(649,29,9,'4',0,''),(651,29,10,'4',0,''),(653,29,11,'4',0,''),(655,29,12,'5',0,''),(657,29,13,'4',0,''),(659,29,14,'4',0,''),(661,29,15,'5',0,''),(663,29,16,'4',0,''),(665,29,17,'4',0,''),(667,29,18,'0',0,''),(669,29,19,'5',0,''),(671,29,20,'4',0,''),(673,29,21,'5',0,''),(675,29,22,'0',0,'fdsgfsdg'),(677,29,23,'0',0,'gfgfgfgf'),(679,29,24,'0',0,'0'),(681,29,25,'0',0,'0'),(683,29,26,'0',0,'0'),(685,29,27,'0',0,'0'),(687,31,1,'5',0,''),(689,31,2,'0',0,''),(691,31,3,'5',0,''),(693,31,4,'5',0,''),(695,31,5,'0',0,''),(697,31,6,'5',0,''),(699,31,7,'0',0,''),(701,31,8,'0',0,''),(703,31,9,'0',0,''),(705,31,10,'5',0,''),(707,31,11,'5',0,''),(709,31,12,'5',0,''),(711,31,13,'0',0,''),(713,31,14,'0',0,''),(715,31,15,'5',0,''),(717,31,16,'0',0,''),(719,31,17,'0',0,''),(721,31,18,'5',0,''),(723,31,19,'5',0,''),(725,31,20,'5',0,''),(727,31,21,'5',0,''),(729,31,22,'0',0,'gfdgdfg'),(731,31,23,'0',0,'fdgfdg'),(733,31,24,'0',0,'fgfgfgf'),(735,31,25,'0',0,'gfgf'),(737,31,26,'0',0,'gfgfgfgfg'),(739,31,27,'0',0,'fgfgfgfgfgf'),(741,33,1,'5',0,''),(743,33,2,'5',0,''),(745,33,3,'5',0,''),(747,33,4,'5',0,''),(749,33,5,'5',0,''),(751,33,6,'4',0,''),(753,33,7,'4',0,''),(755,33,8,'5',0,''),(757,33,9,'5',0,''),(759,33,10,'5',0,''),(761,33,11,'5',0,''),(763,33,12,'5',0,''),(765,33,13,'5',0,''),(767,33,14,'5',0,''),(769,33,15,'5',0,''),(771,33,16,'5',0,''),(773,33,17,'4',0,''),(775,33,18,'5',0,''),(777,33,19,'4',0,''),(779,33,20,'4',0,''),(781,33,21,'4',0,''),(783,33,22,'0',0,'vgvv'),(785,33,23,'0',0,'ygyg'),(787,33,24,'0',0,'gfdgfd'),(789,33,25,'0',0,'fdgfdg'),(791,33,26,'0',0,'fdgfdg'),(793,33,27,'0',0,'gfdgf'),(795,35,1,'5',0,''),(797,35,2,'5',0,''),(799,35,3,'5',0,''),(801,35,4,'0',0,''),(803,35,5,'5',0,''),(805,35,6,'5',0,''),(807,35,7,'0',0,''),(809,35,8,'5',0,''),(811,35,9,'5',0,''),(813,35,10,'0',0,''),(815,35,11,'5',0,''),(817,35,12,'5',0,''),(819,35,13,'5',0,''),(821,35,14,'5',0,''),(823,35,15,'5',0,''),(825,35,16,'5',0,''),(827,35,17,'5',0,''),(829,35,18,'5',0,''),(831,35,19,'5',0,''),(833,35,20,'5',0,''),(835,35,21,'5',0,''),(837,35,22,'0',0,'good'),(839,35,23,'0',0,' excellent'),(841,35,24,'0',0,'soso'),(843,35,25,'0',0,'good'),(845,35,26,'0',0,'good'),(847,35,27,'0',0,'good'),(849,37,1,'0',0,''),(851,37,2,'0',0,''),(853,37,3,'0',0,''),(855,37,4,'0',0,''),(857,37,5,'0',0,''),(859,37,6,'0',0,''),(861,37,7,'0',0,''),(863,37,8,'0',0,''),(865,37,9,'0',0,''),(867,37,10,'0',0,''),(869,37,11,'0',0,''),(871,37,12,'0',0,''),(873,37,13,'0',0,''),(875,37,14,'0',0,''),(877,37,15,'0',0,''),(879,37,16,'0',0,''),(881,37,17,'0',0,''),(883,37,18,'0',0,''),(885,37,19,'0',0,''),(887,37,20,'0',0,''),(889,37,21,'0',0,''),(891,37,22,'0',0,''),(893,37,23,'0',0,''),(895,37,24,'0',0,''),(897,37,25,'0',0,''),(899,37,26,'0',0,''),(901,37,27,'0',0,''),(903,39,1,'0',0,''),(905,39,2,'0',0,''),(907,39,3,'0',0,''),(909,39,4,'0',0,''),(911,39,5,'0',0,''),(913,39,6,'0',0,''),(915,39,7,'0',0,''),(917,39,8,'0',0,''),(919,39,9,'0',0,''),(921,39,10,'0',0,''),(923,39,11,'0',0,''),(925,39,12,'0',0,''),(927,39,13,'0',0,''),(929,39,14,'0',0,''),(931,39,15,'0',0,''),(933,39,16,'0',0,''),(935,39,17,'0',0,''),(937,39,18,'0',0,''),(939,39,19,'0',0,''),(941,39,20,'0',0,''),(943,39,21,'0',0,''),(945,39,22,'0',0,''),(947,39,23,'0',0,''),(949,39,24,'0',0,''),(951,39,25,'0',0,''),(953,39,26,'0',0,''),(955,39,27,'0',0,''),(957,41,1,'0',0,''),(959,41,2,'0',0,''),(961,41,3,'0',0,''),(963,41,4,'0',0,''),(965,41,5,'0',0,''),(967,41,6,'0',0,''),(969,41,7,'0',0,''),(971,41,8,'0',0,''),(973,41,9,'0',0,''),(975,41,10,'0',0,''),(977,41,11,'0',0,''),(979,41,12,'0',0,''),(981,41,13,'0',0,''),(983,41,14,'0',0,''),(985,41,15,'0',0,''),(987,41,16,'0',0,''),(989,41,17,'0',0,''),(991,41,18,'0',0,''),(993,41,19,'0',0,''),(995,41,20,'0',0,''),(997,41,21,'0',0,''),(999,41,22,'0',0,''),(1001,41,23,'0',0,''),(1003,41,24,'0',0,''),(1005,41,25,'0',0,''),(1007,41,26,'0',0,''),(1009,41,27,'0',0,''),(1011,43,1,'5',0,''),(1013,43,2,'5',0,''),(1015,43,3,'5',0,''),(1017,43,4,'5',0,''),(1019,43,5,'5',0,''),(1021,43,6,'5',0,''),(1023,43,7,'5',0,''),(1025,43,8,'5',0,''),(1027,43,9,'5',0,''),(1029,43,10,'5',0,''),(1031,43,11,'5',0,''),(1033,43,12,'5',0,''),(1035,43,13,'5',0,''),(1037,43,14,'5',0,''),(1039,43,15,'5',0,''),(1041,43,16,'5',0,''),(1043,43,17,'5',0,''),(1045,43,18,'5',0,''),(1047,43,19,'5',0,''),(1049,43,20,'5',0,''),(1051,43,21,'5',0,''),(1053,43,22,'0',0,'fgfdg'),(1055,43,23,'0',0,'fdgfgf'),(1057,43,24,'0',0,'gfgf'),(1059,43,25,'0',0,'fg'),(1061,43,26,'0',0,'fgfg'),(1063,43,27,'0',0,'gfgfg'),(1065,45,1,'0',0,''),(1067,45,2,'0',0,''),(1069,45,3,'0',0,''),(1071,45,4,'0',0,''),(1073,45,5,'0',0,''),(1075,45,6,'0',0,''),(1077,45,7,'0',0,''),(1079,45,8,'0',0,''),(1081,45,9,'0',0,''),(1083,45,10,'0',0,''),(1085,45,11,'0',0,''),(1087,45,12,'0',0,''),(1089,45,13,'0',0,''),(1091,45,14,'0',0,''),(1093,45,15,'0',0,''),(1095,45,16,'0',0,''),(1097,45,17,'0',0,''),(1099,45,18,'0',0,''),(1101,45,19,'0',0,''),(1103,45,20,'0',0,''),(1105,45,21,'0',0,''),(1107,45,22,'0',0,'0'),(1109,45,23,'0',0,'0'),(1111,45,24,'0',0,'0'),(1113,45,25,'0',0,'0'),(1115,45,26,'0',0,'0'),(1117,45,27,'0',0,'0'),(1119,47,1,'0',0,''),(1121,47,2,'0',0,''),(1123,47,3,'0',0,''),(1125,47,4,'0',0,''),(1127,47,5,'0',0,''),(1129,47,6,'0',0,''),(1131,47,7,'0',0,''),(1133,47,8,'0',0,''),(1135,47,9,'0',0,''),(1137,47,10,'0',0,''),(1139,47,11,'0',0,''),(1141,47,12,'0',0,''),(1143,47,13,'0',0,''),(1145,47,14,'0',0,''),(1147,47,15,'0',0,''),(1149,47,16,'0',0,''),(1151,47,17,'0',0,''),(1153,47,18,'0',0,''),(1155,47,19,'0',0,''),(1157,47,20,'0',0,''),(1159,47,21,'0',0,''),(1161,47,22,'0',0,'0'),(1163,47,23,'0',0,'0'),(1165,47,24,'0',0,'0'),(1167,47,25,'0',0,'0'),(1169,47,26,'0',0,'0'),(1171,47,27,'0',0,'0');
/*!40000 ALTER TABLE `crc_feedback_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crc_feedback_questions`
--

DROP TABLE IF EXISTS `crc_feedback_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crc_feedback_questions` (
  `feedback_questions_id` int(11) NOT NULL AUTO_INCREMENT,
  `feedback_questions_question` text NOT NULL,
  `feedback_questions_active` tinyint(1) NOT NULL DEFAULT '0',
  `feedback_questions_type` varchar(100) NOT NULL DEFAULT 'COMMENT',
  `feedback_questions_category` varchar(100) NOT NULL DEFAULT 'COMMENTS',
  `feedback_questions_sequence` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`feedback_questions_id`),
  KEY `SEQUENCE` (`feedback_questions_sequence`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crc_feedback_questions`
--

LOCK TABLES `crc_feedback_questions` WRITE;
/*!40000 ALTER TABLE `crc_feedback_questions` DISABLE KEYS */;
INSERT INTO `crc_feedback_questions` VALUES (1,'Course content was good.',0,'OPTION','GENERAL',1),(2,'The sequence in which topics were covered was helpful to grasp the course contents.',0,'OPTION','GENERAL',2),(3,'Assignment helped better understand the course.',0,'OPTION','GENERAL',3),(4,'Interesting reference material was suggested.',0,'OPTION','GENERAL',4),(5,'Exams truly reflected the grasp of course material.',0,'OPTION','GENERAL',5),(6,'Course objectives were fulfilled.',0,'OPTION','GENERAL',6),(7,'Fundamental principles were well emphasized.',0,'OPTION','GENERAL',7),(8,'Board work and/or visual aids were of good quality.',0,'OPTION','GENERAL',8),(9,'The presentations of lecture material were well organized.',0,'OPTION','OBJECTIVE',9),(10,'Pace of instruction was comfortable.',0,'OPTION','OBJECTIVE',10),(11,'Questions were encouraged during the class.',0,'OPTION','OBJECTIVE',11),(12,'The course content was well covered.',0,'OPTION','OBJECTIVE',12),(13,'Application/practical aspects were emphasized.',0,'OPTION','OBJECTIVE',13),(14,'Motivation for the course was well emphasized.',0,'OPTION','OBJECTIVE',14),(15,'Overall instruction was effective.',0,'OPTION','PRESENTATION',15),(16,'Questions were encouraged during the tutorial.',0,'OPTION','PRESENTATION',16),(17,'Doubts were clarified effectively.',0,'OPTION','PRESENTATION',17),(18,'The number of tutorials was sufficient.',0,'OPTION','PRESENTATION',18),(19,'Overall the tutorials were effective.',0,'OPTION','PRESENTATION',19),(20,'Laboratory reports were corrected regularly.',0,'OPTION','PRESENTATION',20),(21,'Difficulties pointed out to the instructor were satisfactorily addressed.',0,'OPTION','PRESENTATION',21),(22,'What did you like about this course?',0,'COMMENT','COMMENTS',22),(23,'What did you dislike about this course?',0,'COMMENT','COMMENTS',23),(24,'Can you suggest anything that the instructor could do to enrich your learning experience?',0,'COMMENT','COMMENTS',24),(25,'What methods would you advise a friend to adopt to maximize his/her benefit from this course? ',0,'COMMENT','COMMENTS',25),(26,'Indicate in what manner your interest in the subject increased as a result of this course?',0,'COMMENT','COMMENTS',26),(27,'Other comments?',0,'COMMENT','COMMENTS',27);
/*!40000 ALTER TABLE `crc_feedback_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crc_profiles`
--

DROP TABLE IF EXISTS `crc_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crc_profiles` (
  `profile_id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_uid` varchar(100) NOT NULL DEFAULT '',
  `profile_pwd` varchar(40) NOT NULL DEFAULT '',
  `profile_firstname` varchar(100) NOT NULL DEFAULT '',
  `profile_lastname` varchar(100) NOT NULL DEFAULT '',
  `profile_email` varchar(100) NOT NULL DEFAULT '',
  `profile_dob` date NOT NULL DEFAULT '2010-01-01',
  `profile_gender` varchar(6) NOT NULL DEFAULT 'M',
  `profile_employed` tinyint(1) DEFAULT '0',
  `profile_employed_title` varchar(100) DEFAULT '',
  `profile_employed_company` varchar(100) DEFAULT '',
  `profile_address_one` varchar(100) DEFAULT '',
  `profile_address_two` varchar(100) DEFAULT '',
  `profile_city` varchar(100) DEFAULT '',
  `profile_province_state` varchar(100) DEFAULT '',
  `profile_postal_code` varchar(100) DEFAULT '',
  `profile_country` varchar(100) DEFAULT '',
  `profile_phone_land` varchar(14) DEFAULT '00400000000000',
  `profile_phone_cell` varchar(14) DEFAULT '00400000000000',
  `profile_phone_fax` varchar(14) DEFAULT '00400000000000',
  `profile_role_id` int(11) NOT NULL DEFAULT '0',
  `profile_active` tinyint(1) NOT NULL DEFAULT '0',
  `profile_rdn` varchar(100) DEFAULT 'ou=don mills,ou=toronto,ou=ontario,ou=canada,o=crc world',
  `profile_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`profile_id`,`profile_uid`,`profile_email`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crc_profiles`
--

LOCK TABLES `crc_profiles` WRITE;
/*!40000 ALTER TABLE `crc_profiles` DISABLE KEYS */;
INSERT INTO `crc_profiles` VALUES (1,'admin','d033e22ae348aeb5660fc2140aec35850c4da997','Firstname','Lastname','admin@domain.com','1977-11-19','M',0,'','','Campulung','','Campulung','AG','115100','Romania','00400000000000','00400000000000','00400000000000',1,0,'ou=don mills,ou=toronto,ou=ontario,ou=canada,o=crc world','2011-08-29 06:46:03'),(25,'bsr','40bd001563085fc35165329ea1ff5c5ecbdbbeef','Bharat','Singh','bsr@iitmandi.ac.in','0000-00-00','M',0,'','','IIT Mandi','','Mandi','ON','175001','India','00190523719','00400000000000','00400000000000',2,0,'ou=don mills,ou=toronto,ou=ontario,ou=canada,o=crc world','2011-08-29 06:53:42'),(27,'gagan','40bd001563085fc35165329ea1ff5c5ecbdbbeef','Gagan','Grag','gagan@iitmandi.ac.in','0000-00-00','M',0,'','','IIT Mandi','','Mandi','ON','175001','India','00400000000000','00400000000000','00400000000000',2,0,'ou=don mills,ou=toronto,ou=ontario,ou=canada,o=crc world','2011-08-29 06:54:45'),(29,'b11135','40bd001563085fc35165329ea1ff5c5ecbdbbeef','Kirti','Thakur','kirti@iitmandi.ac.in','0000-00-00','M',0,'','','IIT Mandi','','Mandi','ON','175001','India','00400000000000','00400000000000','00400000000000',3,0,'ou=don mills,ou=toronto,ou=ontario,ou=canada,o=crc world','2011-08-29 10:51:46'),(31,'b11136','40bd001563085fc35165329ea1ff5c5ecbdbbeef','Deshraj','Thakur','deshraj@iitmandi.ac.in','0000-00-00','M',0,'','','IIT Mandi','','Mandi','ON','175001','India','00400000000000','00400000000000','00400000000000',3,0,'ou=don mills,ou=toronto,ou=ontario,ou=canada,o=crc world','2011-08-29 10:32:06'),(33,'b11137','40bd001563085fc35165329ea1ff5c5ecbdbbeef','Lalit','Sharma','b11137@iitmandi.ac.in','0000-00-00','M',0,'','','#24','','Mandi','ON','175001','India','00400000000000','00400000000000','00400000000000',3,0,'ou=don mills,ou=toronto,ou=ontario,ou=canada,o=crc world','2011-09-12 09:12:36'),(35,'b11138','40bd001563085fc35165329ea1ff5c5ecbdbbeef','Ishita','Sharma','b11138@students.iitmandi.ac.in','0000-00-00','M',0,'','','#397','','Mandi','ON','175001','India','00400000000000','00400000000000','00400000000000',3,0,'ou=don mills,ou=toronto,ou=ontario,ou=canada,o=crc world','2011-09-12 09:13:31'),(37,'b11139','40bd001563085fc35165329ea1ff5c5ecbdbbeef','Deshu','Thakur','b11138@students.iitmandi.ac.in','0000-00-00','M',0,'','','@3232','','Mandi','ON','175001','India','00400000000000','00400000000000','00400000000000',3,0,'ou=don mills,ou=toronto,ou=ontario,ou=canada,o=crc world','2011-09-12 09:13:15'),(39,'b11140','40bd001563085fc35165329ea1ff5c5ecbdbbeef','Ankita','Thakur','amit.ask.sharma6@gmail.com','1990-11-12','M',0,'','','#029','','Mandi','ON','175001','India','00400000000000','00400000000000','00400000000000',3,0,'ou=don mills,ou=toronto,ou=ontario,ou=canada,o=crc world','2011-09-12 08:57:30'),(41,'b11141','40bd001563085fc35165329ea1ff5c5ecbdbbeef','Anurag','Sharma','suhailpcm@gmail.com','1990-11-12','M',0,'','','4354','','Mandi','ON','175001','Hp','00400000000000','00400000000000','00400000000000',3,0,'ou=don mills,ou=toronto,ou=ontario,ou=canada,o=crc world','2011-09-14 04:29:17'),(43,'kirtithakur2012','40bd001563085fc35165329ea1ff5c5ecbdbbeef','1111','11111','kirtithakur2012@gmail.com','2011-11-11','M',0,'','','#1313','','Mandi','ON','175001','India','00400000000000','00400000000000','00400000000000',3,0,'ou=don mills,ou=toronto,ou=ontario,ou=canada,o=crc world','2011-09-15 06:26:13');
/*!40000 ALTER TABLE `crc_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crc_roles`
--

DROP TABLE IF EXISTS `crc_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crc_roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) NOT NULL DEFAULT '',
  `role_desc` varchar(255) NOT NULL DEFAULT '',
  `role_active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`role_id`,`role_name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crc_roles`
--

LOCK TABLES `crc_roles` WRITE;
/*!40000 ALTER TABLE `crc_roles` DISABLE KEYS */;
INSERT INTO `crc_roles` VALUES (1,'Administrator','CRC Administrator role',1),(2,'Teacher','CRC Teacher role',1),(3,'Student','CRC Student role',1);
/*!40000 ALTER TABLE `crc_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crc_rooms`
--

DROP TABLE IF EXISTS `crc_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crc_rooms` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_name` varchar(100) NOT NULL DEFAULT '',
  `room_desc` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`room_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crc_rooms`
--

LOCK TABLES `crc_rooms` WRITE;
/*!40000 ALTER TABLE `crc_rooms` DISABLE KEYS */;
INSERT INTO `crc_rooms` VALUES (3,'208','N/A');
/*!40000 ALTER TABLE `crc_rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crc_schedule`
--

DROP TABLE IF EXISTS `crc_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crc_schedule` (
  `schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `schedule_course_id` int(11) NOT NULL DEFAULT '0',
  `schedule_start_date` date NOT NULL DEFAULT '2010-01-01',
  `schedule_end_date` date NOT NULL DEFAULT '2010-01-01',
  `schedule_day_time` varchar(30) NOT NULL DEFAULT 'M,W [8:00PM - 10:00PM]',
  `schedule_status` varchar(100) NOT NULL DEFAULT 'Tentative',
  `schedule_room_id` int(11) NOT NULL DEFAULT '2',
  `schedule_active` tinyint(1) NOT NULL DEFAULT '0',
  `schedule_venue_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`schedule_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crc_schedule`
--

LOCK TABLES `crc_schedule` WRITE;
/*!40000 ALTER TABLE `crc_schedule` DISABLE KEYS */;
INSERT INTO `crc_schedule` VALUES (15,13,'2011-07-01','2011-09-01','11:AM-12:PM','In Progress',3,0,1),(17,15,'2011-07-01','2011-09-01','11:AM-12:PM','In Progress',3,0,1);
/*!40000 ALTER TABLE `crc_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crc_sessions`
--

DROP TABLE IF EXISTS `crc_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crc_sessions` (
  `session_oid` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) NOT NULL DEFAULT '',
  `session_uid` varchar(15) NOT NULL DEFAULT '',
  `session_pwd` varchar(15) NOT NULL DEFAULT '',
  `session_dn` varchar(255) NOT NULL DEFAULT '',
  `session_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`session_oid`)
) ENGINE=MyISAM AUTO_INCREMENT=960 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crc_sessions`
--

LOCK TABLES `crc_sessions` WRITE;
/*!40000 ALTER TABLE `crc_sessions` DISABLE KEYS */;
INSERT INTO `crc_sessions` VALUES (461,'t546bthsba291c2aobq3m3lsb6','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 06:49:14'),(463,'t546bthsba291c2aobq3m3lsb6','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 06:49:14'),(465,'t546bthsba291c2aobq3m3lsb6','bsr','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 06:53:46'),(467,'t546bthsba291c2aobq3m3lsb6','bsr','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 06:53:46'),(469,'t546bthsba291c2aobq3m3lsb6','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 06:54:48'),(471,'t546bthsba291c2aobq3m3lsb6','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 06:54:48'),(473,'t546bthsba291c2aobq3m3lsb6','b11135','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 06:55:50'),(475,'t546bthsba291c2aobq3m3lsb6','b11135','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 06:55:50'),(477,'t546bthsba291c2aobq3m3lsb6','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 06:56:01'),(479,'t546bthsba291c2aobq3m3lsb6','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 06:56:01'),(481,'t546bthsba291c2aobq3m3lsb6','bsr','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 07:01:10'),(483,'t546bthsba291c2aobq3m3lsb6','bsr','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 07:01:10'),(485,'t546bthsba291c2aobq3m3lsb6','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 07:01:32'),(487,'t546bthsba291c2aobq3m3lsb6','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 07:01:32'),(489,'t546bthsba291c2aobq3m3lsb6','kirti','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 07:02:01'),(491,'t546bthsba291c2aobq3m3lsb6','kirti','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 07:02:06'),(493,'t546bthsba291c2aobq3m3lsb6','kirti','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 07:02:25'),(495,'t546bthsba291c2aobq3m3lsb6','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 07:02:43'),(497,'t546bthsba291c2aobq3m3lsb6','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 07:02:43'),(499,'t546bthsba291c2aobq3m3lsb6','b11135','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 07:03:15'),(501,'t546bthsba291c2aobq3m3lsb6','b11135','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 07:03:15'),(503,'t546bthsba291c2aobq3m3lsb6','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 07:04:28'),(505,'t546bthsba291c2aobq3m3lsb6','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 07:04:28'),(507,'t546bthsba291c2aobq3m3lsb6','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 07:05:02'),(509,'t546bthsba291c2aobq3m3lsb6','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 07:05:02'),(511,'t546bthsba291c2aobq3m3lsb6','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 07:05:48'),(513,'t546bthsba291c2aobq3m3lsb6','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 07:05:48'),(515,'t546bthsba291c2aobq3m3lsb6','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 07:10:37'),(517,'t546bthsba291c2aobq3m3lsb6','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 07:10:37'),(519,'40fq50lua31aa11hjh9iuvme66','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 10:19:03'),(521,'40fq50lua31aa11hjh9iuvme66','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 10:19:03'),(523,'40fq50lua31aa11hjh9iuvme66','bsr','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 10:30:11'),(525,'40fq50lua31aa11hjh9iuvme66','bsr','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 10:30:11'),(527,'40fq50lua31aa11hjh9iuvme66','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 10:30:23'),(529,'40fq50lua31aa11hjh9iuvme66','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 10:30:23'),(531,'40fq50lua31aa11hjh9iuvme66','b11136','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 10:32:12'),(533,'40fq50lua31aa11hjh9iuvme66','b11136','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 10:32:12'),(535,'40fq50lua31aa11hjh9iuvme66','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 10:33:58'),(537,'40fq50lua31aa11hjh9iuvme66','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 10:33:58'),(539,'40fq50lua31aa11hjh9iuvme66','b11136','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 10:34:22'),(541,'40fq50lua31aa11hjh9iuvme66','b11136','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 10:34:22'),(543,'40fq50lua31aa11hjh9iuvme66','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 10:35:01'),(545,'40fq50lua31aa11hjh9iuvme66','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 10:35:01'),(547,'40fq50lua31aa11hjh9iuvme66','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 10:36:18'),(549,'40fq50lua31aa11hjh9iuvme66','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 10:36:18'),(551,'u7g91q1b8sdrdsa4qedt5d4q42','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 10:43:30'),(553,'u7g91q1b8sdrdsa4qedt5d4q42','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 10:43:30'),(555,'u7g91q1b8sdrdsa4qedt5d4q42','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 10:44:33'),(557,'u7g91q1b8sdrdsa4qedt5d4q42','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 10:44:33'),(559,'6k529fnjbgtghrmavsq280r272','bsr','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 10:46:21'),(561,'6k529fnjbgtghrmavsq280r272','bsr','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 10:46:21'),(563,'6k529fnjbgtghrmavsq280r272','b11135','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 10:46:40'),(565,'6k529fnjbgtghrmavsq280r272','b11135','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 10:46:40'),(567,'6k529fnjbgtghrmavsq280r272','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 10:48:39'),(569,'6k529fnjbgtghrmavsq280r272','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 10:48:39'),(571,'6k529fnjbgtghrmavsq280r272','bsr','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 10:49:11'),(573,'6k529fnjbgtghrmavsq280r272','bsr','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 10:49:11'),(575,'6k529fnjbgtghrmavsq280r272','b11136','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 10:49:28'),(577,'6k529fnjbgtghrmavsq280r272','b11136','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 10:49:28'),(579,'6k529fnjbgtghrmavsq280r272','bsr','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 10:49:45'),(581,'6k529fnjbgtghrmavsq280r272','bsr','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 10:49:45'),(583,'6k529fnjbgtghrmavsq280r272','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 10:49:59'),(585,'6k529fnjbgtghrmavsq280r272','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 10:49:59'),(587,'6k529fnjbgtghrmavsq280r272','bsr','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 10:50:38'),(589,'6k529fnjbgtghrmavsq280r272','bsr','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 10:50:38'),(591,'6k529fnjbgtghrmavsq280r272','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 10:51:07'),(593,'6k529fnjbgtghrmavsq280r272','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 10:51:07'),(595,'6k529fnjbgtghrmavsq280r272','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 10:52:23'),(597,'6k529fnjbgtghrmavsq280r272','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 10:52:23'),(599,'6k529fnjbgtghrmavsq280r272','bsr','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 10:53:33'),(601,'6k529fnjbgtghrmavsq280r272','bsr','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 10:53:33'),(603,'6k529fnjbgtghrmavsq280r272','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 10:55:34'),(605,'6k529fnjbgtghrmavsq280r272','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 10:55:34'),(607,'6k529fnjbgtghrmavsq280r272','bsr','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 10:56:12'),(609,'6k529fnjbgtghrmavsq280r272','bsr','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 10:56:12'),(611,'6k529fnjbgtghrmavsq280r272','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 11:05:44'),(613,'6k529fnjbgtghrmavsq280r272','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-29 11:05:44'),(615,'30ajsodbsph8pv2p5k952i3nn3','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-30 03:58:23'),(617,'30ajsodbsph8pv2p5k952i3nn3','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-30 03:58:23'),(619,'30ajsodbsph8pv2p5k952i3nn3','bsr','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-30 03:58:55'),(621,'30ajsodbsph8pv2p5k952i3nn3','bsr','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-30 03:58:55'),(623,'30ajsodbsph8pv2p5k952i3nn3','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-30 03:59:47'),(625,'30ajsodbsph8pv2p5k952i3nn3','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-30 03:59:47'),(627,'30ajsodbsph8pv2p5k952i3nn3','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-30 04:00:11'),(629,'30ajsodbsph8pv2p5k952i3nn3','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-08-30 04:00:11'),(631,'ofvf4en7kte778s1ldalanj3j6','bsr','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-05 08:53:27'),(633,'ofvf4en7kte778s1ldalanj3j6','bsr','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-05 08:53:27'),(635,'ofvf4en7kte778s1ldalanj3j6','bsr','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-05 08:53:31'),(637,'ofvf4en7kte778s1ldalanj3j6','bsr','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-05 08:53:31'),(639,'ofvf4en7kte778s1ldalanj3j6','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-05 08:54:53'),(641,'ofvf4en7kte778s1ldalanj3j6','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-05 08:54:53'),(643,'ofvf4en7kte778s1ldalanj3j6','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-05 08:54:55'),(645,'ofvf4en7kte778s1ldalanj3j6','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-05 08:54:55'),(647,'ofvf4en7kte778s1ldalanj3j6','kirti','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-05 08:56:31'),(649,'ofvf4en7kte778s1ldalanj3j6','kirti','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-05 08:56:33'),(651,'ofvf4en7kte778s1ldalanj3j6','bsr','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-05 08:56:54'),(653,'ofvf4en7kte778s1ldalanj3j6','bsr','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-05 08:56:54'),(655,'8fn2igj6hapjs1ifsgjnj5il55','b11135','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-05 09:01:36'),(657,'8fn2igj6hapjs1ifsgjnj5il55','b11135','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-05 09:01:36'),(659,'8fn2igj6hapjs1ifsgjnj5il55','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-05 09:02:57'),(661,'8fn2igj6hapjs1ifsgjnj5il55','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-05 09:02:57'),(663,'8fn2igj6hapjs1ifsgjnj5il55','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-05 09:03:19'),(665,'8fn2igj6hapjs1ifsgjnj5il55','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-05 09:03:19'),(667,'ofvf4en7kte778s1ldalanj3j6','b11135','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-05 09:05:11'),(669,'ofvf4en7kte778s1ldalanj3j6','b11135','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-05 09:05:11'),(671,'ofvf4en7kte778s1ldalanj3j6','b11135','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-05 09:05:13'),(673,'ofvf4en7kte778s1ldalanj3j6','b11135','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-05 09:05:13'),(675,'ofvf4en7kte778s1ldalanj3j6','bsr','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-05 09:14:52'),(677,'ofvf4en7kte778s1ldalanj3j6','bsr','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-05 09:14:52'),(679,'ofvf4en7kte778s1ldalanj3j6','bsr','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-05 09:14:52'),(681,'ofvf4en7kte778s1ldalanj3j6','bsr','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-05 09:14:52'),(683,'ofvf4en7kte778s1ldalanj3j6','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-05 09:24:01'),(685,'ofvf4en7kte778s1ldalanj3j6','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-05 09:24:01'),(687,'ofvf4en7kte778s1ldalanj3j6','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-05 09:24:03'),(689,'ofvf4en7kte778s1ldalanj3j6','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-05 09:24:03'),(691,'h60feqemkqvimaq9cg9s6ttnr4','b11135','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-05 10:20:50'),(693,'h60feqemkqvimaq9cg9s6ttnr4','b11135','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-05 10:20:50'),(695,'h60feqemkqvimaq9cg9s6ttnr4','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-05 10:24:11'),(697,'h60feqemkqvimaq9cg9s6ttnr4','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-05 10:24:11'),(699,'h60feqemkqvimaq9cg9s6ttnr4','b11135','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-05 10:24:25'),(701,'h60feqemkqvimaq9cg9s6ttnr4','b11135','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-05 10:24:25'),(703,'h60feqemkqvimaq9cg9s6ttnr4','b11137','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-05 10:26:38'),(705,'h60feqemkqvimaq9cg9s6ttnr4','b11137','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-05 10:26:38'),(707,'b6t3l4ph991qitceq1bohvtn65','b11135','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-06 11:12:57'),(709,'b6t3l4ph991qitceq1bohvtn65','b11135','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-06 11:12:57'),(711,'b6t3l4ph991qitceq1bohvtn65','b11137','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-06 11:13:16'),(713,'b6t3l4ph991qitceq1bohvtn65','b11137','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-06 11:13:16'),(715,'f6m5mhrrohssl9o4qar7ck0tf5','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-07 07:10:22'),(717,'f6m5mhrrohssl9o4qar7ck0tf5','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-07 07:10:22'),(719,'f6m5mhrrohssl9o4qar7ck0tf5','b11136','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-07 07:10:48'),(721,'f6m5mhrrohssl9o4qar7ck0tf5','b11136','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-07 07:10:48'),(723,'1tjn89gsdmaffarcvvl8snlc15','admin','admin]','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-07 08:38:18'),(725,'1tjn89gsdmaffarcvvl8snlc15','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-07 08:38:22'),(727,'1tjn89gsdmaffarcvvl8snlc15','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-07 08:38:22'),(729,'1tjn89gsdmaffarcvvl8snlc15','b11136','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-07 08:38:59'),(731,'1tjn89gsdmaffarcvvl8snlc15','b11136','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-07 08:38:59'),(733,'1tjn89gsdmaffarcvvl8snlc15','b11136','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-07 09:10:52'),(735,'1tjn89gsdmaffarcvvl8snlc15','b11136','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-07 09:10:52'),(737,'1tjn89gsdmaffarcvvl8snlc15','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-07 10:08:25'),(739,'1tjn89gsdmaffarcvvl8snlc15','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-07 10:08:25'),(741,'1tjn89gsdmaffarcvvl8snlc15','b11138','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-07 10:10:12'),(743,'1tjn89gsdmaffarcvvl8snlc15','b11138','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-07 10:10:12'),(745,'1tjn89gsdmaffarcvvl8snlc15','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-07 10:17:52'),(747,'1tjn89gsdmaffarcvvl8snlc15','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-07 10:17:52'),(749,'1tjn89gsdmaffarcvvl8snlc15','b11138','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-07 10:19:10'),(751,'1tjn89gsdmaffarcvvl8snlc15','b11138','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-07 10:19:10'),(753,'07dvuott2a8hkfqsvt2sq3ikj3','b11137','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-09 08:43:38'),(755,'07dvuott2a8hkfqsvt2sq3ikj3','b11137','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-09 08:43:38'),(757,'nm15qakn7dqg6q6fm5rpbdjcn5','b11137','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-09 10:36:32'),(759,'nm15qakn7dqg6q6fm5rpbdjcn5','b11137','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-09 10:36:32'),(761,'2mir9l1nhttke1dnqdf44h07t7','b11137','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-10 03:55:44'),(763,'2mir9l1nhttke1dnqdf44h07t7','b11137','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-10 03:55:44'),(765,'2mir9l1nhttke1dnqdf44h07t7','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-10 04:06:35'),(767,'2mir9l1nhttke1dnqdf44h07t7','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-10 04:06:35'),(769,'2mir9l1nhttke1dnqdf44h07t7','b11137','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-10 04:07:07'),(771,'2mir9l1nhttke1dnqdf44h07t7','b11137','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-10 04:07:07'),(773,'2mir9l1nhttke1dnqdf44h07t7','bsr','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-10 04:07:43'),(775,'2mir9l1nhttke1dnqdf44h07t7','bsr','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-10 04:07:43'),(777,'2mir9l1nhttke1dnqdf44h07t7','b11137','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-10 04:21:35'),(779,'2mir9l1nhttke1dnqdf44h07t7','b11137','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-10 04:21:35'),(781,'2mir9l1nhttke1dnqdf44h07t7','bsr','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-10 04:22:07'),(783,'2mir9l1nhttke1dnqdf44h07t7','bsr','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-10 04:22:07'),(785,'3vhcif4aqg4pvdei612obud6a0','b11137','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-12 04:16:10'),(787,'3vhcif4aqg4pvdei612obud6a0','b11137','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-12 04:16:10'),(789,'3vhcif4aqg4pvdei612obud6a0','b11139','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-12 04:18:21'),(791,'3vhcif4aqg4pvdei612obud6a0','b11139','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-12 04:18:21'),(793,'2l44gqtdr32blf5rt1dfip9eh1','b11139','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-12 08:04:43'),(795,'2l44gqtdr32blf5rt1dfip9eh1','b11139','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-12 08:04:43'),(797,'2l44gqtdr32blf5rt1dfip9eh1','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-12 08:07:36'),(799,'2l44gqtdr32blf5rt1dfip9eh1','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-12 08:07:36'),(801,'2l44gqtdr32blf5rt1dfip9eh1','b11139','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-12 08:32:15'),(803,'2l44gqtdr32blf5rt1dfip9eh1','b11139','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-12 08:32:15'),(805,'2l44gqtdr32blf5rt1dfip9eh1','b11138','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-12 08:33:46'),(807,'2l44gqtdr32blf5rt1dfip9eh1','b11138','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-12 08:33:46'),(809,'2l44gqtdr32blf5rt1dfip9eh1','b11139','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-12 08:35:11'),(811,'2l44gqtdr32blf5rt1dfip9eh1','b11139','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-12 08:35:11'),(813,'2l44gqtdr32blf5rt1dfip9eh1','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-12 08:46:25'),(815,'2l44gqtdr32blf5rt1dfip9eh1','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-12 08:46:25'),(817,'2l44gqtdr32blf5rt1dfip9eh1','bsr','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-12 08:46:58'),(819,'2l44gqtdr32blf5rt1dfip9eh1','bsr','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-12 08:46:58'),(821,'2l44gqtdr32blf5rt1dfip9eh1','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-12 08:47:24'),(823,'2l44gqtdr32blf5rt1dfip9eh1','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-12 08:47:24'),(825,'2l44gqtdr32blf5rt1dfip9eh1','b11140','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-12 08:57:34'),(827,'2l44gqtdr32blf5rt1dfip9eh1','b11140','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-12 08:57:34'),(829,'2l44gqtdr32blf5rt1dfip9eh1','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-12 08:58:37'),(831,'2l44gqtdr32blf5rt1dfip9eh1','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-12 08:58:37'),(833,'2l44gqtdr32blf5rt1dfip9eh1','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-12 09:11:34'),(835,'2l44gqtdr32blf5rt1dfip9eh1','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-12 09:11:34'),(837,'2l44gqtdr32blf5rt1dfip9eh1','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-12 09:15:13'),(839,'2l44gqtdr32blf5rt1dfip9eh1','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-12 09:15:13'),(841,'h5p6t6tcataqckcba0mnicsqc5','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-12 12:10:40'),(843,'h5p6t6tcataqckcba0mnicsqc5','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-12 12:10:40'),(845,'h5p6t6tcataqckcba0mnicsqc5','b11139','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-12 12:11:18'),(847,'h5p6t6tcataqckcba0mnicsqc5','b11139','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-12 12:11:18'),(849,'h5p6t6tcataqckcba0mnicsqc5','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-12 12:11:37'),(851,'h5p6t6tcataqckcba0mnicsqc5','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-12 12:11:37'),(853,'n86s4tp54l530nsqrb2r866ie7','b10038','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-14 03:58:21'),(855,'n86s4tp54l530nsqrb2r866ie7','b11138','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-14 03:58:30'),(857,'n86s4tp54l530nsqrb2r866ie7','b11138','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-14 03:58:30'),(859,'n86s4tp54l530nsqrb2r866ie7','bsr','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-14 03:58:49'),(861,'n86s4tp54l530nsqrb2r866ie7','bsr','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-14 03:58:49'),(863,'n86s4tp54l530nsqrb2r866ie7','b11138','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-14 04:19:25'),(865,'n86s4tp54l530nsqrb2r866ie7','b11138','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-14 04:19:25'),(867,'n86s4tp54l530nsqrb2r866ie7','b11140','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-14 04:25:20'),(869,'n86s4tp54l530nsqrb2r866ie7','b11140','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-14 04:25:20'),(871,'n86s4tp54l530nsqrb2r866ie7','bsr','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-14 04:25:36'),(873,'n86s4tp54l530nsqrb2r866ie7','bsr','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-14 04:25:36'),(875,'n86s4tp54l530nsqrb2r866ie7','b11140','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-14 04:26:18'),(877,'n86s4tp54l530nsqrb2r866ie7','b11140','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-14 04:26:18'),(879,'n86s4tp54l530nsqrb2r866ie7','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-14 04:26:35'),(881,'n86s4tp54l530nsqrb2r866ie7','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-14 04:26:35'),(883,'n86s4tp54l530nsqrb2r866ie7','b11141','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-14 04:29:20'),(885,'n86s4tp54l530nsqrb2r866ie7','b11141','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-14 04:29:20'),(887,'8kqrjvnbudkd0p9mqjt0truf33','b11140','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-14 05:00:00'),(889,'8kqrjvnbudkd0p9mqjt0truf33','b11140','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-14 05:00:00'),(891,'8kqrjvnbudkd0p9mqjt0truf33','b11140','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-14 05:00:29'),(893,'8kqrjvnbudkd0p9mqjt0truf33','b11140','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-14 05:00:29'),(895,'8kqrjvnbudkd0p9mqjt0truf33','b11140','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-14 05:02:58'),(897,'8kqrjvnbudkd0p9mqjt0truf33','b11140','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-14 05:02:58'),(899,'8kqrjvnbudkd0p9mqjt0truf33','b11141','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-14 05:05:09'),(901,'8kqrjvnbudkd0p9mqjt0truf33','b11141','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-14 05:05:09'),(903,'9a5u6r7j56u46618ucdkedb7e4','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-15 05:02:47'),(905,'9a5u6r7j56u46618ucdkedb7e4','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-15 05:02:47'),(907,'9a5u6r7j56u46618ucdkedb7e4','b11140','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-15 05:03:12'),(909,'9a5u6r7j56u46618ucdkedb7e4','b11140','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-15 05:03:12'),(911,'9a5u6r7j56u46618ucdkedb7e4','b11141','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-15 05:03:23'),(913,'9a5u6r7j56u46618ucdkedb7e4','b11141','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-15 05:03:23'),(915,'9a5u6r7j56u46618ucdkedb7e4','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-15 05:31:02'),(917,'9a5u6r7j56u46618ucdkedb7e4','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-15 05:31:02'),(919,'9a5u6r7j56u46618ucdkedb7e4','b11141','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-15 05:44:35'),(921,'9a5u6r7j56u46618ucdkedb7e4','b11141','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-15 05:44:35'),(923,'9a5u6r7j56u46618ucdkedb7e4','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-15 05:56:51'),(925,'9a5u6r7j56u46618ucdkedb7e4','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-15 05:56:51'),(927,'9a5u6r7j56u46618ucdkedb7e4','b11141','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-15 06:25:09'),(929,'9a5u6r7j56u46618ucdkedb7e4','b11141','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-15 06:25:09'),(931,'9a5u6r7j56u46618ucdkedb7e4','kirtithakur2012','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-15 06:26:16'),(933,'9a5u6r7j56u46618ucdkedb7e4','kirtithakur2012','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-15 06:26:16'),(935,'20r9r7u68jn9je032hrdofosj0','b11141','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-16 05:48:51'),(937,'20r9r7u68jn9je032hrdofosj0','b11141','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-16 05:48:51'),(939,'20r9r7u68jn9je032hrdofosj0','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-16 05:49:08'),(941,'20r9r7u68jn9je032hrdofosj0','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-16 05:49:08'),(943,'20r9r7u68jn9je032hrdofosj0','kirtithakur2012','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-16 05:50:06'),(945,'20r9r7u68jn9je032hrdofosj0','kirtithakur2012','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-16 05:50:06'),(947,'l342nqqha6elgiolc81ur3as02','kirtithakur2012','1234','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-16 08:22:39'),(949,'l342nqqha6elgiolc81ur3as02','kirtithakur2012','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-16 08:22:52'),(951,'l342nqqha6elgiolc81ur3as02','kirtithakur2012','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-16 08:22:52'),(953,'l342nqqha6elgiolc81ur3as02','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-16 08:23:10'),(955,'l342nqqha6elgiolc81ur3as02','gagan','123','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-16 08:23:10'),(957,'4k9983hldgd9v3rqcav0o13od3','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-16 12:32:27'),(959,'4k9983hldgd9v3rqcav0o13od3','admin','admin','ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World','2011-09-16 12:32:27');
/*!40000 ALTER TABLE `crc_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crc_states`
--

DROP TABLE IF EXISTS `crc_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crc_states` (
  `state_id` int(11) NOT NULL AUTO_INCREMENT,
  `state_name` varchar(50) NOT NULL DEFAULT '',
  `state_desc` text NOT NULL,
  PRIMARY KEY (`state_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crc_states`
--

LOCK TABLES `crc_states` WRITE;
/*!40000 ALTER TABLE `crc_states` DISABLE KEYS */;
/*!40000 ALTER TABLE `crc_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crc_student_schedule`
--

DROP TABLE IF EXISTS `crc_student_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crc_student_schedule` (
  `student_schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_schedule_profile_id` int(11) NOT NULL DEFAULT '0',
  `student_schedule_schedule_id` int(11) NOT NULL DEFAULT '0',
  `student_schedule_paid` char(1) NOT NULL DEFAULT 'U',
  `student_schedule_amount` int(11) NOT NULL DEFAULT '0',
  `student_schedule_questions` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`student_schedule_id`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crc_student_schedule`
--

LOCK TABLES `crc_student_schedule` WRITE;
/*!40000 ALTER TABLE `crc_student_schedule` DISABLE KEYS */;
INSERT INTO `crc_student_schedule` VALUES (37,29,15,'U',0,0),(39,31,15,'U',0,0),(41,29,17,'U',0,0),(43,31,17,'U',0,0),(45,33,15,'U',0,0),(47,33,17,'U',0,0),(49,35,15,'U',0,0),(51,35,17,'U',0,0),(53,37,15,'U',0,0),(55,37,17,'U',0,1),(57,39,15,'U',0,0),(59,39,17,'U',0,0),(61,41,15,'U',0,0),(63,41,17,'U',0,0),(65,43,15,'U',0,0),(67,43,17,'U',0,1);
/*!40000 ALTER TABLE `crc_student_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crc_teacher_schedule`
--

DROP TABLE IF EXISTS `crc_teacher_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crc_teacher_schedule` (
  `teacher_schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_schedule_profile_id` int(11) NOT NULL DEFAULT '0',
  `teacher_schedule_schedule_id` int(11) NOT NULL DEFAULT '0',
  `teacher_schedule_evaluation` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`teacher_schedule_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crc_teacher_schedule`
--

LOCK TABLES `crc_teacher_schedule` WRITE;
/*!40000 ALTER TABLE `crc_teacher_schedule` DISABLE KEYS */;
INSERT INTO `crc_teacher_schedule` VALUES (9,27,15,10),(11,25,17,10);
/*!40000 ALTER TABLE `crc_teacher_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crc_venue`
--

DROP TABLE IF EXISTS `crc_venue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crc_venue` (
  `venue_id` int(11) NOT NULL AUTO_INCREMENT,
  `venue_name` varchar(100) NOT NULL DEFAULT '',
  `venue_desc` varchar(100) NOT NULL DEFAULT '',
  `venue_shortname` varchar(8) NOT NULL DEFAULT '',
  PRIMARY KEY (`venue_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crc_venue`
--

LOCK TABLES `crc_venue` WRITE;
/*!40000 ALTER TABLE `crc_venue` DISABLE KEYS */;
/*!40000 ALTER TABLE `crc_venue` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-09-16 18:09:10
