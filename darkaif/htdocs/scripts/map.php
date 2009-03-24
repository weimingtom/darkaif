<?php
/*
action:
-load
-save
-update
-delete
-check

*/
include('config.php');

mysql_connect($host,$username,$password) or die(mysql_error());
mysql_select_db($database) or die(mysql_error());

$membername = 'guest';
$membernamehash = md5($membername);

$mapname = $_GET['mapname'];
$action = $_GET['action'];
//echo $_POST['action'];
if(($_GET == null)&&($_POST == null)){
	$db_table = $prefix."mapdata";
	$query = "SELECT * FROM $db_table WHERE authorname='$membername'";
	$result = mysql_query($query) or die(mysql_error());
	#$row = mysql_fetch_array($result);
	#$bodycontent .= '[-]';
	header ("content-type: text/xml");
	$xml_output = '<data>';
	while ($row = mysql_fetch_array($result)) { //
	//echo 
	$xml_output .= '<mapname>' . $row['name'] .'</mapname>';
	
	}
	$xml_output .= '</data>';
	echo $xml_output;
}
else if ($action == 'check') {
	$db_table = $prefix."mapdata";
	$query = "SELECT * FROM $db_table WHERE authorname='$membername' AND name='{$mapname}'";
	$result = mysql_query($query) or die(mysql_error());
	$num_rows = mysql_num_rows($result); 
	header ("content-type: text/xml");
	//echo $num_rows;
	$xml_output = '<data>';
	if ($num_rows) {
		//echo 'FOUND!';
		//$xml_output .= 1;
		$xml_output .= '<message>1</message>';
	}else {
		//echo 'Do Not Exist!';
		$xml_output .= '<message>0</message>';
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
	VALUES( '$maphash','{$mapname}','.xml','{$membernamehash}','{$membername}','$datapath','$datestamp','$objectnametext','1','1','none','none','$dataxmlmap','0','0')")
	or die(mysql_error());
	header ("content-type: text/xml");
	$xml_output = '<data>';
	$xml_output .= 'done';
	$xml_output .= '</data>';
	echo $xml_output;
	//echo $_POST['mapdata'];
	//echo $dataxmlmap;
}else if ($_POST['action'] == 'update') {
	$mapname =  $_POST['mapname'];
	$dataxmlmap = $_POST['mapdata'];
	$db_table = $prefix."mapdata";
	$query = "UPDATE $db_table SET mapdata='{$dataxmlmap}' WHERE name='{$mapname}'" ;
	$sql = mysql_query($query) or die(mysql_error());
	
	$xml_output = '<data>';
	$xml_output .= 'done';
	$xml_output .= '</data>';
	echo $xml_output;
	
}


//echo '[MAP]';
?>