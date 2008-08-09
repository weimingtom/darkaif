<?php
/**
* ...
* @author Darknet
* Copy Rights (c) http://darkaif.googlecode.com
*/
//===============================================================================================//
// - BOT CATEGORY
//===============================================================================================//
require('../config.php');
header("Content-type: text/xml");

$table = $prefix."bot_category";
////////////////////////////////////////////////////////

//$botid = 'default';
//$pattern = 'Hello';
$botid = $_GET['botid'];
$pattern = $_GET['pattern'];
if ($botid == null){
$botid = 'default';
$pattern = 'Hello';
}

//$linkID = mysql_connect($host,$user,$pass) or die("Could not connect to host.");
//mysql_select_db($database, $linkID) or die("Could not find database.");

mysql_connect($host,$user,$pass) or die(mysql_error());
mysql_select_db($database) or die(mysql_error());
$db_bot_category = $prefix.'bot_category';

$query = "SELECT * FROM {$db_bot_category} WHERE botid='{$botid}' AND pattern='{$pattern}'";
$resultID = mysql_query($query) or die("Data not found.");
$count = mysql_num_rows($resultID);
//echo $count;
if ($count){
//$rowID = mysql_fetch_array($resultID);
//echo $rowID['pattern']."=". $rowID['template'];


$xml_output= '<category>';
while ($rowID = mysql_fetch_array($resultID)){
	$xml_output.= '<bot_category>';
    $xml_output.= '<pattern>'.$rowID['pattern'].'</pattern>';
	$xml_output.= '<category>'.$rowID['category'].'</category>';
	$xml_output.= '<topic>'.$rowID['topic'].'</topic>';
	$xml_output.= '<template>'.$rowID['template'].'</template>';
	$xml_output.= '<version>'.$rowID['version'].'</version>';
	$xml_output.= '<emotion>'.$rowID['emotion'].'</emotion>';
	$xml_output.= '</bot_category>';
}
$xml_output.= '</category>';
echo $xml_output;

}else{
//this is the command used to write the record into the MySQL database
$query="INSERT into {$db_bot_category} (botid,pattern,category,topic,template,version,emotion) 
VALUES ('{$botid}','{$pattern}','none','none','I don\'t know how to answer that!','0','neutral')";
//executes the command
//echo $query;
mysql_query($query) or die("Data not written.");
//echo("The data has been written to the table!");
echo("The data has been written to the table!");
}
/*
$xml_output= '<member>';
while ($rowID = mysql_fetch_array($resultID)){
	$xml_output.= '<account>';
    $xml_output.= '<username>'.$rowID['username'].'</username>';
	$xml_output.= '<password>'.$rowID['password'].'</password>';
	$xml_output.= '</account>';
}
$xml_output.= '</member>';
echo $xml_output;
*/
?>