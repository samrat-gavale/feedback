<?php
	// Include the CRC Object class that needs to
	// extended by all classes. This is the super
	// class.

	include_once('crc_constants.mod.php');
	include_once('crc_object.cls.php');
	include_once('crc_mysql.cls.php');

	//******************************************
	// Name: crc_teacher
	//******************************************
	//
	// Desc: The Teacher Object
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

	class crc_teacher extends crc_object {

		var $m_sql;
		var $m_data;
		var $m_dateid;
		var $m_check;
		
		function crc_teacher($debug) {								
			//******************************************
			// Initialization by constructor
			//******************************************
			$this->classname = 'crc_teacher';
			$this->classdescription = 'Provide course schedule.';
			$this->classversion = '1.0.0';
			$this->classdate = 'March 10th, 2003';
			$this->classdevelopername = 'Shaffin Bhanji';
			$this->classdeveloperemail = 'shaffin_bhanji@hotmail.com';
			$this->_DEBUG = $debug;
			
			$this->m_check = 'A';

			if ($this->_DEBUG) {
				echo "DEBUG {crc_teacher::constructor}: The class \"crc_teacher\" was successfuly created. <br>";
				echo "DEBUG {crc_teacher::constructor}: Running in debug mode. <br>";
			}
		}

		function fn_setattendance($id, $action) {
			//******************************************
			// Set the attendance for a student
			//******************************************			
			if ($this->_DEBUG) {
				echo "DEBUG {crc_teacher::fn_setattendance}: Updating attendance id " . $id . " to " . ucwords($action) . ". <br>";
			}
				
			//check inputs
			if (!isset($id, $action) || ($id == "") || ($action == "")) {
				$this->lasterrmsg = 'Invalid input';
				return false;
			}
			
			$result = false;
			$db = new crc_mysql($this->_DEBUG);
			$dbhandle = $db->fn_connect();
			if ($dbhandle != false) {
				$this->m_sql = 'update ' . MYSQL_ATTENDANCE_TBL . ' set attendance_check = "' . ucwords($action) . '"
												where attendance_id = ' . $id;

				$result = $db->fn_runsql(MYSQL_DB, $this->m_sql);
				$db->fn_disconnect($dbhandle);
			}
			if ($result == false) {
				$this->lasterrnum = $db->lasterrnum;
				$this->lasterrmsg = $db->lasterrmsg;
			}

			return $result;
		}

		function fn_setpresent($action, $scheduleid, $day, $month, $year) {
			//******************************************
			// Set the attendance for a student
			//******************************************
			if ($this->_DEBUG) {
				echo "DEBUG {crc_teacher::fn_setpresent}: Setting student presence.<br>";
			}
			
			//check inputs
			if (!isset($action, $scheduleid, $day, $month, $year) ||
			   ($action == "") || ($scheduleid == "") || ($day == "") || ($month == "") || ($year == "")) {
			   	$this->lasterrmsg = "Invalid input";
			   	return false;
			}
			$action = strtoupper($action[0]);
			if (($action != "A") && ($action != "P")) {
				$this->lasterrmsg = 'Invalid action. Should be either "A" or "P"';
			   	return false;
			}
			
			$result = false;
			$db = new crc_mysql($this->_DEBUG);
			$dbhandle = $db->fn_connect();
			if ($dbhandle != false) {				
				//check if the date exists in table
				$this->fn_getdateid($db, $day, $month, $year);
				if ($this->m_dateid == 0) {
					//insert the date into table
					$this->m_sql = 'insert into ' . MYSQL_DATE_TBL . '(' .
												'date_day, date_month, date_year) ' .
												'values("' . $day .
												'","' . $month . 
												'","' . $year . '")';
					$resource = $db->fn_runsql(MYSQL_DB, $this->m_sql);
					if (mysql_affected_rows() <= 0) {
						if ($this->_DEBUG) {
							echo "ERROR {crc_teacher::fn_setpresent}: Cannot insert the date.<br>";
						}
						$db->fn_disconnect();						
						return false;
					}
					$this->fn_getdateid($db, $day, $month, $year);
				}
				
				//check if attendance has been already inserted
				$this->m_sql = 'select attendance_id, attendance_check from ' . MYSQL_ATTENDANCE_TBL .
								' where (attendance_student_schedule_id = "' . $scheduleid . '" and ' .
								'attendance_date_id = "' . $this->m_dateid . '")';
				$resource = $db->fn_runsql(MYSQL_DB, $this->m_sql);
				$update = false;
				if (is_resource($resource)) {
					if (mysql_affected_rows() > 0) {
						$row = mysql_fetch_row($resource);
						$attendancecheck = $row[1];
						if($attendancecheck == $action) { //nothing to be done
							$db->fn_freesql($resource);
							$db->fn_disconnect();
							return true;
						} else {
							$attendanceid = $row[0];
							$update = true;//an attendance update is required
						}
					}
					$db->fn_freesql($resource);
				}
				
				//insert attendance
				if($update == false) {
					$this->m_sql = 'insert into ' . MYSQL_ATTENDANCE_TBL . '(' .
										'attendance_student_schedule_id, attendance_date_id, attendance_check) ' .
										'values("' . $scheduleid .
										'","' . $this->m_dateid . 
										'","'. $action .'")';
				} else {
					$this->m_sql = 'update ' . MYSQL_ATTENDANCE_TBL . ' set attendance_check = "' .
									$action . '" where (attendance_id = "' . $attendanceid . '")';
				}
				$result = $db->fn_runsql(MYSQL_DB, $this->m_sql);
				$db->fn_disconnect();
			} else if ($this->_DEBUG) {
				echo "ERROR {crc_teacher::fn_setpresent}: " . $db->lasterrmsg . ".<br>";
			}
			$this->lasterrnum = $db->lasterrnum;
			$this->lasterrmsg = $db->lasterrmsg;			
			return $result;
		}
		
		function fn_approve($action, $student_scheduleid) {
			//******************************************
			// Approve or disapprove a student's course enrollment
			//******************************************
			if ($this->_DEBUG) {
				echo "DEBUG {crc_teacher::fn_setpresent}: Approving schedule.<br>";
			}
			//check inputs
			if (!isset($action, $student_scheduleid) ||
			   ($action == "") || ($student_scheduleid == "")) {
			   	$this->lasterrmsg = "Invalid input";
			   	die('Invalid input');
			   	return false;
			}
//			$action = strtoupper($action[0]);
			if (($action != "AP") && ($action != "DAP")) {
				$this->lasterrmsg = 'Invalid action. Should be either "AP" or "DAP"';
			   	die('invalid action' . $action);
			   	return false;
			}
			
			$result = false;
			$db = new crc_mysql($this->_DEBUG);
			$dbhandle = $db->fn_connect();
			if ($dbhandle != false) {
					if($action == "AP")
					{
						$this->m_sql = 'update ' . MYSQL_STUDENT_SCHEDULE_TBL . ' set student_schedule_approved = "1" '.
									   'where student_schedule_id = ' . $student_scheduleid;
					}
					else if($action == "DAP")
					{
						$this->m_sql = 'update ' . MYSQL_STUDENT_SCHEDULE_TBL . ' set student_schedule_approved = "0" '.
									   'where student_schedule_id = ' . $student_scheduleid;					
					}
//include('../mysql.php')
					$db->fn_runsql(MYSQL_DB, $this->m_sql);
				}
				else
				{
					die('DB HANDLE FLASE!');
				}
		
		return true;		
		}
		
		function fn_getdateid($db, $day, $month, $year) {
			//******************************************
			// Get date ID
			//******************************************
			if ($this->_DEBUG) {
				echo "DEBUG {crc_admin::fn_getdateid}: Retreiving the date id for " . $day . "-" . $month . "-" . $year ." <br>";
			}
			
			//check inputs
			if (!isset($db, $day, $month, $year) || ($day == "") ||
				($month == "") || ($year == "")) {
				$this->lasterrmsg = 'Invalid input';
				return 0;
			}

			$this->m_dateid = 0;
			if ($db->m_mysqlhandle != false) {
				$this->m_sql = 'select date_id from ' . MYSQL_DATE_TBL .
								' where (date_day = "' . $day . '" and ' .
								'date_month = "' . $month . '" and ' .
								'date_year = "' . $year . '")';
				$resource = $db->fn_runsql(MYSQL_DB, $this->m_sql);
				if (is_resource($resource)) {
					if (mysql_num_rows($resource) > 0) {
						$row = mysql_fetch_row($resource);
						$this->m_dateid = $row[0];
					}
					$db->fn_freesql($resource);
				} else {
					$this->lasterrmsg = $db->lasterrmsg;
					$this->lasterrnum = $db->lasterrnum;
					if ($this->_DEBUG) {
						echo 'ERROR {crc_admin::fn_getdateid}: ' . $this->lasterrmsg . '.<br>';
					}
				}
			} else {
				$this->lasterrmsg = 'Invalid MySQL handle';
				if ($this->_DEBUG) {
					echo 'ERROR {crc_admin::fn_getdateid}: ' . $this->lasterrmsg . '.<br>';
				}
			}
			return $this->m_dateid;			
		}

		function fn_getattendance($profileid, $scheduleid) {
			//***************************************
			// Get the attendance for all student(s)
			//***************************************
			if ($this->_DEBUG) {
				echo "DEBUG {crc_teacher::fn_getattendance}: Retreiving attendance for profile id " . $profileid . ". <br>";
			}
			
			//check input
			if (!isset($profileid, $scheduleid) || ($profileid == "") || ($scheduleid == "")) {
				$this->lasterrmsg = 'Invalid input';
				return null;
			}
			
			$db = new crc_mysql($this->_DEBUG);
			$dbhandle = $db->fn_connect();
			$this->m_data = null;
			if ($dbhandle != false) {
				$this->m_sql = 'select course_name, profile_firstname, profile_lastname, ' .
								'date_day, date_month, date_year, attendance_check, ' .
								'attendance_id, profile_id, schedule_id, schedule_status ' .
					       		'from ' . MYSQL_DATE_TBL . ' as d, ' . 
								MYSQL_ATTENDANCE_TBL . ' as a, ' . 
								MYSQL_STUDENT_SCHEDULE_TBL . ' as s, ' . 
								MYSQL_PROFILES_TBL . ' as p, ' .
								MYSQL_SCHEDULE_TBL . ' as sc, ' . 
								MYSQL_COURSES_TBL . ' as c ' .
					       		'where a.attendance_date_id = d.date_id and ' .
								'a.attendance_student_schedule_id = s.student_schedule_id and ' .
								's.student_schedule_profile_id = p.profile_id and ' .
								's.student_schedule_schedule_id = sc.schedule_id and ' .
								'sc.schedule_course_id = c.course_id and ' .
								's.student_schedule_profile_id = ' . $profileid . ' and ' . 
								'sc.schedule_id = ' . $scheduleid . 
								' order by a.attendance_id asc';
				$result = $db->fn_runsql(MYSQL_DB, $this->m_sql);
				if (is_resource($result)) {
					if (mysql_num_rows($result) > 0) {
						$index = 0;
						while ($row = mysql_fetch_array($result)) {
							if ($this->_DEBUG) {
								echo "DEBUG {crc_teacher::fn_getattendance}: Found attendance id " . $row[0] . " for this profile. <br>";
							}
							$this->m_data[$index] = $row;
							$index = $index + 1;
						}
					}
					$db->fn_freesql($result);
				}
				$db->fn_disconnect($dbhandle);
			} else {
				$this->lasterrnum = $db->lasterrnum;
				$this->lasterrmsg = $db->lasterrmsg;
			}
			
			return $this->m_data;
		}

		function fn_getstudents($scheduleid) {
			//******************************************
			// Get all student(s) for a course
			//******************************************
			if ($this->_DEBUG) {
				echo "DEBUG {crc_teacher::fn_getstudents}: Retreiving all the students for schedule id " . $scheduleid . ". <br>";
			}
			
			//check inputs
			if (!isset($scheduleid) || ($scheduleid == "")) {
				$this->lasterrmsg = 'Invalid input';
				return null;
			}
			
			$db = new crc_mysql($this->_DEBUG);
			$dbhandle = $db->fn_connect();
			$this->m_data = null;
			if ($dbhandle != false) {
				$this->m_sql = 'select schedule_id, course_name, profile_firstname, ' .
				       			'profile_lastname, profile_email, student_schedule_paid, ' .
								'profile_id, student_schedule_id ' .
								'from ' . MYSQL_SCHEDULE_TBL . ' as s, ' .
									MYSQL_COURSES_TBL . ' as c, ' .
									MYSQL_PROFILES_TBL . ' as p, ' .
									MYSQL_STUDENT_SCHEDULE_TBL . ' as t ' .
								'where s.schedule_course_id = c.course_id ' .
								'and t.student_schedule_schedule_id = s.schedule_id ' .
								'and t.student_schedule_profile_id = p.profile_id ' .
								'and t.student_schedule_schedule_id = ' . $scheduleid .
								' order by c.course_name, p.profile_lastname';
				$result = $db->fn_runsql(MYSQL_DB, $this->m_sql);
				if (is_resource($result)) {
					if (mysql_num_rows($result) > 0) {
						$index = 0;
						while ($row = mysql_fetch_array($result)) {
							$this->m_data[$index] = $row;
							if ($this->fn_getcheck($db, $row[7]) == null) {
								$this->lasterrnum = $db->lasterrnum;
								$this->lasterrmsg = $db->lasterrmsg;
								$db->fn_freesql($result);
								$db->fn_disconnect($dbhandle);
								return null;
							}
							$this->m_data[$index][8] = $this->m_check;
							$index = $index + 1;
						}
					}
					$db->fn_freesql($result);
				}
			} else {
				$this->lasterrnum = $db->lasterrnum;
				$this->lasterrmsg = $db->lasterrmsg;
			}
			$db->fn_disconnect($dbhandle);
			return $this->m_data;
		}
		
		function fn_getstudentsapproved($scheduleid) {
			//******************************************
			// Get all student(s) for a course that have been approved
			//******************************************
			if ($this->_DEBUG) {
				echo "DEBUG {crc_teacher::fn_getstudents}: Retreiving the students approved for schedule id " . $scheduleid . ". <br>";
			}
			
			//check inputs
			if (!isset($scheduleid) || ($scheduleid == "")) {
				$this->lasterrmsg = 'Invalid input';
				return null;
			}
			
			$db = new crc_mysql($this->_DEBUG);
			$dbhandle = $db->fn_connect();
			$this->m_data = null;
			if ($dbhandle != false) {
				$this->m_sql = 'select schedule_id, course_name, profile_firstname, ' .
				       			'profile_lastname, profile_email, student_schedule_paid, ' .
								'profile_id, student_schedule_id ' .
								'from ' . MYSQL_SCHEDULE_TBL . ' as s, ' .
									MYSQL_COURSES_TBL . ' as c, ' .
									MYSQL_PROFILES_TBL . ' as p, ' .
									MYSQL_STUDENT_SCHEDULE_TBL . ' as t ' .
								'where s.schedule_course_id = c.course_id ' .
								'and t.student_schedule_schedule_id = s.schedule_id ' .
								'and t.student_schedule_profile_id = p.profile_id ' .
								'and t.student_schedule_schedule_id = ' . $scheduleid .
								' order by c.course_name, p.profile_lastname';

				$this->m_sql = 'select schedule_id, course_number, course_name, profile_name, ' .
				       			'profile_email, profile_enrollno, ' .
								'profile_id, student_schedule_id ' .
								'from ' . MYSQL_SCHEDULE_TBL . ' as s, ' .
									MYSQL_COURSES_TBL . ' as c, ' .
									MYSQL_PROFILES_TBL . ' as p, ' .
									MYSQL_STUDENT_SCHEDULE_TBL . ' as t ' .
								'where s.schedule_course_id = c.course_id ' .
								'and t.student_schedule_schedule_id = s.schedule_id ' .
								'and t.student_schedule_profile_id = p.profile_id ' .
								'and t.student_schedule_schedule_id = ' . $scheduleid .
								' and t.student_schedule_approved = "1" order by c.course_number, p.profile_name';
				$result = $db->fn_runsql(MYSQL_DB, $this->m_sql);
				if (is_resource($result)) {
					if (mysql_num_rows($result) > 0) {
						$index = 0;
						while ($row = mysql_fetch_array($result)) {
							$this->m_data[$index] = $row;
							if ($this->fn_getcheck($db, $row[7]) == null) {
								$this->lasterrnum = $db->lasterrnum;
								$this->lasterrmsg = $db->lasterrmsg;
								$db->fn_freesql($result);
								$db->fn_disconnect($dbhandle);
								return null;
							}
							$this->m_data[$index][8] = $this->m_check;
							$index = $index + 1;
						}
					}
					$db->fn_freesql($result);
				}
			} else {
				$this->lasterrnum = $db->lasterrnum;
				$this->lasterrmsg = $db->lasterrmsg;
			}
			$db->fn_disconnect($dbhandle);
			return $this->m_data;
		}

		function fn_getstudentstoapprove($scheduleid) {
			//******************************************
			// Get all student(s) for a course that are to be approved
			//******************************************
			if ($this->_DEBUG) {
				echo "DEBUG {crc_teacher::fn_getstudents}: Retreiving the students to be approved for schedule id " . $scheduleid . ". <br>";
			}
			
			//check inputs
			if (!isset($scheduleid) || ($scheduleid == "")) {
				$this->lasterrmsg = 'Invalid input';
				return null;
			}
			
			$db = new crc_mysql($this->_DEBUG);
			$dbhandle = $db->fn_connect();
			$this->m_data = null;
			if ($dbhandle != false) {
				$this->m_sql = 'select schedule_id, course_name, profile_firstname, ' .
				       			'profile_lastname, profile_email, student_schedule_paid, ' .
								'profile_id, student_schedule_id ' .
								'from ' . MYSQL_SCHEDULE_TBL . ' as s, ' .
									MYSQL_COURSES_TBL . ' as c, ' .
									MYSQL_PROFILES_TBL . ' as p, ' .
									MYSQL_STUDENT_SCHEDULE_TBL . ' as t ' .
								'where s.schedule_course_id = c.course_id ' .
								'and t.student_schedule_schedule_id = s.schedule_id ' .
								'and t.student_schedule_profile_id = p.profile_id ' .
								'and t.student_schedule_schedule_id = ' . $scheduleid .
								' order by c.course_name, p.profile_lastname';

				$this->m_sql = 'select schedule_id, course_number, course_name, profile_name, ' .
				       			'profile_email, profile_enrollno, ' .
								'profile_id, student_schedule_id ' .
								'from ' . MYSQL_SCHEDULE_TBL . ' as s, ' .
									MYSQL_COURSES_TBL . ' as c, ' .
									MYSQL_PROFILES_TBL . ' as p, ' .
									MYSQL_STUDENT_SCHEDULE_TBL . ' as t ' .
								'where s.schedule_course_id = c.course_id ' .
								'and t.student_schedule_schedule_id = s.schedule_id ' .
								'and t.student_schedule_profile_id = p.profile_id ' .
								'and t.student_schedule_schedule_id = ' . $scheduleid .
								' and t.student_schedule_approved = "0" order by c.course_number, p.profile_name';
				$result = $db->fn_runsql(MYSQL_DB, $this->m_sql);
				if (is_resource($result)) {
					if (mysql_num_rows($result) > 0) {
						$index = 0;
						while ($row = mysql_fetch_array($result)) {
							$this->m_data[$index] = $row;
							if ($this->fn_getcheck($db, $row[7]) == null) {
								$this->lasterrnum = $db->lasterrnum;
								$this->lasterrmsg = $db->lasterrmsg;
								$db->fn_freesql($result);
								$db->fn_disconnect($dbhandle);
								return null;
							}
							$this->m_data[$index][8] = $this->m_check;
							$index = $index + 1;
						}
					}
					$db->fn_freesql($result);
				}
			} else {
				$this->lasterrnum = $db->lasterrnum;
				$this->lasterrmsg = $db->lasterrmsg;
			}
			$db->fn_disconnect($dbhandle);
			return $this->m_data;
		}
		

		function fn_getcheck($db, $studentscheduleid) {
			//******************************************
			// Get attendance check
			//******************************************
			if ($this->_DEBUG) {
				echo "DEBUG {crc_admin::fn_getcheck}: Retreiving the attendance check for " . $studentscheduleid ." <br>";
			}
			
			//check inputs
			if (!isset($db, $studentscheduleid) || ($studentscheduleid == "")) {
				$this->lasterrmsg = 'Invalid input';
				return null;
			}

			$this->m_check = 'A';
			if ($db->m_mysqlhandle != false) {
				
				//check if the current date is already in database
				$currentdate = @getdate();//local time needs to be set in php.ini
				if ($currentdate['mday'] < 10) {
					$currentdate['mday'] = '0' . $currentdate['mday'];
				}
				if ($currentdate['mon'] < 10) {
					$currentdate['mon'] = '0' . $currentdate['mon'];
				}
				$this->fn_getdateid($db, $currentdate['mday'], $currentdate['mon'], $currentdate['year']);
				if ($this->m_dateid == 0) {
					//insert current date
					$this->m_sql = 'insert into ' . MYSQL_DATE_TBL . '(' .
									'date_day, date_month, date_year) ' .
									'values("' . $currentdate['mday'] .
									'","' . $currentdate['mon'] . 
									'","' . $currentdate['year'] . '")';
					$resource = $db->fn_runsql(MYSQL_DB, $this->m_sql);
					if ($resource == false) {
						return null;//an error occured
					}
					$this->fn_getdateid($db, $currentdate['mday'], $currentdate['mon'], $currentdate['year']);
					if ($this->m_dateid == 0) {
						return null;//an error occured
					}
					//insert default attendance and date
					$this->m_sql = 'insert into ' . MYSQL_ATTENDANCE_TBL . '(' .
									'attendance_student_schedule_id, attendance_date_id, attendance_check) ' .
									'values("' . $studentscheduleid .
									'","' . $this->m_dateid . 
									'","'. 	$this->m_check .'")';
					$resource = $db->fn_runsql(MYSQL_DB, $this->m_sql);
					if ($resource == false) {
						return null;//an error occured
					}					
				} else { //this date already exists in database
					$this->m_sql = 'select attendance_check from ' . MYSQL_ATTENDANCE_TBL .
									' where (attendance_student_schedule_id = "' . $studentscheduleid . '") and ' .
									'(attendance_date_id= "' . $this->m_dateid . '")';
					$resource = $db->fn_runsql(MYSQL_DB, $this->m_sql);
					if (is_resource($resource)) {
						if (mysql_num_rows($resource) > 0) {
							$row = mysql_fetch_row($resource);
							$this->m_check = $row[0];
							$db->fn_freesql($resource);
							return 	$this->m_check;
						}
						$db->fn_freesql($resource);
					}
					//insert default attendance and date
					$this->m_sql = 'insert into ' . MYSQL_ATTENDANCE_TBL . '(' .
									'attendance_student_schedule_id, attendance_date_id, attendance_check) ' .
									'values("' . $studentscheduleid .
									'","' . $this->m_dateid . 
									'","'. 	$this->m_check .'")';
					$resource = $db->fn_runsql(MYSQL_DB, $this->m_sql);
					if ($resource == false) {
						return null;//an error occured
					}
				}
				return 	$this->m_check;
			} else {
				$this->lasterrmsg = 'Invalid MySQL handle';
			}
			return 	null;		
		}
	}
?>
