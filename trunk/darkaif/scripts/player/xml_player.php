<?php
/**
* ...
* @author Darknet
* Copy Rights (c) http://darkaif.googlecode.com
*/
error_reporting(E_ALL ^ E_NOTICE);
require('../config.php');
header("Content-type: text/xml");
$objectfields =  $prefix."objectfields";

$one = $_GET['name'];

if ($one == null){
$one = 'dark';
$two = 'none';
$three = 100;
$four = 100;
//echo 'null';
}

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

$query = "SELECT * FROM $objectfields WHERE name='$one'";
$resultID = mysql_query($query) or die(mysql_error());

$xml_output= '<objectfields>';
while ($rowID = mysql_fetch_array($resultID)){
	$xml_output.= '<object>';
    $xml_output.= '<name>'.$rowID['name'].'</name>';
	$xml_output.= '<map>'.$rowID['map'].'</map>';
	$xml_output.= '<x>'.$rowID['x'].'</x>';
	$xml_output.= '<y>'.$rowID['y'].'</y>';
	$xml_output.= '</object>';
}
$xml_output.= '</objectfields>';
echo $xml_output;

?>