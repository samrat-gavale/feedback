-- phpMyAdmin SQL Dump
-- version 3.3.2deb1ubuntu1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 21, 2012 at 03:58 PM
-- Server version: 5.1.41
-- PHP Version: 5.3.2-1ubuntu4.14

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `crcdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE IF NOT EXISTS `courses` (
  `course_id` int(5) NOT NULL AUTO_INCREMENT,
  `course_number` varchar(8) DEFAULT NULL,
  `course_name` varchar(60) DEFAULT NULL,
  `course_active` tinyint(1) NOT NULL DEFAULT '0',
  `semester` int(2) DEFAULT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=55 ;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_number`, `course_name`, `course_active`, `semester`) VALUES
(1, 'MA102', 'Mathematics II', 1, 0),
(2, 'EE101', 'Basic Electrical Engg. ', 1, 0),
(3, 'EE101P', 'Basic Electrical & Electronics Lab ', 1, 0),
(4, 'EE102', 'Introduction to Electronics ', 1, 0),
(5, 'ME104', 'Engineering Thermodynamics ', 1, 0),
(6, 'CS101', 'Introduction to Computing ', 1, 0),
(7, 'CS101P', 'Introduction to Computing Lab ', 1, 0),
(8, 'HS151', 'Advanced Englsih ', 1, 0),
(9, 'HS152', 'Advanced Englsih ', 1, 0),
(10, 'HS152', 'Introduction to Rhetroic ', 1, 0),
(11, 'HS352', 'German II ', 1, 0),
(12, 'EE202', 'Analog Electronics ', 1, 0),
(13, 'EE202P', 'Analog Electronics Lab ', 1, 0),
(14, 'MA202', 'Probability and Random Processes ', 1, 0),
(15, 'IC201', 'Design Practicum ', 1, 0),
(16, 'CS203', 'Discrete Structures ', 1, 0),
(17, 'CS204', 'Introduction to Database ', 1, 0),
(18, 'CS206', 'Computer Networks ', 1, 0),
(19, 'MA460', 'Nonlinear Dynamics and Chaos ', 1, 0),
(20, 'HS251', 'Managerial Economics ', 1, 0),
(21, 'HS252', 'Introduction to Psychology ', 1, 0),
(22, 'HS253', 'Introduction to Sociology ', 1, 0),
(23, 'HS254', 'Introduction to European Philosophy ', 1, 0),
(24, 'HS255', 'India since Independence ', 1, 0),
(25, 'EE204', 'Signals and Systems ', 1, 0),
(26, 'EE201', 'Electromechanics ', 1, 0),
(27, 'EE201P', 'Electromechanics Lab ', 1, 0),
(28, 'ME209', 'Dynamics ', 1, 0),
(29, 'ME210', 'Fluid Mechanics ', 1, 0),
(30, 'ME211', 'Analysis and Synthesis of Mechanisms ', 1, 0),
(31, 'ME354', 'Science and Tech of Thin Films ', 1, 0),
(32, 'ME352', 'Finite Element Methods in Engg. ', 1, 0),
(33, 'CS592snm', 'Topics in SNMP and Network Management ', 1, 0),
(34, 'CY344', 'Food Chemistry ', 1, 0),
(35, 'CS306', 'Operating Systems ', 1, 0),
(36, 'CS350', 'Computer Graphics ', 1, 0),
(37, 'CS501', 'Access Network ', 1, 0),
(38, 'CS592 Bi', 'Selected Topics in Bio-Informatics ', 1, 0),
(39, 'MA651', 'Optimization Techniques ', 1, 0),
(40, 'CY342', 'Nanoscience:Undertaking Small Systems ', 1, 0),
(41, 'HS351', 'Popular Fiction ', 1, 0),
(42, 'HS353', 'Science, Technology & Society ', 1, 0),
(43, 'HS354', 'Social Psychology ', 1, 0),
(44, 'HS355', 'India Through its Epics ', 1, 0),
(45, 'ME353', 'Electronic Materials and their Applications ', 1, 0),
(46, 'ME351', 'Management of Manufacturing & Logistics Systems ', 1, 0),
(48, 'EE307', 'Theory of Measurements ', 1, 0),
(49, 'EE304', 'Communications Engg. ', 1, 0),
(50, 'EE305', 'Digital Signal Processing ', 1, 0),
(51, 'EE306', 'Computer Organization & Microprocessor ', 1, 0),
(52, 'EE501', 'Power System Operation & Control ', 1, 0),
(53, 'EE502P', 'Analog System Design Lab ', 1, 0),
(54, 'ME307', 'Energy Conversion Devices ', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `crc_attendance`
--

CREATE TABLE IF NOT EXISTS `crc_attendance` (
  `attendance_id` int(11) NOT NULL AUTO_INCREMENT,
  `attendance_student_schedule_id` int(11) NOT NULL DEFAULT '0',
  `attendance_date_id` int(11) NOT NULL DEFAULT '0',
  `attendance_check` char(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`attendance_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=188 ;

--
-- Dumping data for table `crc_attendance`
--

INSERT INTO `crc_attendance` (`attendance_id`, `attendance_student_schedule_id`, `attendance_date_id`, `attendance_check`) VALUES
(174, 140, 35, 'A'),
(175, 141, 35, 'A'),
(176, 142, 35, 'A'),
(177, 143, 35, 'A'),
(178, 140, 36, 'A'),
(179, 141, 36, 'A'),
(180, 144, 36, 'A'),
(181, 145, 37, 'A'),
(182, 143, 37, 'A'),
(183, 146, 37, 'A'),
(184, 148, 38, 'A'),
(185, 152, 39, 'A'),
(186, 152, 40, 'A'),
(187, 153, 40, 'A');

-- --------------------------------------------------------

--
-- Table structure for table `crc_courses`
--

CREATE TABLE IF NOT EXISTS `crc_courses` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(100) NOT NULL DEFAULT '',
  `course_desc` varchar(255) DEFAULT '',
  `course_active` tinyint(1) NOT NULL DEFAULT '0',
  `course_fee` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`course_id`,`course_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `crc_courses`
--


-- --------------------------------------------------------

--
-- Table structure for table `crc_date`
--

CREATE TABLE IF NOT EXISTS `crc_date` (
  `date_id` int(11) NOT NULL AUTO_INCREMENT,
  `date_day` char(2) NOT NULL DEFAULT '',
  `date_month` char(2) NOT NULL DEFAULT '',
  `date_year` varchar(4) NOT NULL DEFAULT '',
  PRIMARY KEY (`date_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=41 ;

--
-- Dumping data for table `crc_date`
--

INSERT INTO `crc_date` (`date_id`, `date_day`, `date_month`, `date_year`) VALUES
(35, '31', '10', '2011'),
(36, '01', '11', '2011'),
(37, '02', '12', '2011'),
(38, '09', '01', '2012'),
(39, '13', '01', '2012'),
(40, '26', '01', '2012');

-- --------------------------------------------------------

--
-- Table structure for table `crc_feedback`
--

CREATE TABLE IF NOT EXISTS `crc_feedback` (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `feedback_profile_id` int(11) NOT NULL DEFAULT '0',
  `feedback_schedule_id` int(11) NOT NULL DEFAULT '0',
  `feedback_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `feedback_active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`feedback_id`),
  KEY `feedback_profile_id` (`feedback_profile_id`,`feedback_schedule_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='This table is facility to store feddback information from st' AUTO_INCREMENT=67 ;

--
-- Dumping data for table `crc_feedback`
--

INSERT INTO `crc_feedback` (`feedback_id`, `feedback_profile_id`, `feedback_schedule_id`, `feedback_date`, `feedback_active`) VALUES
(61, 53, 140, '2011-10-31 19:52:54', 0),
(62, 58, 141, '2011-10-31 19:53:55', 0),
(63, 59, 142, '2011-10-31 20:11:15', 0),
(64, 60, 144, '2011-11-01 10:37:15', 0),
(65, 62, 148, '2012-01-09 12:59:48', 0),
(66, 62, 152, '2012-01-13 11:28:38', 0);

-- --------------------------------------------------------

--
-- Table structure for table `crc_feedback_answers`
--

CREATE TABLE IF NOT EXISTS `crc_feedback_answers` (
  `feedback_answers_id` int(11) NOT NULL AUTO_INCREMENT,
  `feedback_answers_feedback_id` int(11) NOT NULL DEFAULT '0',
  `feedback_answers_questions_id` int(11) NOT NULL DEFAULT '0',
  `feedback_answers_answer` text NOT NULL,
  `feedback_answers_active` tinyint(4) NOT NULL DEFAULT '0',
  `feedback_answers_comments` text NOT NULL,
  PRIMARY KEY (`feedback_answers_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=466 ;

--
-- Dumping data for table `crc_feedback_answers`
--

INSERT INTO `crc_feedback_answers` (`feedback_answers_id`, `feedback_answers_feedback_id`, `feedback_answers_questions_id`, `feedback_answers_answer`, `feedback_answers_active`, `feedback_answers_comments`) VALUES
(304, 61, 1, '1', 1, 'NA'),
(305, 61, 2, '2', 1, 'NA'),
(306, 61, 3, '3', 1, 'NA'),
(307, 61, 4, '4', 1, 'NA'),
(308, 61, 5, '5', 1, 'NA'),
(309, 61, 6, '4', 1, 'NA'),
(310, 61, 7, '3', 1, 'NA'),
(311, 61, 8, '2', 1, 'NA'),
(312, 61, 9, '1', 1, 'NA'),
(313, 61, 10, '2', 1, 'NA'),
(314, 61, 11, '3', 1, 'NA'),
(315, 61, 12, '4', 1, 'NA'),
(316, 61, 13, '5', 1, 'NA'),
(317, 61, 14, '4', 1, 'NA'),
(318, 61, 15, '3', 1, 'NA'),
(319, 61, 16, '2', 1, 'NA'),
(320, 61, 17, '1', 1, 'NA'),
(321, 61, 18, '2', 1, 'NA'),
(322, 61, 19, '3', 1, 'NA'),
(323, 61, 20, '4', 1, 'NA'),
(324, 61, 21, '5', 1, 'NA'),
(325, 61, 22, '0', 1, 'sam'),
(326, 61, 23, '0', 1, 'sam'),
(327, 61, 24, '0', 1, 'sam'),
(328, 61, 25, '0', 1, 'sam'),
(329, 61, 26, '0', 1, 'sam'),
(330, 61, 27, '0', 1, 'sam'),
(331, 62, 1, '1', 1, 'NA'),
(332, 62, 2, '1', 1, 'NA'),
(333, 62, 3, '1', 1, 'NA'),
(334, 62, 4, '1', 1, 'NA'),
(335, 62, 5, '1', 1, 'NA'),
(336, 62, 6, '1', 1, 'NA'),
(337, 62, 7, '1', 1, 'NA'),
(338, 62, 8, '1', 1, 'NA'),
(339, 62, 9, '0', 1, 'NA'),
(340, 62, 10, '0', 1, 'NA'),
(341, 62, 11, '0', 1, 'NA'),
(342, 62, 12, '0', 1, 'NA'),
(343, 62, 13, '0', 1, 'NA'),
(344, 62, 14, '0', 1, 'NA'),
(345, 62, 15, '0', 1, 'NA'),
(346, 62, 16, '0', 1, 'NA'),
(347, 62, 17, '0', 1, 'NA'),
(348, 62, 18, '0', 1, 'NA'),
(349, 62, 19, '0', 1, 'NA'),
(350, 62, 20, '0', 1, 'NA'),
(351, 62, 21, '0', 1, 'NA'),
(352, 62, 22, '0', 1, ''),
(353, 62, 23, '0', 1, ''),
(354, 62, 24, '0', 1, ''),
(355, 62, 25, '0', 1, ''),
(356, 62, 26, '0', 1, ''),
(357, 62, 27, '0', 1, ''),
(358, 63, 1, '1', 1, 'NA'),
(359, 63, 2, '1', 1, 'NA'),
(360, 63, 3, '1', 1, 'NA'),
(361, 63, 4, '1', 1, 'NA'),
(362, 63, 5, '1', 1, 'NA'),
(363, 63, 6, '1', 1, 'NA'),
(364, 63, 7, '1', 1, 'NA'),
(365, 63, 8, '1', 1, 'NA'),
(366, 63, 9, '1', 1, 'NA'),
(367, 63, 10, '1', 1, 'NA'),
(368, 63, 11, '1', 1, 'NA'),
(369, 63, 12, '1', 1, 'NA'),
(370, 63, 13, '1', 1, 'NA'),
(371, 63, 14, '1', 1, 'NA'),
(372, 63, 15, '1', 1, 'NA'),
(373, 63, 16, '1', 1, 'NA'),
(374, 63, 17, '1', 1, 'NA'),
(375, 63, 18, '1', 1, 'NA'),
(376, 63, 19, '1', 1, 'NA'),
(377, 63, 20, '1', 1, 'NA'),
(378, 63, 21, '1', 1, 'NA'),
(379, 63, 22, '0', 1, 'sam2'),
(380, 63, 23, '0', 1, 'sam2'),
(381, 63, 24, '0', 1, 'sam2'),
(382, 63, 25, '0', 1, 'sam2'),
(383, 63, 26, '0', 1, 'sam2'),
(384, 63, 27, '0', 1, 'sam2'),
(385, 64, 1, '5', 1, 'NA'),
(386, 64, 2, '4', 1, 'NA'),
(387, 64, 3, '5', 1, 'NA'),
(388, 64, 4, '4', 1, 'NA'),
(389, 64, 5, '5', 1, 'NA'),
(390, 64, 6, '4', 1, 'NA'),
(391, 64, 7, '5', 1, 'NA'),
(392, 64, 8, '4', 1, 'NA'),
(393, 64, 9, '5', 1, 'NA'),
(394, 64, 10, '4', 1, 'NA'),
(395, 64, 11, '4', 1, 'NA'),
(396, 64, 12, '5', 1, 'NA'),
(397, 64, 13, '5', 1, 'NA'),
(398, 64, 14, '5', 1, 'NA'),
(399, 64, 15, '5', 1, 'NA'),
(400, 64, 16, '4', 1, 'NA'),
(401, 64, 17, '5', 1, 'NA'),
(402, 64, 18, '5', 1, 'NA'),
(403, 64, 19, '5', 1, 'NA'),
(404, 64, 20, '5', 1, 'NA'),
(405, 64, 21, '5', 1, 'NA'),
(406, 64, 22, '0', 1, 'Course Material'),
(407, 64, 23, '0', 1, 'Assignments'),
(408, 64, 24, '0', 1, 'Test '),
(409, 64, 25, '0', 1, ''),
(410, 64, 26, '0', 1, ''),
(411, 64, 27, '0', 1, ''),
(412, 65, 1, '2', 1, 'NA'),
(413, 65, 2, '2', 1, 'NA'),
(414, 65, 3, '2', 1, 'NA'),
(415, 65, 4, '4', 1, 'NA'),
(416, 65, 5, '2', 1, 'NA'),
(417, 65, 6, '1', 1, 'NA'),
(418, 65, 7, '1', 1, 'NA'),
(419, 65, 8, '3', 1, 'NA'),
(420, 65, 9, '2', 1, 'NA'),
(421, 65, 10, '2', 1, 'NA'),
(422, 65, 11, '1', 1, 'NA'),
(423, 65, 12, '2', 1, 'NA'),
(424, 65, 13, '3', 1, 'NA'),
(425, 65, 14, '1', 1, 'NA'),
(426, 65, 15, '4', 1, 'NA'),
(427, 65, 16, '3', 1, 'NA'),
(428, 65, 17, '2', 1, 'NA'),
(429, 65, 18, '1', 1, 'NA'),
(430, 65, 19, '2', 1, 'NA'),
(431, 65, 20, '1', 1, 'NA'),
(432, 65, 21, '3', 1, 'NA'),
(433, 65, 22, '0', 1, 'good'),
(434, 65, 23, '0', 1, 'hello'),
(435, 65, 24, '0', 1, 'who'),
(436, 65, 25, '0', 1, 'what'),
(437, 65, 26, '0', 1, 'i dont'),
(438, 65, 27, '0', 1, 'joker killed jessica'),
(439, 66, 1, '0', 1, 'NA'),
(440, 66, 2, '1', 1, 'NA'),
(441, 66, 3, '2', 1, 'NA'),
(442, 66, 4, '4', 1, 'NA'),
(443, 66, 5, '2', 1, 'NA'),
(444, 66, 6, '0', 1, 'NA'),
(445, 66, 7, '5', 1, 'NA'),
(446, 66, 8, '2', 1, 'NA'),
(447, 66, 9, '3', 1, 'NA'),
(448, 66, 10, '3', 1, 'NA'),
(449, 66, 11, '2', 1, 'NA'),
(450, 66, 12, '2', 1, 'NA'),
(451, 66, 13, '3', 1, 'NA'),
(452, 66, 14, '3', 1, 'NA'),
(453, 66, 15, '2', 1, 'NA'),
(454, 66, 16, '2', 1, 'NA'),
(455, 66, 17, '1', 1, 'NA'),
(456, 66, 18, '3', 1, 'NA'),
(457, 66, 19, '0', 1, 'NA'),
(458, 66, 20, '3', 1, 'NA'),
(459, 66, 21, '5', 1, 'NA'),
(460, 66, 22, '0', 1, 'hello'),
(461, 66, 23, '0', 1, 'hi'),
(462, 66, 24, '0', 1, 'HI'),
(463, 66, 25, '0', 1, 'HI'),
(464, 66, 26, '0', 1, 'HI'),
(465, 66, 27, '0', 1, 'HI');

-- --------------------------------------------------------

--
-- Table structure for table `crc_feedback_questions`
--

CREATE TABLE IF NOT EXISTS `crc_feedback_questions` (
  `feedback_questions_id` int(11) NOT NULL AUTO_INCREMENT,
  `feedback_questions_question` text NOT NULL,
  `feedback_questions_active` tinyint(1) NOT NULL DEFAULT '0',
  `feedback_questions_type` varchar(100) NOT NULL DEFAULT 'COMMENT',
  `feedback_questions_category` varchar(100) NOT NULL DEFAULT 'COMMENTS',
  `feedback_questions_sequence` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`feedback_questions_id`),
  KEY `SEQUENCE` (`feedback_questions_sequence`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `crc_feedback_questions`
--

INSERT INTO `crc_feedback_questions` (`feedback_questions_id`, `feedback_questions_question`, `feedback_questions_active`, `feedback_questions_type`, `feedback_questions_category`, `feedback_questions_sequence`) VALUES
(1, 'Course content was good.', 1, 'OPTION', 'GENERAL', 1),
(2, 'The sequence in which topics were covered was helpful to grasp the course contents.', 1, 'OPTION', 'GENERAL', 2),
(3, 'Assignment helped better understand the course.', 1, 'OPTION', 'GENERAL', 3),
(4, 'Interesting reference material was suggested.', 1, 'OPTION', 'GENERAL', 4),
(5, 'Exams truly reflected the grasp of course material.', 1, 'OPTION', 'GENERAL', 5),
(6, 'Course objectives were fulfilled.', 1, 'OPTION', 'GENERAL', 6),
(7, 'Fundamental principles were well emphasized.', 1, 'OPTION', 'GENERAL', 7),
(8, 'Board work and/or visual aids were of good quality.', 1, 'OPTION', 'GENERAL', 8),
(9, 'The presentations of lecture material were well organized.', 1, 'OPTION', 'OBJECTIVE', 9),
(10, 'Pace of instruction was comfortable.', 1, 'OPTION', 'OBJECTIVE', 10),
(11, 'Questions were encouraged during the class.', 1, 'OPTION', 'OBJECTIVE', 11),
(12, 'The course content was well covered.', 1, 'OPTION', 'OBJECTIVE', 12),
(13, 'Application/practical aspects were emphasized.', 1, 'OPTION', 'OBJECTIVE', 13),
(14, 'Motivation for the course was well emphasized.', 1, 'OPTION', 'OBJECTIVE', 14),
(15, 'Overall instruction was effective.', 1, 'OPTION', 'PRESENTATION', 15),
(16, 'Questions were encouraged during the tutorial.', 1, 'OPTION', 'PRESENTATION', 16),
(17, 'Doubts were clarified effectively.', 1, 'OPTION', 'PRESENTATION', 17),
(18, 'The number of tutorials was sufficient.', 1, 'OPTION', 'PRESENTATION', 18),
(19, 'Overall the tutorials were effective.', 1, 'OPTION', 'PRESENTATION', 19),
(20, 'Laboratory reports were corrected regularly.', 1, 'OPTION', 'PRESENTATION', 20),
(21, 'Difficulties pointed out to the instructor were satisfactorily addressed.', 1, 'OPTION', 'PRESENTATION', 21),
(22, 'What did you like about this course?', 1, 'COMMENT', 'COMMENTS', 22),
(23, 'What did you dislike about this course?', 1, 'COMMENT', 'COMMENTS', 23),
(24, 'Can you suggest anything that the instructor could do to enrich your learning experience?', 1, 'COMMENT', 'COMMENTS', 24),
(25, 'What methods would you advise a friend to adopt to maximize his/her benefit from this course? ', 1, 'COMMENT', 'COMMENTS', 25),
(26, 'Indicate in what manner your interest in the subject increased as a result of this course?', 1, 'COMMENT', 'COMMENTS', 26),
(27, 'Other comments?', 1, 'COMMENT', 'COMMENTS', 27);

-- --------------------------------------------------------

--
-- Table structure for table `crc_profiles`
--

CREATE TABLE IF NOT EXISTS `crc_profiles` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=44 ;

--
-- Dumping data for table `crc_profiles`
--


-- --------------------------------------------------------

--
-- Table structure for table `crc_roles`
--

CREATE TABLE IF NOT EXISTS `crc_roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) NOT NULL DEFAULT '',
  `role_desc` varchar(255) NOT NULL DEFAULT '',
  `role_active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`role_id`,`role_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `crc_roles`
--

INSERT INTO `crc_roles` (`role_id`, `role_name`, `role_desc`, `role_active`) VALUES
(1, 'Administrator', 'CRC Administrator role', 1),
(2, 'Teacher', 'CRC Teacher role', 1),
(3, 'Student', 'CRC Student role', 1),
(4, 'Dean', 'Role for the Dean of Academics', 1);

-- --------------------------------------------------------

--
-- Table structure for table `crc_rooms`
--

CREATE TABLE IF NOT EXISTS `crc_rooms` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_name` varchar(100) NOT NULL DEFAULT '',
  `room_desc` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`room_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `crc_rooms`
--


-- --------------------------------------------------------

--
-- Table structure for table `crc_schedule`
--

CREATE TABLE IF NOT EXISTS `crc_schedule` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `crc_schedule`
--


-- --------------------------------------------------------

--
-- Table structure for table `crc_sessions`
--

CREATE TABLE IF NOT EXISTS `crc_sessions` (
  `session_oid` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) NOT NULL DEFAULT '',
  `session_uid` varchar(15) NOT NULL DEFAULT '',
  `session_pwd` varchar(15) NOT NULL DEFAULT '',
  `session_dn` varchar(255) NOT NULL DEFAULT '',
  `session_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`session_oid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1503 ;

--
-- Dumping data for table `crc_sessions`
--

INSERT INTO `crc_sessions` (`session_oid`, `session_id`, `session_uid`, `session_pwd`, `session_dn`, `session_time`) VALUES
(1198, 'ge355v17fc7p4e88hf4sqlm315', 'sam', 'sam', 'NA', '2011-10-31 16:59:04'),
(1199, 'ge355v17fc7p4e88hf4sqlm315', 'sam', 'sam', 'NA', '2011-10-31 16:59:04'),
(1200, 'ge355v17fc7p4e88hf4sqlm315', 'admin', 'admin', 'NA', '2011-10-31 17:00:30'),
(1201, 'ge355v17fc7p4e88hf4sqlm315', 'admin', 'admin', 'NA', '2011-10-31 17:00:40'),
(1202, 'ge355v17fc7p4e88hf4sqlm315', 'admin', 'admin', 'NA', '2011-10-31 17:01:51'),
(1203, 'ge355v17fc7p4e88hf4sqlm315', 'admin', 'admin', 'NA', '2011-10-31 17:01:51'),
(1204, 'ge355v17fc7p4e88hf4sqlm315', 'dean', 'dean', 'NA', '2011-10-31 18:52:44'),
(1205, 'ge355v17fc7p4e88hf4sqlm315', 'dean', 'dean', 'NA', '2011-10-31 18:52:44'),
(1206, 'ge355v17fc7p4e88hf4sqlm315', 'admin', 'admin', 'NA', '2011-10-31 19:00:07'),
(1207, 'ge355v17fc7p4e88hf4sqlm315', 'admin', 'admin', 'NA', '2011-10-31 19:00:07'),
(1208, 'ge355v17fc7p4e88hf4sqlm315', 'admin', 'admin', 'NA', '2011-10-31 19:04:35'),
(1209, 'ge355v17fc7p4e88hf4sqlm315', 'admin', 'admin', 'NA', '2011-10-31 19:04:35'),
(1210, 'ge355v17fc7p4e88hf4sqlm315', 'sam', 'sam', 'NA', '2011-10-31 19:07:29'),
(1211, 'ge355v17fc7p4e88hf4sqlm315', 'sam', 'sam', 'NA', '2011-10-31 19:07:29'),
(1212, 'ge355v17fc7p4e88hf4sqlm315', 'sam1', 'sam', 'NA', '2011-10-31 19:10:04'),
(1213, 'ge355v17fc7p4e88hf4sqlm315', 'sam1', 'sam', 'NA', '2011-10-31 19:10:04'),
(1214, 'ge355v17fc7p4e88hf4sqlm315', 'teacher1', 'teacher1', 'NA', '2011-10-31 19:10:29'),
(1215, 'ge355v17fc7p4e88hf4sqlm315', 'teacher1', 'teacher1', 'NA', '2011-10-31 19:10:29'),
(1216, 'ge355v17fc7p4e88hf4sqlm315', 'sam', 'sam', 'NA', '2011-10-31 19:40:39'),
(1217, 'ge355v17fc7p4e88hf4sqlm315', 'sam', 'sam', 'NA', '2011-10-31 19:40:39'),
(1218, 'ge355v17fc7p4e88hf4sqlm315', 'sam1', 'sam', 'NA', '2011-10-31 19:53:08'),
(1219, 'ge355v17fc7p4e88hf4sqlm315', 'sam1', 'sam', 'NA', '2011-10-31 19:53:08'),
(1220, 'ge355v17fc7p4e88hf4sqlm315', 'dean', 'dean', 'NA', '2011-10-31 19:54:21'),
(1221, 'ge355v17fc7p4e88hf4sqlm315', 'dean', 'dean', 'NA', '2011-10-31 19:54:21'),
(1222, 'ge355v17fc7p4e88hf4sqlm315', 'sam2', 'sam', 'NA', '2011-10-31 20:06:54'),
(1223, 'ge355v17fc7p4e88hf4sqlm315', 'sam2', 'sam', 'NA', '2011-10-31 20:06:54'),
(1224, 'ge355v17fc7p4e88hf4sqlm315', 'admin', 'admin', 'NA', '2011-10-31 20:07:35'),
(1225, 'ge355v17fc7p4e88hf4sqlm315', 'admin', 'admin', 'NA', '2011-10-31 20:07:35'),
(1226, 'ge355v17fc7p4e88hf4sqlm315', 'sam2', 'sam', 'NA', '2011-10-31 20:08:33'),
(1227, 'ge355v17fc7p4e88hf4sqlm315', 'sam2', 'sam', 'NA', '2011-10-31 20:08:33'),
(1228, 'ge355v17fc7p4e88hf4sqlm315', 'teacher2', 'teacher2', 'NA', '2011-10-31 20:09:55'),
(1229, 'ge355v17fc7p4e88hf4sqlm315', 'teacher2', 'teacher2', 'NA', '2011-10-31 20:09:55'),
(1230, 'ge355v17fc7p4e88hf4sqlm315', 'sam2', 'sam', 'NA', '2011-10-31 20:10:22'),
(1231, 'ge355v17fc7p4e88hf4sqlm315', 'sam2', 'sam', 'NA', '2011-10-31 20:10:22'),
(1232, 'ge355v17fc7p4e88hf4sqlm315', 'dean', 'dean', 'NA', '2011-10-31 20:11:27'),
(1233, 'ge355v17fc7p4e88hf4sqlm315', 'dean', 'dean', 'NA', '2011-10-31 20:11:27'),
(1234, 'ge355v17fc7p4e88hf4sqlm315', 'sam', 'sam', 'NA', '2011-10-31 20:12:39'),
(1235, 'ge355v17fc7p4e88hf4sqlm315', 'sam', 'sam', 'NA', '2011-10-31 20:12:39'),
(1236, 'ge355v17fc7p4e88hf4sqlm315', 'teacher2', 'teacher2', 'NA', '2011-10-31 20:13:25'),
(1237, 'ge355v17fc7p4e88hf4sqlm315', 'teacher2', 'teacher2', 'NA', '2011-10-31 20:13:25'),
(1238, 'ge355v17fc7p4e88hf4sqlm315', 'dean', 'dean', 'NA', '2011-10-31 21:34:33'),
(1239, 'ge355v17fc7p4e88hf4sqlm315', 'dean', 'dean', 'NA', '2011-10-31 21:34:33'),
(1240, 'ge355v17fc7p4e88hf4sqlm315', 'sam', 'sam', 'NA', '2011-10-31 21:36:47'),
(1241, 'ge355v17fc7p4e88hf4sqlm315', 'sam', 'sam', 'NA', '2011-10-31 21:36:47'),
(1242, 'ge355v17fc7p4e88hf4sqlm315', 'admin', 'admin', 'NA', '2011-10-31 21:37:15'),
(1243, 'ge355v17fc7p4e88hf4sqlm315', 'admin', 'admin', 'NA', '2011-10-31 21:37:15'),
(1244, 'id5r81667erevumf7thmds2157', 'admin', 'admin', 'NA', '2011-11-01 10:31:03'),
(1245, 'id5r81667erevumf7thmds2157', 'admin', 'admin', 'NA', '2011-11-01 10:31:03'),
(1246, 'id5r81667erevumf7thmds2157', 'dean', 'dean', 'NA', '2011-11-01 10:31:29'),
(1247, 'id5r81667erevumf7thmds2157', 'dean', 'dean', 'NA', '2011-11-01 10:31:29'),
(1248, 'id5r81667erevumf7thmds2157', 'kirti', 'thakur', 'NA', '2011-11-01 10:33:25'),
(1249, 'id5r81667erevumf7thmds2157', 'kirti', 'thakur', 'NA', '2011-11-01 10:33:25'),
(1250, 'id5r81667erevumf7thmds2157', 'teacher1', 'teacher1', 'NA', '2011-11-01 10:33:43'),
(1251, 'id5r81667erevumf7thmds2157', 'teacher1', 'teacher1', 'NA', '2011-11-01 10:33:43'),
(1252, 'id5r81667erevumf7thmds2157', 'kirti', 'thakur', 'NA', '2011-11-01 10:34:25'),
(1253, 'id5r81667erevumf7thmds2157', 'kirti', 'thakur', 'NA', '2011-11-01 10:34:25'),
(1254, 'id5r81667erevumf7thmds2157', 'admin', 'admin', 'NA', '2011-11-01 10:37:33'),
(1255, 'id5r81667erevumf7thmds2157', 'admin', 'admin', 'NA', '2011-11-01 10:37:33'),
(1256, 'id5r81667erevumf7thmds2157', 'admin', 'admin', 'NA', '2011-11-01 10:38:22'),
(1257, 'id5r81667erevumf7thmds2157', 'admin', 'admin', 'NA', '2011-11-01 10:38:22'),
(1258, 'id5r81667erevumf7thmds2157', 'kirti', 'thakur', 'NA', '2011-11-01 10:38:36'),
(1259, 'id5r81667erevumf7thmds2157', 'kirti', 'thakur', 'NA', '2011-11-01 10:38:36'),
(1260, 'id5r81667erevumf7thmds2157', 'kirti', 'thakur', 'NA', '2011-11-01 10:39:02'),
(1261, 'id5r81667erevumf7thmds2157', 'kirti', 'thakur', 'NA', '2011-11-01 10:39:02'),
(1262, 'id5r81667erevumf7thmds2157', 'dean', 'dean', 'NA', '2011-11-01 10:39:33'),
(1263, 'id5r81667erevumf7thmds2157', 'dean', 'dean', 'NA', '2011-11-01 10:39:33'),
(1264, 'ijv2j54n8qdmtco9f17agrm9l3', 'admin', 'admin', 'NA', '2011-11-01 15:08:35'),
(1265, 'ijv2j54n8qdmtco9f17agrm9l3', 'admin', 'admin', 'NA', '2011-11-01 15:08:35'),
(1266, 'ijv2j54n8qdmtco9f17agrm9l3', 'dean', 'dean', 'NA', '2011-11-01 15:09:39'),
(1267, 'ijv2j54n8qdmtco9f17agrm9l3', 'dean', 'dean', 'NA', '2011-11-01 15:09:39'),
(1268, 'ijv2j54n8qdmtco9f17agrm9l3', 'kirti', 'thakur', 'NA', '2011-11-01 15:11:16'),
(1269, 'ijv2j54n8qdmtco9f17agrm9l3', 'kirti', 'thakur', 'NA', '2011-11-01 15:11:16'),
(1270, 'ijv2j54n8qdmtco9f17agrm9l3', 'dean', 'dean', 'NA', '2011-11-01 15:11:34'),
(1271, 'ijv2j54n8qdmtco9f17agrm9l3', 'dean', 'dean', 'NA', '2011-11-01 15:11:34'),
(1272, '38hkc6oa5b5jjhafed1721edr0', 'dean', 'dean', 'NA', '2011-11-01 15:22:47'),
(1273, '38hkc6oa5b5jjhafed1721edr0', 'dean', 'dean', 'NA', '2011-11-01 15:22:47'),
(1274, '38hkc6oa5b5jjhafed1721edr0', 'admin', 'admin', 'NA', '2011-11-01 15:23:00'),
(1275, '38hkc6oa5b5jjhafed1721edr0', 'admin', 'admin', 'NA', '2011-11-01 15:23:00'),
(1276, '38hkc6oa5b5jjhafed1721edr0', 'kirti', 'thakur', 'NA', '2011-11-01 15:23:25'),
(1277, '38hkc6oa5b5jjhafed1721edr0', 'kirti', 'thakur', 'NA', '2011-11-01 15:23:25'),
(1278, '38hkc6oa5b5jjhafed1721edr0', 'admin', 'admin', 'NA', '2011-11-01 15:23:37'),
(1279, '38hkc6oa5b5jjhafed1721edr0', 'admin', 'admin', 'NA', '2011-11-01 15:23:37'),
(1280, '38hkc6oa5b5jjhafed1721edr0', 'dean', 'dean', 'NA', '2011-11-01 15:23:43'),
(1281, '38hkc6oa5b5jjhafed1721edr0', 'dean', 'dean', 'NA', '2011-11-01 15:23:43'),
(1282, '38hkc6oa5b5jjhafed1721edr0', 'dean', 'dean', 'NA', '2011-11-01 15:23:52'),
(1283, '38hkc6oa5b5jjhafed1721edr0', 'dean', 'dean', 'NA', '2011-11-01 15:23:52'),
(1284, '0akqdmdb78ug60h6k0cajfdrv6', 'teacher1', 'teacher1', 'NA', '2011-11-01 18:43:24'),
(1285, '0akqdmdb78ug60h6k0cajfdrv6', 'teacher1', 'teacher1', 'NA', '2011-11-01 18:43:24'),
(1286, '0akqdmdb78ug60h6k0cajfdrv6', 'teacher1', 'teacher1', 'NA', '2011-11-01 18:43:24'),
(1287, '0akqdmdb78ug60h6k0cajfdrv6', 'teacher1', 'teacher1', 'NA', '2011-11-01 18:43:24'),
(1288, '0akqdmdb78ug60h6k0cajfdrv6', 'teacher1', 'teacher1', 'NA', '2011-11-01 18:44:14'),
(1289, '0akqdmdb78ug60h6k0cajfdrv6', 'teacher1', 'teacher1', 'NA', '2011-11-01 18:44:14'),
(1290, '0akqdmdb78ug60h6k0cajfdrv6', 'teacher1', 'teacher1', 'NA', '2011-11-01 18:44:14'),
(1291, '0akqdmdb78ug60h6k0cajfdrv6', 'teacher1', 'teacher1', 'NA', '2011-11-01 18:44:14'),
(1292, '0akqdmdb78ug60h6k0cajfdrv6', 'sam1', 'sam1', 'NA', '2011-11-01 18:45:04'),
(1293, '0akqdmdb78ug60h6k0cajfdrv6', 'sam1', 'sam1', 'NA', '2011-11-01 18:45:04'),
(1294, '0akqdmdb78ug60h6k0cajfdrv6', 'sam1', 'sam1', 'NA', '2011-11-01 18:45:14'),
(1295, '0akqdmdb78ug60h6k0cajfdrv6', 'sam1', 'sam1', 'NA', '2011-11-01 18:45:14'),
(1296, '0akqdmdb78ug60h6k0cajfdrv6', 'sam1', 'sam', 'NA', '2011-11-01 18:45:27'),
(1297, '0akqdmdb78ug60h6k0cajfdrv6', 'sam1', 'sam', 'NA', '2011-11-01 18:45:27'),
(1298, '0akqdmdb78ug60h6k0cajfdrv6', 'sam1', 'sam', 'NA', '2011-11-01 18:45:28'),
(1299, '0akqdmdb78ug60h6k0cajfdrv6', 'sam1', 'sam', 'NA', '2011-11-01 18:45:28'),
(1300, '0akqdmdb78ug60h6k0cajfdrv6', 'dean', 'dean', 'NA', '2011-11-01 18:46:19'),
(1301, '0akqdmdb78ug60h6k0cajfdrv6', 'dean', 'dean', 'NA', '2011-11-01 18:46:19'),
(1302, '0akqdmdb78ug60h6k0cajfdrv6', 'dean', 'dean', 'NA', '2011-11-01 18:46:19'),
(1303, '0akqdmdb78ug60h6k0cajfdrv6', 'dean', 'dean', 'NA', '2011-11-01 18:46:19'),
(1304, 'qscj1jclu4g15par2faf22m1s5', 'admin', 'admin', 'NA', '2011-11-01 18:46:43'),
(1305, 'qscj1jclu4g15par2faf22m1s5', 'admin', 'admin', 'NA', '2011-11-01 18:46:43'),
(1306, '1lslnu39nbsmgl7pvgd4rq4d91', 'admin', 'admin', 'NA', '2011-11-02 09:10:49'),
(1307, '1lslnu39nbsmgl7pvgd4rq4d91', 'admin', 'admin', 'NA', '2011-11-02 09:10:49'),
(1308, '1lslnu39nbsmgl7pvgd4rq4d91', 'dean', 'dean', 'NA', '2011-11-02 09:11:08'),
(1309, '1lslnu39nbsmgl7pvgd4rq4d91', 'dean', 'dean', 'NA', '2011-11-02 09:11:08'),
(1310, '1lslnu39nbsmgl7pvgd4rq4d91', 'sam', 'sam', 'NA', '2011-11-02 12:12:12'),
(1311, '1lslnu39nbsmgl7pvgd4rq4d91', 'sam', 'sam', 'NA', '2011-11-02 12:12:12'),
(1312, 'rurheu5l4qsot3alie7p5jtmh6', 'vivek_vishwakar', 'iitian2010', 'NA', '2011-11-02 17:51:15'),
(1313, 'rurheu5l4qsot3alie7p5jtmh6', 'vivek_vishwakar', 'iitian2010', 'NA', '2011-11-02 17:51:32'),
(1314, '05s2l9c93irmg8vgb94u6nruf5', 'siddhant_mohan', 'sid221992', 'NA', '2011-11-04 13:56:42'),
(1315, 'n7troului53umev4nhu75oa442', 'admin', 'admin', 'NA', '2011-11-25 22:18:27'),
(1316, 'n7troului53umev4nhu75oa442', 'admin', 'admin', 'NA', '2011-11-25 22:18:27'),
(1317, '0k9708ajh5dkhlc1g4h297hj31', 'sam', 'sam', 'NA', '2011-12-02 16:36:52'),
(1318, '0k9708ajh5dkhlc1g4h297hj31', 'sam', 'sam', 'NA', '2011-12-02 16:36:52'),
(1319, '0k9708ajh5dkhlc1g4h297hj31', 'sam1', 'sam', 'NA', '2011-12-02 16:39:00'),
(1320, '0k9708ajh5dkhlc1g4h297hj31', 'sam1', 'sam', 'NA', '2011-12-02 16:39:00'),
(1321, '0k9708ajh5dkhlc1g4h297hj31', 'teacher2', 'teacher2', 'NA', '2011-12-02 16:39:33'),
(1322, '0k9708ajh5dkhlc1g4h297hj31', 'teacher2', 'teacher2', 'NA', '2011-12-02 16:39:33'),
(1323, '0k9708ajh5dkhlc1g4h297hj31', 'sam1', 'sam', 'NA', '2011-12-02 16:40:04'),
(1324, '0k9708ajh5dkhlc1g4h297hj31', 'sam1', 'sam', 'NA', '2011-12-02 16:40:04'),
(1325, '0k9708ajh5dkhlc1g4h297hj31', 'teacher2', 'teacher2', 'NA', '2011-12-02 16:40:24'),
(1326, '0k9708ajh5dkhlc1g4h297hj31', 'teacher2', 'teacher2', 'NA', '2011-12-02 16:40:24'),
(1327, '0k9708ajh5dkhlc1g4h297hj31', 'sam1', 'sam', 'NA', '2011-12-02 16:40:37'),
(1328, '0k9708ajh5dkhlc1g4h297hj31', 'sam1', 'sam', 'NA', '2011-12-02 16:40:37'),
(1329, '0k9708ajh5dkhlc1g4h297hj31', 'dean', 'dean', 'NA', '2011-12-02 16:41:01'),
(1330, '0k9708ajh5dkhlc1g4h297hj31', 'dean', 'dean', 'NA', '2011-12-02 16:41:01'),
(1331, '0k9708ajh5dkhlc1g4h297hj31', 'admin', 'admin', 'NA', '2011-12-02 16:42:56'),
(1332, '0k9708ajh5dkhlc1g4h297hj31', 'admin', 'admin', 'NA', '2011-12-02 16:42:56'),
(1333, '0k9708ajh5dkhlc1g4h297hj31', 'sam', 'sam', 'NA', '2011-12-02 16:44:42'),
(1334, '0k9708ajh5dkhlc1g4h297hj31', 'sam', 'sam', 'NA', '2011-12-02 16:44:42'),
(1335, '5ieqfu5k82e06r5i6j1quhfku7', 'admin', 'admin', 'NA', '2012-01-04 12:40:50'),
(1336, '5ieqfu5k82e06r5i6j1quhfku7', 'admin', 'admin', 'NA', '2012-01-04 12:40:50'),
(1337, '3f2g0jn3rj2k5qicc5l6qi6sj0', 'admin', 'admin', 'NA', '2012-01-04 23:36:35'),
(1338, '3f2g0jn3rj2k5qicc5l6qi6sj0', 'admin', 'admin', 'NA', '2012-01-04 23:36:35'),
(1339, 'mcv2sk7olrat8mc2f2chgg0aa2', 'sam', 'sam', 'NA', '2012-01-07 22:03:42'),
(1340, 'mcv2sk7olrat8mc2f2chgg0aa2', 'sam', 'sam', 'NA', '2012-01-07 22:03:42'),
(1341, 'mcv2sk7olrat8mc2f2chgg0aa2', 'admin', 'admin', 'NA', '2012-01-07 22:04:20'),
(1342, 'mcv2sk7olrat8mc2f2chgg0aa2', 'admin', 'admin', 'NA', '2012-01-07 22:04:20'),
(1343, 'mcv2sk7olrat8mc2f2chgg0aa2', 'teacher1', 'teacher1', 'NA', '2012-01-07 22:04:47'),
(1344, 'mcv2sk7olrat8mc2f2chgg0aa2', 'teacher1', 'teacher1', 'NA', '2012-01-07 22:04:47'),
(1345, 'mcv2sk7olrat8mc2f2chgg0aa2', 'sam', 'sam', 'NA', '2012-01-07 22:07:16'),
(1346, 'mcv2sk7olrat8mc2f2chgg0aa2', 'sam', 'sam', 'NA', '2012-01-07 22:07:16'),
(1347, 'kh7mplbrk45bpuv2u7bkqerv27', 'admin', 'admin', 'NA', '2012-01-09 12:46:47'),
(1348, 'kh7mplbrk45bpuv2u7bkqerv27', 'admin', 'admin', 'NA', '2012-01-09 12:46:47'),
(1349, 'kh7mplbrk45bpuv2u7bkqerv27', 'admin', 'admin', 'NA', '2012-01-09 12:47:59'),
(1350, 'kh7mplbrk45bpuv2u7bkqerv27', 'admin', 'admin', 'NA', '2012-01-09 12:47:59'),
(1351, 'kh7mplbrk45bpuv2u7bkqerv27', 'teacher1', 'teacher1', 'NA', '2012-01-09 12:53:50'),
(1352, 'kh7mplbrk45bpuv2u7bkqerv27', 'teacher1', 'teacher1', 'NA', '2012-01-09 12:53:50'),
(1353, 'kh7mplbrk45bpuv2u7bkqerv27', 'shiv', 'shivansh', 'NA', '2012-01-09 12:55:22'),
(1354, 'kh7mplbrk45bpuv2u7bkqerv27', 'shiv', 'shivansh', 'NA', '2012-01-09 12:55:22'),
(1355, 'kh7mplbrk45bpuv2u7bkqerv27', 'teacher1', 'teacher1', 'NA', '2012-01-09 12:56:24'),
(1356, 'kh7mplbrk45bpuv2u7bkqerv27', 'teacher1', 'teacher1', 'NA', '2012-01-09 12:56:24'),
(1357, 'kh7mplbrk45bpuv2u7bkqerv27', 'shiv', 'shivansh', 'NA', '2012-01-09 12:57:05'),
(1358, 'kh7mplbrk45bpuv2u7bkqerv27', 'shiv', 'shivansh', 'NA', '2012-01-09 12:57:05'),
(1359, 'kh7mplbrk45bpuv2u7bkqerv27', 'director', 'director', 'NA', '2012-01-09 13:02:03'),
(1360, 'kh7mplbrk45bpuv2u7bkqerv27', 'dean', 'dean', 'NA', '2012-01-09 13:02:18'),
(1361, 'kh7mplbrk45bpuv2u7bkqerv27', 'dean', 'dean', 'NA', '2012-01-09 13:02:18'),
(1362, 'kh7mplbrk45bpuv2u7bkqerv27', 'dean', 'dean', 'NA', '2012-01-09 13:08:01'),
(1363, 'kh7mplbrk45bpuv2u7bkqerv27', 'dean', 'dean', 'NA', '2012-01-09 13:08:01'),
(1364, 'dj58dishb9k4o0mh1kr1n7ne27', 'dean', 'dean', 'NA', '2012-01-09 16:02:37'),
(1365, 'dj58dishb9k4o0mh1kr1n7ne27', 'dean', 'dean', 'NA', '2012-01-09 16:02:37'),
(1366, 'dj58dishb9k4o0mh1kr1n7ne27', 'admin', 'admin', 'NA', '2012-01-09 16:02:53'),
(1367, 'dj58dishb9k4o0mh1kr1n7ne27', 'admin', 'admin', 'NA', '2012-01-09 16:02:53'),
(1368, 'dj58dishb9k4o0mh1kr1n7ne27', 'sam', 'sam', 'NA', '2012-01-09 16:03:08'),
(1369, 'dj58dishb9k4o0mh1kr1n7ne27', 'sam', 'sam', 'NA', '2012-01-09 16:03:08'),
(1370, 'dj58dishb9k4o0mh1kr1n7ne27', 'shiv', 'shivansh', 'NA', '2012-01-09 16:03:21'),
(1371, 'dj58dishb9k4o0mh1kr1n7ne27', 'shiv', 'shivansh', 'NA', '2012-01-09 16:03:21'),
(1372, '2r9u2bi52j0bmqb43c7890kr56', 'dean', 'dean', 'NA', '2012-01-12 16:54:09'),
(1373, '2r9u2bi52j0bmqb43c7890kr56', 'dean', 'dean', 'NA', '2012-01-12 16:54:09'),
(1374, 'sbro4mbg6klk73113mc4018qf7', 'admin', 'admin', 'NA', '2012-01-13 11:09:37'),
(1375, 'sbro4mbg6klk73113mc4018qf7', 'admin', 'admin', 'NA', '2012-01-13 11:09:37'),
(1376, 'ihonacp7vdi1sf48hsfc3lu5s7', 'student1', 'student1', 'NA', '2012-01-13 11:16:43'),
(1377, 'ihonacp7vdi1sf48hsfc3lu5s7', 'sam', 'sam', 'NA', '2012-01-13 11:16:49'),
(1378, 'ihonacp7vdi1sf48hsfc3lu5s7', 'sam', 'sam', 'NA', '2012-01-13 11:16:49'),
(1379, 'ihonacp7vdi1sf48hsfc3lu5s7', 'dean', 'dean', 'NA', '2012-01-13 11:20:08'),
(1380, 'ihonacp7vdi1sf48hsfc3lu5s7', 'dean', 'dean', 'NA', '2012-01-13 11:20:08'),
(1381, 'ihonacp7vdi1sf48hsfc3lu5s7', 'sam1', 'sam', 'NA', '2012-01-13 11:21:43'),
(1382, 'ihonacp7vdi1sf48hsfc3lu5s7', 'sam1', 'sam', 'NA', '2012-01-13 11:21:43'),
(1383, 'ihonacp7vdi1sf48hsfc3lu5s7', 'studen1', 'student1', 'NA', '2012-01-13 11:22:35'),
(1384, 'ihonacp7vdi1sf48hsfc3lu5s7', 'admin', 'admin', 'NA', '2012-01-13 11:22:51'),
(1385, 'ihonacp7vdi1sf48hsfc3lu5s7', 'admin', 'admin', 'NA', '2012-01-13 11:22:51'),
(1386, 'ihonacp7vdi1sf48hsfc3lu5s7', 'studen1', 'student1', 'NA', '2012-01-13 11:23:16'),
(1387, 'ihonacp7vdi1sf48hsfc3lu5s7', 'studen1', 'student1', 'NA', '2012-01-13 11:23:30'),
(1388, 'ihonacp7vdi1sf48hsfc3lu5s7', 'admin', 'admin', 'NA', '2012-01-13 11:23:41'),
(1389, 'ihonacp7vdi1sf48hsfc3lu5s7', 'admin', 'admin', 'NA', '2012-01-13 11:23:41'),
(1390, 'ihonacp7vdi1sf48hsfc3lu5s7', 'student1', 'student1', 'NA', '2012-01-13 11:24:22'),
(1391, 'ihonacp7vdi1sf48hsfc3lu5s7', 'admin', 'admin', 'NA', '2012-01-13 11:25:46'),
(1392, 'ihonacp7vdi1sf48hsfc3lu5s7', 'admin', 'admin', 'NA', '2012-01-13 11:25:46'),
(1393, 'ihonacp7vdi1sf48hsfc3lu5s7', 'shiv', 'shivansh', 'NA', '2012-01-13 11:26:06'),
(1394, 'ihonacp7vdi1sf48hsfc3lu5s7', 'shiv', 'shivansh', 'NA', '2012-01-13 11:26:06'),
(1395, 'ihonacp7vdi1sf48hsfc3lu5s7', 'admin', 'admin', 'NA', '2012-01-13 11:26:21'),
(1396, 'ihonacp7vdi1sf48hsfc3lu5s7', 'admin', 'admin', 'NA', '2012-01-13 11:26:21'),
(1397, 'ihonacp7vdi1sf48hsfc3lu5s7', 'teacher1', 'teacher1', 'NA', '2012-01-13 11:26:49'),
(1398, 'ihonacp7vdi1sf48hsfc3lu5s7', 'teacher1', 'teacher1', 'NA', '2012-01-13 11:26:49'),
(1399, 'ihonacp7vdi1sf48hsfc3lu5s7', 'shiv', 'shivansh', 'NA', '2012-01-13 11:27:01'),
(1400, 'ihonacp7vdi1sf48hsfc3lu5s7', 'shiv', 'shivansh', 'NA', '2012-01-13 11:27:01'),
(1401, 'ihonacp7vdi1sf48hsfc3lu5s7', 'teacher1', 'teacher1', 'NA', '2012-01-13 11:27:22'),
(1402, 'ihonacp7vdi1sf48hsfc3lu5s7', 'teacher1', 'teacher1', 'NA', '2012-01-13 11:27:22'),
(1403, 'ihonacp7vdi1sf48hsfc3lu5s7', 'shiv', 'shivansh', 'NA', '2012-01-13 11:27:36'),
(1404, 'ihonacp7vdi1sf48hsfc3lu5s7', 'shiv', 'shivansh', 'NA', '2012-01-13 11:27:36'),
(1405, 'ihonacp7vdi1sf48hsfc3lu5s7', 'dean', 'dean', 'NA', '2012-01-13 11:28:56'),
(1406, 'ihonacp7vdi1sf48hsfc3lu5s7', 'dean', 'dean', 'NA', '2012-01-13 11:28:56'),
(1407, 'ihonacp7vdi1sf48hsfc3lu5s7', 'teacher1', 'teacher1', 'NA', '2012-01-13 11:30:22'),
(1408, 'ihonacp7vdi1sf48hsfc3lu5s7', 'teacher1', 'teacher1', 'NA', '2012-01-13 11:30:22'),
(1409, 'ihonacp7vdi1sf48hsfc3lu5s7', 'teacher4', 'teacher4', 'NA', '2012-01-13 11:33:03'),
(1410, 'ihonacp7vdi1sf48hsfc3lu5s7', 'teacher4', 'teacher4', 'NA', '2012-01-13 11:33:03'),
(1411, 'ihonacp7vdi1sf48hsfc3lu5s7', 'admin', 'admin', 'NA', '2012-01-13 11:34:13'),
(1412, 'ihonacp7vdi1sf48hsfc3lu5s7', 'admin', 'admin', 'NA', '2012-01-13 11:34:13'),
(1413, 'rrm0700m1hs4gn63c6ssvut233', 'sam', 'sam', 'NA', '2012-01-13 16:19:51'),
(1414, 'rrm0700m1hs4gn63c6ssvut233', 'sam', 'sam', 'NA', '2012-01-13 16:19:51'),
(1415, 'rrm0700m1hs4gn63c6ssvut233', 'admin', 'admin', 'NA', '2012-01-13 16:23:41'),
(1416, 'rrm0700m1hs4gn63c6ssvut233', 'admin', 'admin', 'NA', '2012-01-13 16:23:41'),
(1417, 'rrm0700m1hs4gn63c6ssvut233', 'dean', 'dean', 'NA', '2012-01-13 16:26:04'),
(1418, 'rrm0700m1hs4gn63c6ssvut233', 'dean', 'dean', 'NA', '2012-01-13 16:26:04'),
(1419, '15dnh030fgru0ktquvpod07gv7', 'himalaya', 'mail@iitmandi.a', 'NA', '2012-01-20 09:35:34'),
(1420, '15dnh030fgru0ktquvpod07gv7', 'himalaya', 'mail@iitmandi.a', 'NA', '2012-01-20 09:39:35'),
(1421, '3n667gnt0vuso6h31tcksqrhc3', 'admin', 'admin', 'NA', '2012-01-26 19:34:17'),
(1422, '3n667gnt0vuso6h31tcksqrhc3', 'admin', 'admin', 'NA', '2012-01-26 19:34:17'),
(1423, '3n667gnt0vuso6h31tcksqrhc3', 'dean ', 'dean', 'NA', '2012-01-26 19:34:41'),
(1424, '3n667gnt0vuso6h31tcksqrhc3', 'dean ', 'dean', 'NA', '2012-01-26 19:34:41'),
(1425, '3n667gnt0vuso6h31tcksqrhc3', 'shiv', 'shivansh', 'NA', '2012-01-26 19:34:59'),
(1426, '3n667gnt0vuso6h31tcksqrhc3', 'shiv', 'shivansh', 'NA', '2012-01-26 19:34:59'),
(1427, '3n667gnt0vuso6h31tcksqrhc3', 'student12', 'student12', 'NA', '2012-01-26 19:36:09'),
(1428, '3n667gnt0vuso6h31tcksqrhc3', 'student12', 'student12', 'NA', '2012-01-26 19:36:09'),
(1429, '3n667gnt0vuso6h31tcksqrhc3', 'admin', 'admin', 'NA', '2012-01-26 19:36:44'),
(1430, '3n667gnt0vuso6h31tcksqrhc3', 'admin', 'admin', 'NA', '2012-01-26 19:36:44'),
(1431, '3n667gnt0vuso6h31tcksqrhc3', 'teacher3', 'teacher3', 'NA', '2012-01-26 19:37:25'),
(1432, '3n667gnt0vuso6h31tcksqrhc3', 'teacher1', 'teacher1', 'NA', '2012-01-26 19:37:34'),
(1433, '3n667gnt0vuso6h31tcksqrhc3', 'teacher1', 'teacher1', 'NA', '2012-01-26 19:37:34'),
(1434, 'e8hifhfufejeg38dhbgcrbmu03', 'sam', 'sam', 'NA', '2012-02-06 10:39:22'),
(1435, 'e8hifhfufejeg38dhbgcrbmu03', 'sam', 'sam', 'NA', '2012-02-06 10:39:22'),
(1436, 'e8hifhfufejeg38dhbgcrbmu03', 'admin', 'admin', 'NA', '2012-02-06 10:39:50'),
(1437, 'e8hifhfufejeg38dhbgcrbmu03', 'admin', 'admin', 'NA', '2012-02-06 10:39:50'),
(1438, 'ruoj6r4l14ms5e6chfe4mk3t87', 'sam', 'sam', 'NA', '2012-03-09 17:11:33'),
(1439, 'ruoj6r4l14ms5e6chfe4mk3t87', 'sam', 'sam', 'NA', '2012-03-09 17:11:33'),
(1440, 'ruoj6r4l14ms5e6chfe4mk3t87', 'admin', 'admin', 'NA', '2012-03-09 17:13:14'),
(1441, 'ruoj6r4l14ms5e6chfe4mk3t87', 'admin', 'admin', 'NA', '2012-03-09 17:13:14'),
(1442, 'ruoj6r4l14ms5e6chfe4mk3t87', 'sam', 'sam', 'NA', '2012-03-09 17:15:41'),
(1443, 'ruoj6r4l14ms5e6chfe4mk3t87', 'sam', 'sam', 'NA', '2012-03-09 17:15:41'),
(1444, 'ruoj6r4l14ms5e6chfe4mk3t87', 'dean', 'dean', 'NA', '2012-03-09 17:19:04'),
(1445, 'ruoj6r4l14ms5e6chfe4mk3t87', 'dean', 'dean', 'NA', '2012-03-09 17:19:04'),
(1446, 'k4um65e8s8je86b588ce2vgh52', 'sam', 'sam', 'NA', '2012-03-12 14:00:15'),
(1447, 'k4um65e8s8je86b588ce2vgh52', 'sam', 'sam', 'NA', '2012-03-12 14:00:15'),
(1448, 'k4um65e8s8je86b588ce2vgh52', 'sam', 'sam', 'NA', '2012-03-12 14:03:40'),
(1449, 'k4um65e8s8je86b588ce2vgh52', 'sam', 'sam', 'NA', '2012-03-12 14:03:40'),
(1450, 'k4um65e8s8je86b588ce2vgh52', 'dean', 'dean', 'NA', '2012-03-12 14:03:48'),
(1451, 'k4um65e8s8je86b588ce2vgh52', 'dean', 'dean', 'NA', '2012-03-12 14:03:48'),
(1452, 'k4um65e8s8je86b588ce2vgh52', 'sam', 'sam', 'NA', '2012-03-12 14:03:58'),
(1453, 'k4um65e8s8je86b588ce2vgh52', 'sam', 'sam', 'NA', '2012-03-12 14:03:58'),
(1454, 'k4um65e8s8je86b588ce2vgh52', 'dean', 'DEAN', 'NA', '2012-03-12 14:08:53'),
(1455, 'k4um65e8s8je86b588ce2vgh52', 'dean', 'dean', 'NA', '2012-03-12 14:09:06'),
(1456, 'k4um65e8s8je86b588ce2vgh52', 'dean', 'dean', 'NA', '2012-03-12 14:09:06'),
(1457, 'k4um65e8s8je86b588ce2vgh52', 'admin', 'admin', 'NA', '2012-03-12 14:09:16'),
(1458, 'k4um65e8s8je86b588ce2vgh52', 'admin', 'admin', 'NA', '2012-03-12 14:09:16'),
(1459, 'k4um65e8s8je86b588ce2vgh52', 'sam', 'sam', 'NA', '2012-03-12 14:09:43'),
(1460, 'k4um65e8s8je86b588ce2vgh52', 'sam', 'sam', 'NA', '2012-03-12 14:09:43'),
(1461, 'k4um65e8s8je86b588ce2vgh52', 'admin', 'admin', 'NA', '2012-03-12 14:10:45'),
(1462, 'k4um65e8s8je86b588ce2vgh52', 'admin', 'admin', 'NA', '2012-03-12 14:10:45'),
(1463, 'ql1mmr4al8l3pr3c243kpe2pb0', 'admin', 'admin', 'NA', '2012-03-12 15:22:07'),
(1464, 'ql1mmr4al8l3pr3c243kpe2pb0', 'admin', 'admin', 'NA', '2012-03-12 15:22:07'),
(1465, '3r23ronj24u904v4i0k48g85l2', 'admin', 'admin', 'NA', '2012-03-15 14:30:08'),
(1466, '3r23ronj24u904v4i0k48g85l2', 'sam', 'samrat', 'NA', '2012-03-15 14:30:17'),
(1467, '3r23ronj24u904v4i0k48g85l2', 'kirti', 'kirti', 'NA', '2012-03-15 14:31:18'),
(1468, '3r23ronj24u904v4i0k48g85l2', 'kirti', 'kirti', 'NA', '2012-03-15 14:31:41'),
(1469, '3r23ronj24u904v4i0k48g85l2', 'kirti', 'kirti', 'NA', '2012-03-15 14:32:31'),
(1470, 'fo8q2ivh598770dokhj2vlctl2', 'admin', 'admin', 'NA', '2012-03-15 14:48:34'),
(1471, 'fo8q2ivh598770dokhj2vlctl2', 'kirti', 'kirti', 'NA', '2012-03-15 14:48:40'),
(1472, 'fo8q2ivh598770dokhj2vlctl2', 'sam', 'sam', 'NA', '2012-03-15 15:06:22'),
(1473, 'fo8q2ivh598770dokhj2vlctl2', 'sam', 'sam', 'NA', '2012-03-15 15:06:22'),
(1474, 'fo8q2ivh598770dokhj2vlctl2', 'abbas', 'abbas', 'NA', '2012-03-15 15:26:54'),
(1475, 'fo8q2ivh598770dokhj2vlctl2', 'abbas', 'abbas', 'NA', '2012-03-15 15:27:10'),
(1476, 'fo8q2ivh598770dokhj2vlctl2', 'abbas', 'abbas', 'NA', '2012-03-15 15:27:53'),
(1477, 'fo8q2ivh598770dokhj2vlctl2', 'kirti', 'kirti', 'NA', '2012-03-15 15:29:06'),
(1478, 'fo8q2ivh598770dokhj2vlctl2', 'kirti', 'kirti', 'NA', '2012-03-15 15:30:04'),
(1479, 'sviu834dft4f09rbsl9a72b521', 'admin', 'admin', 'NA', '2012-03-16 16:22:19'),
(1480, 'sviu834dft4f09rbsl9a72b521', 'abbas', 'abbas', 'NA', '2012-03-16 16:27:28'),
(1481, 'sviu834dft4f09rbsl9a72b521', 'abbas', 'abbas', 'NA', '2012-03-16 16:28:15'),
(1482, 'sviu834dft4f09rbsl9a72b521', 'abbas', 'abbas', 'NA', '2012-03-16 16:28:15'),
(1483, '9uon3imah4jecvvgvgovp2ap83', 'admin', 'admin', 'NA', '2012-03-20 12:59:23'),
(1484, '9uon3imah4jecvvgvgovp2ap83', 'admin', 'admin', 'NA', '2012-03-20 12:59:23'),
(1485, '9uon3imah4jecvvgvgovp2ap83', 'admin', 'admin', 'NA', '2012-03-20 14:52:12'),
(1486, '9uon3imah4jecvvgvgovp2ap83', 'admin', 'admin', 'NA', '2012-03-20 14:52:12'),
(1487, '9uon3imah4jecvvgvgovp2ap83', 'admin', 'admin', 'NA', '2012-03-20 15:07:30'),
(1488, '9uon3imah4jecvvgvgovp2ap83', 'admin', 'admin', 'NA', '2012-03-20 15:07:30'),
(1489, '9uon3imah4jecvvgvgovp2ap83', 'admin', 'admin', 'NA', '2012-03-20 15:23:14'),
(1490, '9uon3imah4jecvvgvgovp2ap83', 'admin', 'admin', 'NA', '2012-03-20 15:23:14'),
(1491, '9uon3imah4jecvvgvgovp2ap83', 'admin', 'admin', 'NA', '2012-03-20 15:33:19'),
(1492, '9uon3imah4jecvvgvgovp2ap83', 'admin', 'admin', 'NA', '2012-03-20 15:33:19'),
(1493, 'u2devm2j99amtbp7gtmk7bfc80', 'admin', 'admin', 'NA', '2012-03-21 11:31:46'),
(1494, 'u2devm2j99amtbp7gtmk7bfc80', 'admin', 'admin', 'NA', '2012-03-21 11:31:46'),
(1495, 'tj0voobpclobpl9399ud8gpv83', 'admin', 'admin', 'NA', '2012-03-21 11:55:54'),
(1496, 'tj0voobpclobpl9399ud8gpv83', 'admin', 'admin', 'NA', '2012-03-21 11:55:54'),
(1497, 'tj0voobpclobpl9399ud8gpv83', 'admin', 'admin', 'NA', '2012-03-21 12:19:48'),
(1498, 'tj0voobpclobpl9399ud8gpv83', 'admin', 'admin', 'NA', '2012-03-21 12:19:48'),
(1499, 'tj0voobpclobpl9399ud8gpv83', 'admin', 'admin', 'NA', '2012-03-21 13:04:29'),
(1500, 'tj0voobpclobpl9399ud8gpv83', 'admin', 'admin', 'NA', '2012-03-21 13:04:29'),
(1501, 'opt19dlepbi0rfb1eqo1rqekc4', 'admin', 'admin', 'NA', '2012-03-21 15:45:55'),
(1502, 'opt19dlepbi0rfb1eqo1rqekc4', 'admin', 'admin', 'NA', '2012-03-21 15:45:55');

-- --------------------------------------------------------

--
-- Table structure for table `crc_states`
--

CREATE TABLE IF NOT EXISTS `crc_states` (
  `state_id` int(11) NOT NULL AUTO_INCREMENT,
  `state_name` varchar(50) NOT NULL DEFAULT '',
  `state_desc` text NOT NULL,
  PRIMARY KEY (`state_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `crc_states`
--


-- --------------------------------------------------------

--
-- Table structure for table `crc_student_schedule`
--

CREATE TABLE IF NOT EXISTS `crc_student_schedule` (
  `student_schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_schedule_profile_id` int(11) NOT NULL DEFAULT '0',
  `student_schedule_schedule_id` int(11) NOT NULL DEFAULT '0',
  `student_schedule_paid` char(1) NOT NULL DEFAULT 'U',
  `student_schedule_amount` int(11) NOT NULL DEFAULT '0',
  `student_schedule_questions` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`student_schedule_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=68 ;

--
-- Dumping data for table `crc_student_schedule`
--


-- --------------------------------------------------------

--
-- Table structure for table `crc_teacher_schedule`
--

CREATE TABLE IF NOT EXISTS `crc_teacher_schedule` (
  `teacher_schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_schedule_profile_id` int(11) NOT NULL DEFAULT '0',
  `teacher_schedule_schedule_id` int(11) NOT NULL DEFAULT '0',
  `teacher_schedule_evaluation` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`teacher_schedule_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=104 ;

--
-- Dumping data for table `crc_teacher_schedule`
--

INSERT INTO `crc_teacher_schedule` (`teacher_schedule_id`, `teacher_schedule_profile_id`, `teacher_schedule_schedule_id`, `teacher_schedule_evaluation`) VALUES
(1, 1, 1, 0),
(2, 2, 2, 0),
(57, 23, 4, 0),
(56, 3, 4, 0),
(60, 6, 7, 0),
(59, 5, 6, 0),
(7, 7, 7, 0),
(8, 8, 8, 0),
(9, 9, 9, 0),
(62, 9, 10, 0),
(64, 11, 12, 0),
(65, 11, 13, 0),
(66, 12, 13, 0),
(67, 13, 14, 0),
(68, 14, 15, 0),
(69, 15, 16, 0),
(71, 16, 18, 0),
(73, 18, 19, 0),
(74, 19, 20, 0),
(76, 21, 22, 0),
(75, 20, 21, 0),
(79, 24, 25, 0),
(77, 9, 23, 0),
(78, 22, 24, 0),
(80, 23, 27, 0),
(26, 26, 26, 0),
(82, 26, 29, 0),
(81, 25, 28, 0),
(85, 14, 32, 0),
(83, 27, 30, 0),
(84, 28, 31, 0),
(89, 15, 36, 0),
(86, 5, 33, 0),
(87, 29, 34, 0),
(88, 7, 35, 0),
(90, 17, 37, 0),
(91, 30, 39, 0),
(38, 38, 38, 0),
(39, 39, 39, 0),
(40, 40, 40, 0),
(41, 41, 41, 0),
(42, 42, 42, 0),
(43, 43, 43, 0),
(44, 44, 44, 0),
(45, 45, 45, 0),
(46, 46, 46, 0),
(47, 47, 47, 0),
(48, 48, 48, 0),
(49, 49, 49, 0),
(50, 50, 50, 0),
(51, 51, 51, 0),
(52, 52, 52, 0),
(53, 53, 53, 0),
(54, 54, 54, 0),
(55, 2, 3, 0),
(58, 4, 5, 0),
(61, 37, 7, 0),
(63, 10, 11, 0),
(70, 16, 17, 0),
(72, 17, 18, 0),
(92, 31, 40, 0),
(93, 32, 41, 0),
(94, 21, 42, 0),
(95, 33, 45, 0),
(96, 34, 46, 0),
(97, 35, 48, 0),
(98, 2, 49, 0),
(99, 24, 51, 0),
(100, 12, 52, 0),
(101, 11, 53, 0),
(102, 12, 53, 0),
(103, 36, 54, 0);

-- --------------------------------------------------------

--
-- Table structure for table `crc_venue`
--

CREATE TABLE IF NOT EXISTS `crc_venue` (
  `venue_id` int(11) NOT NULL AUTO_INCREMENT,
  `venue_name` varchar(100) NOT NULL DEFAULT '',
  `venue_desc` varchar(100) NOT NULL DEFAULT '',
  `venue_shortname` varchar(8) NOT NULL DEFAULT '',
  PRIMARY KEY (`venue_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `crc_venue`
--


-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE IF NOT EXISTS `enrollments` (
  `enrollment_id` int(7) NOT NULL AUTO_INCREMENT,
  `student_profile_id` int(7) DEFAULT NULL,
  `course_id` int(5) DEFAULT NULL,
  `approved` tinyint(1) DEFAULT '0',
  `feedback_status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`enrollment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `enrollments`
--


-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE IF NOT EXISTS `profiles` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=410 ;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`profile_id`, `profile_uid`, `profile_pwd`, `profile_enrollno`, `profile_name`, `profile_email`, `profile_dob`, `profile_gender`, `profile_role_id`, `profile_active`, `profile_date`) VALUES
(1, 'abbas', '', '', 'Dr. Syed Abbas', 'abbas@iitmandi.ac.in', '2010-01-01', 'M', 2, 1, '0000-00-00 00:00:00'),
(2, 'arvindj', '', '', 'Dr. Arvind Jain', 'arvindj@iitmandi.ac.in', '2010-01-01', 'M', 2, 1, '0000-00-00 00:00:00'),
(3, 'sanjeev', '', '', 'Dr. Sanjeev Manhas ', 'samanfec@iitmandi.ac.in', '2012-01-01', 'M', 2, 1, '0000-00-00 00:00:00'),
(4, 'kishan', '', '', 'Dr. Anil P Kishan', 'kishan@iitmandi.ac.in', '2012-01-01', 'M', 2, 1, '0000-00-00 00:00:00'),
(5, 'tag', '', '', 'Prof. T. A. Gonsalves', 'tag@iitmandi.ac.in', '2013-01-01', 'M', 2, 1, '0000-00-00 00:00:00'),
(6, 'ravi', '', '', 'Dr. P. C. RaviKumar', 'ravi@iitmandi.ac.in', '2014-01-01', 'M', 2, 1, '0000-00-00 00:00:00'),
(7, 'sukumar', '', '', 'Dr.SukumarBhattacharya', 'sukumar@iitmandi.ac.in', '2015-01-01', 'M', 2, 1, '0000-00-00 00:00:00'),
(8, 'suman.sigroha', '', '', 'Dr. Suman Sigroha', 'suman.sigroha@iitmandi.ac.in', '2016-01-01', 'F', 2, 1, '0000-00-00 00:00:00'),
(9, 'bs', '', '', 'Dr. Subramanian', 'bs@iitmandi.ac.in', '2017-01-01', 'M', 2, 1, '0000-00-00 00:00:00'),
(10, 'bettina', '', '', 'Dr. Bettina Knopp', 'bettina@iitmandi.ac.in', '2018-01-01', 'F', 2, 1, '0000-00-00 00:00:00'),
(11, 'genemala', '', '', 'Dr. Genemala H', 'genemala@iitmandi.ac.in', '2019-01-01', 'F', 2, 1, '0000-00-00 00:00:00'),
(12, 'traptij', '', '', 'Dr. Tripati Jain', 'traptij@iitmandi.ac.in', '2020-01-01', 'F', 2, 1, '0000-00-00 00:00:00'),
(13, 'sarita', '', '', 'Dr. Sarita Azad', 'sarita@iitmandi.ac.in', '2021-01-01', 'F', 2, 1, '0000-00-00 00:00:00'),
(14, 'rajeev', '', '', 'Dr. Rajeev Kumar', 'rajeev@iitmandi.ac.in', '2022-01-01', 'M', 2, 1, '0000-00-00 00:00:00'),
(15, 'gagan', '', '', 'Dr. Gagan Garg', 'gagan@iitmandi.ac.in', '2023-01-01', 'M', 2, 1, '0000-00-00 00:00:00'),
(16, 'arti', '', '', 'Dr. Aarti Kashyap', 'arti@iitmandi.ac.in', '2024-01-01', 'F', 2, 1, '0000-00-00 00:00:00'),
(17, 'anand', '', '', 'Dr. Anand Srivastava', 'anand@iitmandi.ac.in', '2025-01-01', 'M', 2, 1, '0000-00-00 00:00:00'),
(18, 'nitu', '', '', 'Dr. Nitu Kumari', 'nitu@iitmandi.ac.in', '2026-01-01', 'F', 2, 1, '0000-00-00 00:00:00'),
(19, 'ramna', '', '', 'Dr. RDT', 'ramna@iitmandi.ac.in', '2027-01-01', 'M', 2, 1, '0000-00-00 00:00:00'),
(20, 'shail', '', '', 'Dr. Shail Shankar', 'shail@iitmandi.ac.in', '2028-01-01', 'M', 2, 1, '0000-00-00 00:00:00'),
(21, 'ashok', '', '', 'Dr. Ashok', 'ashok@iitmandi.ac.in', '2029-01-01', 'M', 2, 1, '0000-00-00 00:00:00'),
(22, 'manu', '', '', 'Dr. ManuD', 'manu@iitmandi.ac.in', '2030-01-01', 'M', 2, 1, '0000-00-00 00:00:00'),
(23, 'bsr', '', '', 'Dr. Bharat S Rajpurohit', 'bsr@iitmandi.ac.in', '2031-01-01', 'M', 2, 1, '0000-00-00 00:00:00'),
(24, 'anil', '', '', 'Dr. Anil K Sao', 'anil@iitmandi.ac.in', '2032-01-01', 'M', 2, 1, '0000-00-00 00:00:00'),
(25, 'bnb', '', '', 'Dr. B. N. Banerjee', 'bnb@iitmandi.ac.in', '2033-01-01', 'M', 2, 1, '0000-00-00 00:00:00'),
(26, 'ankit', '', '', 'Dr. Ankit Bansal', 'ankit@iitmandi.ac.in', '2034-01-01', 'M', 2, 1, '0000-00-00 00:00:00'),
(27, 'vsc', '', '', 'Dr. Vishal S Chauhan', 'vsc@iitmandi.ac.in', '2035-01-01', 'M', 2, 1, '0000-00-00 00:00:00'),
(28, 'akansha', '', '', 'Dr. Akansha Dwivedi', 'akansha@iitmandi.ac.in', '2036-01-01', 'F', 2, 1, '0000-00-00 00:00:00'),
(29, 'subrata', '', '', 'Dr. Subrata Ghosh', 'subrata@iitmandi.ac.in', '2037-01-01', 'M', 2, 1, '0000-00-00 00:00:00'),
(30, 'manoj', '', '', 'Dr. Manoj Thakur', 'manoj@iitmandi.ac.in', '2038-01-01', 'M', 2, 1, '0000-00-00 00:00:00'),
(31, 'achakraborty', '', '', 'Dr. A. Chakraborty', 'achakraborty@iitmandi.ac.in', '2039-01-01', 'M', 2, 1, '0000-00-00 00:00:00'),
(32, 'suman', '', '', 'Dr. Suman Kalyan Pal', 'suman@iitmandi.ac.in', '2040-01-01', 'M', 2, 1, '0000-00-00 00:00:00'),
(33, 'rahul', '', '', 'Dr. Rahul Vaish', 'rahul@iitmandi.ac.in', '2041-01-01', 'M', 2, 1, '0000-00-00 00:00:00'),
(34, 'niraj', '', '', 'Dr. Niraj Sinha', 'niraj@iitmandi.ac.in', '2042-01-01', 'M', 2, 1, '0000-00-00 00:00:00'),
(35, 'barathram', '', '', 'Dr. R. Barathram', 'barathram@iitmandi.ac.in', '2043-01-01', 'M', 2, 1, '0000-00-00 00:00:00'),
(36, 'om', '', '', 'Dr. Om Prakash Singh', 'om@iitmandi.ac.in', '2044-01-01', 'M', 2, 1, '0000-00-00 00:00:00'),
(70, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', '', '', 'admin', '2010-01-01', 'M', 1, 1, '2012-03-20 12:58:54'),
(37, 'prasanth', '', '', 'Dr. Prasanth P. Jose ', 'prasanth @iitmandi.ac.in', '2044-01-01', 'M', 2, 1, '0000-00-00 00:00:00'),
(40, ' aman_kumar', ' ', 'B09003 ', ' AMAN ', ' aman_kumar@students.iitmandi.ac.in ', '0000-00-00', ' ', 3, 1, '0000-00-00 00:00:00'),
(41, ' amanjot_kaur ', '', 'B09004 ', ' AMANJOT KAUR ', ' amanjot_kaur@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(42, ' amit_s ', '', 'B09005 ', ' AMIT KUMAR SWAMI ', ' amit_s@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(43, ' anurag_arora ', '', 'B09006 ', ' ANURAG ARORA ', ' anurag_arora@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(44, ' ashish_gupta ', '', 'B09007 ', ' ASHISH GUPTA ', ' ashish_gupta@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(45, ' ashish_kumar_gupta ', '', 'B09008 ', ' ASHISH KUMAR GUPTA ', ' ashish_kumar_gupta@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(46, ' devinder_yadav ', '', 'B09009 ', ' DEVINDER YADAV ', ' devinder_yadav@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(47, ' divya_d ', '', 'B09010 ', ' DIVYA ', ' divya_d@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(48, ' gavale_samrat ', '', 'B09011 ', ' GAVALE SAMRAT BALASAHEB ', ' gavale_samrat@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(49, ' harshul_jain ', '', 'B09012 ', ' HARSHUL JAIN ', ' harshul_jain@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(50, ' himani_gaugna ', '', 'B09013 ', ' HIMANI GAUGNA ', ' himani_gaugna@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(51, ' jinka_sai_sagar ', '', 'B09014 ', ' JINKA SAI SAGAR ', ' jinka_sai_sagar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(52, ' jitesh_s ', '', 'B09015 ', ' JITESH SHARMA ', ' jitesh_s@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(53, ' k_s ', '', 'B09016 ', ' K SAI SRINIVAS ', ' k_s@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(54, ' karampudi_ramakrishna ', '', 'B09017 ', ' KARAMPUDI RAMAKRISHNA REDDY ', ' karampudi_ramakrishna@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(55, ' naresh_kumar ', '', 'B09018', ' NARESH KUMAR ', ' naresh_kumar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(56, ' neeraj_kumar ', '', 'B09019 ', ' NEERAJ KUMAR JHINGONIYA ', ' neeraj_kumar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(57, ' nikhil_kumar ', '', 'B09020 ', ' NIKHIL KUMAR GUPTA ', ' nikhil_kumar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(58, ' p_sharma ', '', 'B09022 ', ' PANKAJ SHARMA ', ' p_sharma@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(59, ' pranav_kapoor ', '', 'B09023 ', ' PRANAV KAPOOR ', ' pranav_kapoor@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(60, ' rahul_jain ', '', 'B09024 ', ' RAHUL JAIN ', ' rahul_jain@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(61, ' raj_s ', '', 'B09025 ', ' RAJ KAMAL SINGH ', ' raj_s@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(62, ' ratala_rajeswari ', '', 'B09026 ', ' RATALA RAJESWARI ', ' ratala_rajeswari@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(63, ' shekhar_s ', '', 'B09027 ', ' SHEKHAR ', ' shekhar_s@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(64, ' soma_banik ', '', 'B09028 ', ' SOMA BANIK ', ' soma_banik@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(65, ' sravan_t ', '', 'B09029 ', ' SRAVAN TALLURI ', ' sravan_t@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(66, ' sumeet_singh ', '', 'B09030 ', ' SUMEET SINGH ARORA ', ' sumeet_singh@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(67, ' suyash_taneja ', '', 'B09031 ', ' SUYASH TANEJA ', ' suyash_taneja@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(68, ' vaibhav_agarwal ', '', 'B09032 ', ' VAIBHAV AGARWAL ', ' vaibhav_agarwal@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(69, ' yugdeep_b ', '', 'B09033 ', ' YUGDEEP BANGAR ', ' yugdeep_b@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(71, ' basava_k ', '', 'B09034 ', ' BASAVA RAJU KANAPARTHI ', ' basava_k@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(72, ' devang_moyal ', '', 'B09035 ', ' DEVANG MOYAL ', ' devang_moyal@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(73, ' nishant_goyal ', '', 'B09036 ', ' NISHANT GOYAL ', ' nishant_goyal@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(74, ' shekhar_agarwal ', '', 'B09037 ', ' SHEKHAR AGARWAL ', ' shekhar_agarwal@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(75, ' aaditya_goyal ', '', 'B09051 ', ' AADITYA GOYAL ', ' aaditya_goyal@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(76, ' akhalesh_kumar ', '', 'B09052 ', ' AKHALESH KUMAR ', ' akhalesh_kumar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(77, ' amit_kumar ', '', 'B09053 ', ' AMIT KUMAR ', ' amit_kumar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(78, ' anshay_agarwal ', '', 'B09054 ', ' ANSHAY AGARWAL ', ' anshay_agarwal@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(79, ' choppala_a ', '', 'B09055 ', ' CHOPPALA VENKATA ANUDEEP ', ' choppala_a@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(80, ' d_sreekanth ', '', 'B09056 ', ' DAMA SREEKANTH ', ' d_sreekanth@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(81, ' dhruv_parmar ', '', 'B09057 ', ' DHRUV PARMAR ', ' dhruv_parmar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(82, ' geetha_sravya ', '', 'B09058 ', ' GEETHA SRAVYA ANNAVARAPU ', ' geetha_sravya@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(83, ' i_yaswanth_kumar ', '', 'B09059 ', ' I YASWANTH KUMAR ', ' i_yaswanth_kumar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(84, ' ishansh_singh ', '', 'B09060 ', ' ISHANSH SINGH ', ' ishansh_singh@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(85, ' k_manohar ', '', 'B09061 ', ' KANAPAKA MANOHAR ', ' k_manohar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(86, ' kanhaiya_mishra ', '', 'B09062 ', ' KANHAIYA MISHRA ', ' kanhaiya_mishra@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(87, ' kuldeep_purohit ', '', 'B09063 ', ' KULDEEP PUROHIT ', ' kuldeep_purohit@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(88, ' kumod_kumar ', '', 'B09064 ', ' KUMOD KUMAR GUPTA ', ' kumod_kumar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(89, ' manish_jhingoniya ', '', 'B09065 ', ' MANISH JHINGONIYA ', ' manish_jhingoniya@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(90, ' mohit_kumar_malhotra ', '', 'B09066 ', ' MOHIT KUMAR MALHOTRA ', ' mohit_kumar_malhotra@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(91, ' nikhil_kandoi ', '', 'B09067 ', ' NIKHIL KANDOI ', ' nikhil_kandoi@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(92, ' nikki_kumar ', '', 'B09068 ', ' NIKKI KUMAR ', ' nikki_kumar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(93, ' saurabh_jain ', '', 'B09069 ', ' SAURABH JAIN ', ' saurabh_jain@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(94, ' shammas_m ', '', 'B09070 ', ' SHAMMAS MOHYADDIN ', ' shammas_m@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(95, ' siddhant_malik ', '', 'B09071 ', ' SIDDHANT MALIK ', ' siddhant_malik@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(96, ' suket_mehtani ', '', 'B09072 ', ' SUKET ', ' suket_mehtani@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(97, ' s_yadav ', '', 'B09073 ', ' SUNANDA YADAV ', ' s_yadav@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(98, ' uday_mittal ', '', 'B09074 ', ' UDAY MITTAL ', ' uday_mittal@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(99, ' v_vignesh ', '', 'B09075 ', ' V VIGNESH ', ' v_vignesh@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(100, ' bodduna_rahul ', '', 'B09076 ', ' BODDUNA RAHUL ', ' bodduna_rahul@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(101, ' chandan_kumar ', '', 'B09077 ', ' CHANDAN ', ' chandan_kumar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(102, ' chinmay_bhagat ', '', 'B09078 ', ' CHINMAY DUSHYANT BHAGAT ', ' chinmay_bhagat@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(103, ' k_roshni ', '', 'B09079 ', ' KARYAMSETTI ROSHNI ', ' k_roshni@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(104, ' kulkarni_akshay ', '', 'B09080 ', ' KULKARNI AKSHAY JAYANT ', ' kulkarni_akshay@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(105, ' mahesh_kumawat ', '', 'B09081 ', ' MAHESH KUMAWAT ', ' mahesh_kumawat@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(106, ' bhanu_prakash ', '', 'B09082 ', ' BHANU PRAKASH ', ' bhanu_prakash@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(107, ' puneet_saini ', '', 'B09083 ', ' PUNEET SAINI ', ' puneet_saini@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(108, ' shubham_gupta ', '', 'B09084 ', ' SHUBHAM GUPTA ', ' shubham_gupta@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(109, ' sunil_khatri ', '', 'B09085 ', ' SUNIL ', ' sunil_khatri@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(110, ' deepanshu_rastogi ', '', 'B09086 ', ' DEEPANSHU RASTOGI ', ' deepanshu_rastogi@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(111, ' saurabh_saroye ', '', 'B09087 ', ' SAURABH SAROYE ', ' saurabh_saroye@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(112, ' ankur_nahar ', '', 'B09101 ', ' ANKUR NAHAR ', ' ankur_nahar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(113, ' ankush_singla ', '', 'B09102 ', ' ANKUSH SINGLA ', ' ankush_singla@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(114, ' anurag_jakhotia ', '', 'B09103 ', ' ANURAG JAKHOTIA ', ' anurag_jakhotia@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(115, ' chemuduru_sreeram ', '', 'B09104 ', ' CHEMUDURU SREERAM ', ' chemuduru_sreeram@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(116, ' gaurav_yadav ', '', 'B09105 ', ' GAURAV YADAV ', ' gaurav_yadav@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(117, ' guntreddi_prudhvi_raj ', '', 'B09106 ', ' GUNTREDDI PRUDHVI RAJ ', ' guntreddi_prudhvi_raj@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(118, ' m_pramodhdev ', '', 'B09107 ', ' M PRAMODHDEV JAYANTH ', ' m_pramodhdev@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(119, ' manish_shankaram ', '', 'B09108 ', ' MANISH SHANKARAM ', ' manish_shankaram@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(120, ' nikhil_chhabra ', '', 'B09109 ', ' NIKHIL CHHABRA ', ' nikhil_chhabra@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(121, ' priyank_b_patel ', '', 'B09110 ', ' PRIYANK B PATEL ', ' priyank_b_patel@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(122, ' puli_samanth ', '', 'B09111 ', ' PULI SAMANTH KUMAR REDDY ', ' puli_samanth@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(123, ' ranjan_narayan ', '', 'B09112 ', ' RANJAN ', ' ranjan_narayan@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(124, ' s_vijay_rahul ', '', 'B09113 ', ' S VIJAY RAHUL RAJ ', ' s_vijay_rahul@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(125, ' sachin_singhal ', '', 'B09114 ', ' SACHIN SINGHAL ', ' sachin_singhal@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(126, ' saksham_grover ', '', 'B09115 ', ' SAKSHAM GROVER ', ' saksham_grover@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(127, ' subik_kumar ', '', 'B09117 ', ' SUBIK KUMAR ', ' subik_kumar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(128, ' sunil_chaudhary ', '', 'B09118 ', ' SUNIL CHAUDHARY ', ' sunil_chaudhary@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(129, ' thorat_vijay ', '', 'B09119 ', ' THORAT VIJAY GANESH ', ' thorat_vijay@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(130, ' vaka_praveen ', '', 'B09120 ', ' VAKA PRAVEEN ', ' vaka_praveen@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(131, ' v_teja ', '', 'B09121 ', ' VANTEDDU TEJA ', ' v_teja@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(132, ' mrinmoy_biswas ', '', 'B09122 ', ' MRINMOY BISWAS ', ' mrinmoy_biswas@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(133, ' r_shyam_sundar ', '', 'B09123 ', ' R SHYAM SUNDAR ', ' r_shyam_sundar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(134, ' rohit_raut ', '', 'B09124 ', ' ROHIT RAUT ', ' rohit_raut@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(135, ' abhra_basak ', '', 'B10001 ', ' ABHRA BASAK ', ' abhra_basak@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(136, ' ajay_k ', '', 'B10002 ', ' AJAY KUMAR ', ' ajay_k@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(137, ' aman_agrawal ', '', 'B10003 ', ' AMAN AGRAWAL ', ' aman_agrawal@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(138, ' antra_grover ', '', 'B10004 ', ' ANTRA ', ' antra_grover@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(139, ' a_kumar ', '', 'B10005 ', ' Apoorva Kumar ', ' a_kumar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(140, ' ashish_mahaver ', '', 'B10006 ', ' ASHISH MAHAVER ', ' ashish_mahaver@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(141, ' ashish_singh ', '', 'B10007 ', ' ASHISH SINGH ', ' ashish_singh@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(142, ' ashwini_kumar_dautaniya ', '', 'B10008 ', ' ASHWINI KUMAR DAUTANIYA ', ' ashwini_kumar_dautaniya@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(143, ' badavath_sampath_kumar ', '', 'B10009 ', ' BADAVATH SAMPATH KUMAR ', ' badavath_sampath_kumar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(144, ' boga_saikiran ', '', 'B10010 ', ' BOGA SAIKIRAN ', ' boga_saikiran@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(145, ' divya_goyal ', '', 'B10011 ', ' DIVYA GOYAL ', ' divya_goyal@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(146, ' gaurav_chaudhary ', '', 'B10012 ', ' GAURAV CHAUDHARY ', ' gaurav_chaudhary@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(147, ' amit_gore ', '', 'B10013 ', ' AMIT GORE ', ' amit_gore@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(148, ' himanshu_dewan ', '', 'B10014 ', ' HIMANSHU DEWAN ', ' himanshu_dewan@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(149, ' aakash_s_hingu ', '', 'B10015 ', ' AAKASH S HINGU ', ' aakash_s_hingu@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(150, ' jai_prakash ', '', 'B10016 ', ' JAI PRAKASH ', ' jai_prakash@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(151, ' jitendra_prasad ', '', 'B10017 ', ' JITENDRA PRASAD KEER ', ' jitendra_prasad@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(152, ' k_saithe_josh ', '', 'B10018 ', ' K SAITHE JOSH ', ' k_saithe_josh@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(153, ' khushali_modi ', '', 'B10019 ', ' KHUSHALI MODI ', ' khushali_modi@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(154, ' lonkar_nikhil ', '', 'B10020 ', ' LONKAR NIKHIL NANDKUMAR ', ' lonkar_nikhil@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(155, ' mahesh_yadav ', '', 'B10021 ', ' MAHESH YADAV ', ' mahesh_yadav@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(156, ' manav_agarwal ', '', 'B10022 ', ' MANAV AGARWAL ', ' manav_agarwal@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(157, ' nandini_kapoor_kapoor ', '', 'B10023 ', ' NANDINI KAPOOR ', ' nandini_kapoor_kapoor@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(158, ' n_kumar ', '', 'B10024 ', ' NEERAJ KUMAR ', ' n_kumar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(159, ' p_vihari ', '', 'B10025 ', ' PIRATLA VIHARI ', ' p_vihari@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(160, ' prashant_kumar ', '', 'B10026 ', ' PRASHANT KUMAR SINGH ', ' prashant_kumar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(161, ' raheja_vishal ', '', 'B10027 ', ' RAHEJA VISHAL JAGDISH ', ' raheja_vishal@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(162, ' sadique_rasool ', '', 'B10028 ', ' SADIQUE RASOOL ', ' sadique_rasool@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(163, ' sanchit_khattry ', '', 'B10029 ', ' SANCHIT KHATTRY ', ' sanchit_khattry@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(164, ' shiv_sankar ', '', 'B10030 ', ' SHIV SANKAR BAISHYA ', ' shiv_sankar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(165, ' s_agarwal ', '', 'B10031 ', ' SHIVANSH AGARWAL ', ' s_agarwal@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(166, ' shoubhik_debnath ', '', 'B10032 ', ' SHOUBHIK DEBNATH ', ' shoubhik_debnath@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(167, ' sirikonda_sai ', '', 'B10033 ', ' SIRIKONDA SAI TEJA ', ' sirikonda_sai@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(168, ' sudhanshu_gaur ', '', 'B10034 ', ' SUDHANSHU GAUR ', ' sudhanshu_gaur@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(169, ' sukrit_aggarwal ', '', 'B10035 ', ' SUKRIT AGGARWAL ', ' sukrit_aggarwal@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(170, ' suman_s ', '', 'B10036 ', ' SUMAN SOURAV SUNDERROY ', ' suman_s@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(171, ' tushar_dublish ', '', 'B10037 ', ' TUSHAR DUBLISH ', ' tushar_dublish@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(172, ' vivek_vishwakarma ', '', 'B10038 ', ' VIVEK VISHWAKARMA ', ' vivek_vishwakarma@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(173, ' yogesh_kumar ', '', 'B10039 ', ' YOGESH KUMAR MEENA ', ' yogesh_kumar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(174, ' achal_t ', '', 'B10040 ', ' ACHAL THAKUR ', ' achal_t@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(175, ' saveena_rajput ', '', 'B10041 ', ' SAVEENA RAJPUT ', ' saveena_rajput@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(176, ' ankur_bhatt ', '', 'B10042 ', ' ANKUR BHATT ', ' ankur_bhatt@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(177, ' abhijeet_kumar_meena ', '', 'B10051 ', ' ABHIJEET KUMAR MEENA ', ' abhijeet_kumar_meena@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(178, ' akash_trivedi ', '', 'B10052 ', ' AKASH TRIVEDI ', ' akash_trivedi@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(179, ' anand_dhandhania ', '', 'B10053 ', ' ANAND DHANDHANIA ', ' anand_dhandhania@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(180, ' ankur_dixit ', '', 'B10054 ', ' ANKUR DIXIT ', ' ankur_dixit@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(181, ' athar_aamir ', '', 'B10055 ', ' ATHAR AAMIR UL SHAFI KHAN ', ' athar_aamir@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(182, ' bharat_b ', '', 'B10056 ', ' BHARAT ', ' bharat_b@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(183, ' dhirendra_kumar_singh ', '', 'B10057 ', ' DHIRENDRA KUMAR SINGH ', ' dhirendra_kumar_singh@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(184, ' jitesh_meghwal ', '', 'B10059 ', ' JITESH MEGHWAL ', ' jitesh_meghwal@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(185, ' krishna_karnani ', '', 'B10060 ', ' KRISHNA KARNANI ', ' krishna_karnani@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(186, ' lalit_kumar ', '', 'B10061 ', ' LALIT KUMAR ', ' lalit_kumar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(187, ' manoj_kumar_meena ', '', 'B10062', ' MANOJ KUMAR MEENA ', ' manoj_kumar_meena@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(188, ' mohit_goyal ', '', 'B10063 ', ' MOHIT GOYAL ', ' mohit_goyal@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(189, ' mohit_yadav ', '', 'B10064 ', ' MOHIT YADAV ', ' mohit_yadav@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(190, ' nalam_venkata_abhishek ', '', 'B10065 ', ' NALAM VENKATA ABHISHEK ', ' nalam_venkata_abhishek@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(191, ' narender_kumar ', '', 'B10066 ', ' NARENDER KUMAR MEENA ', ' narender_kumar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(192, ' narendra_prajapat ', '', 'B10067 ', ' NARENDRA PRAJAPAT ', ' narendra_prajapat@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(193, ' paliya_aditya ', '', 'B10068 ', ' PALIYA ADITYA VEDPRAKASH ', ' paliya_aditya@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(194, ' rahul_kumar ', '', 'B10069 ', ' RAHUL KUMAR GAUTAM ', ' rahul_kumar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(195, ' ram_g ', '', 'B10070 ', ' RAM GARG ', ' ram_g@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(196, ' rohit_goyal ', '', 'B10071 ', ' Rohit Goyal ', ' rohit_goyal@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(197, ' rohit_sangral ', '', 'B10072 ', ' Rohit Sangral ', ' rohit_sangral@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(198, ' s_bhuvaneswari ', '', 'B10073 ', ' S BHUVANESWARI ', ' s_bhuvaneswari@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(199, ' sachin_kumar_saini ', '', 'B10074 ', ' SACHIN KUMAR ', ' sachin_kumar_saini@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(200, ' sachin_sharma ', '', 'B10075 ', ' SACHIN SHARMA ', ' sachin_sharma@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(201, ' saumya_singh ', '', 'B10076 ', ' SAUMYA SINGH ', ' saumya_singh@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(202, ' shashank_mathur ', '', 'B10077 ', ' SHASHANK MATHUR ', ' shashank_mathur@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(203, ' siddhant_mohan ', '', 'B10078 ', ' SIDDHANT MOHAN ', ' siddhant_mohan@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(204, ' yadav_sunil ', '', 'B10079 ', ' SUNIL YADAV ', ' yadav_sunil@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(205, ' suraj_b ', '', 'B10080 ', ' SUJAJ B ', ' suraj_b@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(206, ' vana_devi_praharsha ', '', 'B10081 ', ' VANA DEVI PRAHARSHA ', ' vana_devi_praharsha@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(207, ' vikas_yadav ', '', 'B10082 ', ' VIKAS YADAV ', ' vikas_yadav@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(208, ' vivek_kumar ', '', 'B10083 ', ' VIVEK KUMAR ', ' vivek_kumar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(209, ' vivek_singh_chandel ', '', 'B10084 ', ' VIVEK SINGH CHANDEL ', ' vivek_singh_chandel@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(210, ' devendra_kumar ', '', 'B10085 ', ' Devendra Kumar Meena ', ' devendra_kumar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(211, ' hariom_m ', '', 'B10086 ', ' HARIOM MEENA ', ' hariom_m@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(212, ' abhishek_verma ', '', 'B10101', ' ABHISHEK VERMA ', ' abhishek_verma@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(213, ' adhish_bhandari ', '', 'B10102 ', ' ADHISH BHANDARI ', ' adhish_bhandari@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(214, ' akash_patel ', '', 'B10103 ', ' AKASH PATEL ', ' akash_patel@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(215, ' akash_pathak ', '', 'B10104 ', ' AKASH PATHAK ', ' akash_pathak@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(216, ' aneesh_monga ', '', 'B10105 ', ' ANEESH MONGA ', ' aneesh_monga@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(217, ' anupam_k ', '', 'B10106 ', ' ANUPAM ', ' anupam_k@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(218, ' damini_singal ', '', 'B10107 ', ' DAMINI SINGAL ', ' damini_singal@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(219, ' d_chaudhary ', '', 'B10108 ', ' DEEPAK CHAUDHARY ', ' d_chaudhary@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(220, ' deepak_sharma ', '', 'B10109 ', ' DEEPAK SHARMA ', ' deepak_sharma@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(221, ' eshaan_aggarwal ', '', 'B10110 ', ' ESHAAN AGGARWAL ', ' eshaan_aggarwal@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(222, ' gurbir_singh ', '', 'B10112 ', ' GURBIR SINGH ', ' gurbir_singh@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(223, ' himanshu_khandelwal ', '', 'B10113 ', ' HIMANSHU KHANDELWAL ', ' himanshu_khandelwal@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(224, ' hrushikesh_sikur_singh ', '', 'B10114 ', ' HRUSHIKESH SIKUR SINGH ALDA ', ' hrushikesh_sikur_singh@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(225, ' jayesh_g ', '', 'B10115 ', ' JAYESH CHANDRA GUPTA ', ' jayesh_g@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(226, ' kanv_garg ', '', 'B10116 ', ' KANV GARG ', ' kanv_garg@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(227, ' k_bansal ', '', 'B10117 ', ' KSHITIJ BANSAL ', ' k_bansal@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(228, ' kumar_shanu_meena ', '', 'B10118 ', ' KUMAR SHANU MEENA ', ' kumar_shanu_meena@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(229, ' kunal_k ', '', 'B10119 ', ' KUNAL KISHORE ', ' kunal_k@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(230, ' kunal_t ', '', 'B10120 ', ' KUNAL VIJAY THAKKAR ', ' kunal_t@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(231, ' lalin_t_divan ', '', 'B10121 ', ' LALIN T DIVAN ', ' lalin_t_divan@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(232, ' m_abhilash ', '', 'B10122 ', ' MONDRATHI ABHILASH ', ' m_abhilash@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(233, ' pranjal_jain ', '', 'B10123 ', ' PRANJAL JAIN ', ' pranjal_jain@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(234, ' prithish_seth ', '', 'B10124 ', ' PRITHISH SETH ', ' prithish_seth@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(235, ' rahul_chandel ', '', 'B10125 ', ' RAHUL CHANDEL ', ' rahul_chandel@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(236, ' rohtaz_singh ', '', 'B10126 ', ' ROHTAZ SINGH ', ' rohtaz_singh@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(237, ' sachin_roongta ', '', 'B10127 ', ' SACHIN ROONGTA ', ' sachin_roongta@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(238, ' sahil_kapila ', '', 'B10128 ', ' SAHIL KAPILA ', ' sahil_kapila@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(239, ' salil_jain ', '', 'B10129 ', ' SALIL JAIN ', ' salil_jain@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(240, ' santosh_kumar ', '', 'B10130 ', ' SANTOSH KUMAR MEENA ', ' santosh_kumar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(241, ' savla_diler ', '', 'B10131 ', ' SAVLA DILER TARAN ', ' savla_diler@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(242, ' moiz_ahmed ', '', 'B10132', ' SHAIK MOIZ AHMED ', ' moiz_ahmed@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(243, ' shashwat_sharma ', '', 'B10133 ', ' SHASHWAT SHARMA ', ' shashwat_sharma@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(244, ' shivanshu_singh ', '', 'B10134 ', ' SHIVANSHU SINGH ', ' shivanshu_singh@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(245, ' sreevalsan_p ', '', 'B10135 ', ' SREEVALSAN P ', ' sreevalsan_p@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(246, ' sumit_kant ', '', 'B10136 ', ' Sumit Kant ', ' sumit_kant@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(247, ' surendra_khoja ', '', 'B10137 ', ' SURENDRA KHOJA ', ' surendra_khoja@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(248, ' vipul_gautam ', '', 'B10138 ', ' VIPUL GAUTAM ', ' vipul_gautam@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(249, ' asheesh_m ', '', 'B10139 ', ' ASHEESH KUMAR MEENA ', ' asheesh_m@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(250, ' abhilash_kumar ', '', 'B11001 ', ' ABHILASH ', ' abhilash_kumar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(251, ' abhinava_mishra ', '', 'B11002 ', ' ABHINAVA MISHRA ', ' abhinava_mishra@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(252, ' anil_kumar ', '', 'B11003 ', ' ANIL KUMAR JHAJHARIA ', ' anil_kumar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(253, ' anjaly_mehla ', '', 'B11004 ', ' ANJALY MEHLA ', ' anjaly_mehla@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(254, ' antim_patel ', '', 'B11005 ', ' ANTIM PATEL ', ' antim_patel@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(255, ' aounon_kumar ', '', 'B11006 ', ' AOUNON KUMAR ', ' aounon_kumar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(256, ' arjun_bhardwaj ', '', 'B11007 ', ' ARJUN BHARDWAJ ', ' arjun_bhardwaj@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(257, ' avinash_kumar ', '', 'B11008', ' AVINASH KUMAR CHAUDHARY ', ' avinash_kumar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(258, ' bhagwan_sahay_meena ', '', 'B11009 ', ' BHAGWAN SAHAY MEENA ', ' bhagwan_sahay_meena@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(259, ' bhupesh_kumar_singh ', '', 'B11010 ', ' BHUPESH KUMAR ', ' bhupesh_kumar_singh@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(260, ' chandan_satyarthi ', '', 'B11011 ', ' CHANDAN SATYARTHI ', ' chandan_satyarthi@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(261, ' darpan_solanki ', '', 'B11012 ', ' DARPAN SOLANKI ', ' darpan_solanki@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(262, ' fatehjeet_s ', '', 'B11013 ', ' FATEHJEET SINGH SRA ', ' fatehjeet_s@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(263, ' j_jangid ', '', 'B11014 ', ' JAYPRAKASH JANGID ', ' j_jangid@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(264, ' kallem_rajashekar_reddy ', '', 'B11015 ', ' KALLEM RAJASHEKAR REDDY ', ' kallem_rajashekar_reddy@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(265, ' khushpreet_singh ', '', 'B11016 ', ' KHUSHPREET SINGH ', ' khushpreet_singh@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(266, ' korra_vishnu_priyanka ', '', 'B11017 ', ' KORRA VISHNU PRIYANKA ', ' korra_vishnu_priyanka@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(267, ' k_vikhyat ', '', 'B11018 ', ' KORRAPATI VIKHYAT ', ' k_vikhyat@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(268, ' kshitiz_saraswat ', '', 'B11019 ', ' KSHITIZ SARASWAT ', ' kshitiz_saraswat@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(269, ' nidhi_makhijani ', '', 'B11020', ' MAKHIJANI NIDHI MANOJ ', ' nidhi_makhijani@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(270, ' md_afsar_reza ', '', 'B11021 ', ' MD AFSAR REZA ', ' md_afsar_reza@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(271, ' m_kumar ', '', 'B11022 ', ' MOHIT KUMAR ', ' m_kumar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(272, ' mohit_rawat ', '', 'B11023 ', ' MOHIT RAWAT ', ' mohit_rawat@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(273, ' pankaj_kumar ', '', 'B11025 ', ' PANKAJ KUMAR VERMA ', ' pankaj_kumar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(274, ' rishabh_sahu ', '', 'B11026 ', ' RISHABH SAHU ', ' rishabh_sahu@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(275, ' ritish_r ', '', 'B11027 ', ' RITISH ', ' ritish_r@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(276, ' rohit_shukla ', '', 'B11028 ', ' ROHIT SHUKLA ', ' rohit_shukla@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(277, ' sachin_s_b ', '', 'B11029 ', ' SACHIN S BHAT ', ' sachin_s_b@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(278, ' sachin_tyagi ', '', 'B11030 ', ' SACHIN TYAGI ', ' sachin_tyagi@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(279, ' sahil_mutneja ', '', 'B11031 ', ' SAHIL MUTNEJA ', ' sahil_mutneja@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(280, ' s_panwar ', '', 'B11032 ', ' SAKET PANWAR ', ' s_panwar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(281, ' s_jain ', '', 'B11033 ', ' SAURABH JAIN ', ' s_jain@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(282, ' s_damani ', '', 'B11034 ', ' SHREEVARDHAN DAMANI ', ' s_damani@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(283, ' shubham_ajmera ', '', 'B11035 ', ' SHUBHAM AJMERA ', ' shubham_ajmera@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(284, ' surendra_anuragi ', '', 'B11036 ', ' SURENDRA ANURAGI ', ' surendra_anuragi@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(285, ' u_shivateja ', '', 'B11037 ', ' U SHIVATEJA REDDY ', ' u_shivateja@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(286, ' vaishali_sain ', '', 'B11038 ', ' VAISHALI ', ' vaishali_sain@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(287, ' vinod_kumar ', '', 'B11039 ', ' VINOD KUMAR ', ' vinod_kumar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(288, ' abhinav_singh ', '', 'B11051 ', ' ABHINAV SINGH ', ' abhinav_singh@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(289, ' akshay_sharma ', '', 'B11052 ', ' AKSHAY SHARMA ', ' akshay_sharma@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(290, ' ankit_verma ', '', 'B11053 ', ' ANKIT VERMA ', ' ankit_verma@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(291, ' apoorva_bhatia ', '', 'B11054 ', ' APOORVA BHATIA ', ' apoorva_bhatia@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(292, ' azmi_omair ', '', 'B11055 ', ' AZMI OMAIR EHSAN ', ' azmi_omair@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(293, ' dushyant_singh ', '', 'B11057 ', ' DUSHYANT SINGH ', ' dushyant_singh@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(294, ' eare_neena ', '', 'B11058 ', ' EARE NEENA ', ' eare_neena@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(295, ' gulshan_pancholi ', '', 'B11059 ', ' GULSHAN PANCHOLI ', ' gulshan_pancholi@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(296, ' harkaran_singh ', '', 'B11060 ', ' HARKARAN SINGH ', ' harkaran_singh@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(297, ' hemant_chawla ', '', 'B11061 ', ' HEMANT CHAWLA ', ' hemant_chawla@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(298, ' jagmohan_singh ', '', 'B11062 ', ' JAGMOHAN SINGH ', ' jagmohan_singh@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(299, ' jyoti_lakra ', '', 'B11063 ', ' JYOTI LAKRA ', ' jyoti_lakra@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(300, ' kamal_kumar_raj ', '', 'B11064 ', ' KAMAL KUMAR RAJ ', ' kamal_kumar_raj@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(301, ' kapil_kumar_dhaker ', '', 'B11065 ', ' KAPIL KUMAR DHAKER ', ' kapil_kumar_dhaker@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(302, ' manish_ladla ', '', 'B11066 ', ' MANISH LADLA ', ' manish_ladla@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(303, ' nagarjun_narayan ', '', 'B11068 ', ' NAGARJUN NARAYAN ', ' nagarjun_narayan@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(304, ' p_nagarjuna ', '', 'B11069 ', ' P NAGARJUNA ', ' p_nagarjuna@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(305, ' pradeep_seervi ', '', 'B11070 ', ' PRADEEP SEERVI ', ' pradeep_seervi@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(306, ' prakhar_agarwal ', '', 'B11071 ', ' PRAKHAR AGARWAL ', ' prakhar_agarwal@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(307, ' priya_agarwal ', '', 'B11072 ', ' PRIYA AGARWAL ', ' priya_agarwal@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(308, ' raj_kumar ', '', 'B11074 ', ' RAJ KUMAR ', ' raj_kumar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(309, ' rajiv_ranjan ', '', 'B11075 ', ' RAJIV RANJAN YADAV ', ' rajiv_ranjan@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(310, ' ravinder_kumar ', '', 'B11076 ', ' RAVINDER KUMAR ', ' ravinder_kumar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(311, ' rohit_kanaujia ', '', 'B11077 ', ' ROHIT KANAUJIA ', ' rohit_kanaujia@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(312, ' sawan_kumar ', '', 'B11078 ', ' SAWAN KUMAR MEENA ', ' sawan_kumar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(313, ' sourabh_singh ', '', 'B11079 ', ' SOURABH SINGH ', ' sourabh_singh@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(314, ' suhail_hameed ', '', 'B11080 ', ' SUHAIL HAMEED ', ' suhail_hameed@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(315, ' suleman_alam ', '', 'B11081 ', ' SULEMAN ALAM ', ' suleman_alam@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(316, ' suramya_gupta ', '', 'B11082 ', ' SURAMYA GUPTA ', ' suramya_gupta@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(317, ' syed_jafar ', '', 'B11083 ', ' SYED JAFAR SHAHID RIZVI ', ' syed_jafar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(318, ' tejas_l ', '', 'B11084 ', ' TEJAS JAYANTILAL LUNAWAT ', ' tejas_l@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(319, ' umang_jain ', '', 'B11086 ', ' UMANG JAIN ', ' umang_jain@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(320, ' vikas_kumar ', '', 'B11088 ', ' VIKAS KUMAR MEENA ', ' vikas_kumar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(321, ' abhay_chowdhary ', '', 'B11101 ', ' ABHAY CHOWDHARY ', ' abhay_chowdhary@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(322, ' abhishek_kumar ', '', 'B11102 ', ' ABHISHEK KUMAR ', ' abhishek_kumar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(323, ' abhishek_gupta ', '', 'B11103 ', ' ABHISHEK KUMAR GUPTA ', ' abhishek_gupta@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(324, ' ajay_kumar ', '', 'B11104 ', ' AJAY KUMAR ', ' ajay_kumar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(325, ' amit_bhati ', '', 'B11105 ', ' AMIT BHATI ', ' amit_bhati@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(326, ' ankit_g ', '', 'B11107 ', ' ANKIT GUPTA ', ' ankit_g@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(327, ' ankit_srivastava ', '', 'B11108 ', ' ANKIT SRIVASTAVA ', ' ankit_srivastava@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(328, ' a_yadav ', '', 'B11109 ', ' ANKIT YADAV ', ' a_yadav@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(329, ' anurag_rawat_kumar ', '', 'B11110 ', ' ANURAG RAWAT ', ' anurag_rawat_kumar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(330, ' arpit_ajay ', '', 'B11111 ', ' ARPIT AJAY NARECHANIA ', ' arpit_ajay@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(331, ' ashish_k ', '', 'B11112', ' ASHISH KUMAR ', ' ashish_k@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(332, ' ashok_choudhary ', '', 'B11113 ', ' ASHOK KUMAR CHOUDHARY ', ' ashok_choudhary@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(333, ' baratam_chamundeswar ', '', 'B11115 ', ' BARATAM CHAMUNDESWAR NADH ', ' baratam_chamundeswar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(334, ' bhavesh_silawat ', '', 'B11116 ', ' BHAVESH SILAWAT ', ' bhavesh_silawat@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(335, ' bijon_kowshik ', '', 'B11117 ', ' BIJON KOWSHIK PAUL ', ' bijon_kowshik@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(336, ' chinmay_krishna ', '', 'B11118 ', ' CHINMAY KRISHNA ', ' chinmay_krishna@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(337, ' harshit_singhal ', '', 'B11119 ', ' HARSHIT SINGHAL ', ' harshit_singhal@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(338, ' ingale_swapnil ', '', 'B11120 ', ' INGALE SWAPNIL SUSHIL ', ' ingale_swapnil@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(339, ' kalu_ram_meena ', '', 'B11121 ', ' KALU RAM MEENA ', ' kalu_ram_meena@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(340, ' karpe_mandar_nitin ', '', 'B11122 ', ' KARPE MANDAR NITIN ', ' karpe_mandar_nitin@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(341, ' kishore_bohara ', '', 'B11123 ', ' KISHORE BOHARA ', ' kishore_bohara@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(342, ' kushal_mundle ', '', 'B11124 ', ' KUSHAL MUNDLE ', ' kushal_mundle@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(343, ' lalitesh_kumar_meena ', '', 'B11125 ', ' LALITESH KUMAR MEENA ', ' lalitesh_kumar_meena@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(344, ' mahendra_singh ', '', 'B11126 ', ' MAHENDRA SINGH MEENA ', ' mahendra_singh@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(345, ' mano_c ', '', 'B11127 ', ' MANO C ', ' mano_c@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00');
INSERT INTO `profiles` (`profile_id`, `profile_uid`, `profile_pwd`, `profile_enrollno`, `profile_name`, `profile_email`, `profile_dob`, `profile_gender`, `profile_role_id`, `profile_active`, `profile_date`) VALUES
(346, ' navneet_yadav ', '', 'B11128 ', ' NAVNEET YADAV ', ' navneet_yadav@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(347, ' nishank_kumar_gupta ', '', 'B11129 ', ' NISHANK KUMAR GUPTA ', ' nishank_kumar_gupta@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(348, ' paradhi_vinit_wamanrao ', '', 'B11131 ', ' PARADHI VINIT WAMANRAO ', ' paradhi_vinit_wamanrao@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(349, ' pranav_kumar_singh ', '', 'B11132 ', ' PRANAV KUMAR SINGH ', ' pranav_kumar_singh@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(350, ' prashant_prazapati ', '', 'B11133 ', ' PRASHANT PRAZAPATI ', ' prashant_prazapati@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(351, ' rahul_raj ', '', 'B11134 ', ' RAHUL RAJ ', ' rahul_raj@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(352, ' sachin_s ', '', 'B11135 ', ' SACHIN ', ' sachin_s@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(353, ' sama_gnaneshwar_reddy ', '', 'B11136 ', ' SAMA GNANESHWAR REDDY ', ' sama_gnaneshwar_reddy@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(354, ' shivam_arora ', '', 'B11137 ', ' SHIVAM ARORA ', ' shivam_arora@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(355, ' shubham_s ', '', 'B11138 ', ' SHUBHAM ', ' shubham_s@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(356, ' t_bala_vineeth ', '', 'B11139 ', ' T BALA VINEETH NETHA ', ' t_bala_vineeth@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(357, ' varra_siva ', '', 'B11140 ', ' VARRA SIVA CHETAN REDDY ', ' varra_siva@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(358, ' sindhu_k ', '', 'D10001 ', ' SINDHU K ', ' sindhu_k@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(359, ' anna_varughese ', '', 'D10002 ', ' Anna Varughese ', ' anna_varughese@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(360, ' navneet_singh ', '', 'D10003 ', ' Navneet Singh ', ' navneet_singh@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(361, ' p_kumar ', '', 'D10004 ', ' PUSHPENDRA KUMAR ', ' p_kumar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(362, ' lakshman_m ', '', 'D10005 ', ' Lakshman Mahto ', ' lakshman_m@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(363, ' jai_prakash_tripathi ', '', 'D10006 ', ' Jai Prakash Tripathi ', ' jai_prakash_tripathi@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(364, ' hemant ', '', 'D10007 ', ' Hemant Jalota ', ' hemant@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(365, ' sunil_dutt ', '', 'D10008 ', ' Sunil Dutt ', ' sunil_dutt@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(366, ' sougata_sinha ', '', 'D10009 ', ' SOUGATA SINHA ', ' sougata_sinha@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(367, ' vivek_m ', '', 'D10010 ', ' Vivek Kumar Mishra ', ' vivek_m@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(368, ' diwaker_d ', '', 'D10011 ', ' Diwaker ', ' diwaker_d@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(369, ' abhishek_chaudhary ', '', 'D10012 ', ' Abhishek Chaudhary ', ' abhishek_chaudhary@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(370, ' reena_singh ', '', 'D10014 ', ' Reena Singh ', ' reena_singh@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(371, ' chander_s ', '', 'D10015 ', ' Chander Kant Susheel ', ' chander_s@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(372, ' ashish_kumar ', '', 'D10016 ', ' ASHISH KUMAR ', ' ashish_kumar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(373, ' j_verma ', '', 'D10017 ', ' JITENDRA KUMAR VERMA ', ' j_verma@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(374, ' abhishek_g ', '', 'D11018 ', ' Abhishek Gupta ', ' abhishek_g@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(375, ' raj_kumar_rao ', '', 'D11019 ', ' Raj Kumar ', ' raj_kumar_rao@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(376, ' sunil_kumar ', '', 'D11020 ', ' Sunil Kumar ', ' sunil_kumar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(377, ' manisha_devi ', '', 'D11021 ', ' Manisha Devi ', ' manisha_devi@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(378, ' hari_vansh_mittal ', '', 'D11023 ', ' HARI VANSH RAI MITTAL ', ' hari_vansh_mittal@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(379, ' kushal_veer_singh ', '', 'D11024 ', ' Kushal Veer Singh ', ' kushal_veer_singh@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(380, ' anshul_s ', '', 'D11027 ', ' Anshul ', ' anshul_s@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(381, ' arun_kumar ', '', 'D11028', ' Arun Kumar ', ' arun_kumar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(382, ' rajiv_m ', '', 'D11030 ', ' RAJIV KUMAR MAURYA ', ' rajiv_m@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(383, ' himadri_c ', '', 'D11031 ', ' Himadri Chakraborti ', ' himadri_c@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(384, ' jalim_singh ', '', 'D11036 ', ' JALIM SINGH ', ' jalim_singh@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(385, ' lakshmanan_s_a ', '', 'D11037 ', ' LAKSHNANAN S ', ' lakshmanan_s_a@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(386, ' abhishek_kumar_gupta ', '', 'D11038 ', ' ABHISHEK KUMAR GUPTA ', ' abhishek_kumar_gupta@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(387, ' r_sharma ', '', 'D11039 ', ' REENA SINGH ', ' r_sharma@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(388, ' sk_mujaffor ', '', 'D11040 ', ' SK MUJARROR ', ' sk_mujaffor@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(389, ' deepak_kumar ', '', 'D11041 ', ' DEEPAK KUMAR ', ' deepak_kumar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(390, ' anand_k ', '', 'D11042 ', ' ANAND KUMAR ', ' anand_k@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(391, ' rajeev_k ', '', 'D11043 ', ' RAJEEV KUMAR ', ' rajeev_k@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(392, ' gurinderbir_singh ', '', 'D11044 ', ' GURINDER SINGH ', ' gurinderbir_singh@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(393, ' c_thirumurugan ', '', 'D11045 ', ' C THIRUMURUGAN ', ' c_thirumurugan@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(394, ' sanjay_k ', '', 'D11046 ', ' SANJAY K ', ' sanjay_k@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(395, ' runa ', '', 'S10001 ', ' RUNA BARIK ', ' runa@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(396, ' sujeet_kumar ', '', 'S10002 ', ' SUJEET KUMAR ', ' sujeet_kumar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(397, ' s_t ', '', 'S10003 ', ' SHEJIN T ', ' s_t@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(398, ' ranjit_singh ', '', 'S10004 ', ' RANJIT SINGH ', ' ranjit_singh@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(399, ' srimanta_mandal ', '', 'S10005 ', ' SRIMANTA MANDALl ', ' srimanta_mandal@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(400, ' vijay_chauhan ', '', 'S10006 ', ' VIJAY CHAUHAN ', ' vijay_chauhan@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(401, ' anjana_babu ', '', 'S11009 ', ' ANJANA BABU ', ' anjana_babu@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(402, ' anuruddh_kumar ', '', 'S11011 ', ' ANURUDDH KUMAR ', ' anuruddh_kumar@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(403, ' t_kant ', '', 'S11014 ', ' TUSAR  KANT ', ' t_kant@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(404, ' anshul_kumar_mishra ', '', 'S11015 ', ' ANSHUL KUMAR ', ' anshul_kumar_mishra@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(405, ' chittotosh_ganguly ', '', 'S11016 ', ' CHITTOTOSH GANGULY ', ' chittotosh_ganguly@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(406, ' ashish_j ', '', 'S11017 ', ' ASHISH J ', ' ashish_j@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(407, ' pothula_abhinay_reddy ', '', 'S11018 ', ' POTHULA ABHINAY ', ' pothula_abhinay_reddy@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(408, ' khoisnam_steela ', '', 'S11019 ', ' KHOISNAM STEELA ', ' khoisnam_steela@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(409, ' gaurav_vats ', '', 'S11020 ', ' GAURAV VATS ', ' gaurav_vats@students.iitmandi.ac.in ', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(38, 'abhimanyu_kumar', '', 'B09001', 'ABHIMANYU KUMAR', ' 	abhimanyu_kumar@students.iitmandi.ac.in', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00'),
(39, 'akhtar_shahi_qureshi', '', 'B09002', 'AKHTAR SHAHI QURESHI', ' 	akhtar_shahi_qureshi@students.iitmandi.ac.in', '0000-00-00', '', 3, 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE IF NOT EXISTS `schedule` (
  `schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `schedule_course_id` int(11) NOT NULL DEFAULT '0',
  `schedule_status` varchar(100) NOT NULL DEFAULT 'in progress',
  `schedule_active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`schedule_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=55 ;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`schedule_id`, `schedule_course_id`, `schedule_status`, `schedule_active`) VALUES
(1, 1, 'in progress', 0),
(2, 2, 'in progress', 0),
(3, 3, 'In Progress', 0),
(4, 4, 'In Progress', 0),
(5, 5, 'In Progress', 0),
(6, 6, 'In Progress', 0),
(7, 7, 'In Progress', 0),
(8, 8, 'In Progress', 0),
(9, 9, 'in progress', 0),
(10, 10, 'In Progress', 0),
(11, 11, 'In Progress', 0),
(12, 12, 'In Progress', 0),
(13, 13, 'In Progress', 0),
(14, 14, 'In Progress', 0),
(15, 15, 'In Progress', 0),
(16, 16, 'In Progress', 0),
(17, 17, 'In Progress', 0),
(18, 18, 'In Progress', 0),
(19, 19, 'In Progress', 0),
(20, 20, 'In Progress', 0),
(21, 21, 'In Progress', 0),
(22, 22, 'In Progress', 0),
(23, 23, 'In Progress', 0),
(24, 24, 'In Progress', 0),
(25, 25, 'In Progress', 0),
(26, 26, 'in progress', 0),
(27, 27, 'In Progress', 0),
(28, 28, 'In Progress', 0),
(29, 29, 'In Progress', 0),
(30, 30, 'In Progress', 0),
(31, 31, 'In Progress', 0),
(32, 32, 'In Progress', 0),
(33, 33, 'In Progress', 0),
(34, 34, 'In Progress', 0),
(35, 35, 'In Progress', 0),
(36, 36, 'In Progress', 0),
(37, 37, 'In Progress', 0),
(38, 38, 'in progress', 0),
(39, 39, 'In Progress', 0),
(40, 40, 'In Progress', 0),
(41, 41, 'In Progress', 0),
(42, 42, 'In Progress', 0),
(43, 43, 'in progress', 0),
(44, 44, 'in progress', 0),
(45, 45, 'In Progress', 0),
(46, 46, 'In Progress', 0),
(47, 47, 'in progress', 0),
(48, 48, 'In Progress', 0),
(49, 49, 'In Progress', 0),
(50, 50, 'in progress', 0),
(51, 51, 'In Progress', 0),
(52, 52, 'In Progress', 0),
(53, 53, 'In Progress', 0),
(54, 54, 'In Progress', 0);

-- --------------------------------------------------------

--
-- Table structure for table `student_schedule`
--

CREATE TABLE IF NOT EXISTS `student_schedule` (
  `student_schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_schedule_profile_id` int(11) NOT NULL DEFAULT '0',
  `student_schedule_schedule_id` int(11) NOT NULL DEFAULT '0',
  `student_schedule_questions` tinyint(1) NOT NULL DEFAULT '0',
  `student_schedule_approved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`student_schedule_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=156 ;

--
-- Dumping data for table `student_schedule`
--

INSERT INTO `student_schedule` (`student_schedule_id`, `student_schedule_profile_id`, `student_schedule_schedule_id`, `student_schedule_questions`, `student_schedule_approved`) VALUES
(140, 53, 21, 1, 1),
(141, 58, 21, 1, 1),
(142, 59, 22, 1, 1),
(143, 53, 22, 0, 1),
(144, 60, 21, 1, 1),
(145, 60, 22, 0, 1),
(146, 58, 22, 0, 1),
(147, 61, 22, 0, 0),
(148, 62, 21, 1, 1),
(149, 62, 22, 0, 0),
(150, 64, 21, 0, 0),
(151, 64, 22, 0, 0),
(152, 62, 23, 1, 1),
(153, 66, 23, 0, 1),
(154, 66, 24, 0, 0),
(155, 53, 25, 0, 0);
