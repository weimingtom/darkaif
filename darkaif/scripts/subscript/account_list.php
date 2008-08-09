<?php
/**
* ...
* @author Darknet
* Copy Rights (c) http://darkaif.googlecode.com
*/
//=================================================================================================
//DO NOT TOUCH

//=================================================================================================
error_reporting(E_ALL ^ E_NOTICE);
require('../config.php');
//echo 'test';
//header("Content-type: text/xml");
header("Content-type: text");
//////////  FILL IN THIS INFORMATION HERE! ////////////
//$host = "";
//$user = "";
//$pass= "";
//$table = "";
//$database = "";
////////////////////////////////////////////////////////
$username = 'Admin';
//$username = $_GET['username'];
//$password = $_GET['password'];

$linkID = mysql_connect($host,$user,$pass) or die("Could not connect to host.");
mysql_select_db($database, $linkID) or die("Could not find database.");
 
$query = "SELECT * FROM {$table} WHERE username='{$username}'";
$resultID = mysql_query($query, $linkID) or die("Data not found.");
$my_sqlData = $resultID;

$row_string = "";
$tmpstring = "";
$no_loop = -1;

$count = mysql_num_rows($resultID);
//$rowID = mysql_fetch_array($resultID);
//echo $count;
while ($rowID = mysql_fetch_array($resultID)){
      $no_loop = $no_loop + 1;
      if ($no_loop > 0){
         $dotcoma = ',';
      }else{
            $dotcoma = '';
      }
      $row_string = $dotcoma.'['.$rowID['username'].','.$rowID['password'] . ']';
      $tmpstring = $tmpstring.$row_string ;
}
echo $tmpstring;
?>