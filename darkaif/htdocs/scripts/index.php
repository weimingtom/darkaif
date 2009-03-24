<?php
//=========================================================
//Admin panel
//=========================================================
error_reporting(E_PARSE);
#error_reporting(E_ALL);
echo '<link rel="stylesheet" type="text/css" href="default.css" />';
include('config.php');
include('logaccess.php');
mysql_connect($host,$username,$password) or die(mysql_error());
mysql_select_db($database) or die(mysql_error());
//0 = guest
//1 = member
//2 = moderators
//3 = game master
//4 = administrators

if ((login_check() == true)) {
	$db_members = DB_PREFIX."members";
	$query = "select * from $db_members where username='{$_SESSION['username']}'";
	$sql = mysql_query($query) or die(mysql_error());
	#$count = mysql_num_rows($sql);
	$row = mysql_fetch_array($sql);
	//echo $row['access_level'];
	if($row['access_level'] >= 4){
		include('adminlayout.php');
	}else {
		echo '<center>';
		echo '<table>';
		echo '<tr><td>';
		echo 'USER - MESSAGE';
		echo '</td></tr>';
		echo '<tr><td>';
		echo '<font color="red">ACCESS DENIED</font>';
		echo '</td></tr>';
		echo '</table>';
		echo '</center>';
	}
}elseif (login_check() == false) {
	echo '<br><center>'.logintext().'</center>';
}

?>