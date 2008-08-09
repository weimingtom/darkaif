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
$db_mapfields = $prefix."mapfields";
mysql_query("CREATE TABLE $db_mapfields(
id INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY(id),
 maphash TINYTEXT,
 mapid TEXT,
 name TEXT,
 mapdata TEXT,
 memberid TINYTEXT,
 access TINYTEXT,
 date TINYTEXT,
 dateedit TINYTEXT,
 locked TINYTEXT,
 keylocked TINYTEXT
 )")
 or die(mysql_error());
echo "Table Created!";
?>