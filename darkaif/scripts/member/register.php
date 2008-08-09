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
$table = $prefix."members";

//stores the URLvariables into variables that php can use
$username = $_GET['username'];
$password = $_GET['password'];
$email = $_GET['email'];
$gender = $_GET['gender'];
$birthday = $_GET['birthday'];

if ($username == null ){
//this for test section
$username = 'AdminA';
$password  = 'admin';
$passwordv  = 'admin';
$email = 'email';
$emailv = 'email';
$gender = 'gender';
$birthday = 'birthday';
$usernamecase = strtolower($username);
//echo $username.$usernamecase;
}

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

if (($username != null)
and ($password == $passwordv)
and ($email == $emailv)
and ($gender != null )
and ($birthday != null )){
	//echo 'PASS!';
	$query = "SELECT * FROM {$table} WHERE username='$usernamecase'";
	$resultID = mysql_query($query) or die();
	$md_membername = md5($usernamecase);
	$countID = mysql_num_rows($resultID);
	//echo $countID;

	if(!$countID){// if username doesn't match add to the list
		//echo 'helo';
		$query = "INSERT into {$table} (name,username,password,email,gender,birthday,ip_address,date_register,id_encrypt,title,status) 
		VALUES ('{$username}','{$usernamecase}','{$password}','{$email}','{$gender}','{$birthday}','{$yourip}','{$datestamp}','{$md_membername}','Member','offline')";
		mysql_query($query) or die();
		echo '<register>complete</register><error>
				<log>none</log>
			</error>';
	}else{
		//echo 'FAIL';
		echo '<register>exist</register><error>
			<log>none</log>
		</error>';
	}
	//mysql_query($query) or die("Data not written.");
	//echo("The data has been written to the table!");
}

/*
//executes the command
mysql_query($query) or die("Data not written.");
echo("The data has been written to the table!");
*/
//echo $username.''.$_SERVER['HTTP_USER_AGENT'];
//echo $_SERVER['HTTP_USER_AGENT'];
/*
<register></register>
<error>
	<log></log>
</error>
<agent>$_SERVER['HTTP_USER_AGENT']</agent>

*/


?> 