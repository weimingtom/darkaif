<?php
function postpage($pagename){
if (strlen(strstr($_SERVER['REQUEST_URI'], 'scripts')) > 1) {
	require('../config.php');
	#echo "[-scripts folder-]";
}else{
	require('scripts/config.php');
	#echo "[-localhost-]";
}

mysql_connect($host,$user,$pass) or die(mysql_error());
mysql_select_db($database) or die(mysql_error());
$db_ipaddress = $prefix."page";
   $query = "SELECT * FROM $db_posting WHERE name='$pagename'";
   $result = mysql_query($query)or die(mysql_error());
   $row = mysql_fetch_array($result);
   $count = mysql_num_rows($result);
   //echo $count;
   if ($count){
   //echo 'hello';
   $pagemessage = $row['body'];
   }else{
   #$pagemessage = 'Error Page Does Not Exist!';
   }
   return $pagemessage;
}
//echo  postpage('home');
?>