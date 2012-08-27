<?php

//the tests order in the web test case CANNOT be changed

include_once('setup_vars.php');

class TestOfWebPagesClass extends WebTestCase {

	var $m_refreshurl;
	
	function followMetaRefreshURL() {
		$browser = $this->getBrowser();
		$url = trim(strstr($browser->getContent(), "URL"));
		$temp = explode('"', substr($url, 4));
		$this->m_refreshurl = $temp[0];
		$this->get($this->m_refreshurl);
	}
	
	//only the first button is selected from the current page
	function clickOnButton($button_type) {
		
		switch ($button_type) {
			case 'Evaluate':
				$link = 'crc_handler.php?method=evaluation&func=get&course=00'; 
				break;
			case 'MarkPresent':
				$link = 'crc_handler.php?method=teacher&action=P&func=setpresent&scheduleid=00&day=19&month=11&year=2010';
				break;
			case 'MarkAbsent':
				$link = 'crc_handler.php?method=teacher&action=A&func=setpresent&scheduleid=00&day=19&month=11&year=2010';
				break;
			default:
				return false;
		}
		
		$browser = $this->getBrowser();
		$content = $browser->getContent();
		$url = strstr($content, 'javascript:window.location');
		$this->get(substr($url, strlen("javascript:window.location='"), strlen($link)));
		$this->followMetaRefreshURL();
		return true;
	} 
	
	function testDBSetup() {
		//load page
		$this->assertTrue($this->get(FRESMS_BASE_URL . '/mysql/setup.php'));
		$this->assertText('FreeSMS Database Setup System');
		$this->assertResponse(200);

		//test page fields
		$this->assertField('database', 'crcdb');
		$this->assertField('password', '');
		$this->assertField('username', '');
		$this->assertField('userpassword', '');
		$this->assertField('login', 'Create Database');
		
		//click submit button, fields are not initialized
		$this->assertTrue($this->click('Create Database'));
		$this->followMetaRefreshURL();
		$this->assertText('Invalid input');				
		
		//initialize fields
		$this->assertTrue($this->setField('password', MYSQL_ROOT_PASSWORD));
		$this->assertTrue($this->setField('username', USER_NAME));
		$this->assertTrue($this->setField('userpassword', USER_PASSWORD));
		
		//click submit
		$this->assertTrue($this->click('Create Database'));
		$this->followMetaRefreshURL();
		$this->assertText('The default FreeSMS username is "admin" with password "admin"');
	}
	
	function testLogin() {
		//load page
		$this->assertTrue($this->get(FRESMS_BASE_URL . '/pages/crc_login.php'));
		$this->assertText('FreeSMS Registration System');
		$this->assertResponse(200);
		
		//check fields and links
		$this->assertField('username', '');
		$this->assertField('password', '');		
		$this->assertField('login', 'login');
		$this->assertLink("register");
		
		//login with uninitialized fields
		$this->assertTrue($this->click('login'));
		$this->followMetaRefreshURL();
		$this->assertText('Please enter a nonempty username and/or password');
		
		//initialize fields
		$this->assertTrue($this->setField('username', 'admin'));
		$this->assertTrue($this->setField('password', 'admin'));
		
		//login
		$this->assertTrue($this->click('login'));
		$this->followMetaRefreshURL();
		$this->assertText('Welcome Firstname Lastname');		
		$this->assertLink("Add Course");
		$this->assertLink("Edit Course");
		$this->assertLink("Add Student");
		$this->assertLink("Edit Course");
		$this->assertLink("Schedule");
		$this->assertLink("Edit Profile");
		$this->assertLink("Help");
		$this->assertLink("Logout");
	}
	
	function testAdminAccount() {
		//login as admin
		$this->assertTrue($this->get(FRESMS_BASE_URL . '/pages/crc_login.php'));
		$this->assertTrue($this->setField('username', 'admin'));
		$this->assertTrue($this->setField('password', 'admin'));
		$this->assertTrue($this->click('login'));
		$this->followMetaRefreshURL();		
		$this->assertText('User: Firstname Lastname');
		$this->assertText('Userid: admin');
		$this->assertText('Role: Administrator');
		$this->assertText('Welcome Firstname Lastname');
		
		//check if "Add Course" link works
		$this->assertTrue($this->click('Add Course'));
		$this->followMetaRefreshURL();
		$this->assertText('Enter Course Information');
		
		//check if "Edit Course" link works
		$this->assertTrue($this->click('Edit Course'));
		$this->followMetaRefreshURL();
		$this->assertText('Edit Course Information');
		
		//check if "Add Student" link works
		$this->assertTrue($this->click('Add Student'));
		$this->followMetaRefreshURL();
		$this->assertText('Enter Student Information');
		
		//check if "Edit Student" link works
		$this->assertTrue($this->click('Edit Student'));
		$this->followMetaRefreshURL();
		$this->assertText('Edit Student Profile');
		
		//check if "Schedule" link works
		$this->assertTrue($this->click('Schedule'));
		$this->followMetaRefreshURL();
		$this->assertText('Firstname Lastname');
		$this->assertLink("administrator");
		$browser = $this->getBrowser();
		$this->assertTrue(in_array('http://mailto:admin@domain.com', $browser->getUrls()));
		
		//check if "Edit Profile" link works
		$this->assertTrue($this->click('Edit Profile'));
		$this->followMetaRefreshURL();
		$this->assertText('Edit User Profile');
		
		//check if "Help" link works
		$this->assertTrue($this->click('Help'));
		$this->followMetaRefreshURL();
		$this->assertText('Firstname Lastname');
		$this->assertLink("administrator");
		$browser = $this->getBrowser();
		$this->assertTrue(in_array('http://mailto:admin@domain.com', $browser->getUrls()));
		
		//check if "Logout" link works
		$this->assertTrue($this->click('Logout'));
		$this->followMetaRefreshURL();
		$this->assertText('FreeSMS Registration System');
	}
	
