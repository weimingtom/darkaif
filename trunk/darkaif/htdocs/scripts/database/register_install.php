<?php
/**
* ...
* @author Darknet
* Copy Rights (c) http://darkaif.googlecode.com
*/
//=================================================================================================
//DO NOT TOUCH

//=================================================================================================
//error_reporting(E_ALL ^ E_NOTICE);
require('../config.php');
////////////////// modify this information ///////////////////////
//$host = "";
//$user = "";
//$pass= "";
//$table = "";
//$database = ""; //insert the name of the table
///////////////////////////////////////////////////////////////////////

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

$db_test = "flashaccount"; //$db_database_prefix."members";
$query = "CREATE TABLE $db_test(
 id INT NOT NULL AUTO_INCREMENT,
 PRIMARY KEY(id),
 username TINYTEXT,
 password TINYTEXT
 )";

//executes the command
mysql_query($query) or die("Data not written.");
echo("The data has been written to the table!");
?>