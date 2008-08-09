<?php
/**
* ...
* @author Darknet
* Copy Rights (c) http://darkaif.googlecode.com
*/
//===============================================================================================//
//This update player position and load them into xml format
//===============================================================================================//

error_reporting(E_ALL ^ E_NOTICE);
require('../config.php');
header("Content-type: text/xml");

$objectfields =  $prefix."objectfields";

$one = $_GET['name'];
$two = $_GET['map'];
$three = $_GET['x'];
$four = $_GET['y'];
///$three = 'gh';

//if($three){
//echo 'HMM';
//}

if ($one == null){
$one = 'dark';
//$two = 'none';
//$three = 100;
//$four = 100;
//echo 'null';
}

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

//Search for player database
$query = "SELECT * FROM $objectfields WHERE name='$one'";
$sql = mysql_query($query) or die(mysql_error());
$count = mysql_num_rows($sql);
//echo $count;
if ($count){ //If Player exist update player position
if (($three)and($four)){ //If variable become null of the player positions do not update it
$query = "UPDATE {$objectfields} SET map='$two', x='$three', y='$four' WHERE name='$one'";
$sql = mysql_query($query) or die(mysql_error());
}

$query = "SELECT * FROM {$objectfields}";
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

}else{
//this is the command used to write the record into the MySQL database
$query="INSERT into {$objectfields} (name,map,x,y,showimage) VALUES ('{$one}','{$two}','{$three}','{$four}','true')";
//executes the command
mysql_query($query) or die("Data not written.");
echo("The data has been written to the table!");
}
?>