	function testRegisterTeacher() {
		//load register page from login page
		$this->assertTrue($this->get(FRESMS_BASE_URL . '/pages/crc_login.php'));
		$this->assertLink("register");
		$this->assertTrue($this->click('register'));
		$this->followMetaRefreshURL();
		
		//check fields
		$this->assertField('profile', 'Teacher');
		$this->assertField('username', '');
		$this->assertField('password', '');
		$this->assertField('fname', '');
		$this->assertField('lname', '');
		$this->assertField('email', '');
		$this->assertField('gender', 'Male');
		$this->assertField('day', '00');
		$this->assertField('month', '00');
		$this->assertField('year', '0000');
		$this->assertField('add1', '');
		$this->assertField('add2', '');
		$this->assertField('city', 'Toronto');
		$this->assertField('province', 'ON');
		$this->assertField('country', 'Canada');
		$this->assertField('pc', '');
		$this->assertField('lcode', '0040');
		$this->assertField('lprefix', '0000');
		$this->assertField('lpostfix', '000000');
		$this->assertField('register', 'Register');
		
		//register with uninitialized fields
		$this->assertTrue($this->click('Register'));
		$this->followMetaRefreshURL();
		$this->assertText('New User Registration');
		
		//initialize fields
		$this->assertTrue($this->setField('username', 'cristeab'));
		$this->assertTrue($this->setField('password', 'ewigkeit'));
		$this->assertTrue($this->setField('fname', 'Bogdan'));
		$this->assertTrue($this->setField('lname', 'Cristea'));
		$this->assertTrue($this->setField('email', 'cristeab@gmail.com'));
		$this->assertTrue($this->setField('gender', 'Male'));
		$this->assertTrue($this->setField('day', '19'));
		$this->assertTrue($this->setField('month', '11'));
		$this->assertTrue($this->setField('year', '1977'));
		$this->assertTrue($this->setField('add1', 'Campulung'));
		$this->assertTrue($this->setField('pc', '115100'));
		
		//register again
		$this->assertTrue($this->click('Register'));
		$this->followMetaRefreshURL();	
		
		//login with the new settings
		$this->assertField('username', 'cristeab');
		$this->assertTrue($this->setField('password', 'ewigkeit'));
		$this->assertTrue($this->click('login'));
		$this->followMetaRefreshURL();
		$this->assertText('Welcome Bogdan Cristea');
		
		//logout
		$this->assertTrue($this->click('Logout'));
		
		//register another teacher
		$this->assertTrue($this->get(FRESMS_BASE_URL . '/pages/crc_login.php'));
		$this->assertLink("register");
		$this->assertTrue($this->click('register'));
		$this->followMetaRefreshURL();
		$this->assertText('New User Registration');
		
		//initialize fields
		$this->assertTrue($this->setField('username', 'mihail'));
		$this->assertTrue($this->setField('password', ''));
		$this->assertTrue($this->setField('fname', 'Mihail'));
		$this->assertTrue($this->setField('lname', 'Cristea'));
		$this->assertTrue($this->setField('email', 'mihail@domain.com'));
		$this->assertTrue($this->setField('gender', 'Male'));
		$this->assertTrue($this->setField('day', '19'));
		$this->assertTrue($this->setField('month', '11'));
		$this->assertTrue($this->setField('year', '1977'));
		$this->assertTrue($this->setField('add1', 'Campulung'));
		$this->assertTrue($this->setField('pc', '115100'));
		
		//register
		$this->assertTrue($this->click('Register'));
		$this->followMetaRefreshURL();
		$this->assertText('Invalid input');
		
		//set password
		$this->assertTrue($this->setField('password', 'a'));
		//and register user
		$this->assertTrue($this->click('Register'));
		$this->followMetaRefreshURL();
		$this->assertText('FreeSMS Registration System');
		
		//register the same teacher
		$this->assertTrue($this->get(FRESMS_BASE_URL . '/pages/crc_login.php'));
		$this->assertLink("register");
		$this->assertTrue($this->click('register'));
		$this->followMetaRefreshURL();
		$this->assertText('New User Registration');
		
		//initialize fields
		$this->assertTrue($this->setField('username', 'mihail'));
		$this->assertTrue($this->setField('password', 'b'));
		$this->assertTrue($this->setField('fname', 'Mihail'));
		$this->assertTrue($this->setField('lname', 'Cristea'));
		$this->assertTrue($this->setField('email', 'mihail@domain.com'));
		$this->assertTrue($this->setField('gender', 'Male'));
		$this->assertTrue($this->setField('day', '19'));
		$this->assertTrue($this->setField('month', '11'));
		$this->assertTrue($this->setField('year', '1977'));
		$this->assertTrue($this->setField('add1', 'Campulung'));
		$this->assertTrue($this->setField('pc', '115100'));
		
		//register
		$this->assertTrue($this->click('Register'));
		$this->followMetaRefreshURL();
		$this->assertText('The username mihail already exists. Please choose a different username or contact the admin if you need to modify this user');
		
		//choose a different username
		$this->assertTrue($this->setField('username', 'mihailc'));
		$this->assertTrue($this->setField('password', 'b'));
		
		//register
		$this->assertTrue($this->click('Register'));
		$this->followMetaRefreshURL();
		$this->assertText('The user Mihail Cristea already exists. Please contact the admin if you need to modify this user');
	}

