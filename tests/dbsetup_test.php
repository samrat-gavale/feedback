<?php
require_once(dirname(__FILE__) . '/../classes/crc_dbsetup.cls.php');
include_once('setup_vars.php');

class TestOfDBSetupClass extends UnitTestCase {
	function testDBSetup() {
		$dbsetup = new crc_dbsetup(false);
		
		//invalid input
		$dbname = "";
		$rootpwd = "";
		$username = "";
		$userpwd = "";
		$this->assertFalse($dbsetup->fn_dbsetup($dbname, $rootpwd, $username, $userpwd));
		$this->assertEqual($dbsetup->lasterrmsg, "Invalid input");
		
		//create database
		$dbname = DATABASE_NAME;
		$rootpwd = MYSQL_ROOT_PASSWORD;
		$username = USER_NAME;
		$userpwd = USER_PASSWORD;
		$this->assertTrue($dbsetup->fn_dbsetup($dbname, $rootpwd, $username, $userpwd));
	}
}
?>
