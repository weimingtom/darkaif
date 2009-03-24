<?php
function install_ipaddresscheck(){
#echo 'INSTALL..';
//This part help the code where the current local for the settings or config to get access to the database
/*
if (strlen(strstr($_SERVER['REQUEST_URI'], 'scripts')) > 1) {
	require('../config.php');
	#echo "[-scripts folder-]";
}else{
	require('scripts/config.php');
	#echo "[-localhost-]";
}
*/
include('config.php');
#echo "[-]";
#echo $config;

mysql_connect($host,$username,$password) or die(mysql_error());
mysql_select_db($database) or die(mysql_error());
$db_ipaddress = $prefix."ipaddressmonitor";
mysql_query("CREATE TABLE $db_ipaddress(
id INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY(id),
 ipaddress TINYTEXT,
 user_name TINYTEXT,
 access_level TINYTEXT,
 ban TINYTEXT,
 title TINYTEXT,
 description TEXT,
 reason TEXT,
 date TINYTEXT )")
 or die(mysql_error());
echo "Table Created!";
}
?>