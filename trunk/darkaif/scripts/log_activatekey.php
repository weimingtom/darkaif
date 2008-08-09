<?php
function register_keycheck($username,$key){
  $db_members = DB_PREFIX."members";
  $query = "SELECT * FROM $db_members WHERE username='$username' AND validation_code='$key'";
  $sql = mysql_query($query) or die(mysql_error());
  $count = mysql_num_rows($sql);
  
  //$rowID = mysql_fetch_array($sql);
  //echo '[X-]'.$rowID['username'].'[-X]';
  //echo '['.$count.']';
  if ($count){
    $query = "UPDATE $db_members SET validation_code='', is_activated='1' WHERE username='$username'";
    $sql = mysql_query($query) or die(mysql_error());
	//echo 'UPDATE!';
	//echo $username.'[XTURE]';
    return true;
  }else{
	//echo 'FAIL TO UPDATE';
	//echo $username.'[XFALSE]';
    return false;
  }
}
?>