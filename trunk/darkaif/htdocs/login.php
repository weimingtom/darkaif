<?php
include('scripts/config.php');
mysql_connect($host,$username,$password) or die(mysql_error());
mysql_select_db($database) or die(mysql_error());

$db_table = $prefix."members";
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
	$db_table = $prefix."members";
	$query2 = "UPDATE $db_table SET session='{$hashsession}',ip_address='{$_SERVER['REMOTE_ADDR']}',sessionexpiretime='{$date}' WHERE id='{$row['id']}'";
	$sql = mysql_query($query2) or die(mysql_error());

	$xml_output .= '<message>'.'pass'.'</message>';
	$xml_output .= '<username>'.$row['username'].'</username>';
	$xml_output .= '<session>'.$hashsession.'</session>';
	$_SESSION['session'] = $hashsession;
}else {
	$xml_output .= '<message>'.'fail'.'</message>';
	$xml_output .= '<username>'.'</username>';
	$xml_output .= '<session>'.'</session>';
}

$xml_output .= '</data>';
echo $xml_output;


?>