<?php
function install_thumbnail(){
include('config.php');
mysql_connect($host,$username,$password) or die(mysql_error());
mysql_select_db($database) or die(mysql_error());

$db_objectfile = $prefix."thumbnail";
mysql_query("CREATE TABLE $db_objectfile(
id INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY(id),
idhash TEXT,
name TEXT,
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
levelaccess INT DEFAULT 0,
objectrating TEXT,
rateaccess TEXT,
locked INT DEFAULT 0,
date TINYTEXT
)")
 or die(mysql_error());
echo "Table Created!";
}
#install_objectfile();
?>