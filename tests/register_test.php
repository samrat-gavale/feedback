<?php
require_once(dirname(__FILE__) . '/../classes/crc_register.cls.php');

class TestOfRegisterClass extends UnitTestCase {
	function testRegister() {
		$register = new crc_register(false);

		//invalid data
		$this->assertFalse($register->fn_register(null));
		$this->assertEqual($register->lasterrmsg, "Incomplete input");
		
		$data['username'] = "";
		$data['password'] = "";
		$data['email'] = "";
		$data['context'] = "";
		$data['profile'] = "";
		$data['email'] = "";
		$data['password'] = "";
		$data['fname'] = "";
		$data['lname'] = "";
		$data['year'] = "";
		$data['month'] = "";
		$data['day'] = "";
		$data['gender'] = "";
		$data['add1'] = "";
		$data['add2'] = "";
		$data['city'] = "";
		$data['province'] = "";
		$data['pc'] = "";
		$data['country'] = "";
		$data['lcode'] = "";
		$data['lprefix'] = "";
		$data['lpostfix'] = "";
		$this->assertFalse($register->fn_register($data));
		$this->assertEqual($register->lasterrmsg, "Invalid input");

		//valid data
		$data['username'] = "al";
		$data['password'] = "al";
		$data['email'] = "al@domain.com";
		$data['context'] = 'ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World';
		$data['profile'] = 'Student';
		$data['email'] = 'al';
		$data['password'] = 'al';
		$data['fname'] = 'al';
		$data['lname'] = 'bhanji3';
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
		$this->assertTrue($register->fn_register($data));
		
		//register the second time the same user
		$this->assertFalse($register->fn_register($data));
		$this->assertNotNull($register->lasterrmsg);
	}	
}
?>
