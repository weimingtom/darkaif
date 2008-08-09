<?php
/**
* ...
* @author Darknet
* Copy Rights (c) http://darkaif.googlecode.com
*/
//=================================================================================================
//DO NOT TOUCH
//=================================================================================================
error_reporting(E_ALL ^ E_NOTICE);
require('../config.php');

header("Content-type: text/xml");

echo '<?xml version="1.0" ?>
';
//header("Content-type: text");
$table = $prefix."members";
////////////////////////////////////////////////////////
$username = 'admin';
//$username = $_GET['username'];
//$password = $_GET['password'];

$linkID = mysql_connect($host,$user,$pass) or die("Could not connect to host.");
mysql_select_db($database, $linkID) or die("Could not find database.");
$query = "SELECT * FROM {$table} WHERE username='{$username}'"; 
$query = "SELECT * FROM {$table}";
$resultID = mysql_query($query, $linkID) or die("Data not found.");
$my_sqlData = $resultID;

$xml_output= '<member>';
while ($rowID = mysql_fetch_array($resultID)){
	$xml_output.= '<account>';
    $xml_output.= '<username>'.$rowID['username'].'</username>';
	$xml_output.= '<password>'.$rowID['password'].'</password>';
	$xml_output.= '</account>';
}
$xml_output.= '</member>';
echo $xml_output;
?>