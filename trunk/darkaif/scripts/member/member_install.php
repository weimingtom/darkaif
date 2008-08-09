<?php
function install_member(){
if (strlen(strstr($_SERVER['REQUEST_URI'], 'scripts')) > 1) {
	require('../config.php');
	#echo "[-scripts folder-]";
}else{
	require('scripts/config.php');
	#echo "[-localhost-]";
}
mysql_connect($host,$user,$pass) or die(mysql_error());
mysql_select_db($database) or die(mysql_error());

$db_members = $prefix."members";
mysql_query("CREATE TABLE $db_members(
id INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY(id),
 id_encrypt TINYTEXT,
 session TINYTEXT,
 cookie TINYTEXT,
 status TINYTEXT,
 status_no INT DEFAULT '0',
 title TINYTEXT,
 firstname TINYTEXT,
 middlename TINYTEXT,
 lastname TINYTEXT,
 gender TINYTEXT,
 birthday TINYTEXT,
 name TINYTEXT,
 username TINYTEXT,
 password TINYTEXT,
 p_encrypt TINYTEXT,
 email TINYTEXT,
 hideemail INT DEFAULT 0,
 access_level INT DEFAULT 1,
 forum_access INT DEFAULT 1,
 credit_points INT DEFAULT 0,
 money_points INT DEFAULT 0,
 cash_points INT DEFAULT 0,
 fame INT DEFAULT 0,
 rank INT DEFAULT 0,
 is_activated INT DEFAULT 1,
 validation_code TINYTEXT,
 ip_address TINYTEXT,
 ban INT DEFAULT 0,
 date_register TINYTEXT)")
 or die(mysql_error());
echo "Table Created!";
}
?>