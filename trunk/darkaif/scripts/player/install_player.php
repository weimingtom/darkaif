<?php
/**
* ...
* @author Darknet
* Copy Rights (c) http://darkaif.googlecode.com
*/
//error_reporting(E_ALL ^ E_NOTICE);
require('../config.php');

mysql_connect($host,$user,$pass) or die(mysql_error());
mysql_select_db($database) or die(mysql_error());
$db_ipaddress = $prefix."objectfields";
mysql_query("CREATE TABLE $db_ipaddress(
id INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY(id),
 flashid TEXT,
 seasonid TINYTEXT,
 nameid TEXT,
 name TEXT,
 type TEXT,
 typeid TEXT,
 map TEXT,
 x TEXT,
 y TEXT,
 z TEXT,
 time TINYTEXT,
 expiretime TINYTEXT,
 showimage TINYTEXT )")
 or die(mysql_error());
echo "Table Created!";
?>