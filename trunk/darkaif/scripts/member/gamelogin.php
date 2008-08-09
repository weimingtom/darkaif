<?php
/**
* ...
* @author Darknet
* Copy Rights (c) http://darkaif.googlecode.com
*/
//=================================================================================================
//DO NOT TOUCH
// VERSION 0.2
// need to build broswer detecter $_SERVER['HTTP_USER_AGENT']
//=================================================================================================
error_reporting(E_ALL ^ E_NOTICE);
require('../config.php');

$DB_gamelogin = $prefix."gamelogin";
$DB_Member = $prefix."members";

//stores the URLvariables into variables that php can use
$username = $_GET['username'];
$password = $_GET['password'];


if ($username == null ){
//this for test section
$username = 'Admin';
$password  = 'admin';
//echo $username.$usernamecase;
}
$usernamecase = strtolower($username);
$yourip = $_SERVER['REMOTE_ADDR'];
$datestamp =  date('Y-m-d-H-i-s');


$dbcnx = @mysql_connect($host, $user, $pass); // Connects to the database server
if (!$dbcnx) {
echo( "<P>Unable to connect to the database server at this time.</P>" );
exit();
}
if (! @mysql_select_db($database) ) { // Selects the database
echo( "<P>Unable to find database");
exit();
}


//search for member name and password
$query = "SELECT * FROM {$DB_Member} WHERE username='$usernamecase' AND password='$password'";
$resultID = mysql_query($query) or die();
$rowID = mysql_fetch_array($resultID);
//echo $rowID['id_encrypt'];
//IF ID Encrypt have member id exist execute code
if ($rowID['id_encrypt']){
	//echo 'hello1';
	//set member hash id here
	$memberhashid = $rowID['id_encrypt'];
	$membername = $rowID['username'];
	$datestamp =  date('YmdHis');
	$time =  date('His');
	$gameid = md5($gamename);
	$gamename = 'MMO';
	$gamehashid = md5($membername + date('His'));
	//echo $memberhashid;

	$QGI = "SELECT * FROM {$DB_gamelogin} WHERE MEMBERID='$memberhashid'";
	$resultGI = mysql_query($QGI) or die('ERROR!');
	$countID = mysql_num_rows($resultGI);
	//echo '('.$countID.')';
	//Check if this member exist in the account database
	if (!$countID){
		//echo 'The account exist!';
		//Create new id for the game id and name of the game
		$query="INSERT into {$DB_gamelogin} 
		(MEMBERID,GAMEID,GAMENAME,GAMEHASHID,DATEID,TIMEID)
		VALUES ('{$memberhashid}','{$gameid}','{$gamename}','{$gamehashid}','$datestamp','$time')";
		mysql_query($query) or die('ERROR!');
		echo $gamehashid;
	}else{
		//echo 'Check login again';
		$query="UPDATE {$DB_gamelogin} SET GAMEHASHID='$gamehashid' WHERE MEMBERID='$memberhashid'";
		//This will prevent from same game appatlcation when played.
		echo $gamehashid;
	}
}else{
	echo 'fail';
}

//id, 
//GAMEID, 
//GAMENAME, 
//GAMEHASHID, 
//MEMBERID, 
//BOTID, 
//BATTLE, 
//SERVERID, 
//SERVERNAME, 
//LOCATION, 
//THEME, 
//SETTINGS, 
//TIMEID, 
//DATEID
?> 