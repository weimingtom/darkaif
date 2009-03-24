  <?php

/* ================================================================================================
THIS IS THE SETTINGS 
 ================================================================================================ */
function install_settings(){
require('config.php');
mysql_connect($host,$username,$password) or die(mysql_error());
mysql_select_db($database) or die(mysql_error());

$db_settings = $prefix."settings"; //$db_database_prefix."members";
mysql_query("CREATE TABLE $db_settings(
variable TINYTEXT NOT NULL,
PRIMARY KEY(variable(30)),
value TEXT,
description TEXT
)")
 or die(mysql_error());
echo "Table Created!";

// Insert a row of information into the table "example"
mysql_query("INSERT INTO $db_settings
(variable,value,description)
VALUES('register','1','Method of Registration: 0 = Disable 1 = Normal, 2 = Email Auth, 3 = Admin Auth' ) ")
or die(mysql_error());

mysql_query("INSERT INTO $db_settings
(variable,value,description)
VALUES('register_message','Thank you for register the website that we made and you accept the agreement terms. Hello XD!','register message accept my email' ) ")
or die(mysql_error());

mysql_query("INSERT INTO $db_settings
(variable,value,description)
VALUES('sendmail_from','none@none.com','SMTP Email Address to use from your account access.' ) ")
or die(mysql_error());

mysql_query("INSERT INTO $db_settings
(variable,value,description)
VALUES('sendmail_name','none','Display Name on Email for the message.' ) ")
or die(mysql_error());

mysql_query("INSERT INTO $db_settings
(variable,value,description)
VALUES('smtp_auth','true','Whether or not to authenticate SMTP' ) ")
or die(mysql_error());

mysql_query("INSERT INTO $db_settings
(variable,value,description)
VALUES('smtp_host','smtp.none.com','Email SMTP Host Email' ) ")
or die(mysql_error());

mysql_query("INSERT INTO $db_settings
(variable,value,description)
VALUES('smtp_login','none','SMTP Login (If auth is on). Your user account.' ) ")
or die(mysql_error());

mysql_query("INSERT INTO $db_settings
(variable,value,description)
VALUES('smtp_pass','none','SMTP Password (If auth is on). Your password account.' ) ")
or die(mysql_error());

mysql_query("INSERT INTO $db_settings
(variable,value,description)
VALUES('smtp_port','587','PORT SMTP Default connect' ) ")
or die(mysql_error());
}

/* ================================================================================================
THIS IS THE MENU LINKS
 ================================================================================================ */
function install_menulink(){
//This support only one folder down
if (strlen(strstr($_SERVER['REQUEST_URI'], 'scripts')) > 1) {
	require('../config.php');
	echo "[-scripts folder-]";
}else{
	require('scripts/config.php');
	echo "[-localhost-]";
}
mysql_connect($host,$user,$pass) or die(mysql_error());
mysql_select_db($database) or die(mysql_error());

$db_settings = $prefix."menulink"; //$db_database_prefix."members";
mysql_query("CREATE TABLE $db_bot_property(
id INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY(id),
parentid TEXT,
childid TEXT,
menuorder TEXT,
linkname TEXT,
linkprefix TEXT,
opentype TEXT
)")
 or die(mysql_error());
echo "Table Created!";
}
/* ================================================================================================

 ================================================================================================ */
?>