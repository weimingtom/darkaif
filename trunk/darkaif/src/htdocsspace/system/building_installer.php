<?php
function install_building(){
require('config.php');
mysql_connect($accessdata['host'],$accessdata['username'],$accessdata['password']) or die(mysql_error());
mysql_select_db($accessdata['database']) or die(mysql_error());

$db_objectfile = $accessdata['prefix']."building"; //$db_database_prefix."members";
mysql_query("CREATE TABLE $db_objectfile(
id INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY(id),
idplanet TEXT,
name TEXT,
idtag TEXT,
level TEXT,
productionpoint TEXT,
productiontype TEXT,
requiretech TEXT,
disabletech TEXT,
disablebuilding TEXT,

username TEXT,
userid TEXT,

destory TEXT,
date TEXT
)")
 or die(mysql_error());
echo "Table Created!";
}