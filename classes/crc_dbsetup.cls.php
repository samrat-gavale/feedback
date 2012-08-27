<?php
	// Include the CRC Object class that needs to
	// extended by all classes. This is the super
	// class.
	include_once('crc_constants.mod.php');
	include_once('crc_object.cls.php');
	include_once('crc_mysql.cls.php');

	//******************************************
	// Name: crc_dbsetup
	//******************************************
	//
	// Desc: Creates and initializes the FreeSMS database
	// Developer: Bogdan Cristea
	// Email: cristeab@gmail.com
	// Date: Oct 1st, 2010
	// Version: 1.0.0
	//
	// Copyright
	// =========
	// This code is copyright, use in part or
	// whole is prohibited without a written
	// concent to the developer.
	//******************************************

	class crc_dbsetup extends crc_object {

		var $m_sql;
		
		function crc_dbsetup($debug) {
			//******************************************
			// Initialization by constructor
			//******************************************
			$this->classname = 'crc_dbsetup';
			$this->classdescription = 'Creates and initializes the FreeSMS database.';
			$this->classversion = '1.0.0';
			$this->classdate = 'October 1st, 2010';
			$this->classdevelopername = 'Bogdan Cristea';
			$this->classdeveloperemail = 'cristeab@gmail.com';
			$this->_DEBUG = $debug;

			if ($this->_DEBUG) {
				echo "DEBUG {crc_dbsetup::constructor}: The class \"crc_dbsetup\" was successfuly created. <br>";
				echo "DEBUG {crc_dbsetup::constructor}: Running in debug mode. <br>";
			}

		}

		function fn_dbsetup($dbname, $rootpwd, $username, $userpwd) {
			//******************************************
			// Setup FreeSMS database
			//******************************************

			if ($this->_DEBUG) {
				echo "DEBUG {crc_dbsetup::fn_dbsetup}: Setting up FreeSMS database <br>";
			}

			if (($dbname == "") || ($rootpwd == "") || ($username == "") || ($userpwd == "")) {
				$this->lasterrmsg = "Invalid input";
				return false;
			}
			
			//create database
			$dbhandle = mysql_connect(MYSQL_SERVER, 'root', $rootpwd);
			if ($dbhandle != false) {
				$this->m_sql = 'create database ' . $dbname;				
				$resource = mysql_query($this->m_sql, $dbhandle);
				if (mysql_errno() != 0) {
					$errstring = mysql_error();//"database exists"
					if (strpos($errstring, "database exists") == false) {
						$this->lasterrmsg = 'An error occured when creating database';
						if ($this->_DEBUG)	{
							echo "DEBUG {crc_admin::fn_dbsetup}: " . $this->lasterrmsg . ".<br>";
						}
						mysql_close($dbhandle);						
						return false;						
					}
					if ($this->_DEBUG)	{
						echo "DEBUG {crc_admin::fn_dbsetup}: Database " . $dbname . " already exists.<br>";
					}			
				}
				
				//grand privileges
				$this->m_sql = 'grant all privileges on ' . $dbname . '.* to ' . $username . '@localhost identified by "' . $userpwd . '"';
				$resource = mysql_query($this->m_sql, $dbhandle);
				if (mysql_errno() != 0) {
					$this->lasterrmsg = mysql_error();
					if ($this->_DEBUG)	{
						echo "DEBUG {crc_admin::fn_dbsetup}: " . $this->lasterrmsg . "<br>";
					}					
					mysql_close($dbhandle);						
					return false;					
				}
				
				//setup tables
				$textfile= dirname(__FILE__) . '/../mysql/crc_database_setup.sql'; 
				$handle = fopen($textfile, "r");
				if ($handle == false) {
					$this->lasterrmsg = "Cannot open sql script file " . $textfile;
					if ($this->_DEBUG)	{
						echo "DEBUG {crc_admin::fn_dbsetup}: " . $this->lasterrmsg . "<br>";
					}
					mysql_close($dbhandle);						
					return false;					
				}
				$sqlscript = fread($handle, filesize($textfile));
				fclose($handle);
				if ($sqlscript == false) {
					$this->lasterrmsg = "Cannot read from sql script file " . $textfile;
					if ($this->_DEBUG)	{
						echo "DEBUG {crc_admin::fn_dbsetup}: " . $this->lasterrmsg . "<br>";
					}
					mysql_close($dbhandle);						
					return false;
				} 				
				
				if (mysql_select_db($dbname) == false) {
					$this->lasterrmsg = "Cannot select database";
					if ($this->_DEBUG)	{
						echo "DEBUG {crc_admin::fn_dbsetup}: " . $this->lasterrmsg . "<br>";
					}					
					mysql_close($dbhandle);						
					return false;					
				}
				
				//run sql script (no comments starting with '#' are allowed)
				//TODO search for '#' char
				$sqlArray = explode(';',$sqlscript);
				foreach ($sqlArray as $stmt) {
					$stmt = ltrim($stmt);					
  					if (strlen($stmt) > 0) {
    					$resource = mysql_query($stmt);
    					if (mysql_errno() != 0) {
    						$this->lasterrmsg = mysql_error();
      						if ($this->_DEBUG)	{
								echo "DEBUG {crc_admin::fn_dbsetup}: " . $this->lasterrmsg . "<br>";
							}					
							mysql_close($dbhandle);						
							return false;
    					}
  					}
				}				
								
			} else {
				$this->lasterrmsg = "Cannot connect to MySQL server as root";
				if ($this->_DEBUG) {					
					echo "DEBUG {crc_admin::fn_dbsetup}: " . $this->lasterrmsg . "<br>";					
				}
				return false;
			}
			mysql_close($dbhandle);
            if ($this->_DEBUG) {
                echo "DEBUG {crc_admin::fn_dbsetup}: end<br>";
            }
			return true;			
		}
		
	}
?>
