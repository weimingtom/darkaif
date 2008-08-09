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
header("Content-type: text/xml");
 
//////////  FILL IN THIS INFORMATION HERE! ////////////

  $host = "localhost"; //insert the name of your host here.  usually its localhost
  $user = "root"; //insert the name of the user here
  $pass = "root";  //insert the password here
  $database = "test";  //insert name of database wherein table was exported
  $table = "test";  //insert the name of the table
 
////////////////////////////////////////////////////////

$round = $_GET['roundNum'];
//$name = 'Zzyzx'; //$_GET['name'];
$name = 'Zzyzx';//$_GET['name'];

 
$linkID = mysql_connect($host,$user,$pass) or die("Could not connect to host.");
mysql_select_db($database, $linkID) or die("Could not find database.");
 
$query = "SELECT * FROM {$table} WHERE name='{$name}'";
$resultID = mysql_query($query, $linkID) or die("Data not found.");

//echo $resultID;
//$rowID = mysql_fetch_array($resultID);
//echo $rowID['name'];
/*$xml_output = "<flashScores>\n";*/
$xml_output = "<flashScores>\n";
 
for($x = 0 ; $x < mysql_num_rows($resultID) ; $x++){
	$y = $x +1;
    $row = mysql_fetch_assoc($resultID);
    $xml_output .= "\t<entry>\n";
    $xml_output .= "\t\t<Name>" . $row['name'] . "</Name>\n";
    $xml_output .= "\t\t<Rank>" . $y.  "</Rank>\n";
    $xml_output .= "\t\t<Round1>" . $row['roundOneTime'] . "</Round1>\n";
    $xml_output .= "\t\t<Round2>" . $row['roundTwoTime'] . "</Round2>\n";
    $xml_output .= "\t\t<Round3>" . $row['roundThreeTime'] . "</Round3>\n";
    $xml_output .= "\t\t<Total>" . $row['finalTime'] . "</Total>\n";
 
    $xml_output .= "\t</entry>\n";
}
 
$xml_output .= "</flashScores>";
echo $xml_output;

?>