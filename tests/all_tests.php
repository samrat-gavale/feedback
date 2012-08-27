<?php
//require_once('show_passes.php');
//require_once('simpletest/simpletest.php');
//SimpleTest::prefer(new ShowPasses());

require_once('simpletest/autorun.php');
require_once('simpletest/web_tester.php');

class AllTests extends TestSuite {
	function AllTests() {
		$this->TestSuite('All tests');
		
		//unit tests
		$this->addFile(dirname(__FILE__) . '/dbsetup_test.php');
		$this->addFile(dirname(__FILE__) . '/mysql_test.php');
		$this->addFile(dirname(__FILE__) . '/login_test.php');
		$this->addFile(dirname(__FILE__) . '/admin_test.php');
		$this->addFile(dirname(__FILE__) . '/courses_test.php');
		$this->addFile(dirname(__FILE__) . '/register_test.php');
		$this->addFile(dirname(__FILE__) . '/profile_test.php');
		$this->addFile(dirname(__FILE__) . '/evaluation_test.php');
		$this->addFile(dirname(__FILE__) . '/schedule_test.php');
		$this->addFile(dirname(__FILE__) . '/teacher_test.php');

		//integration tests
		$this->addFile(dirname(__FILE__) . '/web_test.php');
	}
}
?>
