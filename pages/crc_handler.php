<?php  
if(isset($_REQUEST[session_name()])) {
	// There is a session already available
	//session_start();
} else {
	session_name('crc');
	session_start();
}
include_once('../classes/crc_login.cls.php');
include_once('../classes/crc_register.cls.php');
include_once('../classes/crc_profile.cls.php');
include_once('../classes/crc_schedule.cls.php');
include_once('../classes/crc_courses.cls.php');
include_once('../classes/crc_teacher.cls.php');
include_once('../classes/crc_evaluation.cls.php');
include_once('../classes/crc_admin.cls.php');
include_once('../classes/crc_dean.cls.php');
include_once('../classes/crc_dbsetup.cls.php');
?>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<TITLE><?php	
if (isset($_GET['method'])) {
	$title = "Method->" . $_GET['method'];
}
if (isset($_GET['func'])) {
	$title = $title . " Function->" . $_GET['func'];
}
//$title = $title . ". Please wait...";
$title = 'Please wait....';
print '[' . $title . ']';
?></TITLE>
<!--LINK HREF="../styles/crc_page_style.css" REL="stylesheet" TYPE="text/css"-->
<LINK HREF="../styles/crc_main.css" REL="stylesheet" TYPE="text/css">
</HEAD>
<BODY>
<CENTER><!----------------------------------------------------
			// This is the main boss of the web page. The page
			// is broken down into 3 groups as follows:
			//
			// - The "Page Header" where the logo should be placed
			//   and anything else that is to be seen on every page.
			//
			// - The "Page Content" where the content text of the
			//   page is to be placed for users to see.
			//
			// - The "Page Footer" where the closing statements
			//   such as webmaster email and any closing statements
			//   should be placed. Again this will be seen on every page.
			//
			// Note that all this should be placed within a table
			// containing 3 rows respectively.
			------------------------------------------------------>

