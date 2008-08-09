<?php
/**
* ...
* @author Darknet
* Copy Rights (c) http://darkaif.googlecode.com
*/
error_reporting(E_ALL ^ E_NOTICE);
require('../config.php');
header("Content-type: text/xml");


$username = $_GET['username'];
$mapname = $_GET['mapname'];
$mapdata = $_GET['mapdata'];
$submittype = $_GET['submittype'];
$memberid = $_GET['memberid'];
$access = $_GET['access'];

if ($mapname == null){
$mapname = 'test_none';
$submittype = 'open';
//echo 'Hello';
}

$datestamp =  date('YmdHis');

mysql_connect($host,$user,$pass) or die(mysql_error());
mysql_select_db($database) or die(mysql_error());

if ($submittype == 'save'){
$db_mapfields = $prefix."mapfields";
$query = "SELECT * FROM $db_mapfields WHERE name='$mapname'";
$result = mysql_query($query)or die(mysql_error());
$rowID = mysql_fetch_array($result);
$countID = mysql_num_rows($result);
//echo $countID;
if (!$countID){
$db_mapfields = $prefix."mapfields";
$query = "INSERT INTO $db_mapfields (name,mapdata,memberid,access,date)
VALUES('$mapname','$mapdata','$memberid','$access','$datestamp')";
$result = mysql_query($query)or die(mysql_error());
//echo 'XD';
}
echo $rowID['mapdata'];
//echo $rowID['name'];
//echo 'MAP DATA';
}

?>