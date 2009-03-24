<?php
include('config.php');
echo "[DATABASE SCRIPT INSTALLER]<BR> [Work In Progress!] <BR> [Stable]";
include('database/install.php');
include('member/member_install.php');
include('system/system_installer.php');
//include('item/item_install.php');
//include('bot/install_chat.php');
include('system/install_page.php');


include('system/objectfile_installer.php');
include('system/mapdata_install.php');
include('system/thumbnail_install.php');
include('system/flashapp_install.php');

echo 'Scripts:<br>';
//function script
install_ipaddresscheck();//working
install_member();//working
install_settings();//working

install_page(); //working
install_flashapp(); //working
install_mapdata(); //working
install_thumbnail();//working
install_objectfile(); //working

//Not working yet
#install_bot_log();
#install_bot_chat();
#install_item();
//echo md5('admin');
echo '[Done]';
?>