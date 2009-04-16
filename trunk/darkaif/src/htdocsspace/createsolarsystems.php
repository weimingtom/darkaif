<?php
include('config.php');
mysql_connect($accessdata['host'],$accessdata['username'],$accessdata['password']) or die(mysql_error());
mysql_select_db($accessdata['database']) or die(mysql_error());


$db_table = $accessdata['prefix']."solarsystem"; //$db_database_prefix."members";
echo 'CREATING...';
$numbersolarsystemmax = 1100;
$numbersolarsystem = 0;

while($numbersolarsystem < $numbersolarsystemmax) {

//echo '<br>['.rand(-1000,1000).':'.rand(-1000,1000).':'.rand(-1000,1000).']';
$position_x = rand( -1000, 1000);
$position_y = rand( -1000, 1000);
$position_z = rand( -1000, 1000);
$time = time();
//echo $position_x;

$query = "INSERT INTO $db_table
(name,x,y,z,date)
VALUES('nameless', '{$position_x}', '{$position_y}', '{$position_z}', '{$time}')";

mysql_query($query)or die(mysql_error());

$numbersolarsystem++;
}


?>