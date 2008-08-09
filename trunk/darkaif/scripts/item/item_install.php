<?php
/**
* ...
* @author Darknet
* Copy Rights (c) http://darkaif.googlecode.com
*/
//error_reporting(E_ALL ^ E_NOTICE);
function install_item(){
if (strlen(strstr($_SERVER['REQUEST_URI'], 'scripts')) > 1) {
	require('../config.php');
	#echo "[-scripts folder-]";
}else{
	require('scripts/config.php');
	#echo "[-localhost-]";
}

mysql_connect($host,$user,$pass) or die(mysql_error());
mysql_select_db($database) or die(mysql_error());
$db_ipaddress = $prefix."shopitem";
mysql_query("CREATE TABLE $db_ipaddress(
id INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY(id),
shopid TEXT,
shopname TEXT,
nameid TEXT,
name TEXT,
namehash TEXT,
description TEXT,
stock TEXT,
sotckmax TEXT,
buyprice TEXT,
sellprice TEXT,
sellable TEXT,
tradable TEXT,
stackable TEXT,
time TEXT, 
date TEXT
 )")
 or die(mysql_error());
echo "Table Created!";
}
?>