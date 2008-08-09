<?php
/**
* ...
* @author Darknet
* Copy Rights (c) http://darkaif.googlecode.com
*/
require('../config.php');

mysql_connect($host,$user,$pass) or die(mysql_error());
mysql_select_db($database) or die(mysql_error());
$db_shopitem = $prefix."shopitem";
header("Content-type: text/xml");
/*
if (!isset($_POST['submit'])){
}else{
echo 'HELOE';
$itemname = $_POST['itemname'];
$itemid = md5($itemname);
$itemnamehash = md5($itemname);
$shopname = $_POST['shopname'];
$shopid = md5($shopname);
$itembuy = $_POST['buyprice'];
$itemsell = $_POST['sellprice'];
$datestamp =  date('YmdHis');
$timestamp =  date('His');
$query = "INSERT into {$db_shopitem} (shopid,shopname,nameid,name,namehash,buyprice,sellprice,time,date) 
VALUES ('$shopid','$shopname','$itemid','$itemname','$itemnamehash','$itembuy','$itemsell','$timestamp','$datestamp')";
mysql_query($query) or die(mysql_error());
}
*/

$query = "SELECT * FROM $db_shopitem";
$resultID = mysql_query($query) or die(mysql_error());

$xml_output= '<shopitem>';
while ($rowID = mysql_fetch_array($resultID)){
	$xml_output.= '<item>';
    $xml_output.= '<shopname>'.$rowID['shopname'].' </shopname>';
	$xml_output.= '<itemname> '.$rowID['name'].' </itemname>';
	$xml_output.= '<buyprice> '.$rowID['buyprice'].' </buyprice>';
	$xml_output.= '<sellprice> '.$rowID['sellprice'].' </sellprice>';
	$xml_output.= '</item>';
}
$xml_output.= '</shopitem>';
echo $xml_output;
?>