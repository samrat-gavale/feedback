<?php
	//******************************************
	// Name: crc_object
	//******************************************
	//
	// Desc: The primary CRC Object
	// Developer: Free SMS team
	// Email: shaffin_bhanji@hotmail.com
	// Date: March 10th, 2003
	// Version: 1.0.0
	//
	// Copyright
	// =========
	// This code is copyright, use in part or
	// whole is prohibited without a written 
	// concent to the developer. 
	//******************************************
	
	class crc_object {

		// These are class specific information when extending this object
		var $classname;
		var $classdescription;
		var $classversion;
		var $classdate;
		var $classdevelopername;
		var $classdeveloperemail;
		
		var $lasterrnum;
		var $lasterrmsg;

		var $_DEBUG;
		
		function crc_object() {
			//******************************************
			// Initialization by constructor
			//******************************************
			$this->classname = '[NONE]';
			$this->classdescription = '[NONE]';
			$this->classversion = '[NONE]';
			$this->classdate = '[NONE]';
			$this->classdevelopername = '[NONE]';
			$this->classdeveloperemail = '[NONE]';
		}

		function get_style() {
			//******************************************
			// Return formated style 
			//******************************************

			$result = '<style type="text/css"><!--';
			$result .= 'body {background-color: #ffffff; color: #000000;}';
			$result .= 'body, td, th, h1, h2 {font-family: sans-serif;}';
			$result .= 'pre {margin: 0px; font-family: monospace;}';
			$result .= 'a:link {color: #000099; text-decoration: none;}';
			$result .= 'a:hover {text-decoration: underline;}';
			$result .= 'table {border-collapse: collapse;}';
			$result .= '.center {text-align: center;}';
			$result .= '.center table { margin-left: auto; margin-right: auto; text-align: left;}';
			$result .= '.center th { text-align: center; !important }';
			$result .= 'td, th { border: 1px solid #000000; font-size: 75%; vertical-align: baseline;}';
			$result .= 'h1 {font-size: 150%;}';
			$result .= 'h2 {font-size: 125%;}';
			$result .= '.p {text-align: left;}';
			$result .= '.e {background-color: #ccccff; font-weight: bold;}';
			$result .= '.h {background-color: #9999cc; font-weight: bold;}';
			$result .= '.v {background-color: #cccccc;}';
			$result .= '.err {background-color: #cccccc; font-weight: bold; color: #ff0000;}';
			$result .= 'i {color: #666666;}';
			$result .= 'img {float: right; border: 0px;}';
			$result .= 'hr {width: 600px; align: center; background-color: #cccccc; border: 0px; height: 1px;}';
			$result .= '//--></style>';

			return $result;
		}
		
		function get_appinfo() {
			//******************************************
			// Application Server Information
			//******************************************
			return phpinfo();
		}
		
		function set_classnameinfo($name) {
			//******************************************
			// Set the classname property
			//******************************************
			$this->classname = $name;
			
			return true;
		}
		
		function set_classdescriptioninfo($desc) {
			//******************************************
			// Set the classdescription property
			//******************************************
			$this->classdescription = $desc;
			
			return true;
		}
		
		function set_classversioninfo($ver) {
			//******************************************
			// Set the classversion property
			//******************************************
			$this->classversion = $ver;
			
			return true;
		}
		
		function set_classdateinfo($dt) {
			//******************************************
			// Set the classdate property
			//******************************************
			$this->classdate = $dt;
			
			return true;
		}
		
		function set_classdevelopernameinfo($devname) {
			//******************************************
			// Set the classdevelopername property
			//******************************************
			$this->classdevelopername = $devname;
			
			return true;
		}
		
		function set_classdeveloperemailinfo($email) {
			//******************************************
			// Set the classdeveloperemail property
			//******************************************
			$this->classdeveloperemail = $email;
			
			return true;
		}
		
		function get_classnameinfo() {
			//******************************************
			// Get the classname property
			//******************************************
			return $this->classname;
		}
		
		function get_classdescriptioninfo() {
			//******************************************
			// Get the classdescription property
			//******************************************
			return $this->classdescription;
		}
		
		function get_classversioninfo() {
			//******************************************
			// Get the classversion property
			//******************************************
			return $this->classversion;
		}
		
		function get_classdateinfo() {
			//******************************************
			// Get the classdate property
			//******************************************
			return $this->classdate;
		}
		
		function get_classdevelopernameinfo() {
			//******************************************
			// Get the classdevelopername property
			//******************************************
			return $this->classdevelopername;
		}
		
		function get_classdeveloperemailinfo() {
			//******************************************
			// Get the classdeveloperemail property
			//******************************************
			return $this->classdeveloperemail;
		}
		
		function get_classinfo() {
			//******************************************
			// Return formated information
			//******************************************
			
			$result = $this->get_style() . '<div class="center">';
			
			$result .= '<TABLE cellpadding="3" width="600"><TR><TD CLASS="h" COLSPAN="2">';
			$result .= '<H1>Class Information</H1></TD></TH><TR><TD CLASS="e">';
			$result .= 'Class Name: </TD><TD CLASS="v">' . $this->get_classnameinfo() . '</TD></TR><TR><TD CLASS="e">';
			$result .= 'Class Description: </TD><TD CLASS="v">' . $this->get_classdescriptioninfo() . '</TD></TR><TR><TD CLASS="e">';
			$result .= 'Class Version: </TD><TD CLASS="v">' . $this->get_classversioninfo() . '</TD></TR><TR><TD CLASS="e">';
			$result .= 'Create Date: </TD><TD CLASS="v">' . $this->get_classdateinfo() . '</TD></TR><TR><TD CLASS="e">';
			$result .= 'Developer Name: </TD><TD CLASS="v">' . $this->get_classdevelopernameinfo() . '</TD></TR><TR><TD CLASS="e">';
			$result .= 'Developer Email: </TD><TD CLASS="v">' . $this->get_classdeveloperemailinfo() . '</TD></TR>';
			$result .= '</TABLE></DIV><P />';
			
			return $result;
		}

	}
?>
