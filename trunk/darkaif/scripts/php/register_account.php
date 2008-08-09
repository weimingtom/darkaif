<?php
/**
* ...
* @author Darknet
* Copy Rights (c) http://darkaif.googlecode.com
*/
//=================================================================================================
//DO NOT TOUCH
// VErSION 0.2
//=================================================================================================
error_reporting(E_ALL ^ E_NOTICE);
require('../config.php');
$table = $prefix."members";

//stores the URLvariables into variables that php can use
$one = $_GET['username'];
$two = $_GET['password'];
$three = $_GET['email'];
$four = $_GET['gender'];
$five = $_GET['birthday'];

$yourip = $_SERVER['REMOTE_ADDR'];
$datestamp =  date('Y-m-d-H-i-s');

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

//this is the command used to write the record into the MySQL database
$query="
INSERT into {$table} (name,username,password,email,gender,birthday,ip_address,date_register,id_encrypt) 
VALUES ('{$one}','{$one}','{$two}','{$three}','{$four}','{$five}','{$yourip}','{$datestamp}','{$md_membername}')";

//executes the command
mysql_query($query) or die("Data not written.");
echo("The data has been written to the table!");
?> 