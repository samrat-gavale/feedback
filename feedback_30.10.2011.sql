-- MySQL dump 10.13  Distrib 5.1.49, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: crcdb
-- ------------------------------------------------------
-- Server version	5.1.49-1ubuntu8.1

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
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `course_id` int(5) NOT NULL AUTO_INCREMENT,
  `course_number` varchar(8) DEFAULT NULL,
  `course_name` varchar(60) DEFAULT NULL,
  `course_active` tinyint(1) NOT NULL DEFAULT '0',
  `semester` int(2) DEFAULT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM AUTO_INCREMENT=174 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=latin1 COMMENT='This table is facility to store feddback information from st';
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM AUTO_INCREMENT=304 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM AUTO_INCREMENT=1198 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `enrollments`
--

DROP TABLE IF EXISTS `enrollments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrollments` (
  `enrollment_id` int(7) NOT NULL AUTO_INCREMENT,
  `student_profile_id` int(7) DEFAULT NULL,
  `course_id` int(5) DEFAULT NULL,
  `approved` tinyint(1) DEFAULT '0',
  `feedback_status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`enrollment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `profile_id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_uid` varchar(100) NOT NULL DEFAULT '',
  `profile_pwd` varchar(40) NOT NULL DEFAULT '',
  `profile_enrollno` varchar(40) NOT NULL DEFAULT '',
  `profile_name` varchar(100) NOT NULL DEFAULT '',
  `profile_email` varchar(100) NOT NULL DEFAULT '',
  `profile_dob` date NOT NULL DEFAULT '2010-01-01',
  `profile_gender` varchar(6) NOT NULL DEFAULT 'M',
  `profile_role_id` int(11) NOT NULL DEFAULT '0',
  `profile_active` tinyint(1) NOT NULL DEFAULT '1',
  `profile_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`profile_id`,`profile_uid`,`profile_email`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule` (
  `schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `schedule_course_id` int(11) NOT NULL DEFAULT '0',
  `schedule_status` varchar(100) NOT NULL DEFAULT 'in progress',
  `schedule_active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`schedule_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `student_schedule`
--

DROP TABLE IF EXISTS `student_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_schedule` (
  `student_schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_schedule_profile_id` int(11) NOT NULL DEFAULT '0',
  `student_schedule_schedule_id` int(11) NOT NULL DEFAULT '0',
  `student_schedule_questions` tinyint(1) NOT NULL DEFAULT '0',
  `student_schedule_approved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`student_schedule_id`)
) ENGINE=MyISAM AUTO_INCREMENT=140 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-10-30 23:28:02
