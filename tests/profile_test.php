<?php
require_once(dirname(__FILE__) . '/../classes/crc_profile.cls.php');

class TestOfProfileClass extends UnitTestCase {
	function testGetProfile() {
		$profile = new crc_profile(false);
		
		//invalid username
		$this->assertFalse($profile->fn_getprofile("invaliduser"));
		$this->assertNotNull($profile->lasterrmsg);
		
		//valid username
		$this->assertTrue($profile->fn_getprofile("admin"));
	}
	
	function testSetProfile() {
		$profile = new crc_profile(false);
		
		//invalid data
		$this->assertFalse($profile->fn_setprofile(null));
		$this->assertEqual($profile->lasterrmsg, "Incomplete input");
		
		$data['profileid']  = '';
		$data['username'] = '';		
		$data['email'] = '';
		$data['password'] = '';
		$data['fname'] = '';
		$data['lname'] = '';
		$data['year'] = '';
		$data['month'] = '';
		$data['day'] = '';
		$data['gender'] = '';
		$data['add1'] = '';
		$data['add2'] = '';
		$data['city'] = '';
		$data['province'] = '';
		$data['pc'] = '';
		$data['country'] = '';
		$data['lcode'] = '';
		$data['lprefix'] = '';
		$data['lpostfix'] = '';
		$this->assertFalse($profile->fn_setprofile($data));
		$this->assertEqual($profile->lasterrmsg, "Empty profile ID");
		
		$data['profileid']  = '0';
		$this->assertFalse($profile->fn_setprofile($data));
		$this->assertEqual(strlen($profile->lasterrmsg), 0);
		
		//valid data
		$data['profileid']  = '1';
		$data['username'] = 'admin';
		$data['email'] = 'altaf';
		$data['password'] = 'altaf';
		$data['fname'] = 'altaf';
		$data['lname'] = 'bhanji';
		$data['year'] = '1969';
		$data['month'] = '03';
		$data['day'] = '24';
		$data['gender'] = 'Male';
		$data['add1'] = '28 Elson Street';
		$data['add2'] = '';
		$data['city'] = 'Markham';
		$data['province'] = 'ON';
		$data['pc'] = 'L3S2J5';
		$data['country'] = 'Canada';
		$data['lcode'] = '416';
		$data['lprefix'] = '524';
		$data['lpostfix'] = '9520';
		$this->assertTrue($profile->fn_setprofile($data));
	}
}
?>
