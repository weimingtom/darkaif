<?php
error_reporting(E_ALL ^ E_NOTICE);
/**
* ...
* @author Darknet
* Copy Rights (c) http://darkaif.googlecode.com
*/
//===============================================================================================//
// ACCESS FOR GAME ENTER THE WORLD
// TWO LAYERS SECCRITY
// ONE - IS LOGIN REQUIRED GAME SETUP FROM DATA
// TWO - GAME ID OF THE USER CURRENT GUI
//===============================================================================================//
echo '<center><h1>Project Darkaif</h1></center>';
$ShowFlash = true;
if ($_SERVER['SERVER_ADDR'] == '127.0.0.1'){
error_reporting(E_ALL ^ E_NOTICE);
}
echo $MainContent;

include('scripts/settings.php');
//include('scripts/accesslog.php'); //login system
include('scripts/logaccess.php');


echo '<link rel="stylesheet" type="text/css" href="scripts/default.css" />';
echo '<center>This site is Under Construction</center>';
//echo logintext();

if ((login_check()== true)){
	include('scripts/layout.php');
}elseif (login_check()== false){

        //$MainContent .= "hello";
        if (($_GET['action'] != 'register') and ($_GET['action'] != 'forgotpassword')and ($_GET['action'] != 'activatekey')){
           $MainContent .= '<div id="hmenu"><ul></ul><div>';
           $MainContent .= '<br><center>'.logintext().'</center><br>';
           $MainContent .= '<div id="hmenu"><ul></ul><div>';
        }
        echo '</center>';
        include('scripts/layout_login.php');
}
echo '<br><center><a href="index.php">Home</a> <a href="index.php?action=logout">Logout</a>-Be sure you logout when not in use.</center>';
$license = '<a rel="license" href="http://creativecommons.org/licenses/by-sa/2.5/ca/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-sa/2.5/ca/80x15.png" /></a><br /><span xmlns:dc="http://purl.org/dc/elements/1.1/" property="dc:title">Darkaif</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="http://code.google.com/p/darkaif/" property="cc:attributionName" rel="cc:attributionURL">Darknet</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/2.5/ca/">Creative Commons Attribution-Share Alike 2.5 Canada License</a>.<br />Based on a work at <a xmlns:dc="http://purl.org/dc/elements/1.1/" href="http://code.google.com/p/darkaif/source/checkout" rel="dc:source">code.google.com</a>.';

echo '<br><center>'.$license.'</center> ';
if ($_SERVER['SERVER_ADDR'] == '127.0.0.1'){
//=================================================================================================
// DEBUG SECTION
//=================================================================================================
}

?>