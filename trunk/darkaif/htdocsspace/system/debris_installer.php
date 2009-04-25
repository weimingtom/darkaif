<?php
function install_debris(){
require('config.php');
mysql_connect($accessdata['host'],$accessdata['username'],$accessdata['password']) or die(mysql_error());
mysql_select_db($accessdata['database']) or die(mysql_error());

$db_objectfile = $accessdata['prefix']."debris"; //$db_database_prefix."members";
mysql_query("CREATE TABLE $db_objectfile(
id INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY(id),
idplanet TEXT,
name TEXT,
x TEXT,
y TEXT,
z TEXT,
material TEXT,
resource TEXT,
metal TEXT,
fuel TEXT,
crystal TEXT,
food TEXT,
farm TEXT,
destory TEXT,
date TEXT
)")
 or die(mysql_error());
echo "Table Created!";
}