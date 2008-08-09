<?php
/**
* ...
* @author Darknet
* Copy Rights (c) http://darkaif.googlecode.com
*/
function install_bot_chat(){
if (strlen(strstr($_SERVER['REQUEST_URI'], 'scripts')) > 1) {
	require('../config.php');
	#echo "[-scripts folder-]";
}else{
	require('scripts/config.php');
	#echo "[-localhost-]";
}
#==================================================================================================
# BOT CHAT
#==================================================================================================
{mysql_connect($host,$user,$pass ) or die(mysql_error());
mysql_select_db($database) or die(mysql_error());

$db_bot_category = $prefix."bot_category";
mysql_query("CREATE TABLE $db_bot_category(
 id INT NOT NULL AUTO_INCREMENT,
 PRIMARY KEY(id),
 botid TINYTEXT,
 pattern TEXT,
 category TEXT,
 topic TEXT,
 version TEXT,
 template TEXT,
 emotion TEXT)")
 or die(mysql_error());
echo "Table Created!";
}
}
#==================================================================================================
# CHAT LOG
#==================================================================================================
function install_bot_log(){// This deal with bot error for games and nongame functions or chat log
if (strlen(strstr($_SERVER['REQUEST_URI'], 'scripts')) > 1) {
	require('../config.php');
	#echo "[-scripts folder-]";
}else{
	require('scripts/config.php');
	#echo "[-localhost-]";
}
mysql_connect($host,$user,$pass) or die(mysql_error());
mysql_select_db($database) or die(mysql_error());

$db_bots_log = $prefix."bot_log";
mysql_query("CREATE TABLE $db_bots_log(
 id INT NOT NULL AUTO_INCREMENT,
 PRIMARY KEY(id),
 username TINYTEXT,
 room TEXT,
 chattype TINYTEXT,
 message TEXT,
 timestamp TINYTEXT)")
 or die(mysql_error());
echo "Table Created!";
}

?>