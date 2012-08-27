<?php
require_once(dirname(__FILE__) . '/../classes/crc_admin.cls.php');

class TestOfAdminClass extends UnitTestCase {
	
	function testSetCourse() {
		$admin = new crc_admin(false);
		
		//null input
		$this->assertFalse($admin->fn_setcourse(null));
		
		//empty string
		$this->assertFalse($admin->fn_setcourse(""));
		
		//full $post with fake teacher
		$post['cname'] = "Digital Signal Processing";
		$post['cdesc'] = "some course";
		$post['syear'] = "2010";
		$post['smonth'] = "01";
		$post['sday'] = "01";		
		$post['eyear'] = "2010";
		$post['emonth'] = "03";
		$post['eday'] = "01";
		$post['daytime'] = "Mo [09:00 - 11:00]";
		$post['roomname'] = "NII2";
		$post['teacher0'] = "";		
		$this->assertFalse($admin->fn_setcourse($post));
		$this->assertEqual($admin->lasterrmsg, "No teacher has been selected");
		
		//insert again the same course		
		$this->assertFalse($admin->fn_setcourse($post));
		$this->assertEqual($admin->lasterrmsg, "Course \"" . $post['cname'] . "\" already exists in database.<br>Use \"Edit Course\" menu if you want to modify this course.");
	}
	
	function testGetCourseList() {
		$admin = new crc_admin(false);
		
		//null input, assuming that there is a course in the db
		$admin->fn_getcourselist(null);
		$this->assertEqual(count($admin->m_courselist), 1);
		$this->assertEqual($admin->m_courselist[0]['cnamedesc'], "Digital Signal Processing, some course");
	}
	
	function testGetTeacherList() {
		$admin = new crc_admin(false);
		
		//null input, the teacher is the admin
		$admin->fn_getteacherlist(null);
		$this->assertEqual(count($admin->m_teacherlist), 1);
		$this->assertEqual($admin->m_teacherlist[0]['lastfirstname'], "Lastname, Firstname");
		$this->assertEqual($admin->m_teacherlist[0]['profileid'], 1);
	}
	
	function testSetStudent() {
		$admin = new crc_admin(false);
		
		//null input
		$this->assertFalse($admin->fn_setstudent(null));
		
		//empty string
		$this->assertFalse($admin->fn_setstudent(""));
		
		//full $post with fake course
		$post['fname'] = "SFirstame";
		$post['lname'] = "SLastname";
		$post['gender'] = "male";
		$post['email'] = "student@domain.com";
		$post['lcode'] = "0040";		
		$post['lprefix'] = "0000";
		$post['lpostfix'] = "000000";
		$post['course0'] = "";
		$this->assertFalse($admin->fn_setstudent($post));
		$this->assertEqual($admin->lasterrmsg, "No course has been selected");
	}	
	
	function testGetStudentList() {
		$admin = new crc_admin(false);
		
		//null input, no student should be in the database
		$admin->fn_getstudentlist(null);
		$this->assertEqual(count($admin->m_studentlist), 0);
	}
}
?>
