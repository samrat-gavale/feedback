<?php
require_once(dirname(__FILE__) . '/../classes/crc_teacher.cls.php');

class TestOfTeacherClass extends UnitTestCase {
	function testSetPresent() {
		$teacher = new crc_teacher(false);
		
		//invalid data
		$this->assertFalse($teacher->fn_setpresent(null, null, null, null, null));
		$this->assertEqual($teacher->lasterrmsg, 'Invalid input');
		
		$action = "none";
		$scheduleid = "1";
		$day = "01";
		$month = "01";
		$year = "2010";
		$this->assertFalse($teacher->fn_setpresent($action, $scheduleid, $day, $month, $year));
		$this->assertEqual($teacher->lasterrmsg, 'Invalid action. Should be either "A" or "P"');

		//valid data
		$action = "present";
		$scheduleid = "1";
		$day = "01";
		$month = "01";
		$year = "2010";
		$this->assertTrue($teacher->fn_setpresent($action, $scheduleid, $day, $month, $year));
	}
	
	function testGetDateID() {
		$teacher = new crc_teacher(false);
		
		//create db object
		$db = new crc_mysql(false);
		
		$day = "01";
		$month = "01";
		$year = "2010";
		
		//invalid data
		$this->assertTrue($teacher->fn_getdateid($db, $day, $month, $year) == 0);
		$this->assertEqual($teacher->lasterrmsg, 'Invalid MySQL handle');
		
		//connect to db
		$this->assertTrue($db->fn_connect());

		//valid data
		$this->assertFalse($teacher->fn_getdateid($db, $day, $month, $year) == 0);
		
		//close db connection
		$db->fn_disconnect();
	}
	
	function testGetCheck() {
		$teacher = new crc_teacher(false);
		
		//create db object
		$db = new crc_mysql(false);
		
		$studentscheduleid = "1";
		
		//invalid data
		$this->assertNull($teacher->fn_getcheck($db, $studentscheduleid));
		
		//connect to db
		$this->assertTrue($db->fn_connect());
		
		//valid data
		$this->assertNotNull($teacher->fn_getcheck($db, $studentscheduleid));
		$this->assertEqual($teacher->m_check, 'A');
	}
}
?>
