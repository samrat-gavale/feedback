<?php
require_once(dirname(__FILE__) . '/../classes/crc_mysql.cls.php');

class TestOfMySQLClass extends UnitTestCase {
	function testSetServerInfo() {
		$db = new crc_mysql(false);
		
		//invalid input
		$server = "";
		$port = "";
		$this->assertFalse($db->set_serverinfo($server, $port));
		$this->assertEqual($db->lasterrmsg, "Invalid input");
		
		//valid input
		$server = "localhost";
		$port = "3306";
		$this->assertTrue($db->set_serverinfo($server, $port));
		$this->assertEqual($db->m_mysqlserver, $server);
		$this->assertEqual($db->m_mysqlport, $port);
	}
	
	function testSetUserInfo() {
		$db = new crc_mysql(false);
		
		//invalid input
		$user = "";
		$pass = "";
		$this->assertFalse($db->set_userinfo($user, $pass));
		$this->assertEqual($db->lasterrmsg, "Invalid input");
		
		//valid input
		$user = "bogdan";
		$pass = "ewigkeit";
		$this->assertTrue($db->set_userinfo($user, $pass));
		$this->assertEqual($db->m_mysqlusername, $user);
		$this->assertEqual($db->m_mysqlpassword, $pass);
	}
	
	function testConnectDisconnect() {
		$db = new crc_mysql(false);
		
		//connection parameters are taken from constants file
		$this->assertNotNull($db->fn_connect());
		
		//disconnect
		$this->assertTrue($db->fn_disconnect());
		
		//second disconnect should fail
		$this->assertFalse($db->fn_disconnect());
	}
	
	function testRunSQL() {
		$db = new crc_mysql(false);		
		
		//attempt to run SQL command without connecting to db
		$sql = 'insert into ' . MYSQL_SESSIONS_TBL .
			   '(session_id, session_uid, session_pwd, session_dn) ' .
			   'values("2", "0", "a", "none")';
		$resource = $db->fn_runsql(MYSQL_DB, $sql);
		$this->assertNull($resource);
		$this->assertEqual($db->lasterrmsg, "Invalid MySQL handle");
		
		//connect to database
		$this->assertNotNull($db->fn_connect());
		
		//invalid insert
		$sql = 'insert into ' . MYSQL_SESSIONS_TBL .
			   '(session_id, session_uid, session_pwd, session_din) ' .
			   'values("2", "0", "a", "none")';
		$resource = $db->fn_runsql(MYSQL_DB, $sql);
		$this->assertNull($resource);
		$this->assertEqual($db->lasterrmsg, "Unknown column 'session_din' in 'field list'");
		
		//valid insert
		$sql = 'insert into ' . MYSQL_SESSIONS_TBL .
			   '(session_id, session_uid, session_pwd, session_dn) ' .
			   'values("2", "0", "a", "none")';
		$resource = $db->fn_runsql(MYSQL_DB, $sql);
		$this->assertNotNull($resource);
		
		//invalid update
		$sql = 'update ' . MYSQL_SESSIONS_TBL .
			   ' set session_uid = "1", session_pwd = "b", session_din = "something" ' .
			   'where(session_id = "2")';
		$resource = $db->fn_runsql(MYSQL_DB, $sql);
		$this->assertNull($resource);
		$this->assertEqual($db->lasterrmsg, "Unknown column 'session_din' in 'field list'");
		
		//valid update
		$sql = 'update ' . MYSQL_SESSIONS_TBL .
			   ' set session_uid = "1", session_pwd = "b", session_dn = "something" ' .
			   'where(session_id = "2")';
		$resource = $db->fn_runsql(MYSQL_DB, $sql);
		$this->assertNotNull($resource);
		
		//free invalid resource
		$this->assertFalse($db->fn_freesql($resource));
		$this->assertEqual($db->lasterrmsg, "Invalid resource");
		
		//invalid select
		$sql = 'select session_uid from ' . MYSQL_SESSIONS_TBL .
			   ' where (session_idi = "2")';
		$resource = $db->fn_runsql(MYSQL_DB, $sql);
		$this->assertNull($resource);
		$this->assertEqual($db->lasterrmsg, "Unknown column 'session_idi' in 'where clause'");
		
		//valid select
		$sql = 'select session_uid from ' . MYSQL_SESSIONS_TBL .
			   ' where (session_id = "2")';
		$resource = $db->fn_runsql(MYSQL_DB, $sql);
		$this->assertNotNull($resource);
		$row = mysql_fetch_row($resource);
		$this->assertEqual($row[0], "1");
		
		//free valid resource
		$this->assertTrue($db->fn_freesql($resource));
		
		//invalid delete
		$sql = 'delete from ' . MYSQL_SESSIONS_TBL .
			   ' where(session_idi = "2")';
		$resource = $db->fn_runsql(MYSQL_DB, $sql);
		$this->assertNull($resource);
		$this->assertEqual($db->lasterrmsg, "Unknown column 'session_idi' in 'where clause'");
		
		//valid delete
		$sql = 'delete from ' . MYSQL_SESSIONS_TBL .
			   ' where(session_id = "2")';
		$resource = $db->fn_runsql(MYSQL_DB, $sql);
		$this->assertNotNull($resource);

		//disconnect
		$this->assertTrue($db->fn_disconnect());
	}
}
?>