	function testTeacherAccount() {
		//wrong username
		$this->assertTrue($this->get(FRESMS_BASE_URL . '/pages/crc_login.php'));
		$this->assertTrue($this->setField('username', 'cristea'));
		$this->assertTrue($this->setField('password', 'ewigkeit'));
		$this->assertTrue($this->click('login'));
		$this->followMetaRefreshURL();
		$this->assertText('No such user exists! Re-enter a valid Username and/or Password or register yourself. ');
		
		//wrong password
		$this->assertTrue($this->setField('username', 'cristeab'));
		$this->assertTrue($this->setField('password', 'ewigkei'));
		$this->assertTrue($this->click('login'));
		$this->followMetaRefreshURL();
		$this->assertText('No such user exists! Re-enter a valid Username and/or Password or register yourself. ');
				
		//login registered teacher
		$this->assertTrue($this->setField('username', 'cristeab'));
		$this->assertTrue($this->setField('password', 'ewigkeit'));
		$this->assertTrue($this->click('login'));
		$this->followMetaRefreshURL();		
		$this->assertText('User: Bogdan Cristea');
		$this->assertText('Userid: cristeab');
		$this->assertText('Role: Teacher');
		$this->assertText('Welcome Bogdan Cristea');
		
		//check if "Schedule" link works
		$this->assertTrue($this->click('Schedule'));
		$this->followMetaRefreshURL();
		$this->assertText('Bogdan Cristea');
		$this->assertLink("administrator");
		$browser = $this->getBrowser();
		$this->assertTrue(in_array('http://mailto:admin@domain.com', $browser->getUrls()));
		
		//check if "Edit Profile" link works
		$this->assertTrue($this->click('Edit Profile'));
		$this->followMetaRefreshURL();
		$this->assertText('Edit User Profile');
		
		//check if "Help" link works
		$this->assertTrue($this->click('Help'));
		$this->followMetaRefreshURL();
		$this->assertText('Bogdan Cristea');
		$this->assertLink("administrator");
		$browser = $this->getBrowser();
		$this->assertTrue(in_array('http://mailto:admin@domain.com', $browser->getUrls()));
		
		//check if "Logout" link works
		$this->assertTrue($this->click('Logout'));		
		$this->followMetaRefreshURL();
		$this->assertText('FreeSMS Registration System');
	}
	
	function testRegisterStudent() {
		//load register page from login page
		$this->assertTrue($this->get(FRESMS_BASE_URL . '/pages/crc_login.php'));
		$this->assertLink("register");
		$this->assertTrue($this->click('register'));
		$this->followMetaRefreshURL();
		
		//check fields
		$this->assertField('profile', 'Teacher');
		$this->assertTrue($this->setField('profile', 'Student'));		
		$this->assertField('username', '');
		$this->assertField('password', '');
		$this->assertField('fname', '');
		$this->assertField('lname', '');
		$this->assertField('email', '');
		$this->assertField('gender', 'Male');
		$this->assertField('day', '00');
		$this->assertField('month', '00');
		$this->assertField('year', '0000');
		$this->assertField('add1', '');
		$this->assertField('add2', '');
		$this->assertField('city', 'Toronto');
		$this->assertField('province', 'ON');
		$this->assertField('country', 'Canada');
		$this->assertField('pc', '');
		$this->assertField('lcode', '0040');
		$this->assertField('lprefix', '0000');
		$this->assertField('lpostfix', '000000');
		$this->assertField('register', 'Register');
		
		//register with uninitialized fields
		$this->assertTrue($this->click('Register'));
		$this->followMetaRefreshURL();
		$this->assertText('New User Registration');
		
		//initialize fields		
		$this->assertTrue($this->setField('profile', 'Student'));
		$this->assertTrue($this->setField('username', 'gica'));
		$this->assertTrue($this->setField('password', 'a'));
		$this->assertTrue($this->setField('fname', 'Gheorghe'));
		$this->assertTrue($this->setField('lname', 'Hagi'));
		$this->assertTrue($this->setField('email', 'gica@domain.com'));
		$this->assertTrue($this->setField('gender', 'Male'));
		$this->assertTrue($this->setField('day', '19'));
		$this->assertTrue($this->setField('month', '11'));
		$this->assertTrue($this->setField('year', '1977'));
		$this->assertTrue($this->setField('add1', 'Campulung'));
		$this->assertTrue($this->setField('pc', '115100'));
		
		//register again
		$this->assertTrue($this->click('Register'));
		$this->followMetaRefreshURL();	
		
		//login with the new settings
		$this->assertField('username', 'gica');
		$this->assertTrue($this->setField('password', 'a'));
		$this->assertTrue($this->click('login'));
		$this->followMetaRefreshURL();
		$this->assertText('Welcome Gheorghe Hagi');		
	}
	
	function testStudentAccount() {
		//login registered student
		$this->assertTrue($this->get(FRESMS_BASE_URL . '/pages/crc_login.php'));
		$this->assertTrue($this->setField('username', 'gica'));
		$this->assertTrue($this->setField('password', 'a'));
		$this->assertTrue($this->click('login'));
		$this->followMetaRefreshURL();		
		$this->assertText('User: Gheorghe Hagi');
		$this->assertText('Userid: gica');
		$this->assertText('Role: Student');
		$this->assertText('Welcome Gheorghe Hagi');
		
		//check if "Courses" link works
		$this->assertTrue($this->click('Courses'));
		$this->followMetaRefreshURL();
		$this->assertText('Gheorghe Hagi');
		
		//check if "Edit Profile" link works
		$this->assertTrue($this->click('Edit Profile'));
		$this->followMetaRefreshURL();
		$this->assertText('Edit User Profile');
		
		//check if "Help" link works
		$this->assertTrue($this->click('Help'));
		$this->followMetaRefreshURL();
		$this->assertText('Gheorghe Hagi');
		$this->assertLink("administrator");
		$browser = $this->getBrowser();
		$this->assertTrue(in_array('http://mailto:admin@domain.com', $browser->getUrls()));
		
		//check if "Logout" link works
		$this->assertTrue($this->click('Logout'));		
		$this->followMetaRefreshURL();
		$this->assertText('FreeSMS Registration System');
	}

