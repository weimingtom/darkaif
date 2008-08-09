<?php
/**
* ...
* @author Darknet
* Copy Rights (c) http://darkaif.googlecode.com
*/
//=================================================================================================
//DO NOT TOUCH
//=================================================================================================
require('../config.php');
// Connects to the database server
$dbcnx = @mysql_connect($host, $user, $pass);
if (!$dbcnx) {
echo( "<P>Unable to connect to the database server at this time.</P>" );
exit();
}

// Selects the database
if (! @mysql_select_db($database) ) {
echo( "<P>Unable to find database");
exit();
}

$db_test = $prefix."gamelogin"; //$db_database_prefix."members";
$query = "CREATE TABLE $db_test(
 id INT NOT NULL AUTO_INCREMENT,
 PRIMARY KEY(id),
 GAMEID TINYTEXT,
 GAMENAME TINYTEXT,
 GAMEHASHID TINYTEXT,
 MEMBERID TINYTEXT,
 BOTID TINYTEXT,
 BATTLE TINYTEXT,
 SERVERID TINYTEXT,
 SERVERNAME TINYTEXT,
 LOCATION TINYTEXT,
 THEME TINYTEXT,
 SETTINGS TINYTEXT,
 TIMEID TINYTEXT,
 DATEID TINYTEXT
 )";

//executes the command
mysql_query($query) or die("Data not written.");
echo("The data has been written to the table!");

/**
* ...
* @author Default
* @version 0.1
* 
* This will get game data for uiqie id
* ID 
* GAMEID
* MEMBERID
* BOTID
* BATTLEID
* SERVERID
* SERVERNAME
* GAMENAME
* lOCALTION
* SETTINGS
* THEME
* 
* TIME
* DATE
* 
*/
?>