<?php
/*
action:
-load
-save
-update
-delete
-check
*/

session_start(); // This must at the top else it not work right
include('config.php');

//mysql_connect($host, $username, $password) or die(mysql_error());
//$username ='';
mysql_connect($host, $username, $password) or die('<data>databaseerroraccess</data>');
//$database = 'sds';
//mysql_select_db($database) or die(mysql_error());
//mysql_select_db($database) or (echo '<data>databaseerror</data>'; );
mysql_select_db($database) or die('<data>databaseerrortable</data>');

$db_member = $prefix."members";
$query = "SELECT * FROM $db_member WHERE session='{$_POST['session']}'";
$result = mysql_query($query) or die(mysql_error());
$row_member = mysql_fetch_array($result);

if ($row_member['ban']) {
	die();
}
$membername = $row_member['username'];
$membernamehash = md5($membername);

//echo $_POST['action'];
if($_POST['action'] == 'maplist'){
	$db_table = $prefix."mapdata";
	$query = "SELECT * FROM $db_table WHERE authorname='$membername'";
	$result = mysql_query($query) or die(mysql_error());
	#$row = mysql_fetch_array($result);
	#$bodycontent .= '[-]';
	header ("content-type: text/xml");
	$xml_output = '<data>';
	while ($row = mysql_fetch_array($result)) { //
		//echo 
		$xml_output .= '<map>';
		//$xml_output .= '<name>' . $row['name'] .$_SESSION['username'].'</name>';
		$xml_output .= '<name>' . $row['name'] .'</name>';
		$xml_output .= '<id>' . $row['idhash'] .'</id>';
		$xml_output .= '</map>';
	}
	//$xml_output .= '<member>'.$row_member['username'].$_SESSION['session'].'</member>';
	$xml_output .= '</data>';
	echo $xml_output;
}
else if ($_POST['action'] == 'check') {
	$db_table = $prefix."mapdata";
	$query = "SELECT * FROM $db_table WHERE authorname='$membername' AND name='{$_POST['mapname']}'";
	$result = mysql_query($query) or die(mysql_error());
	$num_rows = mysql_num_rows($result); 
	header ("content-type: text/xml");
	//echo $num_rows;
	$xml_output = '<data>';
	if ($num_rows) {
		//echo 'FOUND!';
		//$xml_output .= 1;
		$xml_output .= '<message>existmap</message>';
	}else {
		//echo 'Do Not Exist!';
		$xml_output .= '<message>newmap</message>';
	}
	$xml_output .= '</data>';
	echo $xml_output;
	//echo '[Check]';
}
else if ($_POST['action'] == 'save') {
	$dataxmlmap = $_POST['mapdata'];
	$mapname =  $_POST['mapname'];
	$datestamp =  date('Y-m-d-H-i-s');
	$maphash = md5($datestamp.$mapname);
	$datapath = 'map';

	$db_table = $prefix."mapdata";
	mysql_query("INSERT INTO $db_table
	(idhash,name,filetype,idauthor,authorname,datatype,date,filename,fileversion,sharelevel,description,imageid,mapdata,flag,locked)
	VALUES( '$maphash','{$mapname}','.xml','{$row_member['id_encrypt']}','{$row_member['username']}','$datapath','$datestamp','$objectnametext','1','1','none','none','$dataxmlmap','0','0')")
	or die(mysql_error());
	header ("content-type: text/xml");
	$xml_output = '<data>';
	$xml_output .= 'save';
	$xml_output .= '</data>';
	echo $xml_output;
	//echo $_POST['mapdata'];
	//echo $dataxmlmap;
}
else if ($_POST['action'] == 'update') {
	$mapname =  $_POST['mapname'];
	$dataxmlmap = $_POST['mapdata'];
	$db_table = $prefix."mapdata";
	$query = "UPDATE $db_table SET mapdata='{$dataxmlmap}' WHERE name='{$mapname}'" ;
	$sql = mysql_query($query) or die(mysql_error());
	
	$xml_output = '<data>';
	$xml_output .= 'save';
	$xml_output .= '</data>';
	echo $xml_output;	
}
else if ($_POST['action'] == 'load') {
	$mapid = $_POST['mapid'];
	$db_table = $prefix."mapdata";
	$query = "SELECT * FROM $db_table WHERE authorname='$membername' AND idhash='{$mapid}'";
	$result = mysql_query($query) or die(mysql_error());
	#$row = mysql_fetch_array($result);
	#$bodycontent .= '[-]';
	header ("content-type: text/xml");
	while ($row = mysql_fetch_array($result)) {
		$xml_output .= $row['mapdata'];
	}
	echo $xml_output;
}
//echo '[MAP]';
?>