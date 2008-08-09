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
//header("Content-type: text");
$table = $prefix."members";
//echo $table;
////////////////////////////////////////////////////////
//$username = 'admin';
//$password = 'admin';
$username = $_GET['username'];
$password = $_GET['password'];

$linkID = mysql_connect($host,$user,$pass) or die("Could not connect to host.");
mysql_select_db($database, $linkID) or die("Could not find database.");
$query = "SELECT * FROM {$table} WHERE username='{$username}' AND password='{$password}'"; 
//$query = "SELECT * FROM {$table}";
$resultID = mysql_query($query, $linkID) or die("Data not found.");
//$rowID = mysql_fetch_array($resultID);
//echo $rowID['username'];
$countID = mysql_num_rows($resultID);
//echo $countID;
if ($countID > 0){
	$account = "pass";
}else{
	$account = "fail";
}
$xml_output= '<member>';
//while ($rowID = mysql_fetch_array($resultID)){
//}
//echo $account;
$xml_output .= $account;
$xml_output.= '</member>';
echo $xml_output;
?>