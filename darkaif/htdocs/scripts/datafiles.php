<?php

/*
* -Loading files from mysql database
* -Requried donwload function ro execute script
* -Get user access
*/

include('config.php');

mysql_connect($host,$username,$password) or die(mysql_error());
mysql_select_db($database) or die(mysql_error());

if ($_GET == null){ //if there no get url it will create the list
	$db_table = $prefix."objectfile";
	$query = "SELECT * FROM $db_table";
	$result = mysql_query($query) or die(mysql_error());
	header("content-type: text/xml");
	$bodycontent .= '<?xml version="1.0" encoding="utf-8" ?><data>';
	while ($row = mysql_fetch_array($result)){ //
		$bodycontent .= '
<file>
	<idobject>' . $row['idhash'].'</idobject>
	<name>' . $row['name'].'</name>
	<type>' . $row['filetype'].'</type>
</file>';
	}
	$bodycontent .= '</data>';
	echo $bodycontent;
}


if ($_GET['file'] != null){ //this is an id to get the file and send it to the flash app or download it.
	$db_table = $prefix."objectfile";
	$query = "SELECT * FROM $db_table WHERE idhash='{$_GET['file']}'";
	$result = mysql_query($query) or die(mysql_error());
	$row = mysql_fetch_array($result);
	$datafilelocation = '../'.$row['filelocation']; //file location
	$datafilename = $row['filename']; //file name
	$datafiletype = $row['filetype']; //file type
	$type = filetype($datafilelocation); //file type
	//echo $type;
	// Get a date and timestamp
	$today = date("F j, Y, g:i a");
	$time = time();//created date file
	header("content-type:$type");
	header("Content-Disposition: attachment;filename=$datafilename");//download
	header('Pragma: no-cache');
	header('Expires: 0');
	readfile($datafilelocation);
}


?>