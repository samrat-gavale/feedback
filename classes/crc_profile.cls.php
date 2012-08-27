<?php
	// Include the CRC Object class that needs to
	// extended by all classes. This is the super
	// class.
	include_once('crc_constants.mod.php');
	include_once('crc_object.cls.php');
	include_once('crc_mysql.cls.php');

	//******************************************
	// Name: crc_profile
	//******************************************
	//
	// Desc: The Profile Object
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

	class crc_profile extends crc_object {

		var $m_roleid;
		var $m_uid;
		var $m_pwd;
		var $m_email;
		var $m_rdn;
		var $m_name;
		var $m_lname;
		var $m_dob;
		var $m_gender;
		var $m_emp;
		var $m_emptitle;
		var $m_empcomp;
		var $m_add1;
		var $m_add2;
		var $m_city;
		var $m_prov;
		var $m_country;
		var $m_code;
		var $m_phland;
		var $m_phcell;
		var $m_phfax;
		var $m_active;
		var $m_sql;
		var $m_data;
		
		function crc_profile($debug) {
			//******************************************
			// Initialization by constructor
			//******************************************
			$this->classname = 'crc_profile';
			$this->classdescription = 'Handle user profile.';
			$this->classversion = '1.0.0';
			$this->classdate = 'March 10th, 2003';
			$this->classdevelopername = 'Shaffin Bhanji';
			$this->classdeveloperemail = 'shaffin_bhanji@hotmail.com';
			$this->_DEBUG = $debug;

			if ($this->_DEBUG) {
				echo "DEBUG {crc_profile::constructor}: The class \"crc_profile\" was successfuly created. <br>";
				echo "DEBUG {crc_profile::constructor}: Running in debug mode. <br>";
			}

		}

		function fn_getprofile($uid) {
			//******************************************
			// Get the users profile information
			//******************************************						
			if ($this->_DEBUG) {
				echo "DEBUG {crc_profile::fn_getprofile}: Retreiving the profile of uid: " . $uid . ". <br>";
			}

			$result = false;
			$this->m_data = null;			
			$db = new crc_mysql($this->_DEBUG);
			$dbhandle = $db->fn_connect();			
			if ($dbhandle != false) {

				$this->m_sql = 'select * ' . 
								'from ' . MYSQL_PROFILES_TBL . 
								' where (profile_uid = "' . $uid . '")';

				$resource = $db->fn_runsql(MYSQL_DB, $this->m_sql);
				if (mysql_num_rows($resource) > 0) {
					$this->m_data = mysql_fetch_array($resource);
				} else {					
					$this->lasterrnum = ERR_PROFILE_NOPROFILE_NUM;
					$this->lasterrmsg = ERR_PROFILE_NOPROFILE_DESC;
					if ($this->_DEBUG) {
						echo 'ERROR {crc_profile::fn_getprofile}: The sql command returned nothing. <br>';
						echo 'ERROR {crc_profile::fn_getprofile}: Error number: ' . $this->lasterrnum . '. <br>';
						echo 'ERROR {crc_profile::fn_getprofile}: Error description: ' . $this->lasterrmsg . '. <br>';
					}
				}
				$db->fn_freesql($resource);
				$db->fn_disconnect();
				
			} else {
				$this->lasterrmsg = mysql_error();
				$this->lasterrnum = mysql_errno();
				if ($this->_DEBUG) {
					echo 'ERROR {crc_profile::fn_setprofile}: ' . $this->lasterrmsg . '.<br>';
				}
			}
			return $this->m_data;
		}

		function fn_setprofile($post, $keepuid = false) {
			//******************************************
			// Update the users profile information
			//******************************************
			if ($this->_DEBUG && isset($post['username'])) {
				echo "DEBUG {crc_profile::fn_updateprofile}: Updating the profile for \"" . $post['username'] . "\". <br>";
			}
			
			//checking input
			if (!isset($post['profileid'], $post['username'], $post['password'], $post['email'],
				$post['name'], $post['year'], $post['month'], 
				$post['day'], $post['gender'], $post['enrollno'])) {
				$this->lasterrmsg = "Incomplete input";
				return false;		
			}
			if ($post['profileid'] == "") {
				$this->lasterrmsg = "Empty profile ID";
				return false;
			}
			if (($post['username'] == "") || ($post['password'] == "") ||
				($post['email'] == "") ||($post['name'] == "") || /*($post['enrollno'] == "") || */
				($post['year'] == "") || ($post['month'] == "") ||
				($post['day'] == "") || ($post['gender'] == "") ) {
					$this->lasterrmsg = "Input not valid.";
					return false;
			}			

			$result = false;
			$db = new crc_mysql($this->_DEBUG);
			$dbhandle = $db->fn_connect();
			if ($dbhandle != false) {
				//don't allow users with the same name
				$this->m_sql = 'select * ' . 
								'from ' . MYSQL_PROFILES_TBL . 
								' where (profile_uid = "' . $post['uid'] . '") or ' .
								'(profile_enrollno = "' . ucfirst($post['enrollno']) . '" and profile_role_id = "3")';

				$result = $db->fn_runsql(MYSQL_DB, $this->m_sql);
				if (mysql_num_rows($result) > 0) {
					while ($row = mysql_fetch_array($result)) {
						if ($row[0] != $post['profileid']) {
							$this->lasterrmsg = 'The user ' . $post['uid'] . ' or enrollment number '. ucfirst($post['enrollno']) . ' already exists in database. If you have already registered using this enrollment number, please contact the administrator. If not then use a different user name.';
							$db->fn_freesql($result);
							$db->fn_disconnect();
							return false;
						}						
					}
				}
				
/*				$this->m_sql = 'update ' . MYSQL_PROFILES_TBL .
								' SET profile_uid="' . $post['username'] . '", profile_pwd=SHA1("' . strtolower($post['password']) . '"), ' .
								'profile_firstname="' . ucfirst($post['name']) . '", profile_lastname="' . ucfirst($post['lname']) . '", ' .
								'profile_email="' . $post['email'] . '", profile_dob="' . $post['year'] . '-' . $post['month'] . '-' . $post['day'] . '", ' .
								'profile_gender="' . strtoupper($post['gender'][0]) . '", profile_address_one="' . $post['add1'] . '", ' .
								'profile_address_two="' . $post['add2'] . '", profile_city="' . $post['city'] . '", ' .
								'profile_province_state="' . strtoupper($post['province']) . '", profile_postal_code="' . strtoupper($post['pc']) . '", ' .
								'profile_country="' . ucfirst($post['country']) . '", profile_phone_land="' . $post['lcode'] . $post['lprefix'] . $post['lpostfix'] . '"' .
								' where (profile_id = ' . $post['profileid'] . ')';
*/
				$this->m_sql = 'update ' . MYSQL_PROFILES_TBL .
								' SET profile_uid="' . $post['username'] . '", profile_pwd=SHA1("' . strtolower($post['password']) . '"), ' .
								'profile_name="' . ucfirst($post['name']) . '", profile_enrollno="' . ucfirst($post['enrollno']) . '", ' .
								'profile_email="' . $post['email'] . '", profile_dob="' . $post['year'] . '-' . $post['month'] . '-' . $post['day'] . '", ' .
								'profile_gender="' . strtoupper($post['gender'][0]) . '" ' .
								' where (profile_id = ' . $post['profileid'] . ')';

//include('../mysql.php');

				$result = $db->fn_runsql(MYSQL_DB, $this->m_sql);
				if ($result) {
					if ($keepuid == false) {
						$_SESSION['uid'] = $post['username'];
					}
				} else {
					$this->lasterrnum = ERR_PROFILE_UPDATE_NUM;
					$this->lasterrmsg = ERR_PROFILE_UPDATE_DESC;
					if ($this->_DEBUG) {
						echo 'ERROR {crc_profile::fn_setprofile}: Could not update profile information for ' . $post['profileid'] . '<br>';
						echo 'ERROR {crc_profile::fn_setprofile}: Error number: ' . $this->lasterrnum . '. <br>';
						echo 'ERROR {crc_profile::fn_setprofile}: Error description: ' . $this->lasterrmsg . '. <br>';
					}					
				}
			} else {
				$this->lasterrnum = mysql_errno();
				$this->lasterrmsg = mysql_error();
				if ($this->_DEBUG) {
					echo 'ERROR {crc_profile::fn_setprofile}: ' . $this->lasterrmsg . '.<br>';
				}
			}
			$db->fn_disconnect();
			return $result;
		}
	}
?>
