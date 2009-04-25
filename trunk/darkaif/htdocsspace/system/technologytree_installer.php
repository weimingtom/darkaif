<?php
function install_technologytree(){
require('config.php');
mysql_connect($accessdata['host'],$accessdata['username'],$accessdata['password']) or die(mysql_error());
mysql_select_db($accessdata['database']) or die(mysql_error());

$db_objectfile = $accessdata['prefix']."technologytree"; //$db_database_prefix."members";
mysql_query("CREATE TABLE $db_objectfile(
id INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY(id),
name TEXT,
idtag TEXT,
level TEXT,
levelmax TEXT,

buildtype TEXT,

information TEXT,

timebuild TEXT,
costtype TEXT,
othercosttype TEXT,

productionpoint TEXT,
productiontype TEXT,
requiretech TEXT,
disabletech TEXT,
date TEXT
)")
 or die(mysql_error());
echo "Table Created!";
}