<?php
include('scripts/config.php');
if ($_GET['flashid'] != null){
   mysql_connect($host,$username,$password) or die(mysql_error());
   mysql_select_db($database) or die(mysql_error());
   $db_table = $prefix."flashapp";
   $query = "SELECT * FROM $db_table WHERE idhash='{$_GET['flashid']}'";
   $result = mysql_query($query) or die(mysql_error());
   $row = mysql_fetch_array($result);
   $filename = $row['filelocation'];
}else{
      $filename = 'main.swf';
}
header("Content-Type:application/x-shockwave-flash");
#header("Content-Disposition: attachment;filename=$filename");
header('Pragma: no-cache');
header('Expires: 0');
readfile($filename);
?>