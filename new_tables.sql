CREATE TABLE IF NOT EXISTS enrollments
(
enrollment_id INT(7) PRIMARY KEY AUTO_INCREMENT,
student_profile_id INT(7),
course_id INT(5),
approved BOOL DEFAULT 0,
feedback_status BOOL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS courses
(
course_id INT(5) PRIMARY KEY AUTO_INCREMENT,
course_number VARCHAR(8),
course_name VARCHAR(60),
course_active tinyint(1) NOT NULL DEFAULT '0',
semester INT(2)
);

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
  `profile_active` tinyint(1) NOT NULL DEFAULT '0',
  `profile_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`profile_id`,`profile_uid`,`profile_email`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

CREATE TABLE `schedule` (
  `schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `schedule_course_id` int(11) NOT NULL DEFAULT '0',
  `schedule_status` varchar(100) NOT NULL DEFAULT 'Tentative',
  `schedule_active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`schedule_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

CREATE TABLE `student_schedule` (
  `student_schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_schedule_profile_id` int(11) NOT NULL DEFAULT '0',
  `student_schedule_schedule_id` int(11) NOT NULL DEFAULT '0',
  `student_schedule_questions` tinyint(1) NOT NULL DEFAULT '0',
  `student_schedule_approved` bool NOT NULL DEFAULT '0',
  PRIMARY KEY (`student_schedule_id`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;

