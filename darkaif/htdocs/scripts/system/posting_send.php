<?php
//include('../settings.php');
//echo '<div>';
//echo $_POST['category'].'<br>';
//echo $_POST['subject'].'<br>';
//echo $_POST['body'];
//echo '</div>';

if(empty($_POST['category'])||empty($_POST['subject'])||empty($_POST['body'])){
//echo 'Missing a field';
}else{
if (strlen(strstr($_SERVER['REQUEST_URI'], 'scripts')) > 1) {
	require('../config.php');
	#echo "[-scripts folder-]";
}else{
	require('scripts/config.php');
	#echo "[-localhost-]";
}

mysql_connect($host,$user,$pass) or die(mysql_error());
mysql_select_db($database) or die(mysql_error());
$db_page = $prefix."page";
$userid = '0';
$username = 'Admin';
$to_subject = $_POST['subject'];
$to_category = $_POST['category'];
$to_message = $_POST['body'];

$time = time();
$mark_time = date('Y',$time).date('m',$time).date('d',$time).strftime('%H%M%S');
mysql_query("INSERT INTO $db_page
(title,category,body,date,userid,username,level,hide)
VALUES('$to_subject ','$to_category','$to_message','$mark_time','$userid','$username','0','0')")or die(mysql_error());

//$linkpage = $_POST['linkpage'];
//header("Location:$site_url");
//echo 'Posted!';
}
?>