	function testAdminAddCourse() {
		$this->assertTrue($this->get(FRESMS_BASE_URL . '/pages/crc_login.php'));
		$this->assertTrue($this->setField('username', 'admin'));
		$this->assertTrue($this->setField('password', 'admin'));
		$this->assertTrue($this->click('login'));
		$this->followMetaRefreshURL();
		
		//"Add Course" menu
		$this->assertTrue($this->click('Add Course'));
		$this->followMetaRefreshURL();
		$this->assertText('Enter Course Information');
		
		//check fields
		$this->assertField('cname', '');
		$this->assertField('cdesc', '');
		$this->assertField('sday', '');
		$this->assertField('smonth', '');
		$this->assertField('syear', '');
		$this->assertField('eday', '');
		$this->assertField('emonth', '');
		$this->assertField('eyear', '');
		$this->assertField('daytime', '');
		$this->assertField('teacher0');
		$this->assertField('roomname', '');
		$this->assertField('Add', 'Add');
		
		//initialize fields
		$this->assertTrue($this->setField('cname', 'Digital Signal Processing'));
		$this->assertTrue($this->setField('cdesc', 'held at some university'));
		$this->assertTrue($this->setField('sday', '01'));
		$this->assertTrue($this->setField('smonth', '01'));
		$this->assertTrue($this->setField('syear', '2010'));
		$this->assertTrue($this->setField('eday', '01'));
		$this->assertTrue($this->setField('emonth', '03'));
		$this->assertTrue($this->setField('eyear', '2010'));
		$this->assertTrue($this->setField('daytime', 'Mo [09:00 - 11:00]'));
		$this->assertTrue($this->setField('roomname', 'NII2'));
		$this->assertTrue($this->setField('teacher0', 'on'));
		$this->assertTrue($this->setField('teacher2', 'on'));
		
		//add course
		$this->assertTrue($this->click('Add'));
		$this->followMetaRefreshURL();
		$this->assertText('Course successfully added');
		
		//add a second course without selecting a teacher
		$this->assertTrue($this->setField('cname', 'Numerical Algorithms'));
		$this->assertTrue($this->setField('cdesc', 'held at another university'));
		$this->assertTrue($this->setField('sday', '01'));
		$this->assertTrue($this->setField('smonth', '03'));
		$this->assertTrue($this->setField('syear', '2010'));
		$this->assertTrue($this->setField('eday', '01'));
		$this->assertTrue($this->setField('emonth', '06'));
		$this->assertTrue($this->setField('eyear', '2010'));
		$this->assertTrue($this->setField('daytime', 'Tu [09:00 - 11:00]'));
		$this->assertTrue($this->setField('roomname', 'NII1'));
		
		//add course
		$this->assertTrue($this->click('Add'));
		$this->followMetaRefreshURL();
		$this->assertText('No teacher has been selected');
		//select a teacher
		$this->assertTrue($this->setField('teacher1', 'on'));
		//and add again the course
		$this->assertTrue($this->click('Add'));
		$this->followMetaRefreshURL();
		$this->assertText('Enter Course Information');
		$this->assertField('cname', '');//should be an empty field
		
		//add a third course
		$this->assertTrue($this->setField('cname', 'C++ Programming'));
		$this->assertTrue($this->setField('cdesc', 'held at a third university'));
		$this->assertTrue($this->setField('sday', '01'));
		$this->assertTrue($this->setField('smonth', '06'));
		$this->assertTrue($this->setField('syear', '2010'));
		$this->assertTrue($this->setField('eday', '01'));
		$this->assertTrue($this->setField('emonth', '09'));
		$this->assertTrue($this->setField('eyear', '2010'));
		$this->assertTrue($this->setField('daytime', 'We [09:00 - 11:00]'));
		$this->assertTrue($this->setField('roomname', 'NII3'));
		$this->assertTrue($this->setField('teacher1', 'on'));
		
		//add course
		$this->assertTrue($this->click('Add'));
		$this->followMetaRefreshURL();
		$this->assertText('Course successfully added');
	}
	
	function testAdminEditCourse() {
		$this->assertTrue($this->get(FRESMS_BASE_URL . '/pages/crc_login.php'));
		$this->assertTrue($this->setField('username', 'admin'));
		$this->assertTrue($this->setField('password', 'admin'));
		$this->assertTrue($this->click('login'));
		$this->followMetaRefreshURL();		
		
		//"Edit Course" menu
		$this->assertTrue($this->click('Edit Course'));
		$this->followMetaRefreshURL();					
		$this->assertText('Edit Course Information');
		$this->assertLink("Digital Signal Processing");
		$this->assertLink('Numerical Algorithms');
		$this->assertLink('C++ Programming');
		
		//edit 'Numerical Algorithms' course
		$this->assertTrue($this->click('Numerical Algorithms'));
		$this->followMetaRefreshURL();					
		$this->assertText('Edit Course Information');
		$this->assertField('cname', 'Numerical Algorithms');
		
		//empty course field
		$this->assertTrue($this->setField('cname', ''));
		//update should fail with error message
		$this->assertTrue($this->click('Update'));		
		$this->followMetaRefreshURL();
		$this->assertText('Edit Course Information');
		$this->assertField('cname', 'Numerical Algorithms');
		
		//set the teacher
		$this->assertTrue($this->setField('teacher0', 'on'));		
		//and update course
		$this->assertTrue($this->click('Update'));		
		$this->followMetaRefreshURL();
		$this->followMetaRefreshURL();
		$this->assertText('"Numerical Algorithms" updated successfully!');		
	}
	
