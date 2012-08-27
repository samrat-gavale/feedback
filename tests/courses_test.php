<?php
require_once(dirname(__FILE__) . '/../classes/crc_courses.cls.php');

class TestOfCoursesClass extends UnitTestCase {
	
	function testSetCourseInfo() {
		$courses = new crc_courses(false);
		
		//null input
		$this->assertFalse($courses->fn_setcourseinfo(null));
		
		//empty string
		$this->assertFalse($courses->fn_setcourseinfo(""));
		
		//full $post with invalid course ID
		$post['cname'] = "Digital Signal Processing";
		$post['cdesc'] = "some course";
		$post['cfee'] = "2010";
		$post['courseid'] = "1";
		$post['cactive'] = "on";
		$post['syear'] = "2010";
		$post['smonth'] = "01";
		$post['sday'] = "01";
		$post['eyear'] = "2010";
		$post['emonth'] = "03";
		$post['eday'] = "01";
		$post['cstatus'] = "";
		$post['roomname'] = "NII2";
		$post['daytime'] = "Mo [09:00 - 11:00]";
		$post['roomdesc'] = "N/A";
		$this->assertFalse($courses->fn_setcourseinfo($post));
		$this->assertEqual($courses->lasterrmsg, "Invalid course ID");
	}
}
?>
