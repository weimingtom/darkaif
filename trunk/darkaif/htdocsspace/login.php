<?php
session_start(); // This must at the top else it not work right
include('config.php');
mysql_connect($accessdata['host'],$accessdata['username'],$accessdata['password']) or die(mysql_error());
mysql_select_db($accessdata['database']) or die(mysql_error());

$db_table = $accessdata['prefix']."member";
$query = "SELECT * FROM $db_table WHERE username='{$_POST['username']}' AND password='{$_POST['password']}'";
$result = mysql_query($query) or die(mysql_error());
$row = mysql_fetch_array($result);

$date = date('YmdHis');
$date = $date + 100;//one hour
$hashsession = md5($date);

$xml_output = '';
$xml_output .= '<data>';
if ($row['username'] == $_POST['username']) {
	//create session control
	$db_table2 = $accessdata['prefix']."member";
	$query2 = "UPDATE $db_table2 SET session='{$hashsession}', sessiontime='{$date}' WHERE id='{$row['id']}'";
	$sql = mysql_query($query2) or die(mysql_error());
	
	$db_table = $accessdata['prefix']."planet";
	$query3 = "SELECT * FROM $db_table WHERE id='{$row['homeplanetid']}'";
	$result3 = mysql_query($query3) or die(mysql_error());
	$row3 = mysql_fetch_array($result3);
	
	$db_table = $accessdata['prefix']."solarsystem";
	$query4 = "SELECT * FROM $db_table WHERE id='{$row3['idsolarsystem']}'";
	$result4 = mysql_query($query4) or die(mysql_error());
	$row4 = mysql_fetch_array($result4);

	$xml_output .= '<message>'.'pass'.'</message>';
	$xml_output .= '<username>'.$row['username'].'</username>';
	$xml_output .= '<session>'.$hashsession.'</session>';
	$xml_output .= '<galaxyid>'.$row4['idgalaxy'].'</galaxyid>';
	$xml_output .= '<solarsystemid>'.$row3['idsolarsystem'].'</solarsystemid>';
	$xml_output .= '<homeplanetid>'.$row['homeplanetid'].'</homeplanetid>';
	$xml_output .= '<setplanetid>'.$row['setplanetid'].'</setplanetid>';
}else {
	$xml_output .= '<message>'.'fail'.'</message>';
	$xml_output .= '<username>'.'</username>';
	$xml_output .= '<session>'.'</session>';
	$xml_output .= '<galaxyid>'.'</galaxyid>';
	$xml_output .= '<solarsystemid>'.'</solarsystemid>';
	$xml_output .= '<homeplanetid>'.'</homeplanetid>';
	$xml_output .= '<setplanetid>'.'</setplanetid>';
}

$xml_output .= '</data>';
echo $xml_output;


?>