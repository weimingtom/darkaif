<?php
function install_member(){
require('config.php');
mysql_connect($accessdata['host'],$accessdata['username'],$accessdata['password']) or die(mysql_error());
mysql_select_db($accessdata['database']) or die(mysql_error());

$db_objectfile = $accessdata['prefix']."member"; //$db_database_prefix."members";
mysql_query("CREATE TABLE $db_objectfile(
id INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY(id),

session TEXT,
sessiontime TEXT,

homeplanetid TEXT,
setplanetid TEXT,
objecttype TEXT,

userid TEXT,
username TEXT,
firstname TEXT,
lastname TEXT,
password TEXT,
hashpassword TEXT,
birth TEXT,

ban TEXT,
level TEXT,

email TEXT,
alliancename TEXT,
alliancetag TEXT,
allianceid TEXT,

date TEXT
)")
 or die(mysql_error());
echo "Table Created!";
}