<?php
require_once(dirname(__FILE__) . '/../classes/crc_login.cls.php');

class TestOfLoginClass extends UnitTestCase {
	function testSession() {
		$login = new crc_login(false);
		
		//invalid data
		$login->m_sess = "";
		$login->m_uid = "";
		$login->m_pwd = "";
		$login->m_rdn = "";
		$this->assertFalse($login->fn_session());
		$this->assertEqual($login->lasterrmsg, "Invalid input");
		
		//valid data
		$login->m_sess = "none";
		$login->m_uid = "admin";
		$login->m_pwd = "admin";
		$login->m_rdn = "ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World";
		$this->assertTrue($login->fn_session());
	}
	
	function testLogin() {
		$login = new crc_login(false);
		
		//invalid data
		$post['username'] = "";
		$post['password'] = "";
		$post['context']  = "";
		$this->assertFalse($login->fn_login($post));
		$this->assertEqual($login->lasterrmsg, "Please enter a nonempty username and/or password");
		
		//valid data
		$post['username'] = "admin";
		$post['password'] = "admin";
		$post['context']  = "ou=Don Mills,ou=Toronto,ou=Ontario,ou=Canada,o=CRC World";
		session_id("test_freesms");
		$this->assertTrue($login->fn_login($post));
	}
}
?>
