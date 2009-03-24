<?php
#error_reporting(E_ALL);
include('scripts/content/class_ads.php');

include('scripts/config.php');
include('scripts/logaccess.php');
mysql_connect($host,$username,$password) or die(mysql_error());
mysql_select_db($database) or die(mysql_error());

echo $ads1;
echo $ads2;
echo '<link rel="stylesheet" type="text/css" href="scripts/default.css" />';
if($siteaccess){
	if ((login_check() == true)) {
		include('scripts/content/layout.php');
		include('scripts/postnotice.php');
	}elseif (login_check() == false) {
		include('srcipts/form.php');
		if (($_GET['action'] != 'register') and ($_GET['action'] != 'forgotpassword')and ($_GET['action'] != 'activatekey')){
			$MainContent .= '<div id="hmenu"><ul></ul><div>';
			$MainContent .= '<br><center>'.logintext().'</center><br>';
			$MainContent .= '<div id="hmenu"><ul></ul><div>';
		}
		include('scripts/layout_login.php');
	}
}else {
	include('scripts/postnotice.php');
	include('scripts/content/layout.php');
}
#echo 'In Progress of Building DataBase.';
echo $ads1;
?>