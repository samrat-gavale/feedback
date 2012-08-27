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
	// Desc: The Courses Object
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

	class crc_courses extends crc_object {

		var $m_sql;
		var $m_data;
		var $m_roomid;
		var $m_scheduleid;

		function crc_courses($debug) {
			//******************************************
			// Initialization by constructor
			//******************************************
			$this->classname = 'crc_courses';
			$this->classdescription = 'Courses resitered by student.';
			$this->classversion = '1.0.0';
			$this->classdate = 'March 10th, 2003';
			$this->classdevelopername = 'Shaffin Bhanji';
			$this->classdeveloperemail = 'shaffin_bhanji@hotmail.com';
			$this->_DEBUG = $debug;
			if ($this->_DEBUG) {
				echo '<font color="blue">';
				echo "DEBUG {crc_courses::constructor}: The class \"crc_courses\" was successfuly created. <br>";
				echo "DEBUG {crc_courses::constructor}: Running in debug mode. <br>";
				echo '</font>';
			}
		}

		function fn_getcourses($profileid) {
			//******************************************
			// Get all the courses the student has enrolled in 
			//******************************************
			$db = new crc_mysql($this->_DEBUG);
			$dbhandle = $db->fn_connect();
			if ($dbhandle != false) {

				if ($this->_DEBUG) {
					echo "DEBUG {crc_courses::fn_getcourses}: Retreiving the courses for the profile id " . $profileid . "<br>";
				}
				$this->m_sql = 'select course_name, schedule_start_date, ' .
														'schedule_end_date, schedule_day_time, course_fee, ' .
														'schedule_status, schedule_id, schedule_room_id, room_name ' .
												'from ' . MYSQL_SCHEDULE_TBL . ' as s, ' . MYSQL_COURSES_TBL . ' as c, ' . 
														MYSQL_ROOMS_TBL . ' as r ' .
												'where (s.schedule_course_id=c.course_id) and ' .
														'(s.schedule_room_id=r.room_id) ' .
												'order by c.course_name asc';

				$this->m_sql = 'select course_number, course_name, schedule_id, schedule_status from '.
								MYSQL_SCHEDULE_TBL . ' as s, ' . MYSQL_COURSES_TBL . ' as c '.
								'where (s.schedule_course_id=c.course_id) order by c.course_number asc';

				$result = $db->fn_runsql(MYSQL_DB, $this->m_sql);
				if (mysql_num_rows($result) > 0) {
					$index = 0;
					while ($row = mysql_fetch_array($result)) {

						if ($this->_DEBUG) {
							echo "DEBUG {crc_courses::fn_getcourses}: Checking to see if profile id: " . $profileid . " enrolled into a course scheduled under schedule id: " . $row[6] . ". <br>";
						}
						$this->m_sql = 'select * from ' . MYSQL_STUDENT_SCHEDULE_TBL . ', ' . MYSQL_SCHEDULE_TBL . 
														' where student_schedule_schedule_id = ' . $row[2] . ' and student_schedule_profile_id = ' . $profileid;

						$enrol = $db->fn_runsql(MYSQL_DB, $this->m_sql);
						if (mysql_num_rows($enrol) > 0) {
							$this->m_data[$index] = $row;
							$question = mysql_fetch_array($enrol);
							$this->m_data[$index][5] = $question[0];
							$this->m_data[$index][6] = $question[3];
							$this->m_data[$index][7] = $question[4];
							$index = $index + 1;
						}
						$db->fn_freesql($enrol);
					}
				}
				$db->fn_freesql($result);
				$db->fn_disconnect($dbhandle);
				return $this->m_data;
			} else {
				$this->lasterrnum = $db->lasterrnum;
				$this->lasterrmsg = $db->lasterrmsg;
				$db->fn_disconnect($dbhandle);
				return null;
			}
		}

		function fn_getcourseinfo($courseid) {
			//******************************************
			// Get the course information, given course id 
			//******************************************
			$db = new crc_mysql($this->_DEBUG);
			$dbhandle = $db->fn_connect();
			$this->m_data = null;
			if ($dbhandle != false) {

				if ($this->_DEBUG) {
					echo "DEBUG {crc_courses::fn_getcourseinfo}: Retreiving the courses for the course id " . $courseid . "<br>";
				}
/*				$this->m_sql = 'select * from ' .
								MYSQL_COURSES_TBL . ' as c, ' . MYSQL_SCHEDULE_TBL . ' as s, ' . 
								MYSQL_ROOMS_TBL . ' as r ' .
								'where (c.course_id=' . $courseid . ') and ' .
								'(s.schedule_course_id = c.course_id) and ' .
								'(s.schedule_room_id = r.room_id)';
*/
				$this->m_sql  = 'select * from '.
								MYSQL_COURSES_TBL . ' as c, ' . MYSQL_SCHEDULE_TBL . ' as s ' . 
								'where (c.course_id=' . $courseid . ') and ' .
								'(s.schedule_course_id = c.course_id)';

				$result = $db->fn_runsql(MYSQL_DB, $this->m_sql);
				if (mysql_num_rows($result) > 0) {
					$this->m_data = mysql_fetch_row($result);
				}
				$db->fn_freesql($result);
			} else {
				$this->lasterrnum = $db->lasterrnum;
				$this->lasterrmsg = $db->lasterrmsg;
			}
			$db->fn_disconnect($dbhandle);
			return $this->m_data;
		}		

		function fn_setcourseinfo($post) {
			//****************************
			// Set the course information 
			//****************************
			if ($this->_DEBUG) {
				echo "DEBUG {crc_courses::fn_setcourseinfo}: Retreiving the courses for the course id " . $post['courseid'] . "<br>";
			}
			
			//input check
			if(!isset($post['cname']) || !isset($post['cnum']) ||
//			   !isset($post['cactive']) ||
			   !isset($post['cstatus'])
			   ) {
			   	$this->lasterrmsg = "Invalid input";
				return false;
			}
			if(($post['cname'] == "") || ($post['cnum'] == "")) {
				return false;
			}
			
			$db = new crc_mysql($this->_DEBUG);
			$dbhandle = $db->fn_connect();
			$retresult = false;
			if ($dbhandle != false) {
				
				//update courses table
				if(isset($post['cactive']) && (strtolower($post['cactive']) == "on")) {
					$cactive = '1';
				} else {
					$cactive = '0';
				}				
				$this->m_sql = 'update ' . MYSQL_COURSES_TBL . ' set course_name = "' . 
									$post['cname'] . '", course_number = "' .
									$post['cnum'] . '", course_active = "' . $cactive . '" ' .
									' where(course_id = "' . $post['courseid'] . '")';

				$result = $db->fn_runsql(MYSQL_DB, $this->m_sql);
				if (mysql_errno() != 0) {
					$this->lasterrnum = $db->lasterrnum;
					$this->lasterrmsg = $db->lasterrmsg;
					$db->fn_freesql($result);
					$db->fn_disconnect($dbhandle);
					return false;
				}
				
				//update schedule table
/*				$this->m_sql = 'update ' . MYSQL_SCHEDULE_TBL . ' set schedule_start_date = "' . 
									$post['syear'] . '-' . $post['smonth'] . '-' . $post['sday'] . '", schedule_end_date = "' .
									$post['eyear'] . '-' . $post['emonth'] . '-' . $post['eday'] . '", schedule_day_time = "' . $post['daytime'] .
									'", schedule_status = "' . $post['cstatus'] . '" ' .
									'where(schedule_course_id = "' . $post['courseid'] . '")';
*/
				$this->m_sql = 'update ' . MYSQL_SCHEDULE_TBL . ' set ' . 
									'schedule_status = "' . $post['cstatus'] . '" ' .
									'where(schedule_course_id = "' . $post['courseid'] . '")';

				$result = $db->fn_runsql(MYSQL_DB, $this->m_sql);
				if (mysql_errno() != 0) {
					$this->lasterrnum = $db->lasterrnum;
					$this->lasterrmsg = $db->lasterrmsg;
					$db->fn_freesql($result);
					$db->fn_disconnect($dbhandle);
					return false;
				}
				
				//add/remove from teacher schedule
				$teacherlist = $this->fn_getteacherlist($db, $post['courseid']);
				if ($teacherlist == null) {
					$this->lasterrnum = $db->lasterrnum;
					$this->lasterrmsg = $db->lasterrmsg;
					$db->fn_freesql($result);
					$db->fn_disconnect($dbhandle);
					return false;					
				}
				$scheduleid = $this->fn_getscheduleid($db, $post['courseid']);
				if ($scheduleid == 0) {
					$this->lasterrmsg = "Invalid course ID";
					$db->fn_freesql($result);
					$db->fn_disconnect($dbhandle);
					return false;					
				}
				for ($i = 0; $i < count($teacherlist); $i++) {
					$this->m_sql = null;
					if (($teacherlist[$i]['assigned'] == true) && !isset($post['teacher' . $i])) {
						//remove this teacher from teacher schedule
						$this->m_sql = 'delete from ' . MYSQL_TEACHER_SCHEDULE_TBL . 
										' where (teacher_schedule_profile_id = ' . $teacherlist[$i]['profileid'] . ' and teacher_schedule_schedule_id = ' . $scheduleid . ')';
					} else if (($teacherlist[$i]['assigned'] == false) && isset($post['teacher' . $i])) {
						//add this teacher to teacher schedule
						$this->m_sql = 'insert into ' . MYSQL_TEACHER_SCHEDULE_TBL . '(' .
									'teacher_schedule_profile_id, ' .
									'teacher_schedule_schedule_id, ' .
									'teacher_schedule_evaluation) ' .
									'values("' . $teacherlist[$i]['profileid'] .
									'","' . $scheduleid . 
									'","0")';
					}
					if ($this->m_sql != null) {
						$result = $db->fn_runsql(MYSQL_DB, $this->m_sql);
						if (mysql_errno() != 0) {
							$this->lasterrnum = $db->lasterrnum;
							$this->lasterrmsg = $db->lasterrmsg;
							$db->fn_freesql($result);
							$db->fn_disconnect($dbhandle);
							return false;
						}
					}
				}
				
				$db->fn_freesql($result);
				$retresult = true;
			} else {
				$this->lasterrnum = $db->lasterrnum;
				$this->lasterrmsg = $db->lasterrmsg;
			}
			$db->fn_disconnect($dbhandle);
			return $retresult;
		}		
		
		function fn_getroomid($db, $roomname) {
			//******************************************
			// Get room ID
			//******************************************

			if ($this->_DEBUG) {
				echo "DEBUG {crc_courses::fn_getroomid}: Retreiving the room id for " . $roomname . " <br>";
			}

			$this->m_roomid = 0;
			if ($db->m_mysqlhandle != false) {
				$this->m_sql = 'select room_id from ' . MYSQL_ROOMS_TBL .
												' where (room_name = "' . $roomname . '")';
				$resource = $db->fn_runsql(MYSQL_DB, $this->m_sql);
				if (mysql_num_rows($resource) > 0) {
					$row = mysql_fetch_row($resource);
					$this->m_roomid = $row[0];
				} else {
					if ($this->_DEBUG) {
						echo 'ERROR {crc_courses::fn_getroomid}: The sql command returned nothing. <br>';
					}
				}
			}
			return $this->m_roomid;
		}		

		function fn_getscheduleid($db, $courseid) {
			//******************************************
			// Get the schedule id for the given course id
			//******************************************

			if ($this->_DEBUG) {
				echo "DEBUG {crc_courses::fn_getscheduleid}: Retreiving the schedule id for the course id " . $courseid . " <br>";
			}

			$this->m_scheduleid = 0;
			if ($db->m_mysqlhandle != false) {
				$this->m_sql = 'select schedule_id from ' . MYSQL_SCHEDULE_TBL .
								' where (schedule_course_id = "' . $courseid . '")';
				$resource = $db->fn_runsql(MYSQL_DB, $this->m_sql);
				if (mysql_num_rows($resource) > 0) {
					$row = mysql_fetch_row($resource);
					$this->m_scheduleid = $row[0];
				} else {
					if ($this->_DEBUG) {
						echo 'ERROR {crc_courses::fn_getscheduleid}: The sql command returned nothing.<br>';
					}
				}
			}
			return $this->m_scheduleid;
		}		
		
		function fn_removecourse($profileid, $courseid) {
			//******************************************
			// Remove a course enrollment
			//******************************************
			$result = false;

			$db = new crc_mysql($this->_DEBUG);
			$dbhandle = $db->fn_connect();
			if ($dbhandle != false) {

				if ($this->_DEBUG) {
					echo "DEBUG {crc_courses::fn_removecourses}: Removing course id: " . $courseid . " from student schedule. Profile id: " . $profileid . ".<br>";
				}
				if ($profileid > 0) {
					$this->m_sql = 'delete from ' . MYSQL_STUDENT_SCHEDULE_TBL . 
													' where (student_schedule_profile_id = ' . $profileid . ' and student_schedule_schedule_id = ' . $courseid . ')';

					$db->fn_runsql(MYSQL_DB, $this->m_sql);
					if (mysql_affected_rows() > 0) {
						$result = true;
					} else {
						if ($this->_DEBUG) {
							echo "DEBUG {crc_courses::fn_removecourses}: Could not remove course id: " . $courseid . " from student schedule.<br>";
						}
					}
				}
				$db->fn_disconnect($dbhandle);
				return $result;
			} else {
				$this->lasterrnum = $db->lasterrnum;
				$this->lasterrmsg = $db->lasterrmsg;
				return $result;
			}
		}
		
		function fn_getteacherlist($db, $courseid) {
			//***********************************************************
			// Get a list with all teachers, the teachers already assigned
			//to the specified course (with given courseid) are marked
			//***********************************************************
			
			if ($this->_DEBUG) {
				echo "DEBUG {crc_courses::fn_getteacherlist}: Retreiving the teacher list for course id " . $courseid . " <br>";
			}
			
			$closedb = false;
			if ($db == null) {
				$db = new crc_mysql($this->_DEBUG);
				$db->fn_connect();
				$closedb = true;
			}
			$this->m_data = null;
			if ($db->m_mysqlhandle != false) {
				
				$this->m_sql = 'select profile_id, profile_name ' .
								'from ' . MYSQL_PROFILES_TBL . ' as p' . 
								' where (p.profile_active = "1") and ' .
								'(p.profile_role_id = "2") ' .
								'order by p.profile_name asc';
				$resource = $db->fn_runsql(MYSQL_DB, $this->m_sql);											
				if (mysql_num_rows($resource) > 0) {
					$index = 0;
					while ($row = mysql_fetch_array($resource)) {
						$this->m_data[$index]['name'] = $row[1];//name
						$this->m_data[$index]['assigned'] = $this->fn_isassigned($db, $row[0], $courseid);
						$this->m_data[$index]['profileid'] = $row[0];
						$index++;
					}
				}
				$db->fn_freesql($resource);
				
			} else {
				
				$this->lasterrnum = $db->lasterrnum;
				$this->lasterrmsg = $db->lasterrmsg;
				
			}
			if ($closedb == true) {
				$db->fn_disconnect();
			}
			return $this->m_data;
		}
		
		function fn_isassigned($db, $teacherprofileid, $courseid) {
			//**************************************************************
			// Helper function used to decide if a teacher has been asigned
			//to a given course
			//**************************************************************
			
			if ($this->_DEBUG) {
				echo "DEBUG {crc_courses::fn_isassigned}: Checking the teacher with profile id " . $teacherprofileid . " is assigned to the course id " . $courseid . "<br>";
			}
			
			if ($db->m_mysqlhandle != false) {
				$this->m_sql = 'select schedule_id ' .
							'from ' . MYSQL_SCHEDULE_TBL . ' as s' . 
							' where (s.schedule_course_id = "' . $courseid . '")';
				$resource = $db->fn_runsql(MYSQL_DB, $this->m_sql);
				if (mysql_num_rows($resource) <= 0) {
					return false;
				}
					
				$row = mysql_fetch_row($resource);//there should be a single row, if any
				$this->m_sql = 'select teacher_schedule_profile_id ' .
							'from ' . MYSQL_TEACHER_SCHEDULE_TBL . ' as t' . 
							' where (t.teacher_schedule_schedule_id = "' . $row[0] . '")';
				$resource = $db->fn_runsql(MYSQL_DB, $this->m_sql);
				if (mysql_num_rows($resource) <= 0) {
					return false;
				}

				while ($row = mysql_fetch_array($resource)) {
					if ($row[0] == $teacherprofileid) {
						return true;
					}
				}
			}
			
			return false;
		}
	}
?>