	function testAdminAddStudent() {
		$this->assertTrue($this->get(FRESMS_BASE_URL . '/pages/crc_login.php'));
		$this->assertTrue($this->setField('username', 'admin'));
		$this->assertTrue($this->setField('password', 'admin'));
		$this->assertTrue($this->click('login'));
		$this->followMetaRefreshURL();
		
		//"Add Student" menu
		$this->assertTrue($this->click('Add Student'));
		$this->followMetaRefreshURL();
		$this->assertText('Enter Student Information');
		
		//check fields
		$this->assertField('fname', '');
		$this->assertField('lname', '');
		$this->assertField('gender', 'Male');
		$this->assertField('email', '');
		$this->assertField('lname', '');
		$this->assertField('lcode', '0040');
		$this->assertField('lprefix', '0000');
		$this->assertField('lpostfix', '000000');
        $this->assertText("C++ Programming");//course 0
		$this->assertText("Digital Signal Processing");//course 1
		$this->assertText("Numerical Algorithms");//course 2	
		
		//initialize fields
		$this->assertTrue($this->setField('fname', 'Marius'));
		$this->assertTrue($this->setField('lname', 'Lacatus'));
		$this->assertTrue($this->setField('course0', 'on'));
		
		//add student
		$this->assertTrue($this->click('Add'));
		$this->followMetaRefreshURL();
		$this->assertText('Student successfully added');
		
		//add a third student without selecting a course
		$this->assertTrue($this->setField('fname', 'Cristina'));
		$this->assertTrue($this->setField('lname', 'Rus'));
		$this->assertTrue($this->setField('gender', 'Female'));
		
		//add student
		$this->assertTrue($this->click('Add'));
		$this->followMetaRefreshURL();
		$this->assertText('No course has been selected');
		
		//select a course
		$this->assertTrue($this->setField('course1', 'on'));
		//and add again the student
		$this->assertTrue($this->click('Add'));
		$this->followMetaRefreshURL();
		$this->assertText('Student successfully added');
		$this->assertText('Enter Student Information');
		$this->assertField('fname', '');//should be an empty field
		$this->assertField('lname', '');
		
		//try to add a student already in database
		$this->assertTrue($this->setField('fname', 'Gheorghe'));
		$this->assertTrue($this->setField('lname', 'Hagi'));
		$this->assertTrue($this->click('Add'));
		$this->followMetaRefreshURL();
		$this->assertText('No course has been selected');
		$this->assertTrue($this->setField('course1', 'on'));
		$this->assertTrue($this->click('Add'));
		$this->followMetaRefreshURL();
		$this->assertText('User Gheorghe Hagi already exists in database.Use "Edit Student" menu if you want to modify this user.');		
	}
	
	function testAdminEditStudent() {
		$this->assertTrue($this->get(FRESMS_BASE_URL . '/pages/crc_login.php'));
		$this->assertTrue($this->setField('username', 'admin'));
		$this->assertTrue($this->setField('password', 'admin'));
		$this->assertTrue($this->click('login'));
		$this->followMetaRefreshURL();

		//check account information
		$this->assertText('User: Firstname Lastname');
		$this->assertText('Userid: admin');
		$this->assertText('Role: Administrator');
		
		//"Edit Course" menu
		$this->assertTrue($this->click('Edit Student'));
		$this->followMetaRefreshURL();					
		$this->assertText('Edit Student Profile');
		$this->assertLink("Hagi, Gheorghe");
		$this->assertLink("Lacatus, Marius");
		$this->assertLink("Rus, Cristina");
		
		//edit 'Hagi, Gheorghe' student
		$this->assertTrue($this->click('Hagi, Gheorghe'));
		$this->followMetaRefreshURL();					
		$this->assertText('Edit Student Profile');
		$this->assertField('fname', 'Gheorghe');
		$this->assertField('lname', 'Hagi');
		
		//update should fail without error message
		$this->assertTrue($this->click('Update'));		
		$this->followMetaRefreshURL();
		$this->assertText('Edit Student Profile');
		$this->assertField('fname', 'Gheorghe');
		$this->assertField('lname', 'Hagi');
		
		//account information should remain unchanged
		$this->assertText('User: Firstname Lastname');
		$this->assertText('Userid: admin');
		$this->assertText('Role: Administrator');
		
		//set password without selecting any course and update should succeed
		$this->assertTrue($this->setField('password', 'a'));
		$this->assertTrue($this->click('Update'));		
		$this->followMetaRefreshURL();
		$this->followMetaRefreshURL();
		$this->assertText('"Hagi, Gheorghe" updated successfully!');
		$this->assertText('Edit Student Profile');
		
		//account information should remain unchanged
		$this->assertText('User: Firstname Lastname');
		$this->assertText('Userid: admin');
		$this->assertText('Role: Administrator');
		
		//access the same student and select course
		$this->assertTrue($this->click('Hagi, Gheorghe'));
		$this->followMetaRefreshURL();					
		$this->assertText('Edit Student Profile');
		$this->assertTrue($this->setField('password', 'a'));
		$this->assertTrue($this->setField('course1', 'on'));
		$this->assertTrue($this->setField('course2', 'on'));
		$this->assertTrue($this->click('Update'));
		$this->followMetaRefreshURL();
		$this->followMetaRefreshURL();
		$this->assertText('"Hagi, Gheorghe" updated successfully!');
		
		//account information should remain unchanged
		$this->assertText('User: Firstname Lastname');
		$this->assertText('Userid: admin');
		$this->assertText('Role: Administrator');
	}
	
