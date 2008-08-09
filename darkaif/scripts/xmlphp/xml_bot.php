<?php
/**
* ...
* @author Darknet
* Copy Rights (c) http://darkaif.googlecode.com
*/
require('../config.php');

$table = $prefix."bot";

$linkID = mysql_connect($host,$user,$pass) or die("Could not connect to host.");
mysql_select_db($database, $linkID) or die("Could not find database.");
//$query = "SELECT * FROM {$table} WHERE username='{$username}'"; 
//$query = "SELECT * FROM {$table}";
$resultID = mysql_query($query, $linkID) or die("Data not found.");
$my_sqlData = $resultID;


?>