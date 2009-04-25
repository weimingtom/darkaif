<?php
function install_entityobject(){
require('config.php');
mysql_connect($host,$username,$password) or die(mysql_error());
mysql_select_db($database) or die(mysql_error());

$db_objectfile = $prefix."entityobject"; //$db_database_prefix."members";
mysql_query("CREATE TABLE $db_objectfile(
id INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY(id),
idhash TEXT,
idobject TEXT,
idobjecthash TEXT,
idmap TEXT,
idmesh TEXT,
meshdata TEXT,

animationdata TEXT,
scripts TEXT,
scriptdata TEXT,
xmldata TEXT,
entitytype TEXT,
entitydata TEXT,

version TEXT,
name TEXT,
namehash TEXT,
sharelevel TEXT,
description TEXT,
imageid TEXT,
imagelocation TEXT,
filelocation TEXT,
filetype TEXT,
filesize TEXT,
filename TEXT,
datatype TEXT,
idauthor TEXT,
authorname TEXT,
levelaccess TEXT,
objectrating TEXT,
rateaccess TEXT,
locked TEXT,
date TEXT
)")
 or die(mysql_error());
echo "Table Created!";
}