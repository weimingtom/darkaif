<?php
function install_member(){
require('config.php');
mysql_connect($host,$username,$password) or die(mysql_error());
mysql_select_db($database) or die(mysql_error());
$db_members = $prefix."members";
mysql_query("CREATE TABLE $db_members(
id INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY(id),
 id_encrypt TINYTEXT,
 session TINYTEXT,
 sessionexpiretime TINYTEXT,
 cookie TINYTEXT,
 status TINYTEXT,
 status_no INT DEFAULT '0',
 title TINYTEXT,
 firstname TINYTEXT,
 middlename TINYTEXT,
 lastname TINYTEXT,
 gender TINYTEXT,
 birthday TINYTEXT,
 name TINYTEXT,
 username TINYTEXT,
 password TINYTEXT,
 p_encrypt TINYTEXT,
 email TINYTEXT,
 hideemail INT DEFAULT 0,
 access_level INT DEFAULT 1,
 forum_access INT DEFAULT 1,
 credit_points INT DEFAULT 0,
 money_points INT DEFAULT 0,
 cash_points INT DEFAULT 0,
 fame INT DEFAULT 0,
 rank INT DEFAULT 0,
 is_activated INT DEFAULT 1,
 validation_code TINYTEXT,
 ip_address TINYTEXT,
 ban INT DEFAULT 0,
 date_register TINYTEXT)")
 or die(mysql_error());
echo "Table Created!";

mysql_query("INSERT INTO $db_members
(id_encrypt,name,username,password,p_encrypt,access_level,forum_access,is_activated)
VALUES('21232f297a57a5a743894a0e4a801fc3','Admin','admin','admincore','524d6fdd10161e14b33bea1ff661e30d','4','1','1') ")
or die(mysql_error());
}

?>