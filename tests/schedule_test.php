<?php
require_once(dirname(__FILE__) . '/../classes/crc_schedule.cls.php');

class TestOfScheduleClass extends UnitTestCase {
	function testAddSchedule() {
		$schedule = new crc_schedule(false);
		
		//invalid data
		$this->assertFalse($schedule->fn_addschedule(null, "1"));
		$this->assertEqual($schedule->lasterrmsg, "Invalid input");
		
		//valid data
		$this->assertTrue($schedule->fn_addschedule("1", "1"));		
	}
	
	function testGetSchedule() {
		$schedule = new crc_schedule(false);
		
		//invalid data
		$this->assertNull($schedule->fn_getschedule(null, "1"));
		$this->assertEqual($schedule->lasterrmsg, "Invalid input");
		
		$this->assertNull($schedule->fn_getschedule("1", "1"));
		$this->assertEqual($schedule->lasterrmsg, "No enrollment found");
	}
}
?>
