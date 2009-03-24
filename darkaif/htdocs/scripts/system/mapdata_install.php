<?php
function install_mapdata(){
include('config.php');
mysql_connect($host,$username,$password) or die(mysql_error());
mysql_select_db($database) or die(mysql_error());

$db_objectfile = $prefix."mapdata"; //$db_database_prefix."members";
mysql_query("CREATE TABLE $db_objectfile(
id INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY(id),
idhash TEXT,
name TEXT,
description TEXT,
imageid TEXT,
filelocation TEXT,
mapdata TEXT,
filetype TEXT,
filesize TEXT,
filename TEXT,
datatype TEXT,
idauthor TEXT,
authorname TEXT,
fileversion TEXT,
levelaccess TEXT,
objectrating TEXT,
rateaccess TEXT,
accesslevel TEXT,
accessmember TEXT,
sharelevel TEXT,
sharemember TEXT,
gametype TEXT,
gamemode TEXT,
enginetype TEXT,
category TEXT,
flag INT DEFAULT 0,
locked INT DEFAULT 0,
date TINYTEXT
)")
 or die(mysql_error());
echo "Table Created!";
}
?>