<?php
error_reporting(E_PARSE);
include('config.php');
mysql_connect($accessdata['host'],$accessdata['username'],$accessdata['password']) or die(mysql_error());
mysql_select_db($accessdata['database']) or die(mysql_error());

//mysql_connect($accessdata['host'],$accessdata['username'],$accessdata['password']) or die('database account error..');
//mysql_select_db($accessdata['database']) or die('database error...');
include('access.php');

echo 'Flash Space War 3D';



include('layout.php');




?>