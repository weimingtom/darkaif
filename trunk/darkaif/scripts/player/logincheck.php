<?php
/**
* ...
* @author Darknet
* Copy Rights (c) http://darkaif.googlecode.com
*/
//error_reporting(E_ALL ^ E_NOTICE);
header("Content-type: text/xml");
require('../config.php');

$mapfields =  $prefix."mapfields";
$DB_member =  $prefix."members";


$username = $_GET['username'];
$password = $_GET['password'];
if($username == null){
$username = 'admin';
$password = 'admin';
}
/*
echo '
<member>
	<username>admin</username>
	<gameid>0</gameid>
</member>
';
*/

// Connects to the database server
$dbcnx = @mysql_connect($host, $user, $pass);
if (!$dbcnx) {
//echo( "<P>Unable to connect to the database server at this time.</P>" );
exit();
}

// Selects the database
if (! @mysql_select_db($database) ) {
//echo( "<P>Unable to find database");
exit();
}

$query = "SELECT * FROM $DB_member WHERE username='$username' AND password='$password'";
$resultID = mysql_query($query) or die(mysql_error());

$xml_output= '<member>';
while ($rowID = mysql_fetch_array($resultID)){
	$xml_output .= '<access>1</access>';
	//$xml_output.= '<object>';
    $xml_output.= '<username>'.$rowID['name'].'</username>';
	$xml_output.= '<gameid>'.$rowID['id'].'</gameid>';
	//$xml_output.= '<x>'.$rowID['x'].'</x>';
	//$xml_output.= '<y>'.$rowID['y'].'</y>';
	//$xml_output.= '</object>';
}
$xml_output.= '</member>';
echo $xml_output;



?>