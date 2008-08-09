<?php
/**
* ...
* @author Darknet
* Copy Rights (c) http://darkaif.googlecode.com
*/
//=================================================================================================
//DO NOT TOUCH
//=================================================================================================
//CONFIG
$host 		= "localhost"; 		//insert the name of your host here.  usually its localhost
$user 		= "as3"; 			//insert the name of the user here
$pass 		= "as3";  			//insert the password here
$table 		= "members"; 		//insert name of database wherein table was exported
$database 	= "flashcoreas"; 	//insert the name of the table
$prefix 	= "flashcoreas_";   //prefix incase there are other same name files.

$servername = 'core';
$serverid = md5($servername);
$config = 'Hello Config!';
$register = 2;  //Method of Registration: 0 = Disable 1 = Normal, 2 = Email Auth, 3 = Admin Auth

$sitename = 'Darkaif';
$siteurl = 'http:///darkaif/';
?>