<TABLE width="100%">
	<!-- The Page Header -->
	<TR CLASS="OUTER">
	<?php
	include "data/crc_page_header_band.html";
	?>
	</TR>

	<tr>
		<td align="center"><br>
		<br>
		</th>
	
	</tr>

	<!-- The Page Content -->
	<?php	

	if (isset($_GET['method'])) {

		echo '<table class="tbl">';
		echo '<tr align="center"><td class="error"><b>' . $title . '</b></td></tr>';
		echo '</table>';

		if ($_GET['method'] == 'login') {
			$login = new crc_login(false);
			$login->fn_login($_POST);
		}
		else if ($_GET['method'] == 'verify')
		{
			$login = new crc_login(false);
			$result = $login->fn_verify($_POST);
			if ($result == false) {
					
				$_SESSION['msg'] = $login->lasterrmsg;
				echo '<meta http-equiv="refresh" content="0;URL=crc_login.php?' . session_name() . '=' . session_id() . '&uid=' . $_POST['username'] . '">';

			} else {

                $_SESSION['uid'] = "";
                $_SESSION['profileid'] = "";
                $_SESSION['name'] = "";
                $_SESSION['data'] = "";
                $_SESSION['profiledata'] = "";
                $_SESSION['scheduledata'] = "";
                $_SESSION['coursesdata'] = "";
                $_SESSION['teacherscheduledata'] = "";
                $_SESSION['teacherstudentsdata'] = "";
                $_SESSION['teacherattendancegetdata'] = "";
                $_SESSION['evaluation'] = "";
				$_SESSION['uid'] = $login->m_uid;
				$_SESSION['name'] = $login->m_name;
				$_SESSION['profileid'] = $login->m_profileid;
				$_SESSION['roleid'] = $login->m_roleid;
				$_SESSION['msg'] = "";
				$login->m_sess = session_id();
				$login->fn_session();
				echo '<meta http-equiv="refresh" content="0;URL=crc_main.php?' . session_name() . '=' . session_id() . '&uid=' . $_SESSION['uid'] . '">';

			}

		} else if ($_GET['method'] == 'register') {

			$_SESSION['msg'] = "";
            $_SESSION['registerdata'] = "";

			if (isset($_GET['func'])) {

				if ($_GET['func'] == 'add') {

					$_SESSION['registerdata'] = $_POST;

					$register = new crc_register(false);
					$result = $register->fn_register($_POST);

					if ($result == false) {

						$_SESSION['msg'] = $register->lasterrmsg;
						echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_register.php?' . session_name() . '=' . session_id() . '&uid=' . $_POST['username'] . '">';

					} else {

						$_SESSION['registerdata'] = NULL;
						echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_login.php?' . session_name() . '=' . session_id() . '&uid=' . $_POST['username'] . '">';

					}
					
				} else {
					
					echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_unknown.php?' . session_name() . '=' . session_id() . '">';
					
				}
			} else {

				echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_register.php?' . session_name() . '=' . session_id() . '">';

			}

		} else if ($_GET['method'] == 'profile') {

			if ($_GET['func'] == 'get') {
				
				$_SESSION['msg'] = "";
				$profile = new crc_profile(false);
				$_SESSION['profiledata'] = $profile->fn_getprofile($_SESSION['uid']);
				echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_profile.php?func=get&' . session_name() . '=' . session_id() . '&uid=' . $_SESSION['uid'] . '">';

			} else if ($_GET['func'] == 'update') {
				$profile = new crc_profile(false);
				$result = $profile->fn_setprofile($_POST);

				if ($result == false) {
					$_SESSION['msg'] = $profile->lasterrmsg;
					echo $profile->lasterrmsg;
					echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_profile.php?' . session_name() . '=' . session_id() . '&uid=' . $_SESSION['uid'] . '">';
				} else {
					$_SESSION['profiledata'] = $profile->fn_getprofile($_SESSION['uid']);
					$_SESSION['msg'] = "Profile updated successfully!";
					echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_profile.php?' . session_name() . '=' . session_id() . '&uid=' . $_SESSION['uid'] . '">';
				}

			} else if ($_GET['func'] == 'studentlist') {
					
				$admin = new crc_admin(false);
				$admin->fn_getstudentlist(null);
				$_SESSION['teacherstudentsdata'] = $admin->m_studentlist;
				echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_profile.php?func=studentlist&' . session_name() . '=' . session_id() . '&uid=' . $_SESSION['uid'] . '">';

			} else if ($_GET['func'] == 'editstudent') {

				$profile = new crc_profile(false);
				$profile->fn_getprofile($_GET['profileuid']);
				$_SESSION['profiledata'] = $profile->m_data;
				$admin = new crc_admin(false);
				$admin->fn_getcourselist(null);
				$_SESSION['coursesdata'] = $admin->m_courselist;
				$schedule = new crc_schedule(false);
				$schedule->fn_getschedule($profile->m_data[0], 3);
				$_SESSION['scheduledata'] = $schedule->m_data;
				echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_profile.php?func=editstudent&' . session_name() . '=' . session_id() . '&uid=' . $_SESSION['uid'] . '">';

			} else if ($_GET['func'] == 'updatestudent') {

				$profile = new crc_profile(false);
				$result_profile = $profile->fn_setprofile($_POST, true);
				$admin = new crc_admin(false);
				$result_admin = $admin->fn_setstudentschedule(null, $_POST, $_POST['profileid']);
				if ($result_profile == false) {
					$_SESSION['msg'] = $profile->lasterrmsg;
					echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_profile.php?method=profile&func=editstudent&' . session_name() . '=' . session_id() . '&uid=' . $_SESSION['uid'] . '">';
				} else if ($result_admin == false) {
					$_SESSION['msg'] = $admin->lasterrmsg;
					echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_profile.php?method=profile&func=editstudent&' . session_name() . '=' . session_id() . '&uid=' . $_SESSION['uid'] . '">';
				} else {
					$_SESSION['msg'] = $_POST['name'] . "\" updated successfully!";
					echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_handler.php?method=profile&func=studentlist&' . session_name() . '=' . session_id() . '&uid=' . $_SESSION['uid'] . '">';
				}
				
			} else {
				echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_unknown.php?' . session_name() . '=' . session_id() . '&uid=' . $_SESSION['uid'] . '">';
			}
		} else if ($_GET['method'] == 'schedule') {
			$_SESSION['msg'] = "";

			if ($_GET['func'] == 'get') {
				//TODO this code is duplicated by 'method = teacher', 'func = getschedule'
				$schedule = new crc_schedule(false);
				$schedule->fn_getschedule($_SESSION['profileid'], $_SESSION['roleid']);
				$_SESSION['scheduledata'] = $schedule->m_data;
					
				echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_schedule.php?func=get&' . session_name() . '=' . session_id() . '&uid=' . $_SESSION['uid'] . '">';

			} else if ($_GET['func'] == 'add') {

				$schedule = new crc_schedule(false);
				$schedule->fn_addschedule($_SESSION['profileid'], $_GET['schedule']);
				$_SESSION['msg'] = 'Course successfully added!';
				echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_schedule.php?' . session_name() . '=' . session_id() . '&uid=' . $_SESSION['uid'] . '">';

			} else {
				echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_unknown.php?' . session_name() . '=' . session_id() . '&uid=' . $_SESSION['uid'] . '">';
			}

		} else if ($_GET['method'] == 'courses') {

			if ($_GET['func'] == 'get') {

				$courses = new crc_courses(false);
				$courses->fn_getcourses($_SESSION['profileid']);
				$_SESSION['coursesdata'] = $courses->m_data;
				echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_courses.php?func=get&' . session_name() . '=' . session_id() . '&uid=' . $_SESSION['uid'] . '">';

			} else if ($_GET['func'] == 'remove') {

				$courses = new crc_courses(false);
				$courses->fn_removecourse($_SESSION['profileid'], $_GET['course']);
				$_SESSION['msg'] = 'Course successfully removed!';
				echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_courses.php?' . session_name() . '=' . session_id() . '&uid=' . $_SESSION['uid'] . '">';

			} else if ($_GET['func'] == 'courselist') {
				
				$admin = new crc_admin(false);
				$_SESSION['coursesdata'] = $admin->fn_getacourselist(null);
				echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_courses.php?func=courselist&' . session_name() . '=' . session_id() . '&uid=' . $_SESSION['uid'] . '">';

 			} else if ($_GET['func'] == 'active_courselist') {
				
				$admin = new crc_admin(false);
				$_SESSION['coursesdata'] = $admin->fn_getactivecourselist(null);
				echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_courses.php?func=courselist&' . session_name() . '=' . session_id() . '&uid=' . $_SESSION['uid'] . '">';

			} else if ($_GET['func'] == 'inactive_courselist') {
				
				$admin = new crc_admin(false);
				$_SESSION['coursesdata'] = $admin->fn_getinactivecourselist(null);
				echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_courses.php?func=courselist&' . session_name() . '=' . session_id() . '&uid=' . $_SESSION['uid'] . '">';
				
			} else if ($_GET['func'] == 'editenroll') {
				
				$profile = new crc_profile(false);
				$profile->fn_getprofile($_SESSION['uid']);//obtain profile id
				$_SESSION['profiledata'] = $profile->m_data;
				$schedule = new crc_schedule(false);
				$schedule->fn_getschedule($profile->m_data[0], 3, true);//obtain information for all courses
				$_SESSION['coursesdata'] = $schedule->m_data;
				echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_courses.php?func=register&' . session_name() . '=' . session_id() . '&uid=' . $_SESSION['uid'] . '">';
				
			} else if ($_GET['func'] == 'enroll') {
				
				$admin = new crc_admin(false);
				$result_admin = $admin->fn_setstudentschedule(null, $_POST, $_SESSION['profiledata'][0]);
				echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_handler.php?method=courses&func=editenroll">';
				
			} else if ($_GET['func'] == 'deroll') {
				
				$admin = new crc_admin(false);
				$profile = new crc_profile(false);
				$profile->fn_getprofile($_SESSION['uid']);//obtain profile id
				$_SESSION['profiledata'] = $profile->m_data;
				$result_admin = $admin->fn_delstudentschedule(null, $_GET['student_schedule'], $_SESSION['profiledata'][0]);
				echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_handler.php?method=courses&func=get">';
				
			} else if ($_GET['func'] == 'editcourse') {
				
				$course = new crc_courses(false);
				$_SESSION['coursesdata'] = $course->fn_getcourseinfo($_GET['courseid']);
				$_SESSION['teacherscheduledata'] = $course->fn_getteacherlist(null, $_GET['courseid']);
				echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_courses.php?func=editcourse&' . session_name() . '=' . session_id() . '&uid=' . $_SESSION['uid'] . '">';

			} else if ($_GET['func'] == 'updatecourse') {

				$course = new crc_courses(false);
				$result = $course->fn_setcourseinfo($_POST);
				if ($result == false) {
					$_SESSION['msg'] = $course->lasterrmsg;
					echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_courses.php?func=editcourse&' . session_name() . '=' . session_id() . '&uid=' . $_SESSION['uid'] . '">';
				} else {
					$_SESSION['msg'] = "\"" . $_POST['cname'] . "\" updated successfully!";
					echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_handler.php?method=courses&func=courselist&' . session_name() . '=' . session_id() . '&uid=' . $_SESSION['uid'] . '">';
				}				
				
			} else {
				echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_unknown.php?' . session_name() . '=' . session_id() . '&uid=' . $_SESSION['uid'] . '">';
			}

		} else if ($_GET['method'] == 'teacher') {

			$_SESSION['msg'] = "";

			if ($_GET['func'] == 'getschedule') {

				$schedule = new crc_schedule(false);
				$schedule->fn_getschedule($_SESSION['profileid'], 2);//teacher role id
				$_SESSION['teacherscheduledata'] = $schedule->m_data;
				echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_teacher.php?' . session_name() . '=' . session_id() . '&uid=' . $_SESSION['uid'] . '">';
				
			} else if ($_GET['func'] == 'getstudents') {

				$scheduleid = $_GET['scheduleid'];
				$teacher = new crc_teacher(false);
				$teacher->fn_getstudents($scheduleid);
				$_SESSION['teacherstudentsdata'] = $teacher->m_data;
				echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_students.php?func=getstudents&' . session_name() . '=' . session_id() . '&uid=' . $_SESSION['uid'] . '">';

			} else if ($_GET['func'] == 'getstudentsapproved') {

				$scheduleid = $_GET['scheduleid'];
				$teacher = new crc_teacher(false);
				$teacher->fn_getstudentsapproved($scheduleid);
				$_SESSION['teacherstudentsdata'] = $teacher->m_data;
				echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_students.php?func=getstudentsapproved&' . session_name() . '=' . session_id() . '&uid=' . $_SESSION['uid'] . '">';

			} else if ($_GET['func'] == 'getstudentstoapprove') {

				$scheduleid = $_GET['scheduleid'];
				$teacher = new crc_teacher(false);
				$teacher->fn_getstudentstoapprove($scheduleid);
				$_SESSION['teacherstudentsdata'] = $teacher->m_data;
				echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_students.php?func=getstudentstoapprove&' . session_name() . '=' . session_id() . '&uid=' . $_SESSION['uid'] . '">';

			} else if ($_GET['func'] == 'getattendance') {

				$scheduleid = $_GET['scheduleid'];
				$profileid = $_GET['profileid'];
				$teacher = new crc_teacher(false);
				$teacher->fn_getattendance($profileid, $scheduleid);
				$_SESSION['teacherattendancegetdata'] = $teacher->m_data;
				echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_attendance.php?func=getattendance&' . session_name() . '=' . session_id() . '&uid=' . $_SESSION['uid'] . '">';

			} else if ($_GET['func'] == 'setattendance') {

				$teacher = new crc_teacher(false);
				$attendanceid = $_GET['id'];
				$action = $_GET['action'];
				$teacher->fn_setattendance($attendanceid, $action);
					
				$scheduleid = $_GET['scheduleid'];
				$profileid = $_GET['profileid'];
				$teacher->fn_getattendance($profileid, $scheduleid);
				$_SESSION['teacherattendancegetdata'] = $teacher->m_data;
				echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_attendance.php?func=getattendance&' . session_name() . '=' . session_id() . '&uid=' . $_SESSION['uid'] . '">';
				
			} else if ($_GET['func'] == 'setpresent') {

				$teacher = new crc_teacher(false);
				$action = $_GET['action'];
				$scheduleid = $_GET['scheduleid'];
				$day = $_GET['day']; 
				$month = $_GET['month'];
				$year = $_GET['year'];
				$result = $teacher->fn_setpresent($action, $scheduleid, $day, $month, $year);
				$data = $_SESSION['teacherstudentsdata'];
				$found = false;
				for($i = 0; $i < count($data); $i++) {
					if($data[$i][7] == $scheduleid) {
						$found = true;
						break;
					}
				}
				if ($found == true) {
					if ($result == true) {
						$data[$i][8] = $action;
					}
				}
				$_SESSION['teacherstudentsdata'] = $data;
				echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_students.php?func=getstudents&' . session_name() . '=' . session_id() . '&uid=' . $_SESSION['uid'] . '">';
				
			}else if ($_GET['func'] == 'approve') {

				$teacher = new crc_teacher(false);
				$action = $_GET['action'];
				$scheduleid = $_GET['scheduleid'];
//				die($scheduleid);
				$student_scheduleid = $_GET['studentscheduleid'];
				$result = $teacher->fn_approve($action, $student_scheduleid);
				$data = $_SESSION['teacherstudentsdata'];
				$found = false;
				for($i = 0; $i < count($data); $i++) {
					if($data[$i][7] == $scheduleid) {
						$found = true;
						break;
					}
				}
				if ($found == true) {
					if ($result == true) {
						$data[$i][8] = $action;
					}
				}
				$_SESSION['teacherstudentsdata'] = $data;
				if($action == "AP")
				{
					echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_handler.php?method=teacher&func=getstudentstoapprove&scheduleid=' . $scheduleid . '">';
				}
				else
				{
					echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_handler.php?method=teacher&func=getstudentsapproved&scheduleid=' . $scheduleid . '">';					
				}
			} else {
				
				echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_unknown.php?' . session_name() . '=' . session_id() . '&uid=' . $_SESSION['uid'] . '">';
				
			}

		} else if ($_GET['method'] == 'admin') {
			$_SESSION['msg'] = "";

			$admin = new crc_admin(false);
			$_SESSION['data'] = $admin->m_data;//common data: course and student
			if ($_GET['func'] == 'showaddcourse') {
				
				$_SESSION['teacherscheduledata'] = $admin->fn_getteacherlist(null);
				echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_admin.php?method=addcourse&' . session_name() . '=' . session_id() . '&uid=' . $_SESSION['uid'] . '">';
				
			} else 	if ($_GET['func'] == 'addcourse') {

				$result = $admin->fn_setcourse($_POST);
				if($result == false) {
					$_SESSION['data'] = $admin->m_data;
					$_SESSION['msg'] = $admin->lasterrmsg;
				} else {
					$_SESSION['msg'] = "Course successfully added";
				}
				echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_admin.php?method=addcourse&' . session_name() . '=' . session_id() . '&uid=' . $_SESSION['uid'] . '">';
				
			} else if ($_GET['func'] == 'showaddstudent') {
								
				$_SESSION['coursesdata'] = $admin->fn_getcourselist(null);				
				echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_admin.php?method=addstudent&' . session_name() . '=' . session_id() . '&uid=' . $_SESSION['uid'] . '">';
								
			} else if ($_GET['func'] == 'addstudent') {
				
				$result = $admin->fn_setstudent($_POST);
				if($result == false) {
					$_SESSION['data'] = $admin->m_data;
					$_SESSION['msg'] = $admin->lasterrmsg;
				} else {
					$_SESSION['msg'] = "Student successfully added";
				}
				echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_admin.php?method=addstudent&' . session_name() . '=' . session_id() . '&uid=' . $_SESSION['uid'] . '">';
								
			} else if ($_GET['func'] == 'dbsetup') {
				
				$dbsetup = new crc_dbsetup(false);
				$result = $dbsetup->fn_dbsetup($_POST['database'], $_POST['password'], $_POST['username'], $_POST['userpassword']);
				if ($result == false) {
					$_SESSION['msg'] = $dbsetup->lasterrmsg;
				} else {
					$_SESSION['msg'] = "success";
				}
				echo '<meta http-equiv="refresh" content="0;URL=../mysql/setup.php?' . session_name() . '=' . session_id() . '">';
				
			} else {
				
				echo '<meta http-equiv="refresh" content="0;URL=crc_unknown.php?' . session_name() . '=' . session_id() . '&uid=' . $_SESSION['uid'] . '">';
				
			}

		} else if ($_GET['method'] == 'evaluation') {

			$_SESSION['msg'] = "";
			$evaluation = new crc_evaluation(false);
			$evaluation2 = new crc_evaluation(false);

			if ($_GET['func'] == 'get') {
				
				$evaluation->fn_getquestions();
				$_SESSION['evaluation'] = $evaluation->m_data;
				echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_evaluation.php?' . session_name() . '=' . session_id() . '&uid=' . $_SESSION['uid'] . '&course=' . $_GET['student_schedule'] . '">';

			} else if ($_GET['func'] == 'add') {

				if ($evaluation->fn_setquestions($_SESSION['profileid'], $_POST)) {
					$_SESSION['msg'] = "Thank you! You feedback is important to us and will be communicated accordingly.";
				} else {
					$_SESSION['msg'] = "Sorry, There was an error submittimg your feedback.";
				}
				echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_evaluation.php?' . session_name() . '=' . session_id() . '&uid=' . $_SESSION['uid'] . '&course=' . $_GET['course'] . '">';
				
			} else if ($_GET['func'] == 'getanswers') {

				$_SESSION['evaluation'] = $evaluation->fn_getanswers($_GET['scheduleid']);
				$answers = $_SESSION['evaluation'];
				$_SESSION['sdevcnt'] = $evaluation->fn_getstandarddeviation($_GET['scheduleid'],$answers);
				if (($_SESSION['evaluation'] != null) && ($_SESSION['sdevcnt'] != null)) {
					$_SESSION['coursesdata'] = $evaluation->fn_getcoursename($_GET['scheduleid']);
//					$_SESSION['data'] = $evaluation->m_studentnb;
				} else {
					$_SESSION['msg'] = "<td><br>There are no statistics for this course<br><br></td>";
				}
				echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_evaluation.php?' . session_name() . '=' . session_id() . '&func=stats&scheduleid=' . $_GET['scheduleid'] . '">';			
				
			} else if ($_GET['func'] == 'getanswersnew') {

				$_SESSION['evaluation'] = $evaluation->fn_getanswersnew($_GET['scheduleid']);
				$answers = $_SESSION['evaluation'];
				$_SESSION['sdevcnt'] = $evaluation->fn_getstandarddeviation($_GET['scheduleid'],$answers);
				if (($_SESSION['evaluation'] != null) && ($_SESSION['sdevcnt'] != null)) {
					$_SESSION['coursesdata'] = $evaluation->fn_getcoursename($_GET['scheduleid']);
				} else {
					$_SESSION['msg'] = "<td><br>There are no statistics for this course<br><br></td>";
				}
				echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_evaluation.php?' . session_name() . '=' . session_id() . '&func=statsnew&scheduleid=' . $_GET['scheduleid'] . '">';			
				
			} else if ($_GET['func'] == 'getoverallstats') {

				$_SESSION['evaluation'] = $evaluation->fn_getanswersnew2($_GET['scheduleid']);
				$answers = $_SESSION['evaluation'];
				$_SESSION['overallavg'] = $evaluation->fn_getoverallavg();
				$_SESSION['overallminmax'] = $evaluation->fn_getoverallminmax();
				$_SESSION['sdevcnt'] = $evaluation->fn_getstandarddeviation($_GET['scheduleid'],$answers);
				if(($_SESSION['overallavg'] != null)&&($_SESSION['overallminmax'] != null)) 
				{
					$_SESSION['coursesdata'] = $evaluation->fn_getcoursename($_GET['scheduleid']);
				} else {
					$_SESSION['msg'] = "<td><br>There are no statistics for this course<br><br></td>";
				}
				echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_evaluation.php?' . session_name() . '=' . session_id() . '&func=overallstats&scheduleid=' . $_GET['scheduleid'] . '">';	
				
			} else if ($_GET['func'] == 'schedulelist') {
				
				$admin = new crc_dean(false);
				$_SESSION['scheduledata'] = $admin->fn_getschedulelist(null);
				echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_evaluation.php?func=schedulelist&' . session_name() . '=' . session_id() . '&uid=' . $_SESSION['uid'] . '">';
				
			} else if ($_GET['func'] == 'downloadpdf') {

				$_SESSION['evaluation'] = $evaluation->fn_getanswers($_GET['scheduleid']);
				$_SESSION['scheduledata'] = $evaluation->fn_getattendance($_GET['scheduleid']);				
				if (($_SESSION['evaluation'] != null) || ($_SESSION['scheduledata'] != null)) {
					$_SESSION['coursesdata'] = $evaluation->fn_getcoursename($_GET['scheduleid']);
					$_SESSION['data'] = $evaluation->m_studentnb;
				} else {
					$_SESSION['msg'] = "There are no statistics for this course";
				}
				echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_feedback_pdf.php?' . session_name() . '=' . session_id() . '&func=stats">';			

			} else if ($_GET['func'] == 'downloadpdf1') {

				$_SESSION['evaluation'] = $evaluation->fn_getanswersnew($_GET['scheduleid']);
				$_SESSION['scheduledata'] = $evaluation->fn_getattendance($_GET['scheduleid']);				
				if (($_SESSION['evaluation'] != null) || ($_SESSION['scheduledata'] != null)) {
					$_SESSION['coursesdata'] = $evaluation->fn_getcoursename($_GET['scheduleid']);
					$_SESSION['data'] = $evaluation->m_studentnb;
				} else {
					$_SESSION['msg'] = "There are no statistics for this course";
				}
				echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_feedback_pdf1.php?' . session_name() . '=' . session_id() . '&func=stats">';			

			} else if ($_GET['func'] == 'downloadpdf3') {

				$_SESSION['evaluation'] = $evaluation->fn_getanswersnew2($_GET['scheduleid']);
				$_SESSION['scheduledata'] = $evaluation->fn_getattendance($_GET['scheduleid']);				
				if (($_SESSION['evaluation'] != null) || ($_SESSION['scheduledata'] != null)) {
					$_SESSION['coursesdata'] = $evaluation->fn_getcoursename($_GET['scheduleid']);
					$_SESSION['data'] = $evaluation->m_studentnb;
				} else {
					$_SESSION['msg'] = "There are no statistics for this course";
				}
				echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_feedback_pdf3.php?' . session_name() . '=' . session_id() . '&func=stats">';			

			} else if ($_GET['func'] == 'downloadpdf2') {

				$_SESSION['evaluation'] = $evaluation->fn_getanswersnew($_GET['scheduleid']);
				$_SESSION['overallavg'] = $evaluation->fn_getoverallavg();
				$_SESSION['overallminmax'] = $evaluation->fn_getoverallminmax();
				$answers = $_SESSION['evaluation'];
				$_SESSION['sdevcnt'] = $evaluation->fn_getstandarddeviation($_GET['scheduleid'],$answers);
				if(($_SESSION['overallavg'] != null)&&($_SESSION['overallminmax'] != null)) 
				{
					$_SESSION['coursesdata'] = $evaluation->fn_getcoursename($_GET['scheduleid']);
				} else {
					$_SESSION['msg'] = "<td><br>There are no statistics for this course<br><br></td>";
				}
				echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_feedback_pdf2.php?' . session_name() . '=' . session_id() . '&func=stats">';			

			} 

		} else if ($_GET['method'] == 'faq') {
			$_SESSION['msg'] = "";

			echo '<meta http-equiv="refresh"' . 'content="0;URL=../faq/index.php?' . session_name() . '=' . session_id() . '&uid=' . $_SESSION['uid'] . '">';

		} else if ($_GET['method'] == 'events') {
			$_SESSION['msg'] = "";

			echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_events.php?' . session_name() . '=' . session_id() . '&uid=' . $_SESSION['uid'] . '">';

		} else if ($_GET['method'] == 'team') {
			$_SESSION['msg'] = "";

			echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_team.php?' . session_name() . '=' . session_id() . '&uid=' . $_SESSION['uid'] . '">';

		} else if ($_GET['method'] == 'help') {
			$_SESSION['msg'] = "";

			echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_help.php?' . session_name() . '=' . session_id() . '&uid=' . $_SESSION['uid'] . '">';

		} else if ($_GET['method'] == 'logout') {
			$_SESSION['msg'] = "";

			session_unset();
			session_destroy();

			echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_login.php">';

		} else {
			$_SESSION['msg'] = "";
			echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_unknown.php?' . session_name() . '=' . session_id() . '&uid=' . $_SESSION['uid'] . '">';
		}

	} else {
		$_SESSION['msg'] = "";
		echo '<meta http-equiv="refresh"' . 'content="0;URL=crc_unknown.php?' . session_name() . '=' . session_id() . '">';
	}

	?>

	</TR>
</TABLE>

</CENTER>
</BODY>
</HTML>
