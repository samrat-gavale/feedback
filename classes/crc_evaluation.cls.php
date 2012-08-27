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
	// Desc: The Evaluation Object
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

	class crc_evaluation extends crc_object {

		var $m_sql;
		var $m_data;
		var $m_question;
		var $m_profilename;
		var $m_date;
		var $m_studentnb;
		
		function crc_evaluation($debug) {
			//******************************************
			// Initialization by constructor
			//******************************************
			$this->classname = 'crc_evaluation';
			$this->classdescription = 'Handle user feedback and evaluation.';
			$this->classversion = '1.0.0';
			$this->classdate = 'March 10th, 2003';
			$this->classdevelopername = 'Shaffin Bhanji';
			$this->classdeveloperemail = 'shaffin_bhanji@hotmail.com';
			$this->_DEBUG = $debug;

			if ($this->_DEBUG) {
				echo "DEBUG {crc_evaluation::constructor}: The class \"crc_evaluation\" was successfuly created. <br>";
				echo "DEBUG {crc_evaluation::constructor}: Running in debug mode. <br>";
			}

		}

		function fn_getcategory($db, $category) {
			//***************************************************************
			// Get the questions for a specific category
			// Reads continuosly from database without closing the connection
			//and without freeing the resource
			//***************************************************************						
			if ($this->_DEBUG) {
				echo "DEBUG {crc_evaluation::fn_getsection}: Retreiving questions for category: '" . $category . "'. <br>";
			}
			
			if (!isset($category) || ($category == "")) {
				$this->lasterrmsg = "Invalid input";
				return null;
			}

			$result = null;
			if ($db->m_mysqlhandle != false) {			
				$this->m_sql = 'select * ' .
								'from ' . MYSQL_FEEDBACK_QUESTIONS_TBL . 
								' where (feedback_questions_active = 1) and ' .
								'(feedback_questions_category = "' . strtoupper($category) . '") ' . 
												'order by feedback_questions_sequence asc';
				$resource = $db->fn_runsql(MYSQL_DB, $this->m_sql);
				if (is_resource($resource) && mysql_num_rows($resource) > 0) {
					$result = $resource;
				} else {
					$this->lasterrmsg = mysql_error();
					$this->lasterrnum = mysql_errno();
					if ($this->_DEBUG) {
						echo "DEBUG {crc_evaluation::fn_getsection}: '" . $this->lasterrmsg . "'.<br>";
					}
				}											
			} else {
				$this->lasterrmsg = mysql_error();
				$this->lasterrnum = mysql_errno();
				if ($this->_DEBUG) {
					echo "DEBUG {crc_evaluation::fn_getsection}: '" . $this->lasterrmsg . "'.<br>";
				}
			}
			return $result;			
		}

		function fn_getquestions() {
			//******************************************
			// Get the questions to generate the evaluation form
			//******************************************						
			if ($this->_DEBUG) {
				echo "DEBUG {crc_evaluation::fn_getquestions}: Retreiving feedback questions<br>";
			}

			$this->m_data = null;
			$db = new crc_mysql($this->_DEBUG);
			$dbhandle = $db->fn_connect();
			if ($dbhandle != false) {
				$this->m_sql = 'select distinct feedback_questions_category ' . 
								'from ' . MYSQL_FEEDBACK_QUESTIONS_TBL . 
								' where (feedback_questions_active = "1")';

				$this->m_sql = 'select distinct feedback_questions_category ' . 
								'from ' . MYSQL_FEEDBACK_QUESTIONS_TBL;
				$categories = $db->fn_runsql(MYSQL_DB, $this->m_sql);
				if (is_resource($categories) && (mysql_num_rows($categories) > 0)) {				
					if ($this->_DEBUG) {
						echo "DEBUG {crc_evaluation::fn_getquestions}: Number of sections found are: " . mysql_num_rows($categories) . ". <br>";
					}					
					$index = 0;					
					while ($category = mysql_fetch_array($categories)) {
						$questions = $this->fn_getcategory($db, $category[0]);   //$questions = GENERAL, PRESENTATION, etc
						if ($questions == null) {
							if ($this->_DEBUG) {
								echo 'DEBUG {crc_evaluation::fn_getquestions}: Cannot get category' . $category[0] . '<br>';
								echo 'DEBUG {crc_evaluation::fn_getquestions}: ' . $this->lasterrmsg . '<br>';
							}
							continue;
						}
						
						while ($row = mysql_fetch_array($questions)) {
							$this->m_data[$index] = $row;    //$row[0] = question_id
							if ($this->_DEBUG) {
								switch(strtolower($this->m_data[$index][3])) {
									case "option":
										$form = '<input type="radio" name="' . $this->m_data[$index][0] . '" value="1">';
										$form = $form . '<input type="radio" name="' . $this->m_data[$index][0] . '" value="2">';
										$form = $form . '<input type="radio" name="' . $this->m_data[$index][0] . '" value="3">';
										$form = $form . '<input type="radio" name="' . $this->m_data[$index][0] . '" value="4">';
										$form = $form . '<input type="radio" name="' . $this->m_data[$index][0] . '" value="5">';
										$form = $form . '<input name="' . $this->m_data[$index][0] . 'text" size="40" width="80">';
										break;										
									case "comment":
										$form = '<textarea name="' . $this->m_data[$index][0] . '" col="40" row="3" wrap="soft"></textarea>';
										break;
								}							
								echo 'DEBUG {crc_evaluation::fn_getquestions}: Question found: "' . $this->m_data[$index][1] . '" ' . $form . '<br>';
							}												
							$index = $index + 1;
						}						
						$db->fn_freesql($questions);					
					}
					if ($this->_DEBUG) {
						echo 'DEBUG {crc_evaluation::fn_getquestions}: Total questions are: ' . count($this->m_data) . '<br>';
					}
					$db->fn_freesql($categories);
				} else {
					$this->lasterrnum = ERR_FEEDBACK_QUESTIONS_NOSECTIONS_NUM;
					$this->lasterrmsg = ERR_FEEDBACK_QUESTIONS_NOSECTIONS_DESC;					
					if ($this->_DEBUG) {
						echo 'ERROR {crc_evaluation::fn_getquestions}: The sql command returned nothing. <br>';
						echo 'ERROR {crc_evaluation::fn_getquestions}: Error number: ' . $this->lasterrnum . '. <br>';
						echo 'ERROR {crc_evaluation::fn_getquestions}: Error description: ' . $this->lasterrmsg . '. <br>';
					}
				}
				$db->fn_disconnect();				
			} else {
				$this->lasterrmsg = mysql_error();
				$this->lasterrnum = mysql_errno();
				if ($this->_DEBUG) {
					echo 'ERROR {crc_evaluation::fn_getquestions}: ' . $this->lasterrmsg . '.<br>';
				}
			}
			return $this->m_data;
		}

		function fn_setquestions($profileid, $post) {
			//*****************************************
			// Update the users evaluation information
			//*****************************************
			if ($this->_DEBUG) {
				echo "DEBUG {crc_evaluation::fn_setquestions}: Updating the user evaluation information.<br>";
			}
			
			$this->lasterrmsg = "";//reset error message
			if(!isset($post['schedule_id']) || ($post['schedule_id'] == "") ||
			    ($profileid == null) || ($profileid == "")) {
				$this->lasterrmsg = "Invalid input";
				return false;
			}

			$result = false;
			$db = new crc_mysql($this->_DEBUG);
			$dbhandle = $db->fn_connect();
			if ($dbhandle != false) {

				$this->m_sql = 'update ' . MYSQL_STUDENT_SCHEDULE_TBL .
									' SET student_schedule_questions = 1 ' .
									'where (student_schedule_id = ' . $post['schedule_id'] . ')'; 
				$result = $db->fn_runsql(MYSQL_DB, $this->m_sql);
				if (mysql_affected_rows() <= 0)
				{
					if ($this->_DEBUG) {
						echo 'ERROR {crc_evaluation::fn_setquestions}: Cannot update student schedule for student schedule id ' . $post['schedule_id'] . '.<br>';
					}
					$this->lasterrmsg = "Cannot update student schedule";
					return false;
				}				
				$this->m_sql = 'insert into ' . MYSQL_FEEDBACK_TBL .
								' (feedback_profile_id, feedback_schedule_id) ' .
								' values (' . $profileid . ', ' . $post['schedule_id'] . ')'; 					
				$db->fn_runsql(MYSQL_DB, $this->m_sql);
				if (mysql_affected_rows() > 0) {
					$this->m_sql = 'select * from ' . MYSQL_FEEDBACK_TBL .
									' where (feedback_profile_id = ' . $profileid . ') and ' .
									'(feedback_schedule_id = ' . $post['schedule_id'] . ')';
					$resource = $db->fn_runsql(MYSQL_DB, $this->m_sql);
					if (!is_resource($resource))
					{
						if ($this->_DEBUG) {
							echo 'ERROR {crc_evaluation::fn_setquestions}: Cannot select feedback table.<br>';
						}
						$this->lasterrmsg = "Cannot select feedback table";
						return false;
					}
					$feedback = mysql_fetch_array($resource);					
					for ($i = 1; $i <= count($_SESSION['evaluation']); $i++) {
						$question = $_SESSION['evaluation'][$i - 1];
						$answers = $post;
						$answeri = $question[0] . 'name';
						$answer = $post[$answeri];
						if (!isset($answer)) {
							$answer = 0;
						}
						if (strtoupper($question[3]) == "OPTION") {

//							echo $question[3]. ' '.$question[0];
//							$commenti = $question[0] . 'comment';
							$commenti = $question[0] . 'name';
//							$comment = $post[$commenti];
							$this->m_sql = 'insert into ' . MYSQL_FEEDBACK_ANSWERS_TBL .
											' (feedback_answers_feedback_id, feedback_answers_questions_id, ' .
											' feedback_answers_answer, feedback_answers_comments, feedback_answers_active) ' .
											' values (' . $feedback[0] . ', ' . $question[0] . ', ' . $answer . ', "NA", "1" )'; 
						} else {						
							$this->m_sql = 'insert into ' . MYSQL_FEEDBACK_ANSWERS_TBL .
											' (feedback_answers_feedback_id, feedback_answers_questions_id, ' .
											' feedback_answers_answer, feedback_answers_comments, feedback_answers_active) ' .
											' values (' . $feedback[0] . ', ' . $question[0] . ', "0", "' . $answer . '", "1")'; 
						
						}
						
						$result = $db->fn_runsql(MYSQL_DB, $this->m_sql);
						if ($result == false) {
							if ($this->_DEBUG) {
								echo 'ERROR {crc_evaluation::fn_setquestions}: Could not insert feedback information.<br>';
							}
							$this->lasterrmsg = mysql_error();
							$this->lasterrnum = mysql_errno();
							$db->fn_freesql($resource);
							return $result;
						}
					}		
					$db->fn_freesql($resource);
				} else {
					$this->lasterrnum = ERR_FEEDBACK_ADD_NUM;
					$this->lasterrmsg = ERR_FEEDBACK_ADD_DESC;
					if ($this->_DEBUG) {
						echo 'ERROR {crc_evaluation::fn_setquestions}: Could not add feedback information. <br>';
						echo 'ERROR {crc_evaluation::fn_setquestions}: Error number: ' . $this->lasterrnum . '. <br>';
						echo 'ERROR {crc_evaluation::fn_setquestions}: Error description: ' . $this->lasterrmsg . '. <br>';
					}
				}
				$db->fn_disconnect();				
			} else {
				$this->lasterrmsg = mysql_error();
				$this->lasterrnum = mysql_errno();
			}			
			return $result;
		}
		
		function fn_getoverallavg() {
			//***********************************************
			//Get the average of all the courses together
			//***********************************************
			if ($this->_DEBUG) {
				echo "DEBUG {crc_evaluation::fn_getanswers}: Getting the evaluation information for the all the curses together . <br>";
			}
			
			$this->m_data = null;

			$db = new crc_mysql($this->_DEBUG);
			$dbhandle = $db->fn_connect();
			$this->m_data = null;
			if ($dbhandle != false) 
			{
				$this->m_sql = 'select count(*) as num_ques from ' . MYSQL_FEEDBACK_QUESTIONS_TBL . ' where feedback_questions_type LIKE "OPTION"';
				$result = $db->fn_runsql(MYSQL_DB, $this->m_sql);
				$array = mysql_fetch_array($result);
				$num_questions = $array['num_ques'];
				$this->m_sql = 'select feedback_answers_questions_id, feedback_answers_answer from '. MYSQL_FEEDBACK_ANSWERS_TBL .
							   ' where feedback_answers_comments LIKE "NA"';
							   
				$allanswers = $db->fn_runsql(MYSQL_DB, $this->m_sql);
							   
				if (mysql_num_rows($allanswers) > 0) 
				{
					//mind that the index starts from 1
					for($counter = 1; $counter<=$num_questions;$counter++)
					{
						$avg[$counter]['total'] = 0;
						$avg[$counter]['count'] = 0;
					}
	
					$ansidx = 0;
					while ($answer = mysql_fetch_array($allanswers)) 
					{
						$ansidx = $answer['feedback_answers_questions_id'];
						$ansval = $answer['feedback_answers_answer'];
						$avg[$ansidx]['total'] += $ansval;
						$avg[$ansidx]['count'] += 1;
					}
				}
				
				for ($i = 1; $i <= $num_questions; $i++)
				{
					$this->m_data[$i]['avg'] =  number_format(round($avg[$i]['total']/$avg[$i]['count'], 2), 2);//take the mean evaluation of all the courses
				}
				
				$this->m_data['avg_of_overall_avg'] = 0;
				for ($i = 1; $i <= $num_questions; $i++)
				{
					$this->m_data['avg_of_overall_avg'] +=  $this->m_data[$i]['avg'];
				}				
				$this->m_data['avg_of_overall_avg'] = number_format(round($this->m_data['avg_of_overall_avg']/$num_questions, 2), 2);
			}
			else if ($this->_DEBUG) 
			{
				echo "DEBUG {crc_evaluation::fn_getanswers}: Cannot connect to MySQL database.<br>";
			}
			$db->fn_disconnect();
			return $this->m_data;		
		}

		function fn_getoverallminmax() {
			//***********************************************
			//Get the minimum and maximum of all the courses together
			//***********************************************
			if ($this->_DEBUG) {
				echo "DEBUG {crc_evaluation::fn_getanswers}: Getting the evaluation information for the all the curses together . <br>";
			}
			
			$this->m_data = null;

			$db = new crc_mysql($this->_DEBUG);
			$dbhandle = $db->fn_connect();
			$this->m_data = null;
			if ($dbhandle != false) 
			{
				$this->m_sql = 'select count(*) as num_ques from ' . MYSQL_FEEDBACK_QUESTIONS_TBL . ' where feedback_questions_type LIKE "OPTION"';
				$result = $db->fn_runsql(MYSQL_DB, $this->m_sql);
				$array = mysql_fetch_array($result);
				$num_questions = $array['num_ques'];
	
				//get schedule ids of all the active schedules			
				$this->m_sql = 'select schedule_id ' . 
							   'from ' . MYSQL_SCHEDULE_TBL . ' join ' . MYSQL_COURSES_TBL .
							   ' where ( ' . MYSQL_SCHEDULE_TBL.'.schedule_course_id = '. MYSQL_COURSES_TBL .'.course_id '.
							   ' and ' . MYSQL_COURSES_TBL .'.course_active = 1 )';
				$result = $db->fn_runsql(MYSQL_DB, $this->m_sql);
	
				while ($schedule = mysql_fetch_array($result)) 
				{
					$schedule_stats = $this->fn_getanswers($schedule['schedule_id']);
					
					for($i = 1; $i<=$num_questions; $i++)
					{
						/* initialize the min and max variables appropirately */
						if(!isset($minmax[$i]['max']))
							$minmax[$i]['max'] = 0;

						if(!isset($minmax[$i]['min']))
							$minmax[$i]['min'] = 5.0;

						if($schedule_stats[$i-1]['ans'] > $minmax[$i]['max'])
						{
							$minmax[$i]['max'] = $schedule_stats[$i-1]['ans'];
						}	
						if($schedule_stats[$i-1]['ans'] < $minmax[$i]['min'])
						{
							$minmax[$i]['min'] = $schedule_stats[$i-1]['ans'];
						}
					}
				}
			}
			else if ($this->_DEBUG) 
			{
				echo "DEBUG {crc_evaluation::fn_getanswers}: Cannot connect to MySQL database.<br>";
			}
			$db->fn_disconnect();
			return $minmax;		
		}

		function fn_getanswersnew($scheduleid) {
			//*************************************************************************************************
			//same as fn_getanswers but the comments are grouped student wise intead of question wise grouping
			//*************************************************************************************************
			if ($this->_DEBUG) {
				echo "DEBUG {crc_evaluation::fn_getanswers}: Getting the user evaluation information for the schedule id " . $scheduleid . ".<br>";
			}
			
			$db = new crc_mysql($this->_DEBUG);
			$dbhandle = $db->fn_connect();
			$this->m_data = null;
			if ($dbhandle != false) {
				//get student_schedule_id of all the students enrolled to this schedule			
				$this->m_sql = 'select student_schedule_id, student_schedule_profile_id ' . 
								'from ' . MYSQL_STUDENT_SCHEDULE_TBL . 
								' where (student_schedule_schedule_id = "' . $scheduleid . '")';
				$studentscheduleid = $db->fn_runsql(MYSQL_DB, $this->m_sql);
				if (mysql_num_rows($studentscheduleid) > 0) {					
					$studidx = 0;
					$prev_studidx = -1;
					$ansidx = 0;
					while ($ssid = mysql_fetch_array($studentscheduleid)) {
						//get student name
						$name = $this->fn_getprofilename($db, $ssid[1]);
						//get feedback_id
						$this->m_sql = 'select feedback_id ' . 
								'from ' . MYSQL_FEEDBACK_TBL . 
								' where (feedback_schedule_id = "' . $ssid[0] . '")';
						$feedbackid = $db->fn_runsql(MYSQL_DB, $this->m_sql);
						if (mysql_num_rows($feedbackid) > 0) {
							$fid = mysql_fetch_row($feedbackid);//a single feedback id should correspond to a student schedule id
							//get questions, answers and comments
							$this->m_sql = 'select feedback_answers_questions_id, ' .
												'feedback_answers_answer, feedback_answers_comments ' . 
												'from ' . MYSQL_FEEDBACK_ANSWERS_TBL . 
												' where (feedback_answers_feedback_id = "' . $fid[0] . '")';
							$answers = $db->fn_runsql(MYSQL_DB, $this->m_sql);
							if (mysql_num_rows($answers) > 0) 
							{
								$ansidx = 0;
								while ($ans = mysql_fetch_array($answers)) 
								{
									if ($studidx == 0) 
									{
										$this->m_data[$ansidx]['ans'] = 0;
										$this->m_data[$ansidx]['comm'] = "";
										$this->m_data[$ansidx]['que'] = $this->fn_getquestion($db, $ans[0]);
									}
									$this->m_data[$ansidx]['que_no'] = $ans[0];
									$this->m_data[$ansidx]['ans'] += $ans[1];
									if ($ans[2] != "" && $ans[2] != "NA") 
									{
										if( ($studidx > $prev_studidx) && ($studidx == 0) )
										{
											$this->m_data['comm'] .='<tr><td colspan="5" align="left">';
											$prev_studidx = $studidx;
										}
										else if( ($studidx > $prev_studidx) && ($studidx != 0) )
										{
											$this->m_data['comm'] .='</td></tr><tr><td colspan="5" align="left">';
											$prev_studidx = $studidx;
										}
										$this->m_data['comm'] .= '<tr><td colspan="5">&nbsp;&nbsp;&nbsp;' . $this->m_data[$ansidx]['que_no'] . ': ' . $ans[2] . '<br></td></tr>';
									}					
									$ansidx++;
								}
								$prev_studidx = $studidx;
								$studidx++;
							} 
							else if ($this->_DEBUG) 
							{
								echo "DEBUG {crc_evaluation::fn_getanswers}: Cannot get the answers.<br>";
							}							
							$db->fn_freesql($answers);
						} 
						else if ($this->_DEBUG) 
						{
							echo "DEBUG {crc_evaluation::fn_getanswers}: Cannot get feedback ID.<br>";
						}
						$db->fn_freesql($feedbackid);						
					}
					for ($i = 0; $i < $ansidx; $i++) 
					{
						$this->m_data[$i]['ans'] =  number_format(round($this->m_data[$i]['ans']/$studidx, 2), 2);//take the mean evaluation
					}
					
					/* find the average of averages */
					$_SESSION['avg_of_avg'] = 0;
					for ($i = 0; $i < $ansidx-6; $i++) 
					{
						$_SESSION['avg_of_avg'] +=  $this->m_data[$i]['ans']; //add all the averages
					}
					$_SESSION['avg_of_avg'] = number_format(round($_SESSION['avg_of_avg']/($ansidx-6), 2), 2);//the average of averages
				
				} else if ($this->_DEBUG) {
					echo "DEBUG {crc_evaluation::fn_getanswers}: Cannot get the student schedule.<br>";
				}
				$db->fn_freesql($studentscheduleid);
			} else 	if ($this->_DEBUG) {
				echo "DEBUG {crc_evaluation::fn_getanswers}: Cannot connect to MySQL database.<br>";
			}
			$db->fn_disconnect();
			$this->m_data['comm'].= '</td></tr>';
			return $this->m_data;
		}

		function fn_getanswersnew2($scheduleid) {
			//*************************************************************************************************
			//same as fn_getanswers but the comments are grouped student wise intead of question wise grouping, and they are passed as plain text and not as html
			//*************************************************************************************************
			if ($this->_DEBUG) {
				echo "DEBUG {crc_evaluation::fn_getanswers}: Getting the user evaluation information for the schedule id " . $scheduleid . ".<br>";
			}
			
			$db = new crc_mysql($this->_DEBUG);
			$dbhandle = $db->fn_connect();
			$this->m_data = null;
			if ($dbhandle != false) {
				//get student_schedule_id of all the students enrolled to this schedule			
				$this->m_sql = 'select student_schedule_id, student_schedule_profile_id ' . 
								'from ' . MYSQL_STUDENT_SCHEDULE_TBL . 
								' where (student_schedule_schedule_id = "' . $scheduleid . '")';
				$studentscheduleid = $db->fn_runsql(MYSQL_DB, $this->m_sql);
				if (mysql_num_rows($studentscheduleid) > 0) {					
					$studidx = 0;
					$ansidx = 0;
					while ($ssid = mysql_fetch_array($studentscheduleid)) {
						//get student name
						$name = $this->fn_getprofilename($db, $ssid[1]);
						//get feedback_id
						$this->m_sql = 'select feedback_id ' . 
								'from ' . MYSQL_FEEDBACK_TBL . 
								' where (feedback_schedule_id = "' . $ssid[0] . '")';
						$feedbackid = $db->fn_runsql(MYSQL_DB, $this->m_sql);
						if (mysql_num_rows($feedbackid) > 0) {
							$fid = mysql_fetch_row($feedbackid);//a single feedback id should correspond to a student schedule id
							//get questions, answers and comments
							$this->m_sql = 'select feedback_answers_questions_id, ' .
												'feedback_answers_answer, feedback_answers_comments ' . 
												'from ' . MYSQL_FEEDBACK_ANSWERS_TBL . 
												' where (feedback_answers_feedback_id = "' . $fid[0] . '")';
							$answers = $db->fn_runsql(MYSQL_DB, $this->m_sql);
							if (mysql_num_rows($answers) > 0) 
							{
								$ansidx = 0;
								while ($ans = mysql_fetch_array($answers)) 
								{
									if ($studidx == 0) 
									{
										$this->m_data[$ansidx]['ans'] = 0;
										$this->m_data[$ansidx]['comm'] = "";
										$this->m_data[$ansidx]['que'] = $this->fn_getquestion($db, $ans[0]);
									}
									$this->m_data[$ansidx]['que_no'] = $ans[0];
									$this->m_data[$ansidx]['ans'] += $ans[1];
									if ($ans[2] != "" && $ans[2] != "NA") 
									{
										$this->m_data['comm'][$studidx] .= '<br>&nbsp;&nbsp;' . $this->m_data[$ansidx]['que_no'] . ': ' . $ans[2];
									}					
									$ansidx++;
								}
								$prev_studidx = $studidx;
								$studidx++;
							} 
							else if ($this->_DEBUG) 
							{
								echo "DEBUG {crc_evaluation::fn_getanswers}: Cannot get the answers.<br>";
							}							
							$db->fn_freesql($answers);
						} 
						else if ($this->_DEBUG) 
						{
							echo "DEBUG {crc_evaluation::fn_getanswers}: Cannot get feedback ID.<br>";
						}
						$db->fn_freesql($feedbackid);						
					}
					for ($i = 0; $i < $ansidx; $i++) {
						$this->m_data[$i]['ans'] =  number_format(round($this->m_data[$i]['ans']/$studidx, 2), 2);//take the mean evaluation
					}
				} else if ($this->_DEBUG) {
					echo "DEBUG {crc_evaluation::fn_getanswers}: Cannot get the student schedule.<br>";
				}
				$db->fn_freesql($studentscheduleid);
			} else 	if ($this->_DEBUG) {
				echo "DEBUG {crc_evaluation::fn_getanswers}: Cannot connect to MySQL database.<br>";
			}
			$db->fn_disconnect();
			return $this->m_data;
		}
		
		function fn_getanswers($scheduleid) {
			//***********************************************
			//Get the answers to questions for a given course
			//***********************************************
			if ($this->_DEBUG) {
				echo "DEBUG {crc_evaluation::fn_getanswers}: Getting the user evaluation information for the schedule id " . $scheduleid . ".<br>";
			}
			
			$db = new crc_mysql($this->_DEBUG);
			$dbhandle = $db->fn_connect();
			$this->m_data = null;
			if ($dbhandle != false) {
				//get student_schedule_id of all the students enrolled to this schedule			
				$this->m_sql = 'select student_schedule_id, student_schedule_profile_id ' . 
								'from ' . MYSQL_STUDENT_SCHEDULE_TBL . 
								' where (student_schedule_schedule_id = "' . $scheduleid . '")';
				$studentscheduleid = $db->fn_runsql(MYSQL_DB, $this->m_sql);
				if (mysql_num_rows($studentscheduleid) > 0) {					
					$studidx = 0;
					$ansidx = 0;
					while ($ssid = mysql_fetch_array($studentscheduleid)) {
						//get student name
						$name = $this->fn_getprofilename($db, $ssid[1]);
						//get feedback_id
						$this->m_sql = 'select feedback_id ' . 
								'from ' . MYSQL_FEEDBACK_TBL . 
								' where (feedback_schedule_id = "' . $ssid[0] . '")';
						$feedbackid = $db->fn_runsql(MYSQL_DB, $this->m_sql);
						if (mysql_num_rows($feedbackid) > 0) {
							$fid = mysql_fetch_row($feedbackid);//a single feedback id should correspond to a student schedule id
							//get questions, answers and comments
							$this->m_sql = 'select feedback_answers_questions_id, ' .
												'feedback_answers_answer, feedback_answers_comments ' . 
												'from ' . MYSQL_FEEDBACK_ANSWERS_TBL . 
												' where (feedback_answers_feedback_id = "' . $fid[0] . '")';
							$answers = $db->fn_runsql(MYSQL_DB, $this->m_sql);
							if (mysql_num_rows($answers) > 0) {
								$ansidx = 0;
								while ($ans = mysql_fetch_array($answers)) {
									if ($studidx == 0) {
										
										$this->m_data[$ansidx]['ans'] = 0;
										$this->m_data[$ansidx]['comm'] = "";
										$this->m_data[$ansidx]['que'] = $this->fn_getquestion($db, $ans[0]);
										$this->m_data[$ansidx]['que_no'] = $ansidx+1;
									}
									$this->m_data[$ansidx]['ans'] += $ans[1];
									if ($ans[2] != "" && $ans[2] != "NA") {
										$this->m_data[$ansidx]['comm'] .= '<br>&nbsp;&nbsp;&nbsp;' . $name . ': ' . $ans[2];
									}									
									$ansidx++; 
								}
								$studidx++;
							} else if ($this->_DEBUG) {
								echo "DEBUG {crc_evaluation::fn_getanswers}: Cannot get the answers.<br>";
							}							
							$db->fn_freesql($answers);
						} else if ($this->_DEBUG) {
							echo "DEBUG {crc_evaluation::fn_getanswers}: Cannot get feedback ID.<br>";
						}
						$db->fn_freesql($feedbackid);						
					}
					for ($i = 0; $i < $ansidx; $i++) {
						$this->m_data[$i]['ans'] =  number_format(round($this->m_data[$i]['ans']/$studidx, 2), 2);//take the mean evaluation
					}
				} else if ($this->_DEBUG) {
					echo "DEBUG {crc_evaluation::fn_getanswers}: Cannot get the student schedule.<br>";
				}
				$db->fn_freesql($studentscheduleid);
			} else 	if ($this->_DEBUG) {
				echo "DEBUG {crc_evaluation::fn_getanswers}: Cannot connect to MySQL database.<br>";
			}
			$db->fn_disconnect();
			return $this->m_data;
		}
		
		function fn_getquestion($db, $questionid) {
			//*****************************************************
			//Get the question string identified by the question id
			//*****************************************************
			if ($this->_DEBUG) {
				echo "DEBUG {crc_evaluation::fn_getquestion}: Getting the question string for the question id " . $questionid . ".<br>";
			}
			
			//check input
			if (!isset($db, $questionid) || ($questionid == "")) {
				return null;
			}
			
			$this->m_question = null;
			if ($db->m_mysqlhandle != false) {
				$this->m_sql = 'select feedback_questions_question ' . 
								'from ' . MYSQL_FEEDBACK_QUESTIONS_TBL . 
								' where (feedback_questions_id = "' . $questionid . '")';
				$result = $db->fn_runsql(MYSQL_DB, $this->m_sql);
				if (is_resource($result)) {
					if (mysql_num_rows($result) > 0) {
						$row = mysql_fetch_row($result);
						$this->m_question = $row[0];
						if ($this->_DEBUG) {
							echo 'ERROR {crc_evaluation::fn_getquestion}: ' . $this->m_question . '<br>';
						}
					} else if ($this->_DEBUG) {
						echo 'ERROR {crc_evaluation::fn_getquestion}: The sql command returned nothing. <br>';
					}
					$db->fn_freesql($result);
				}
			}
			return $this->m_question;
		}
		
		function fn_getprofilename($db, $profileid) {
			//**********************************************
			// Get profile name, given the profile id
			//**********************************************
			if ($this->_DEBUG) {
				echo "DEBUG {crc_evaluation::fn_getprofilename}: Getting the first and last name for the profile id " . $profileid . ".<br>";
			}
			
			//check input
			if (!isset($db, $profileid) || ($profileid == "")) {
				return null;
			}
			
			$this->m_profilename = null;
			if ($db->m_mysqlhandle != false) {
				$this->m_sql = 'select profile_firstname, profile_lastname ' . 
								'from ' . MYSQL_PROFILES_TBL . 
								' where (profile_id = "' . $profileid . '")';
				$result = $db->fn_runsql(MYSQL_DB, $this->m_sql);
				if (is_resource($result)) {
					if (mysql_num_rows($result) > 0) {
						$row = mysql_fetch_row($result);
						$this->m_profilename = $row[1] . ", " . $row[0];
						if ($this->_DEBUG) {
							echo 'ERROR {crc_evaluation::fn_getprofilename}: ' . $this->m_profilename . '. <br>';
						}
					} else if ($this->_DEBUG) {
						echo 'ERROR {crc_evaluation::fn_getprofilename}: The sql command returned nothing. <br>';
					}
					$db->fn_freesql($result);
				}
			}
			return $this->m_profilename;
		}
		
		function fn_getcoursename($scheduleid) {
			//*************************************
			// Get course from from the schedule id
			//*************************************
			if ($this->_DEBUG) {
				echo "DEBUG {crc_evaluation::fn_getcoursename}: Getting the course name for the schedule id " . $scheduleid . ".<br>";
			}
			
			$db = new crc_mysql($this->_DEBUG);
			$dbhandle = $db->fn_connect();
			$this->m_data = null;
			if ($dbhandle != false) {
				$this->m_sql = 'select schedule_course_id ' . 
								'from ' . MYSQL_SCHEDULE_TBL . 
								' where (schedule_id = "' . $scheduleid . '")';
				$result = $db->fn_runsql(MYSQL_DB, $this->m_sql);
				if (mysql_num_rows($result) > 0) {
					$row = mysql_fetch_row($result);
					$this->m_sql = 'select course_number, course_name, teacher_schedule_profile_id, profile_name ' . 
								'from ' . MYSQL_COURSES_TBL . ' as c,' . MYSQL_TEACHER_SCHEDULE_TBL . ' as t,' .
								MYSQL_PROFILES_TBL . ' as p where ((c.course_id = "' . $row[0] . '") and (t.teacher_schedule_schedule_id = "' . $scheduleid . '") '.
								'and (p.profile_id = t.teacher_schedule_profile_id))';
								
					$result = $db->fn_runsql(MYSQL_DB, $this->m_sql);
					if (mysql_num_rows($result) > 0) {
						$row = mysql_fetch_row($result);
//						$this->m_data = $row[0] . ' - ' . $row[1] ;
						$coursedata['coursenum'] = $row[0];
						$coursedata['coursename'] = $row[1];
						$coursedata['teachername'] = $row[3];						
					}
				}
				$db->fn_freesql($result);
			}
			$db->fn_disconnect();
			return $coursedata;
		}
		
		function fn_getattendance($scheduleid) {
			//***************************************************
			// Get course attendace for the specified schedule ID
			//***************************************************
			if ($this->_DEBUG) {
				echo "DEBUG {crc_evaluation::fn_getattendance}: Getting the course attendance for the schedule id " . $scheduleid . ".<br>";
			}
			
			$db = new crc_mysql($this->_DEBUG);
			$dbhandle = $db->fn_connect();
			$this->m_data = null;
			$this->m_studentnb = 0;
			if ($dbhandle != false) {
				$this->m_sql = 'select student_schedule_id ' . 
								'from ' . MYSQL_STUDENT_SCHEDULE_TBL . 
								' where (student_schedule_schedule_id = "' . $scheduleid . '")';
				$std_result = $db->fn_runsql(MYSQL_DB, $this->m_sql);
				if (mysql_num_rows($std_result) > 0) {
					while ($ssid = mysql_fetch_array($std_result)) {//student schedule ID
						$this->m_studentnb++;
						$this->m_sql = 'select attendance_date_id, attendance_check ' .
									'from ' . MYSQL_ATTENDANCE_TBL . 
									' where (attendance_student_schedule_id = "' . $ssid[0] . '")';
						$att_result = $db->fn_runsql(MYSQL_DB, $this->m_sql);
						if (mysql_num_rows($att_result) > 0) {
							while ($row = mysql_fetch_array($att_result)) {								
								$key = $this->fn_getdate($db, $row[0]);
								if ($key == null) {
									if ($this->_DEBUG) {
										echo "DEBUG {crc_evaluation::fn_getattendance}: Cannot get the date for the given date id " . $att_result[0] . ".<br>";
									}
									return null;
								}
								if(strtoupper($row[1]) == "P") {
									if (!isset($this->m_data[$key])) {
										$this->m_data[$key] = 1;
									} else {
										$this->m_data[$key]++;
									}
								} else {
									if (!isset($this->m_data[$key])) {
										$this->m_data[$key] = 0;
									}
								}
							}
						}
						$db->fn_freesql($att_result);
					}
				}
				$db->fn_freesql($std_result);
			}
			$db->fn_disconnect();
			return $this->m_data;
		}
		
		function fn_getdate($db, $dateid) {
			//************************
			// Get date, given date ID
			//************************
			if ($this->_DEBUG) {
				echo "DEBUG {crc_evaluation::fn_getdate}: Getting the date for the date id " . $dateid . ".<br>";
			}
			
			$this->m_date = null;
			if ($db->m_mysqlhandle != false) {
				$this->m_sql = 'select date_day, date_month, date_year ' . 
								'from ' . MYSQL_DATE_TBL . 
								' where (date_id = "' . $dateid . '")';
				$result = $db->fn_runsql(MYSQL_DB, $this->m_sql);
				if (mysql_num_rows($result) > 0) {
					$row = mysql_fetch_row($result);
					$this->m_date = $row[0] . '-' . $row[1] . '<br>-' . $row[2];
				}
				$db->fn_freesql($result);
			}
			return $this->m_date;
		}
		
		function fn_getstandarddeviation($scheduleid, $means){
			//********************************************************************
			// Get the standard feviation for each question of the schedule
			//********************************************************************
			if ($this->_DEBUG) {
				echo "DEBUG {crc_evaluation::fn_getanswers}: Getting the standard deviation for the schedule id " . $scheduleid . ".<br>";
			}

			$db = new crc_mysql($this->_DEBUG);
			$dbhandle = $db->fn_connect();
			$this->m_data = null;
			if ($dbhandle != false) {
				//get student_schedule_id of all the students enrolled to this schedule			
				$this->m_sql = 'select student_schedule_id, student_schedule_profile_id ' . 
								'from ' . MYSQL_STUDENT_SCHEDULE_TBL . 
								' where (student_schedule_schedule_id = "' . $scheduleid . '")';
				$studentscheduleid = $db->fn_runsql(MYSQL_DB, $this->m_sql);
				if (mysql_num_rows($studentscheduleid) > 0) {					
					$studidx = 0;
					$ansidx = 0;
					while ($ssid = mysql_fetch_array($studentscheduleid)) {
						//get student name
						$name = $this->fn_getprofilename($db, $ssid[1]);
						//get feedback_id
						$this->m_sql = 'select feedback_id ' . 
								'from ' . MYSQL_FEEDBACK_TBL . 
								' where (feedback_schedule_id = "' . $ssid[0] . '")';
						$feedbackid = $db->fn_runsql(MYSQL_DB, $this->m_sql);
						if (mysql_num_rows($feedbackid) > 0) {
							$fid = mysql_fetch_row($feedbackid);//a single feedback id should correspond to a student schedule id
							//get questions, answers and comments
							$this->m_sql = 'select feedback_answers_questions_id, ' .
												'feedback_answers_answer, feedback_answers_comments ' . 
												'from ' . MYSQL_FEEDBACK_ANSWERS_TBL . 
												' where (feedback_answers_feedback_id = "' . $fid[0] . '")';
							$answers = $db->fn_runsql(MYSQL_DB, $this->m_sql);
							if (mysql_num_rows($answers) > 0) {
								$ansidx = 0;
								while ($ans = mysql_fetch_array($answers)) {
									if ($studidx == 0) {
										
										$this->m_data[$ansidx]['sumsquares'] = 0;
										$this->m_data[$ansidx]['responsecount'] = 0;
									}
									
									$this->m_data[$ansidx]['sumsquares'] += ($ans[1]-$means[$ansidx]['ans'])*($ans[1]-$means[$ansidx]['ans']);
									$this->m_data[$ansidx]['responsecount'] += 1;
									$ansidx++;
								}
								$studidx++;
							} else if ($this->_DEBUG) {
								echo "DEBUG {crc_evaluation::fn_getanswers}: Cannot get the answers.<br>";
							}							
							$db->fn_freesql($answers);
						} else if ($this->_DEBUG) {
							echo "DEBUG {crc_evaluation::fn_getanswers}: Cannot get feedback ID.<br>";
						}
						$db->fn_freesql($feedbackid);						
					}
					for ($i = 0; $i < $ansidx; $i++) {
						$this->m_data[$i]['standarddeviation'] =  number_format(round(sqrt($this->m_data[$i]['sumsquares']/$this->m_data[$i]['responsecount']), 2), 2);//take the standard deviation
					}
				} else if ($this->_DEBUG) {
					echo "DEBUG {crc_evaluation::fn_getanswers}: Cannot get the student schedule.<br>";
				}
				$db->fn_freesql($studentscheduleid);
			} else 	if ($this->_DEBUG) {
				echo "DEBUG {crc_evaluation::fn_getanswers}: Cannot connect to MySQL database.<br>";
			}
			$db->fn_disconnect();
			return $this->m_data;
		}
	}
?>
