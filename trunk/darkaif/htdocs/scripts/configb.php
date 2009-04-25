<?php
/**
* ...
* @author Darknet
* Copy Rights (c) http://darkaif.googlecode.com
*/
//=================================================================================================
//DO NOT TOUCH
//=================================================================================================
//CONFIG
$host 		= "localhost"; 		//insert the name of your host here.  usually its localhost

$username 	= "as3"; 			//insert the name of the user here
$password 	= "as3";  			//insert the password here
$database 	= "flashcoreas"; 	//insert the name of the table
$prefix 	= "flashcoreas_";   //prefix incase there are other same name files.


$siteaccess = 0;// 0 = pulblic,1 = private
//game server
$servername = 'core';
$serverid = md5($servername);

$gamecategories = array('app','rpg','rts','fps','others');
$gamemode = array('dm','cft');

//ACCESS AREA
$register = 0;  //Method of Registration: 0 = Disable 1 = Normal, 2 = Email Auth, 3 = Admin Auth
//NEED TO WORK THIS PART
$levelMaintain = 3;      //0 = Admin Only - This for trouble shoorting area for fix section
                         //1 = Admin and GM - Same here for help and support
                         //2 = Member only
                         //3 = All -everyone is well welcome
$register_url = '';

$sitename = 'Darkaif';
$siteurl = 'http:///darkaif/';

//Do not touch this settings
$ImageBG = 'textures/blackgrid.jpg';
$SkinTheme = 'simple'; //'default';

$extra_panel = 'extra panel';
$Banner_top = '<img src="" width="64" height="64">';
$CopyRights = '<center><address>Create By: Darkneter</address></center>';
?>