	function testAdminSchedule() {
		$this->assertTrue($this->get(FRESMS_BASE_URL . '/pages/crc_login.php'));
		$this->assertTrue($this->setField('username', 'admin'));
		$this->assertTrue($this->setField('password', 'admin'));
		$this->assertTrue($this->click('login'));
		$this->followMetaRefreshURL();
		
		//"Schedule" menu
		$this->assertTrue($this->click('Schedule'));
		$this->followMetaRefreshURL();					
		$this->assertText('These are your courses, if any');
		$this->assertLink("Digital Signal Processing");
		$this->assertLink("2");
		
		//click on course name
		$this->assertTrue($this->click("Digital Signal Processing"));
		$this->followMetaRefreshURL();
		$this->assertText("There are no statistics for this course");
		
		//click on students number
		$this->back();
		$this->back();
		$this->assertTrue($this->click("2"));
		$this->followMetaRefreshURL();
		$this->assertText("Here you will find the students registered for the course");
		$this->assertText("Digital Signal Processing");
		if (PHP_OS === 'WINNT') {
			$this->assertLink("Hagi, Gheorghe");
		} else {
        	$this->assertLink(html_entity_decode("Hagi,&nbsp;Gheorghe"));
        }
	    $this->assertLink("gica@domain.com");
	    if (PHP_OS === 'WINNT') {
	       	$this->assertLink("Rus, Cristina");
	    } else {
	        $this->assertLink(html_entity_decode("Rus,&nbsp;Cristina"));
	    }
	    if (PHP_OS === 'WINNT') {
	       	$this->assertTrue($this->click("Hagi, Gheorghe"));
	    } else {
			$this->assertTrue($this->click(html_entity_decode("Hagi,&nbsp;Gheorghe")));        
		}
		$this->followMetaRefreshURL();
		$this->assertText('Absent');
		//cannot check Mark Present/Absent button
	}
	
	function testAdminEditProfile() {
		$this->assertTrue($this->get(FRESMS_BASE_URL . '/pages/crc_login.php'));
		$this->assertTrue($this->setField('username', 'admin'));
		$this->assertTrue($this->setField('password', 'admin'));
		$this->assertTrue($this->click('login'));
		$this->followMetaRefreshURL();
		
		//"Edit Profile" menu
		$this->assertTrue($this->click('Edit Profile'));
		$this->followMetaRefreshURL();
		$this->assertText('Edit User Profile');
		
		//check fields	
		$this->assertField('username', 'admin');
		$this->assertField('password', '');
		$this->assertField('fname', 'Firstname');
		$this->assertField('lname', 'Lastname');
		$this->assertField('email', 'admin@domain.com');
		$this->assertField('gender', 'Male');
		$this->assertField('day', '19');
		$this->assertField('month', '11');
		$this->assertField('year', '1977');
		$this->assertField('add1', 'Campulung');
		$this->assertField('add2', '');
		$this->assertField('city', 'Campulung');
		$this->assertField('province', 'AG');
		$this->assertField('country', 'Romania');
		$this->assertField('pc', '115100');
		$this->assertField('lcode', '0040');
		$this->assertField('lprefix', '0000');
		$this->assertField('lpostfix', '000000');
		$this->assertField('update', 'Update');
		
		//update should fail without error message
		$this->assertTrue($this->click('Update'));
		$this->followMetaRefreshURL();
		
		//set fields, using an existing user name
		$this->assertTrue($this->setField('password', 'admin'));
		$this->assertTrue($this->setField('fname', 'Bogdan'));
		$this->assertTrue($this->setField('lname', 'Cristea'));		
		$this->assertTrue($this->click('Update'));
		$this->followMetaRefreshURL();
		$this->assertText('The user Bogdan Cristea already exists in database.');
		
		//set fields changing the user name
		$this->assertTrue($this->setField('password', 'admin'));
		$this->assertTrue($this->setField('fname', 'Bogdan Eugen'));
		$this->assertTrue($this->setField('lname', 'Cristea'));
		$this->assertTrue($this->setField('email', 'cristeab@gmail.com'));
		$this->assertTrue($this->click('Update'));
		$this->followMetaRefreshURL();
		$this->assertText('Profile updated successfully!');
	}
	
	function testAdminHelp() {
		$this->assertTrue($this->get(FRESMS_BASE_URL . '/pages/crc_login.php'));
		$this->assertTrue($this->setField('username', 'admin'));
		$this->assertTrue($this->setField('password', 'admin'));
		$this->assertTrue($this->click('login'));
		$this->followMetaRefreshURL();
		
		//check admin name
		$this->assertText('User: Bogdan Eugen Cristea');
		$this->assertText('Userid: admin');
		$this->assertText('Role: Administrator');
		
		//"Help" menu
		$this->assertTrue($this->click('Help'));
		$this->followMetaRefreshURL();
		$this->assertText('Bogdan Eugen Cristea,');
		$this->assertLink("administrator");
		$browser = $this->getBrowser();
		$this->assertTrue(in_array('http://mailto:cristeab@gmail.com', $browser->getUrls()));
	}
	
	function testAdminLogout() {
		$this->assertTrue($this->get(FRESMS_BASE_URL . '/pages/crc_login.php'));
		$this->assertTrue($this->setField('username', 'admin'));
		$this->assertTrue($this->setField('password', 'admin'));
		$this->assertTrue($this->click('login'));
		$this->followMetaRefreshURL();
		
		//"Logout" menu
		$this->assertTrue($this->click('Logout'));
		$this->followMetaRefreshURL();
		$this->assertText('FreeSMS Registration System');
	}
	
