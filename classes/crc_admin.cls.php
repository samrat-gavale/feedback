<?php
	// Include the CRC Object class that needs to
	// extended by all classes. This is the super
	// class.
	include_once('crc_constants.mod.php');
	include_once('crc_object.cls.php');
	include_once('crc_mysql.cls.php');

	//******************************************
	// Name: crc_object
	//******************************************
	//
	// Desc: The Admin Object
	// Developer: FreeSMS team
	// Email: cristeab@gmail.com
	// Date: September 22th, 2010
	// Version: 1.0.0
	//
	// Copyright
	// =========
	// This code is copyright, use in part or
	// whole is prohibited without a written
	// concent to the developer.
	//******************************************

	class crc_admin extends crc_object {

		var $m_sql;
		var $m_data;
		var $m_courseid;
		var $m_coursenum;
		var $m_coursename;
		var $m_active;
		var $m_profileid;
		var $m_scheduleid;
		var $m_evaluation;
		
		var $m_name;
		var $m_enrollno;
		var $m_gender;
		var $m_email;
		var $m_phone;
		
		var $m_courselist;
		var $m_teacherlist;
		var $m_studentlist;
		
		function crc_admin($debug) {
			//******************************************
			// Initialization by constructor
			//******************************************
			$this->classname = 'crc_admin';
			$this->classdescription = 'Handle course administration.';
			$this->classversion = '1.0.0';
			$this->classdate = 'September 22th, 2011';
			$this->classdevelopername = 'Information Management Group, IIT Mandi';
			$this->classdeveloperemail = '';
			$this->_DEBUG = $debug;
			
			$this->m_data['cnum'] = '';
			$this->m_data['cname'] = '';
			
			$this->m_data['name'] = '';
			$this->m_data['enrollno'] = '';
			$this->m_data['gender'] = 'male';
			$this->m_data['email'] = '';

			if ($this->_DEBUG) {
				echo "DEBUG {crc_admin::constructor}: The class \"crc_admin\" was successfuly created. <br>";
				echo "DEBUG {crc_admin::constructor}: Running in debug mode. <br>";
			}

		}

		function fn_setcourse($post) {
			//******************************************
			// Update the course information
			//******************************************

			if ($this->_DEBUG) {
				echo "DEBUG {crc_admin::fn_setcourse}: Setting course information <br>";
			}

			$db = new crc_mysql($this->_DEBUG);
			$db->fn_connect();
			$result = true;
			if ($db->m_mysqlhandle != false) {

				if(isset($post['cname'])) {
					$this->m_coursename = $post['cname'];	
				} else {
					$this->m_coursename = "";
				}
				if(isset($post['cnum'])) {
					$this->m_coursenum = $post['cnum'];
				} else {
					$this->m_coursenum = "";
				}
				$this->m_status = 'In progress';
				$this->m_active = '1';//fixed when adding a course
				$this->m_evaluation = '0';//unused
				
				//this data should be restored if something goes wrong
				$this->m_data['cname'] = $this->m_coursename;
				$this->m_data['cnum'] = $this->m_coursenum;
				
				if( ($this->m_coursename == "") || 
				    ($this->m_coursenum == "")
				   )
				    return false;

				//check if at least one teacher has been selected
				$teacherselected = false;
				$this->fn_getteacherlist($db);
				for($i = 0; $i < count($this->m_teacherlist); $i++) {
					if(isset($post['teacher' . $i])) {
						$teacherselected = true;
						break;
					}
				}
				if ($teacherselected == false) {
					if ($this->_DEBUG) {
						echo 'ERROR {crc_admin::fn_setcourse}: No teacher has been selected. <br>';
					}					
					$this->lasterrmsg = "No teacher has been selected";
					return false;
				}
								
				//set course information
				$this->fn_getcourseid($db, $this->m_coursenum);
				if ($this->m_courseid == 0) { //the course doesn't exist in database
					$this->m_sql = 'insert into ' . MYSQL_COURSES_TBL . '(' .
												'course_name, course_number, ' .
												'course_active) ' .
												'values("' . $this->m_coursename . '","' . $this->m_coursenum .
												 '","' . $this->m_active . '")';
				} else {
					$db->fn_freesql($resource);
					$db->fn_disconnect();
					$this->lasterrmsg = "Course \"" . $this->m_coursenum . "\" already exists in database.<br>Use \"Edit Course\" menu if you want to modify this course.";						
					return false;
				}

				$resource = $db->fn_runsql(MYSQL_DB, $this->m_sql);			
				if (mysql_errno() != 0) {
					if ($this->_DEBUG) {
						echo 'ERROR {crc_admin::fn_setcourse}: Could not update/insert course information. <br>';
					}
					$db->fn_freesql($resource);
					$db->fn_disconnect();
					$this->lasterrmsg = "Could not update/insert course information";					
					return false;
				}
				
				//initialize m_courseid
				$this->fn_getcourseid($db, $this->m_coursenum);
				if($this->m_courseid == 0) {
					if ($this->_DEBUG) {
						echo 'ERROR {crc_admin::fn_setcourse}: Could not get course id. <br>';
					}
					$db->fn_freesql($resource);
					$db->fn_disconnect();
					$this->lasterrmsg = "Could not get course id";					
					return false;
				}
				
				//set schedule for this course
				$this->m_sql = 'insert into ' . MYSQL_SCHEDULE_TBL . '(' .
												'schedule_course_id, ' .
												'schedule_active) ' .
												'values("' . $this->m_courseid .
												 '","' . $this->m_active . '")';
				$resource = $db->fn_runsql(MYSQL_DB, $this->m_sql);

				if (mysql_affected_rows() <= 0) {
					if ($this->_DEBUG) {
						echo 'ERROR {crc_admin::fn_setcourse}: Could not insert schedule information. <br>';
					}
					$db->fn_freesql($resource);
					$db->fn_disconnect();
					$this->lasterrmsg = "Could not insert schedule information";					
					return false;
				}
				
				//initialize m_scheduleid
				$this->fn_getscheduleid($db, $this->m_courseid);
				if($this->m_scheduleid == 0) {
					if ($this->_DEBUG) {
						echo 'ERROR {crc_admin::fn_setcourse}: Could not get schedule id. <br>';
					}
					$db->fn_freesql($resource);
					$db->fn_disconnect();
					$this->lasterrmsg = "Could not get schedule id";					
					return false;
				}				

				//set teacher schedule				
				$this->m_profileid = 0;
				for($i = 0; $i < count($this->m_teacherlist); $i++) {
					if(isset($post['teacher' . $i]) && (strtolower($post['teacher' . $i]) == "on")) {
						$this->m_profileid = $this->m_teacherlist[$i]['profileid'];
						$this->m_sql = 'insert into ' . MYSQL_TEACHER_SCHEDULE_TBL . '(' .
												'teacher_schedule_profile_id, ' .
												'teacher_schedule_schedule_id, ' .
												'teacher_schedule_evaluation) ' .
												'values("' . $this->m_profileid . 
												'","' . $this->m_scheduleid .
												 '","' . $this->m_evaluation . '")';
						$resource = $db->fn_runsql(MYSQL_DB, $this->m_sql);
						if (mysql_affected_rows() <= 0) {
							if ($this->_DEBUG) {
								echo 'ERROR {crc_admin::fn_setcourse}: Could not insert teacher schedule information. <br>';
							}
							$db->fn_freesql($resource);
							$db->fn_disconnect();
							$this->lasterrmsg = "Could not insert teacher schedule information";
							return false;
						}
					}
				}

				//check if at least one teacher has been selected
				if ($this->m_profileid == 0) {
					if ($this->_DEBUG) {
						echo 'ERROR {crc_admin::fn_setcourse}: No teacher has been selected. <br>';
					}
					$result = false;
					$this->lasterrmsg = "No teacher has been selected";
				}
				$db->fn_freesql($resource);
				$db->fn_disconnect();
			} else {
				$db->fn_disconnect();
				$result = false;
				$this->lasterrmsg = "Cannot connect to MySQL database";
			}
			return $result;
		}

		function fn_getcourseid($db, $course_num) {
			//******************************************
			// Get course ID
			//******************************************

			if ($this->_DEBUG) {
				echo "DEBUG {crc_admin::fn_getcourseid}: Retreiving the course id for " . $course_num . " <br>";
			}

			$this->m_courseid = 0;
			if ($db->m_mysqlhandle != false) {

				$this->m_sql = 'select course_id from ' . MYSQL_COURSES_TBL .
												' where (course_number = "' . $course_num . '")';

				$resource = $db->fn_runsql(MYSQL_DB, $this->m_sql);
				if (mysql_num_rows($resource) > 0) {
					$row = mysql_fetch_row($resource);
					$this->m_courseid = $row[0];
				} else {
					if ($this->_DEBUG) {
						echo 'ERROR {crc_admin::fn_getcourseid}: The sql command returned nothing. <br>';
					}
				}				
			} 
			return $this->m_courseid;
		}

		function fn_getroomid($db, $room) {
			//******************************************
			// Get room ID
			//******************************************

			if ($this->_DEBUG) {
				echo "DEBUG {crc_admin::fn_getroomid}: Retreiving the room id for " . $room . " <br>";
			}

			$this->m_roomid = 0;
			if ($db->m_mysqlhandle != false) {

				$this->m_sql = 'select room_id from ' . MYSQL_ROOMS_TBL .
												' where (room_name = "' . $room . '")';
				$resource = $db->fn_runsql(MYSQL_DB, $this->m_sql);
				if (mysql_num_rows($resource) > 0) {
					$row = mysql_fetch_row($resource);
					$this->m_roomid = $row[0];
				} else {
					if ($this->_DEBUG) {
						echo 'ERROR {crc_admin::fn_getroomid}: The sql command returned nothing. <br>';
					}
				}
			}
			return $this->m_roomid;
		}
		
		function fn_getscheduleid($db, $courseid) {
			//******************************************
			// Get schedule ID
			//******************************************

			if ($this->_DEBUG) {
				echo "DEBUG {crc_admin::fn_getscheduleid}: Retreiving the schedule id for " . $courseid . " <br>";
			}

			if ($db->m_mysqlhandle != 0) {
				$this->m_sql = 'select schedule_id from ' . MYSQL_SCHEDULE_TBL .
							    ' where (schedule_course_id = "' . $courseid . '")';

				$resource = $db->fn_runsql(MYSQL_DB, $this->m_sql);
				if (mysql_num_rows($resource) > 0) {
					$row = mysql_fetch_row($resource);
					$this->m_scheduleid = $row[0];					
				} else {
					$this->m_scheduleid = 0;
					if ($this->_DEBUG) {
						echo 'ERROR {crc_admin::fn_getscheduleid}: The sql command returned nothing. <br>';						
					}
				}
				return $this->m_scheduleid;
			} else {
				return 0;
			}
		}
		
		function fn_getcourselist($db) {
			
			//******************************************
			// Get the active course list
			//******************************************
			
			if ($this->_DEBUG) {
				echo "DEBUG {crc_admin::fn_getcourselist}: Getting course list <br>";
			}

			$closedb = false;
			if($db == null) {
				$db = new crc_mysql($this->_DEBUG);
				$db->fn_connect();
				$closedb = true;
			}
			if ($db->m_mysqlhandle != 0) {

/*				$this->m_sql = 'select * ' .
								'from ' . MYSQL_COURSES_TBL . 
								' where (course_active = "1") ' .
								'order by course_number asc';
*/
				$this->m_sql = 'select * ' .
								'from ' . MYSQL_COURSES_TBL . 
								' order by course_number asc';

				$resource = $db->fn_runsql(MYSQL_DB, $this->m_sql);											
				if (mysql_num_rows($resource) > 0) {
					$index = 0;
					$this->m_courselist = '';					
					while ($row = mysql_fetch_array($resource)) {
							$this->m_courselist[$index]['cnumname'] = $row[1] . ', ' . $row[2];

						$this->m_courselist[$index]['courseid'] = $row[0];
						$index++;
					}
				} else {
					$this->m_courselist = null;
					if ($this->_DEBUG) {
						echo 'ERROR {crc_admin::fn_getcourselist}: The sql command returned nothing. <br>';
					}
				}
				if ($closedb == true) {
					$db->fn_freesql($resource);
					$db->fn_disconnect();
				}
				return $this->m_courselist;
			} else {
				if ($closedb == true) {
					$db->fn_disconnect();
				}
				return null;
			}
		}
		function fn_getactivecourselist($db) {
			
			//******************************************
			// Get the active course list
			//******************************************
			
			if ($this->_DEBUG) {
				echo "DEBUG {crc_admin::fn_getcourselist}: Getting course list <br>";
			}

			$closedb = false;
			if($db == null) {
				$db = new crc_mysql($this->_DEBUG);
				$db->fn_connect();
				$closedb = true;
			}
			if ($db->m_mysqlhandle != 0) {

				$this->m_sql = 'select * ' .
								'from ' . MYSQL_COURSES_TBL . 
								' where (course_active = "1") ' .
								'order by course_number asc';

/*				$this->m_sql = 'select * ' .
								'from ' . MYSQL_COURSES_TBL . 
								' order by course_number asc';
*/
				$resource = $db->fn_runsql(MYSQL_DB, $this->m_sql);											
				if (mysql_num_rows($resource) > 0) {
					$index = 0;
					$this->m_courselist = '';					
					while ($row = mysql_fetch_array($resource)) {
							$this->m_courselist[$index]['cnumname'] = $row[1] . ', ' . $row[2];

						$this->m_courselist[$index]['courseid'] = $row[0];
						$index++;
					}
				} else {
					$this->m_courselist = null;
					if ($this->_DEBUG) {
						echo 'ERROR {crc_admin::fn_getcourselist}: The sql command returned nothing. <br>';
					}
				}
				if ($closedb == true) {
					$db->fn_freesql($resource);
					$db->fn_disconnect();
				}
				return $this->m_courselist;
			} else {
				if ($closedb == true) {
					$db->fn_disconnect();
				}
				return null;
			}
		}
		function fn_getinactivecourselist($db) {
			
			//******************************************
			// Get the active course list
			//******************************************
			
			if ($this->_DEBUG) {
				echo "DEBUG {crc_admin::fn_getcourselist}: Getting course list <br>";
			}

			$closedb = false;
			if($db == null) {
				$db = new crc_mysql($this->_DEBUG);
				$db->fn_connect();
				$closedb = true;
			}
			if ($db->m_mysqlhandle != 0) {

				$this->m_sql = 'select * ' .
								'from ' . MYSQL_COURSES_TBL . 
								' where (course_active = "0") ' .
								'order by course_number asc';

				$resource = $db->fn_runsql(MYSQL_DB, $this->m_sql);											
				if (mysql_num_rows($resource) > 0) {
					$index = 0;
					$this->m_courselist = '';					
					while ($row = mysql_fetch_array($resource)) {
							$this->m_courselist[$index]['cnumname'] = $row[1] . ', ' . $row[2];

						$this->m_courselist[$index]['courseid'] = $row[0];
						$index++;
					}
				} else {
					$this->m_courselist = null;
					if ($this->_DEBUG) {
						echo 'ERROR {crc_admin::fn_getcourselist}: The sql command returned nothing. <br>';
					}
				}
				if ($closedb == true) {
					$db->fn_freesql($resource);
					$db->fn_disconnect();
				}
				return $this->m_courselist;
			} else {
				if ($closedb == true) {
					$db->fn_disconnect();
				}
				return null;
			}
		}

		function fn_getteacherlist($db) {
			
			//******************************************
			// Get the teacher list
			//******************************************
			
			if ($this->_DEBUG) {
				echo "DEBUG {crc_admin::fn_getteacherlist}: Getting course list <br>";
			}

			$closedb = false;
			if($db == null) {
				$db = new crc_mysql($this->_DEBUG);
				$db->fn_connect();
				$closedb = true;
			}
			$this->m_teacherlist = null;
			if ($db->m_mysqlhandle != false) {
				
/*				$this->m_sql = 'select profile_id, profile_firstname, profile_lastname ' .
								'from ' . MYSQL_PROFILES_TBL . ' as p' . 
								' where (profile_active = "0") and ' .
								'(profile_role_id between 1 and 2) ' .       //roles of admin and teacher
								'order by p.profile_lastname';
*/
				$this->m_sql = 'select profile_id, profile_name from '. MYSQL_PROFILES_TBL .
							   ' where (profile_active = "1") and (profile_role_id = "2") ' .
							   ' order by profile_name ';
				$resource = $db->fn_runsql(MYSQL_DB, $this->m_sql);											
				if (mysql_num_rows($resource) > 0) {					
					$index = 0;
					$this->m_teacherlist = '';					
					while ($row = mysql_fetch_array($resource)) {						
						$this->m_teacherlist[$index]['name'] = $row[1];  //name
						$this->m_teacherlist[$index]['profileid'] = $row[0];
						$index++;
					}
				} else {
					if ($this->_DEBUG) {
						echo 'ERROR {crc_admin::fn_getteacherlist}: The sql command returned nothing.<br>';
					}
				}
				if ($closedb == true) {
					$db->fn_freesql($resource);
					$db->fn_disconnect();
				}
			} else {
				if ($closedb == true) {
					$db->fn_disconnect();
				}
			}
			return $this->m_teacherlist;
		}		

		function fn_getstudentlist($db) {
			
			//******************************************
			// Get registered student list
			//******************************************
			
			if ($this->_DEBUG) {
				echo "DEBUG {crc_admin::fn_getstudentlist}: Getting registered student list<br>";
			}

			$closedb = false;
			if($db == null) {
				$db = new crc_mysql($this->_DEBUG);
				$db->fn_connect();
				$closedb = true;
			}
			if ($db->m_mysqlhandle != false) {
				$this->m_sql = 'select profile_uid, profile_name, profile_enrollno ' .
								'from ' . MYSQL_PROFILES_TBL . ' as p' . 
								' where (profile_active = "1") and ' .
								'(profile_role_id = "3") ' .
								'order by p.profile_enrollno';
				$resource = $db->fn_runsql(MYSQL_DB, $this->m_sql);											
				if (mysql_num_rows($resource) > 0) {					
					$index = 0;
					$this->m_studentlist = '';					
					while ($row = mysql_fetch_array($resource)) {						
						$this->m_studentlist[$index]['profileuid'] = $row[0];
						$this->m_studentlist[$index]['name'] = $row[1];//name
						$this->m_studentlist[$index]['enrollno'] = $row[2];
						$index++;
					}
				} else {
					$this->m_studentlist = null;
					if ($this->_DEBUG) {
						echo 'ERROR {crc_admin::fn_getstudentlist}: The sql command returned nothing.<br>';
					}
				}
				if ($closedb == true) {
					$db->fn_freesql($resource);
					$db->fn_disconnect();
				}
				return $this->m_studentlist;
			} else {
				if ($closedb == true) {
					$db->fn_disconnect();
				}
				return null;
			}
		}		
		
		function fn_getprofileid($db, $name) {
			//******************************************
			// Get profile ID
			//******************************************

			if ($this->_DEBUG) {
				echo "DEBUG {crc_admin::fn_getprofileid}: Retreiving the schedule id for " . $name . " " . $lastname . "<br>";
			}

			if ($db->m_mysqlhandle != false) {

/*				$this->m_sql = 'select profile_id from ' . MYSQL_PROFILES_TBL .
							    ' where (profile_firstname = "' . $firstname . 
							    '" and profile_lastname = "' . $lastname . '")';
*/
				$this->m_sql = 'select profile_id from ' . MYSQL_PROFILES_TBL .
							    ' where (profile_name = "' . $name . 
							    '" )';

				$resource = $db->fn_runsql(MYSQL_DB, $this->m_sql);
				if (mysql_num_rows($resource) > 0) {
					$row = mysql_fetch_row($resource);
					$this->m_profileid = $row[0];
				} else {
					$this->m_profileid = 0;
					if ($this->_DEBUG) {
						echo 'ERROR {crc_admin::fn_getprofileid}: The sql command returned nothing. <br>';
					}
				}
				return $this->m_profileid;
			} else {
				return 0;
			}
		}
		
		function fn_setstudent($post) {

			if ($this->_DEBUG) {
				echo "DEBUG {crc_admin::fn_setstudent}: Setting student information <br>";
			}
				
			$db = new crc_mysql($this->_DEBUG);
			$db->fn_connect();
			$result = true;
			if ($db->m_mysqlhandle != false) {
				if(isset($post['name'])) {
					$this->m_name = $post['name'];
				} else {
					$this->m_name = "";
				}
				if(isset($post['enrollno'])) {
					$this->m_enrollno = $post['enrollno'];
				} else {
					$this->m_enrollno = "";
				}
				if(isset($post['gender']))
				{
					$this->m_gender = strtoupper($post['gender'][0]);
				} else {
					$this->m_gender = "";
				}
				if(isset($post['email'])) {
					$this->m_email = $post['email'];
				} else {
					$this->m_email = "";
				}

				//this data should be restored if something goes wrong
				$this->m_data['name'] = $this->m_name;
				$this->m_data['enrollno'] = $this->m_enrollno;
				$this->m_data['gender'] = $this->m_gender;
				$this->m_data['email'] = $this->m_email;

				if( ($this->m_name == "") || ($this->m_enrollno == "") ) {
					if ($this->_DEBUG) {
						echo 'ERROR {crc_admin::fn_setstudent}: name is empty.<br>';
					}
					$db->fn_disconnect();
					$this->lasterrmsg = "Name or enrollment number is empty";
					return false;
				}
				
				//check if at least one course has been selected
				$this->fn_getcourselist($db);
				$courseselected = false;
				for($i = 0; $i < count($this->m_courselist); $i++) {
					if(isset($post['course' . $i]) && (strtolower($post['course' . $i]) == "on")) {
						$courseselected = true;
						break;
					}
				}
				if($courseselected == false) {
					if ($this->_DEBUG) {
						echo 'ERROR {crc_admin::fn_setstudent}: No course has been selected.<br>';
					}
					$db->fn_disconnect();
					$this->lasterrmsg = "No course has been selected";
					return false;
				}
					
				//check for name enrollment number
/*				$this->m_sql = 'select * ' .
							'from ' . MYSQL_PROFILES_TBL . 
							' where (profile_firstname = "' . $this->m_firstname .
							'" and profile_lastname = "' . $this->m_lastname . '")';
*/
				$this->m_sql = 'select * ' .
							'from ' . MYSQL_PROFILES_TBL . 
							' where (profile_name = "' . $this->m_name .
							'" or profile_enrollno = "' . $this->m_enrollno . '")';
				$resource = $db->fn_runsql(MYSQL_DB, $this->m_sql);


				if (mysql_num_rows($resource) == 0) {
					//insert student
					$this->m_sql = 'insert into ' . MYSQL_PROFILES_TBL . '(' .
									'profile_uid, profile_firstname, profile_enrollno, ' .
									'profile_email, profile_gender, profile_phone_land, ' .
									'profile_role_id, profile_rdn) ' .
									'values("' . $this->m_firstname . $this->m_lastname .
									'","' . $this->m_firstname .
									'","' . $this->m_lastname .
									'","' . $this->m_email .
									'","' . $this->m_gender .
									'","' . $this->m_phone . 
									'","3","ou=don mills,ou=toronto,ou=ontario,ou=canada,o=crc world")';

					$this->m_sql = 'insert into ' . MYSQL_PROFILES_TBL . '(' .
									'profile_uid, profile_name, profile_pwd, profile_enrollno, ' .
									'profile_email, profile_gender, ' .
									'profile_role_id) ' .
									'values("' . $this->m_name .
									'","' . $this->m_name .
									'","' . $this->m_name .
									'","' . ucfirst($this->m_enrollno) .
									'","' . $this->m_email .
									'","' . $this->m_gender .
									'", "3")';
					$resource = $db->fn_runsql(MYSQL_DB, $this->m_sql);
					if (mysql_affected_rows() <= 0) {
						if ($this->_DEBUG) {
							echo 'ERROR {crc_admin::fn_setstudent}: Could not insert student information. <br>';
						}
						$db->fn_freesql($resource);
						$db->fn_disconnect();
						$this->lasterrmsg = "Could not insert student information";
						return false;
					}

					//initialize m_profileid
					$this->fn_getprofileid($db, $this->m_name);
					if ($this->m_profileid == 0) {
						if ($this->_DEBUG) {
							echo 'ERROR {crc_admin::fn_setstudent}: Could not get profile id. <br>';
						}
						$db->fn_freesql($resource);
						$db->fn_disconnect();
						$this->lasterrmsg = "Could not get profile id";
						return false;
					}

					//initialize m_scheduleid using selected course(s)
					if ($this->fn_setstudentschedule($db, $post, $this->m_profileid) == false) {
						if ($this->_DEBUG) {
							echo 'ERROR {crc_admin::fn_setstudent}: Cannot set student schedule. <br>';
						}
						$db->fn_freesql($resource);
						$db->fn_disconnect();
						$this->lasterrmsg = "Cannot set student schedule";
						return false;
					}
				} else {
					if ($this->_DEBUG) {
						echo 'ERROR {crc_admin::fn_setstudent}: User ' . $this->m_name . ' or enrollment number ' . $this->m_enrollno . 'already exists in database.<br>';
					}
					$this->lasterrmsg = "User " . $this->m_firstname . " " . $this->m_lastname . " already exists in database.<br>Use \"Edit Student\" menu if you want to modify this user.";
					$result = false;
				}
				
				$db->fn_freesql($resource);
				$db->fn_disconnect();
			} else {
				$db->fn_disconnect();
			}
			return $result;
		}
		
		function fn_setstudentschedule($db, $post, $profileid) {
			
			//***************************************************
			// Helper function for inserting the student schedule
			//***************************************************
			
			if ($this->_DEBUG) {
				echo "DEBUG {crc_admin::fn_setstudentschedule}: Setting student schedule <br>";
			}
			
			$closedb = false;
			if($db == null) {
				$db = new crc_mysql($this->_DEBUG);
				$db->fn_connect();
				$closedb = true;
			}
			if ($db->m_mysqlhandle == false) {
				$db->fn_disconnect();
				return false;
			}
			
			$this->fn_getcourselist($db);
			$this->m_scheduleid = 0;
            $resource = 0;
            
			for($i = 0; $i < count($this->m_courselist); $i++) {
				if(isset($post['course' . $i]) && (strtolower($post['course' . $i]) == "on")) {
					$this->fn_getscheduleid($db, $this->m_courselist[$i]['courseid']);
//					echo $this->fn_getscheduleid($db, $this->m_courselist[$i]['courseid']);
					if ($this->m_scheduleid == 0) {
						if ($this->_DEBUG) {
							echo 'ERROR {crc_admin::fn_setstudentschedule}: Could not get schedule id. <br>';
						}
						if (is_resource($resource)) {
							$db->fn_freesql($resource);
						}
						$db->fn_disconnect();
						return false;
					}

					//check if the student has been already assigned to this course
					$this->m_sql = 'select * ' .
							'from ' . MYSQL_STUDENT_SCHEDULE_TBL . 
							' where (student_schedule_profile_id = "' . $profileid .
							'" and student_schedule_schedule_id = "' . $this->m_scheduleid . '")';
					$resource = $db->fn_runsql(MYSQL_DB, $this->m_sql);

					if (mysql_num_rows($resource) == 0) {
						//set student schedule
						$this->m_sql = 'insert into ' . MYSQL_STUDENT_SCHEDULE_TBL . '(' .
									'student_schedule_profile_id, ' .
									'student_schedule_schedule_id, ' .
									'student_schedule_questions) ' .
									'values("' . $profileid .
									'","' . $this->m_scheduleid .
									'","0")';
						$resource = $db->fn_runsql(MYSQL_DB, $this->m_sql);
						if (mysql_affected_rows() <= 0) {
							if ($this->_DEBUG) {
								echo 'ERROR {crc_admin::fn_setstudentschedule}: Could not insert student schedule information. <br>';
							}
							$db->fn_freesql($resource);
							$db->fn_disconnect();
							return false;
						}
					}		
				}
			}
			
			if ($closedb == true) {
				if (is_resource($resource)) {
					$db->fn_freesql($resource);
				}
				$db->fn_disconnect();
			}
			
			return true;
		}

		function fn_delstudentschedule($db, $get_student_schedule, $profileid) {
			
			//***************************************************
			// Helper function for deleting the student schedule
			//***************************************************
			
			if ($this->_DEBUG) {
				echo "DEBUG {crc_admin::fn_setstudentschedule}: Deleting student schedule <br>";
			}
			
			$closedb = false;
			if($db == null) {
				$db = new crc_mysql($this->_DEBUG);
				$db->fn_connect();
				$closedb = true;
			}
			if ($db->m_mysqlhandle == false) {
				$db->fn_disconnect();
				return false;
			}
			
					//delete the student schedule
					$this->m_sql = 'delete ' .
							'from ' . MYSQL_STUDENT_SCHEDULE_TBL . 
							' where (student_schedule_profile_id = "' . $profileid .
							'" and student_schedule_id = "' . $get_student_schedule . '")';

					$resource = $db->fn_runsql(MYSQL_DB, $this->m_sql);
			return true;
		}
	}
?>
