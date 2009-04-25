<?php
function install_planet(){
require('config.php');
mysql_connect($accessdata['host'],$accessdata['username'],$accessdata['password']) or die(mysql_error());
mysql_select_db($accessdata['database']) or die(mysql_error());

$db_objectfile = $accessdata['prefix']."planet"; //$db_database_prefix."members";
mysql_query("CREATE TABLE $db_objectfile(
id INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY(id),
idsolarsystem TEXT,
ringradius TEXT,
idowner TEXT,
ownername TEXT,
points TEXT,
size TEXT,
name TEXT,
x TEXT,
y TEXT,
z TEXT,
territorynation TEXT,
type TEXT,
resource TEXT,
techlevel TEXT,
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