	function testTeacherSchedule() {
		$this->assertTrue($this->get(FRESMS_BASE_URL . '/pages/crc_login.php'));
		$this->assertTrue($this->setField('username', 'cristeab'));
		$this->assertTrue($this->setField('password', 'ewigkeit'));
		$this->assertTrue($this->click('login'));
		$this->followMetaRefreshURL();
		
		//"Schedule" menu
		$this->assertTrue($this->click('Schedule'));
		$this->followMetaRefreshURL();
		$this->assertText('These are your courses, if any.');
		$this->assertLink('Digital Signal Processing');
		$this->assertLink('Numerical Algorithms');
		$this->assertLink('2');
		$this->assertLink('1');
		
		//check student for "Numerical Algorithms" course
		$this->assertTrue($this->click('1'));
		$this->followMetaRefreshURL();
		if (PHP_OS === 'WINNT') {
			$this->assertLink("Hagi, Gheorghe");
		} else {
			$this->assertLink(html_entity_decode("Hagi,&nbsp;Gheorghe"));
		}
		$this->assertText('Absent');
		//simulate toggle on 'MarkPresent'/'MarkAbsent' buttons
		$this->assertTrue($this->clickOnButton('MarkPresent'));
		$this->assertText('Present');
		$this->assertTrue($this->clickOnButton('MarkAbsent'));
		$this->assertText('Absent');
		$this->assertTrue($this->clickOnButton('MarkPresent'));
		$this->assertText('Present');
		
		
		//check the page for "Lacatus, Marius"
		if (PHP_OS === 'WINNT') {
			$this->assertTrue($this->click("Hagi, Gheorghe"));
		} else {
			$this->assertTrue($this->click(html_entity_decode("Hagi,&nbsp;Gheorghe")));
		}
		$this->followMetaRefreshURL();
		$this->assertText('This page has the attendance for student Hagi, Gheorghe');
		$this->assertLink('Numerical Algorithms');
		$this->assertText('Present');
		$this->assertTrue($this->click('Numerical Algorithms'));
		$this->followMetaRefreshURL();
		if (PHP_OS === 'WINNT') {
			$this->assertLink("Hagi, Gheorghe");
		} else {
			$this->assertLink(html_entity_decode("Hagi,&nbsp;Gheorghe"));
		}
		$this->assertText('Present');
		
		//check student for "Digital Signal Processing"
		$this->assertTrue($this->click('Schedule'));
		$this->followMetaRefreshURL();
		$this->assertTrue($this->click('2'));
		$this->followMetaRefreshURL();
		if (PHP_OS === 'WINNT') {
			$this->assertLink("Hagi, Gheorghe");
		} else {
			$this->assertLink(html_entity_decode("Hagi,&nbsp;Gheorghe"));
		}
		if (PHP_OS === 'WINNT') {
			$this->assertLink("Rus, Cristina");
		} else {
			$this->assertLink(html_entity_decode("Rus,&nbsp;Cristina"));
		}
		$this->assertText('Absent');
		
		//mark 'Hagi, Gheorghe' as present
		$this->assertTrue($this->clickOnButton('MarkPresent'));
		$this->assertText('Present');
		
		//check the page for 'Rus, Cristina'
		if (PHP_OS === 'WINNT') {
			$this->assertTrue($this->click("Rus, Cristina"));
		} else {
			$this->assertTrue($this->click(html_entity_decode("Rus,&nbsp;Cristina")));
		}
		$this->followMetaRefreshURL();
		$this->assertText('This page has the attendance for student Rus, Cristina');
		$this->assertLink('Digital Signal Processing');
		$this->assertTrue($this->click('Digital Signal Processing'));
		$this->followMetaRefreshURL();
		if (PHP_OS === 'WINNT') {
			$this->assertLink("Rus, Cristina");
		} else {
			$this->assertLink(html_entity_decode("Rus,&nbsp;Cristina"));
		}
	}
	
	function testTeacherProfile() {
		$this->assertTrue($this->get(FRESMS_BASE_URL . '/pages/crc_login.php'));
		$this->assertTrue($this->setField('username', 'cristeab'));
		$this->assertTrue($this->setField('password', 'ewigkeit'));
		$this->assertTrue($this->click('login'));
		$this->followMetaRefreshURL();
		
		//"Profile" menu
		$this->assertTrue($this->click('Edit Profile'));
		$this->followMetaRefreshURL();
		$this->assertText('Edit User Profile');
		
		//check fields	
		$this->assertField('username', 'cristeab');
		$this->assertField('password', '');
		$this->assertField('fname', 'Bogdan');
		$this->assertField('lname', 'Cristea');
		$this->assertField('email', 'cristeab@gmail.com');
		$this->assertField('gender', 'Male');
		$this->assertField('day', '19');
		$this->assertField('month', '11');
		$this->assertField('year', '1977');
		$this->assertField('add1', 'Campulung');
		$this->assertField('add2', '');
		$this->assertField('city', 'Toronto');
		$this->assertField('province', 'ON');
		$this->assertField('country', 'Canada');
		$this->assertField('pc', '115100');
		$this->assertField('lcode', '0040');
		$this->assertField('lprefix', '0000');
		$this->assertField('lpostfix', '000000');
		$this->assertField('update', 'Update');
		
		//update should fail without error message
		$this->assertTrue($this->click('Update'));
		$this->followMetaRefreshURL();
		
		//set password and update again
		$this->assertTrue($this->setField('password', 'a'));
		$this->assertTrue($this->click('Update'));
		$this->followMetaRefreshURL();
		$this->assertText('Profile updated successfully!');
	}
	
	function testTeacherHelp() {
		$this->assertTrue($this->get(FRESMS_BASE_URL . '/pages/crc_login.php'));
		$this->assertTrue($this->setField('username', 'cristeab'));
		$this->assertTrue($this->setField('password', 'a'));
		$this->assertTrue($this->click('login'));
		$this->followMetaRefreshURL();
		
		//"Help" menu
		$this->assertTrue($this->click('Help'));
		$this->followMetaRefreshURL();
		$this->assertText('Bogdan Cristea,');
		$browser = $this->getBrowser();
		$this->assertTrue(in_array('http://mailto:cristeab@gmail.com', $browser->getUrls()));
	}
	
