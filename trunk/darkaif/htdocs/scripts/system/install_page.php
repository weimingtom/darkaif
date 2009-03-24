<?php
function install_page(){
/*
if (strlen(strstr($_SERVER['REQUEST_URI'], 'scripts')) > 1) {
	require('../config.php');
	#echo "[-scripts folder-]";
}else{
	require('scripts/config.php');
	#echo "[-localhost-]";
}
*/
require('config.php');
mysql_connect($host,$username,$password) or die(mysql_error());
mysql_select_db($database) or die(mysql_error());
$db_page = $prefix."page";
mysql_query("CREATE TABLE $db_page(
id INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY(id),
 userid TINYTEXT,
 username TEXT,
 title TEXT,
 name TEXT,
 prefix TEXT,
 type TEXT,
 category TEXT,
 label TEXT,
 link TEXT,
 level TEXT,
 header TEXT,
 body TEXT,
 footer TEXT,
 date TINYTEXT,
 hide TINYTEXT
)")
 or die(mysql_error());
 echo "Table Created!";
}
?>