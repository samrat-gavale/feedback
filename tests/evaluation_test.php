<?php
require_once(dirname(__FILE__) . '/../classes/crc_evaluation.cls.php');

class TestOfEvaluationClass extends UnitTestCase {
	function testGetCategory() {
		$evaluation = new crc_evaluation(false);
		
		$db = new crc_mysql(false);
		$this->assertTrue($db->fn_connect());
		
		//invalid category
		$category = null;
		$this->assertFalse($evaluation->fn_getcategory($db, $category));
		$this->assertEqual($evaluation->lasterrmsg, "Invalid input");
		$category = "";
		$this->assertFalse($evaluation->fn_getcategory($db, $category));
		$this->assertEqual($evaluation->lasterrmsg, "Invalid input");
		
		//general category
		$category = "general";
		$questions = $evaluation->fn_getcategory($db, $category);
		$this->assertNotNull($questions);
		$this->assertTrue(mysql_num_rows($questions)>0);
		$this->assertTrue(mysql_free_result($questions));
		
		//objective category
		$category = "objective";
		$questions = $evaluation->fn_getcategory($db, $category);
		$this->assertNotNull($questions);
		$this->assertTrue(mysql_num_rows($questions)>0);
		$this->assertTrue(mysql_free_result($questions));
		
		//presentation category
		$category = "presentation";
		$questions = $evaluation->fn_getcategory($db, $category);
		$this->assertNotNull($questions);
		$this->assertTrue(mysql_num_rows($questions)>0);
		$this->assertTrue(mysql_free_result($questions));
		
		//comments category
		$category = "comments";
		$questions = $evaluation->fn_getcategory($db, $category);
		$this->assertNotNull($questions);
		$this->assertTrue(mysql_num_rows($questions)>0);
		$this->assertTrue(mysql_free_result($questions));
		
		//close db connection
		$db->fn_disconnect();
	}
	
	function testGetQuestions() {
		$evaluation = new crc_evaluation(false);
		
		$questions = $evaluation->fn_getquestions();
		$this->assertTrue(count($questions)>0);
	}
	
	function testSetQuestions() {
		$evaluation = new crc_evaluation(false);
		
		//invalid data
		$profileid = "1";
		$this->assertFalse($evaluation->fn_setquestions($profileid, null));
		$this->assertEqual($evaluation->lasterrmsg, "Invalid input");
		
		$this->assertFalse($evaluation->fn_setquestions($profileid, ""));
		$this->assertEqual($evaluation->lasterrmsg, "Invalid input");
		
		$data['schedule_id'] = "1";		
		$this->assertFalse($evaluation->fn_setquestions($profileid, $data));
		$this->assertEqual($evaluation->lasterrmsg, "Cannot update student schedule");		
	}
	
	function testGetQuestion() {
		$evaluation = new crc_evaluation(false);
		
		//open database
		$db = new crc_mysql(false);
		$this->assertTrue($db->fn_connect());
		
		//invalid input
		$this->assertNull($evaluation->fn_getquestion($db, null));
		
		//valid input
		$this->assertNotNull($evaluation->fn_getquestion($db, "1"));
		
		//close db connection
		$db->fn_disconnect();
	}
	
	function testGetProfileName() {
		$evaluation = new crc_evaluation(false);
		
		//open database
		$db = new crc_mysql(false);
		$this->assertTrue($db->fn_connect());
		
		//invalid input
		$this->assertNull($evaluation->fn_getprofilename($db, null));
		
		//valid input
		$this->assertNotNull($evaluation->fn_getprofilename($db, "1"));
		$this->assertEqual($evaluation->m_profilename, "Bhanji, Altaf");
		
		//close db connection
		$db->fn_disconnect();
	}
}
?>
