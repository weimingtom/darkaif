<?php
/*
//This support only one folder down
if (strlen(strstr($_SERVER['REQUEST_URI'], 'scripts')) > 1) {
	require('../config.php');
	echo "[-scripts folder-]";
}else{
	require('scripts/config.php');
	echo "[-localhost-]";
}
*/

echo "DATABASE SCRIPT INSTALLER<BR>(Work In Progress!)<BR>";
//Install script area
include('scripts/database/install.php');
include('scripts/member/member_install.php');
include('scripts/system/system_installer.php');
include('scripts/item/item_install.php');
include('scripts/bot/install_chat.php');
include('scripts/system/install_page.php');


echo 'Scripts:<br>';
//function script
#install_ipaddresscheck();
#install_member();
#install_settings();
#install_item();

//Not working yet
#install_bot_log();
#install_bot_chat();
#install_page();

?>