<?php
	// Include the CRC Object class that needs to
	// extended by all classes. This is the super
	// class.
	include_once('crc_constants.mod.php');
	include_once('crc_object.cls.php');
	include_once('crc_mysql.cls.php');

	//******************************************
	// Name: crc_register
	//******************************************
	//
	// Desc: The Register Object
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

	class crc_register extends crc_object {

		var $m_uid;
		var $m_pwd;
		var $m_email;
		var $m_enrollno;
		var $m_name;
		var $m_dob;
		var $m_gender;
		var $m_roleid;
		var $m_active;
		var $m_sql;
		var $m_data;
		
		function crc_register($debug) {
			//******************************************
			// Initialization by constructor
			//******************************************
			$this->classname = 'crc_register';
			$this->classdescription = 'Handle user registration.';
			$this->classversion = '1.0.0';
			$this->classdate = 'Oct 1, 2011';
			$this->classdevelopername = 'Information Management Group, IIT Mandi';
			$this->classdeveloperemail = '';

			$this->_DEBUG = $debug;
			if ($this->_DEBUG) {
				echo "DEBUG {crc_register::constructor}: The class \"crc_register\" was successfuly created. <br>";
				echo "DEBUG {crc_register::constructor}: Running in debug mode. <br>";
			}
			
		}

		function fn_getroleid($db, $role) {
			//******************************************
			// Get the users role_id
			//******************************************

			if ($this->_DEBUG) {
				echo "DEBUG {crc_register::fn_getroleid}: Retreiving the role id: " . $role . " for the profile. <br>";
			}

			if ($db->m_mysqlhandle != false) {

				$this->m_sql = 'select role_id from ' . 
														MYSQL_ROLES_TBL . 
												' where (role_name = "' . $role . '")';

				$resource = $db->fn_runsql(MYSQL_DB, $this->m_sql);
				if (mysql_num_rows($resource) > 0) {
					$row = mysql_fetch_row($resource);
					$this->m_roleid = $row[0];
				} else {
					$this->lasterrnum = ERR_PROFILE_NOROLE_NUM;
					$this->lasterrmsg = ERR_PROFILE_NOROLE_DESC;
					$this->m_roleid = 0;
					if ($this->_DEBUG) {
						echo 'ERROR {crc_register::fn_getroleid}: The sql command returned nothing. <br>';
						echo 'ERROR {crc_register::fn_getroleid}: Error number: ' . $this->lasterrnum . '. <br>';
						echo 'ERROR {crc_register::fn_getroleid}: Error description: ' . $this->lasterrmsg . '. <br>';
					}
				}
				return $this->m_roleid;
			} else {
				return 0;
			}
		}

		function fn_userexists($db, $username) {
			//******************************************
			// Check for username, if it already exists
			//******************************************
			$result = false;
				
			if ($this->_DEBUG) {
				echo 'DEBUG {crc_register::fn_userexists}: Checking to see if the username: ' .$username . ' already exists!. <br>';
			}

			$this->m_sql = 'select * from ' . MYSQL_PROFILES_TBL . ' where profile_uid = "' . $username .'"';
			$resource = $db->fn_runsql(MYSQL_DB, $this->m_sql);
			if (mysql_num_rows($resource) > 0) {
				$this->lasterrmsg = 'The username ' . $username . ' already exists. Please choose a different username or contact the admin if you need to modify this user.';					
				return true;
			}

			return $result;

		}
		
		function fn_register($post) {
			//******************************************
			// Register a new user
			//******************************************
			if ($this->_DEBUG) {
				echo 'DEBUG {crc_register::fn_register}: Registering user.<br>';
			}
			
			//checking post variables
			if (!isset($post['username'], $post['password'], $post['email'],
				$post['profile'], $post['email'], $post['enrollno'], 
				$post['name'], $post['year'], $post['month'], 
				$post['day'], $post['gender'])) {
				$this->lasterrmsg = "Incomplete input";
				return false;		
			}
			if (($post['username'] == "") || ($post['password'] == "") || ($post['email'] == "") ||
				($post['profile'] == "") || ($post['enrollno'] == "") ||
				($post['email'] == "") || ($post['name'] == "") ||
				($post['year'] == "") || ($post['month'] == "") ||
				($post['day'] == "") || ($post['gender'] == "")
				) {
					$this->lasterrmsg = "Invalid input";
					return false;
			}
			
			$result = false;
			$db = new crc_mysql($this->_DEBUG);
			$dbhandle = $db->fn_connect();
			if ($dbhandle != false) {

				if ($this->_DEBUG) {
					echo 'DEBUG {crc_register::fn_register}: Reading $post variables.<br>';
				}
				
				$this->m_uid = $post['username'];
				$this->m_pwd = strtolower($post['password']);
				$this->m_enrollno = strtolower($post['enrollno']);
				$this->m_email = strtolower($post['email']);
				$this->m_gender = strtoupper($post['gender'][0]);
				$this->m_dob = $post['year'] . '-' . $post['month'] . '-' . $post['day'];
				$this->m_name = ucfirst($post['name']);
				$this->m_roleid = $this->fn_getroleid($db, $post['profile']);
				if ($this->_DEBUG) {
					echo 'DEBUG {crc_register::fn_register}: Obtained role id: '. $this->m_roleid . ' <br>';
				}

				if ($this->fn_userexists($db, $this->m_uid) == false) {				

					$this->m_sql = 'insert into ' . MYSQL_PROFILES_TBL . '(' .
															'profile_uid, profile_pwd, profile_enrollno, profile_name, ' .
															'profile_email, profile_dob, profile_gender, ' .
															'profile_role_id) ' .
												'values("' . $this->m_uid . '",SHA1("' . $this->m_pwd . '"),"' . ucfirst($this->m_enrollno) . '","' . $this->m_name . '","' .
															 $this->m_email . '","' . $this->m_dob . '","' . $this->m_gender . '",' .
															 $this->m_roleid . ')';
					$result = $db->fn_runsql(MYSQL_DB, $this->m_sql);

					if ($result == false) {
						$this->lasterrnum = ERR_REGISTER_ADD_NUM;
						$this->lasterrmsg = ERR_REGISTER_ADD_DESC;
						if ($this->_DEBUG) {
							echo 'ERROR {crc_profile::fn_setprofile}: Could not register profile information. <br>';
							echo 'ERROR {crc_profile::fn_setprofile}: Error number: ' . $this->lasterrnum . '. <br>';
							echo 'ERROR {crc_profile::fn_setprofile}: Error description: ' . $this->lasterrmsg . '. <br>';
						}
					}				
				} else {				
					$this->lasterrnum = ERR_REGISTER_USEREXISTS_NUM;
					//lasterrmsg is provided by fn_userexists()
					if ($this->_DEBUG) {
						echo 'ERROR {crc_profile::fn_setprofile}: This user ' . $this->m_uid . ' already exists! <br>';
						echo 'ERROR {crc_profile::fn_setprofile}: Error number: ' . $this->lasterrnum . '.<br>';
						echo 'ERROR {crc_profile::fn_setprofile}: Error description: ' . $this->lasterrmsg . '.<br>';
					}							
				}				
				$db->fn_disconnect();				
			} else {
				$this->lasterrmsg = mysql_error();
				$this->lasterrnum = mysql_errno();
				if ($this->_DEBUG) {
					echo 'ERROR {crc_profile::fn_setprofile}: ' . $this->lasterrmsg . '.<br>';
				}
			}
			return $result;
		}
	}
?>
