<?php
function install_flashapp(){
include('config.php');
mysql_connect($host,$username,$password) or die(mysql_error());
mysql_select_db($database) or die(mysql_error());

$db_objectfile = $prefix."flashapp"; //$db_database_prefix."members";
mysql_query("CREATE TABLE $db_objectfile(
id INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY(id),
idhash TEXT,
name TEXT,
description TEXT,
imageid TEXT,
filelocation TEXT,
filetype TEXT,
filesize TEXT,
filename TEXT,
datatype TEXT,
idauthor TEXT,
authorname TEXT,
fileversion INT DEFAULT 0,
levelaccess TEXT,
objectrating TEXT,
rateaccess INT DEFAULT 0,
accesslevel INT DEFAULT 0,
accessmember TEXT,
sharelevel INT DEFAULT 0,
sharemember TEXT,
height INT DEFAULT 480,
width INT DEFAULT 640,
type TEXT,
category TEXT,
enginetype TEXT,
flag INT DEFAULT 0,
locked INT DEFAULT 0,
date TINYTEXT
)")
 or die(mysql_error());
echo "Table Created!";
}
?>