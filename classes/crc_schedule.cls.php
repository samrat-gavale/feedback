<?php
	// Include the CRC Object class that needs to
	// extended by all classes. This is the super
	// class.
	include_once('crc_constants.mod.php');
	include_once('crc_object.cls.php');
	include_once('crc_mysql.cls.php');	

	//******************************************
	// Name: crc_schedule
	//******************************************
	//
	// Desc: The Schedule Object
	// Developer: Free SMS team
	// Email: shaffin_bhanji@hotmail.com
	// Date: March 10th, 2003
	// Version: 1.0.0
	//
	// Copyright
	// =========
	// This code is copyright, use in part or
	// whole is prohibited without a written
	// concent to the developer.
	//******************************************

	class crc_schedule extends crc_object {

		var $m_sql;
		var $m_data;
		
		function crc_schedule($debug) {
			//******************************************
			// Initialization by constructor
			//******************************************
			$this->classname = 'crc_schedule';
			$this->classdescription = 'Provide course schedule.';
			$this->classversion = '1.0.0';
			$this->classdate = 'October 7th, 2011';
			$this->classdevelopername = 'Information Management Group, IIT Mandi';
			$this->classdeveloperemail = '';
			$this->_DEBUG = $debug;

			if ($this->_DEBUG) {
				echo "DEBUG {crc_schedule::constructor}: The class \"crc_schedule\" was successfuly created. <br>";
				echo "DEBUG {crc_schedule::constructor}: Running in debug mode. <br>";
			}
		}

		function fn_getschedule($profileid, $roleid, $all = false) {
			//**********************************
			// Get the schedule for the classes
			//**********************************
			
			//check input
			if (!isset($profileid, $roleid) || ($profileid == "") || ($roleid == "")) {
				$this->lasterrmsg = "Invalid input";
				return null;
			}
			
			$this->m_data = null;
			$db = new crc_mysql($this->_DEBUG);
			$dbhandle = $db->fn_connect();
			if ($dbhandle != false) {
				if ($this->_DEBUG) {
					echo "DEBUG {crc_schedule::fn_getschedule}: Retreiving the schedule. <br>";
				}
				$this->m_sql = 'select course_name, schedule_start_date, schedule_end_date, ' .
														'schedule_day_time, course_fee, schedule_status, ' . 
														'schedule_id, schedule_room_id, room_name ' . 
												'from ' . MYSQL_SCHEDULE_TBL . ' as s, ' .
														MYSQL_COURSES_TBL . ' as c, ' .
														MYSQL_ROOMS_TBL . ' as r ' .
												'where (s.schedule_course_id=c.course_id) and ' .
														'(s.schedule_active=0) and ' .
														'(s.schedule_room_id=r.room_id) ' .
												'order by c.course_name asc';

				$this->m_sql = 'select course_id, course_number, course_name, schedule_id, schedule_status '.
							   'from ' . MYSQL_SCHEDULE_TBL . ' as s, '.
							   MYSQL_COURSES_TBL . ' as c where (s.schedule_course_id=c.course_id)' .
							   ' and (s.schedule_active = 1) order by c.course_number asc';


							   
				$resource = $db->fn_runsql(MYSQL_DB, $this->m_sql);

				
				if (is_resource($resource)) {					
					if (mysql_num_rows($resource) > 0) {
//											die();

						$index = 0;
						while ($row = mysql_fetch_array($resource)) {
							switch($roleid) {
								case 3:
									$this->m_sql = 'select * from ' . MYSQL_STUDENT_SCHEDULE_TBL .
												' where student_schedule_schedule_id = ' . $row[3] . 
												' and student_schedule_profile_id = ' . $profileid;
									break;
								case 2:
									$this->m_sql = 'select * from ' . MYSQL_TEACHER_SCHEDULE_TBL .
												' where teacher_schedule_schedule_id = ' . $row[3] . 
												' and teacher_schedule_profile_id = ' . $profileid;
									break;
								case 1:
									$this->m_sql = 'select * from ' . MYSQL_TEACHER_SCHEDULE_TBL .
												' where teacher_schedule_schedule_id = ' . $row[3] . 
												' and teacher_schedule_profile_id = ' . $profileid;
									break;
							}
							$enrol = $db->fn_runsql(MYSQL_DB, $this->m_sql);

							if ($this->_DEBUG) {
								echo "DEBUG {crc_schedule::fn_getschedule}: Checking enrollment of schedule id " . $row[6] . " for profile id " . $profileid . ". <br>";
							}
							if (true == $all) {
								//all courses all needed
								$this->m_data[$index] = $row;    //indices 0-4 of row
								//check the enrollment
								if (is_resource($enrol) && (mysql_num_rows($enrol) > 0)) {
									$this->m_data[$index][5] = true;
									$this->m_data[$index][6] = true;
								} else {
									$this->m_data[$index][5] = false;
									$this->m_data[$index][6] = false;
								}
								$index = $index+1;
								continue;
							}
							if (is_resource($enrol)) {
								if (mysql_num_rows($enrol) > 0) {
									$this->m_data[$index] = $row;
									//get the number of students for this schedule id
//									$this->m_sql = 'select count(*) as students from ' . MYSQL_STUDENT_SCHEDULE_TBL .
//													' where student_schedule_schedule_id = ' . $row[6];

									$this->m_sql = 'select count(*) as students from ' . MYSQL_STUDENT_SCHEDULE_TBL .
												   ' where student_schedule_schedule_id = ' . $row[3] . ' and student_schedule_approved = "1"';
									$students = $db->fn_runsql(MYSQL_DB, $this->m_sql);
									if (is_resource($students)) {
										if (mysql_num_rows($students) > 0) {
											$studentcount = mysql_fetch_array($students);
											$this->m_data[$index][5] = $studentcount[0];
//											$index = $index + 1;
										}
										$db->fn_freesql($students);
									} else {
										$this->lasterrmsg = "Cannot get the number of students approved.";
										if ($this->_DEBUG) {
											echo "DEBUG {crc_schedule::fn_getschedule}: " . $this->lasterrmsg . ".<br>";
										}
									}

									$this->m_sql = 'select count(*) as students from ' . MYSQL_STUDENT_SCHEDULE_TBL .
													' where student_schedule_schedule_id = ' . $row[3]. ' and student_schedule_approved = "0"';
									$students = $db->fn_runsql(MYSQL_DB, $this->m_sql);
									if (is_resource($students)) {
										if (mysql_num_rows($students) > 0) {
											$studentcount = mysql_fetch_array($students);
											$this->m_data[$index][6] = $studentcount[0];
											$index = $index + 1;
										}
										$db->fn_freesql($students);
									} else {
										$this->lasterrmsg = "Cannot get the number of students to be approved";
										if ($this->_DEBUG) {
											echo "DEBUG {crc_schedule::fn_getschedule}: " . $this->lasterrmsg . ".<br>";
										}
									}	

								} else {
									$this->lasterrmsg = "No enrollment found";
									if ($this->_DEBUG) {
										echo "DEBUG {crc_schedule::fn_getschedule}: " . $this->lasterrmsg . ".<br>";
									}
								}
								$db->fn_freesql($enrol);
							} else {
								$this->lasterrmsg = "Cannot check enrollment";
								if ($this->_DEBUG) {
									echo "DEBUG {crc_schedule::fn_getschedule}: " . $this->lasterrmsg . ".<br>";
								}
							}
						}
					} else {
						$this->lasterrmsg = "No schedule found";
						if ($this->_DEBUG) {
							echo "DEBUG {crc_schedule::fn_getschedule}: " . $this->lasterrmsg . ".<br>";
						}
					}
					$db->fn_freesql($resource);
				} else {
					$this->lasterrmsg = "Cannot retrieve the schedule";
					if ($this->_DEBUG) {
						echo "DEBUG {crc_schedule::fn_getschedule}: " . $this->lasterrmsg . ".<br>";
					}
				}
				$db->fn_disconnect();				
			} else {
				$this->lasterrnum = $db->lasterrnum;
				$this->lasterrmsg = $db->lasterrmsg;
			}
			return $this->m_data;
		}

		function fn_addschedule($profileid, $scheduleid) {
			//******************************************
			// Add a scheduled course for a student
			//******************************************			
			
			//check input
			if (!isset($profileid, $scheduleid) || ($profileid == "") || ($scheduleid == "")) {
				$this->lasterrmsg = "Invalid input";
				return null;
			}			
			
			$result = false;
			$db = new crc_mysql($this->_DEBUG);
			$dbhandle = $db->fn_connect();
			if ($dbhandle != false) {

				if ($this->_DEBUG) {
					echo "DEBUG {crc_schedule::fn_addschedule}: Add a schedule id: " . $scheduleid . " to the profile id: " . $profileid . " added. <br>";
				}

				$this->m_sql = 'insert into ' . MYSQL_STUDENT_SCHEDULE_TBL . 
								' (student_schedule_schedule_id, ' .
								'student_schedule_profile_id) ' . 
								'values(' . $scheduleid . ',' . $profileid . ')';

				$result = $db->fn_runsql(MYSQL_DB, $this->m_sql);
				if ($result == false) {
					$this->lasterrmsg = "Cannot add schedule";
					if ($this->_DEBUG) {
						echo "ERROR {crc_schedule::fn_addschedule}: The schedule id: " . $scheduleid . " could not be added to the profile id: " . $profileid . " added. <br>";
					}
				}
				$db->fn_disconnect();
			} else {
				$this->lasterrnum = $db->lasterrnum;
				$this->lasterrmsg = $db->lasterrmsg;
				if ($this->_DEBUG) {
					echo "ERROR {crc_schedule::fn_addschedule}: Cannot connect to MySQL database.<br>";
				}
			}
			return $result;
		}
	}
?>
