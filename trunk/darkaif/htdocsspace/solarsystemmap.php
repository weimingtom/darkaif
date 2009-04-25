<?php

include('config.php');
mysql_connect($accessdata['host'],$accessdata['username'],$accessdata['password']) or die(mysql_error());
mysql_select_db($accessdata['database']) or die(mysql_error());


$db_table = $accessdata['prefix']."solarsystem"; //$db_database_prefix."members";

$query = "SELECT * FROM $db_table";
$result = mysql_query($query) or die(mysql_error());

$output_xml = '';
$output_xml .= '<data>';
while ($row = mysql_fetch_array($result)) {
$output_xml .= 
'
 <solarsystem>
  <name>'.$row['name'].'</name>
  <x>'.$row['x'].'</x>
  <y>'.$row['y'].'</y>
  <z>'.$row['z'].'</z>
 </solarsystem>';

}
$output_xml .= '</data>';
echo $output_xml;
?>