<?php
/**
* ...
* @author Darknet
* Copy Rights (c) http://darkaif.googlecode.com
*/
require('../config.php');

$table = $prefix."members";

$username = $_GET['checkid'];
if (!$username){
//$username = 'Admin';
}

$linkID = mysql_connect($host,$user,$pass) or die("Could not connect to host.");
mysql_select_db($database, $linkID) or die("Could not find database.");
$query = "SELECT * FROM {$table} WHERE username='{$username}'"; 


$resultID = mysql_query($query, $linkID) or die("Data not found.");
//$rowID = mysql_fetch_array($resultID);
//echo $rowID['username'];
$countID = mysql_num_rows($resultID);
//echo $countID;
if ($countID > 0){
	$account = $username.' Exist!';
}else{
	$account = $username.'  ready to used!';
}
//$xml_output= '<member>';
//while ($rowID = mysql_fetch_array($resultID)){
//}
//echo $account;
//$xml_output .= $account;
//$xml_output.= '</member>';
//echo $xml_output;
echo $account;

?>