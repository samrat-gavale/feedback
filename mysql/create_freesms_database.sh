#!/bin/bash

# This script is used to initialize an empty MySQL database suitable to be used by FreeSMS
# The mysql script file, 'crc_database_setup.sql', should be located in the same folder as this script
# The default admin user name is 'admin' with password 'admin'

DB_NAME=crcdb
E_SUCCESS=0
E_FAILURE=1

read -s -p "Password for root user of MySQL server: " MYSQL_PWD
echo

echo -n "Creating database $DB_NAME"
mysql -u root --password=$MYSQL_PWD -e "create database $DB_NAME"
if [ $? -eq $E_SUCCESS ]
then
  echo -e "\tdone"
else
  echo "Using existing database ..."
fi

echo "Granting all privileges on $DB_NAME ..."
echo "!!! Make sure that the user name and password match those found in crc_constants.mod.php !!!"
read -p "User name: " USER_NAME
read -s -p "User password: " USER_PWD
echo
read -s -p "Confirm user password: " PWD_CONFIRM
echo
if [ $USER_PWD != $PWD_CONFIRM ] 
then
  echo "Passwords don't match"
  exit $E_FAILURE
fi

mysql -u root --password=$MYSQL_PWD -e "grant all privileges on $DB_NAME.* to $USER_NAME@localhost identified by '$USER_PWD'"
if [ $? -ne $E_SUCCESS ]
then
  exit $E_FAILURE
fi

echo -n "Creating tables inside database $DB_NAME"
mysql -u $USER_NAME --password=$USER_PWD -D $DB_NAME < crc_database_setup.sql
if [ $? -eq $E_SUCCESS ]
then
  echo -e "\tdone"
else
  exit $E_FAILURE
fi

echo -e "\n\t*********************************************************************************************"
echo -e "\t* The default FreeSMS username is 'admin' with password 'admin'                             *"
echo -e "\t* Please change the default values once logged in from 'Edit profile' menu                  *"
echo -e "\t* Make sure that the MySQL username and password match those found in crc_constants.mod.php *"
echo -e "\t*********************************************************************************************\n"

exit $E_SUCCESS