	function testTeacherLogout() {
		$this->assertTrue($this->get(FRESMS_BASE_URL . '/pages/crc_login.php'));
		$this->assertTrue($this->setField('username', 'cristeab'));
		$this->assertTrue($this->setField('password', 'a'));
		$this->assertTrue($this->click('login'));
		$this->followMetaRefreshURL();
		
		//"Logout" menu
		$this->assertTrue($this->click('Logout'));
		$this->followMetaRefreshURL();
		$this->assertText('FreeSMS Registration System');
	}
	
	function testStudentCourses() {
		$this->assertTrue($this->get(FRESMS_BASE_URL . '/pages/crc_login.php'));
		$this->assertTrue($this->setField('username', 'gica'));
		$this->assertTrue($this->setField('password', 'a'));
		$this->assertTrue($this->click('login'));
		$this->followMetaRefreshURL();
		
		//"Courses" menu
		$this->assertTrue($this->click('Courses'));
		$this->followMetaRefreshURL();
		$this->assertText('Gheorghe Hagi,');
		$this->assertText('These are the courses that you have registered for, if any.');
		$this->assertText('Digital Signal Processing');
		$this->assertText('Numerical Algorithms');
		
		//"Evaluate" course (quick hack since a button cannot be clicked)		
		$this->clickOnButton('Evaluate');
		$this->assertText('Welcome Gheorghe Hagi,');
		$this->assertText('Please note that once you submit your feedback you cannot change your answers or reevaluate this course.');
		$this->assertTrue($this->click('Submit'));
		$this->followMetaRefreshURL();
		$this->assertText('Thank you! You feedback is important to us and will be communicated accordingly.');
	}
    
    function testStudentEnrollment() {
		$this->assertTrue($this->get(FRESMS_BASE_URL . '/pages/crc_login.php'));
		$this->assertTrue($this->setField('username', 'gica'));
		$this->assertTrue($this->setField('password', 'a'));
		$this->assertTrue($this->click('login'));
		$this->followMetaRefreshURL();
        
        //"Enrollment" menu
		$this->assertTrue($this->click('Enrollment'));
		$this->followMetaRefreshURL();
		$this->assertText('Gheorghe Hagi,');
		$this->assertText('These are all available courses, if any.');
        $this->assertText('C++ Programming');
		$this->assertText('Digital Signal Processing');
		$this->assertText('Numerical Algorithms');
        $this->assertTrue($this->setField('course0', 'on'));
        $this->assertFalse($this->setField('course1', 'off'));//check box should be disabled
        $this->assertFalse($this->setField('course2', 'off'));
        
        //push enroll button
        $this->assertTrue($this->click('Enroll'));
		$this->followMetaRefreshURL();
        $this->followMetaRefreshURL();
        
		$this->assertText('Gheorghe Hagi,');
		$this->assertText('These are all available courses, if any.');
        $this->assertFalse($this->setField('course0', 'off'));//check box is now disabled        
    }
	
	function testStudentProfile() {
		$this->assertTrue($this->get(FRESMS_BASE_URL . '/pages/crc_login.php'));
		$this->assertTrue($this->setField('username', 'gica'));
		$this->assertTrue($this->setField('password', 'a'));
		$this->assertTrue($this->click('login'));
		$this->followMetaRefreshURL();
		
		//"Profile" menu
		$this->assertTrue($this->click('Edit Profile'));
		$this->followMetaRefreshURL();
		$this->assertText('Edit User Profile');
		
		//check fields	
		$this->assertField('username', 'gica');
		$this->assertField('password', '');
		$this->assertField('fname', 'Gheorghe');
		$this->assertField('lname', 'Hagi');
		$this->assertField('email', 'gica@domain.com');
		$this->assertField('gender', 'Male');
		$this->assertField('day', '19');
		$this->assertField('month', '11');
		$this->assertField('year', '1977');
		$this->assertField('add1', 'Campulung');
		$this->assertField('add2', '');
		$this->assertField('city', 'Toronto');
		$this->assertField('province', 'ON');
		$this->assertField('country', 'Canada');
		$this->assertField('pc', '115100');
		$this->assertField('lcode', '0040');
		$this->assertField('lprefix', '0000');
		$this->assertField('lpostfix', '000000');
		$this->assertField('update', 'Update');
		
		//update should fail without error message
		$this->assertTrue($this->click('Update'));
		$this->followMetaRefreshURL();
		
		//set password and update again
		$this->assertTrue($this->setField('password', 'a'));
		$this->assertTrue($this->click('Update'));
		$this->followMetaRefreshURL();
		$this->assertText('Profile updated successfully!');
	}

	function testStudentHelp() {
		$this->assertTrue($this->get(FRESMS_BASE_URL . '/pages/crc_login.php'));
		$this->assertTrue($this->setField('username', 'gica'));
		$this->assertTrue($this->setField('password', 'a'));
		$this->assertTrue($this->click('login'));
		$this->followMetaRefreshURL();
		
		//"Help" menu
		$this->assertTrue($this->click('Help'));
		$this->followMetaRefreshURL();
		$this->assertText('Gheorghe Hagi,');
		$browser = $this->getBrowser();
		$this->assertTrue(in_array('http://mailto:cristeab@gmail.com', $browser->getUrls()));
	}
	
	function testStudentLogout() {
		$this->assertTrue($this->get(FRESMS_BASE_URL . '/pages/crc_login.php'));
		$this->assertTrue($this->setField('username', 'gica'));
		$this->assertTrue($this->setField('password', 'a'));
		$this->assertTrue($this->click('login'));
		$this->followMetaRefreshURL();

		//"Logout" menu
		$this->assertTrue($this->click('Logout'));
		$this->followMetaRefreshURL();
		$this->assertText('FreeSMS Registration System');
	}	
}
?>
