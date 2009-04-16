<?php
function install_solarsystem(){
require('config.php');
mysql_connect($accessdata['host'],$accessdata['username'],$accessdata['password']) or die(mysql_error());
mysql_select_db($accessdata['database']) or die(mysql_error());

$db_objectfile = $accessdata['prefix']."solarsystem"; //$db_database_prefix."members";
mysql_query("CREATE TABLE $db_objectfile(
id INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY(id),
idgalaxy TEXT,
name TEXT,
x TEXT,
y TEXT,
z TEXT,
percentcontrol TEXT,
percentnocontrol TEXT,
territorynation TEXT,
numberplanets TEXT,
numbermoons TEXT,
destory TEXT,
date TEXT
)")
 or die(mysql_error());
echo "Table Created!";
}