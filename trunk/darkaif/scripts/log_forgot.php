<?php
//=================================================================================================
/*
  This handle sending password and user to the current owner of the account.
*/
//=================================================================================================
function getuser_email($username,$email){
  include('config.php');
  include('mail_site.php');
  $db_members = $prefix."members";
  $query = "SELECT * FROM $db_members WHERE username='$username' or email='$email'";
  $sql = mysql_query($query) or die(mysql_error());
  $count = mysql_num_rows($sql);
  $row = mysql_fetch_array($sql);
  if ($count > 0){
     //The format is is layout as is.
$emailsubject .= 'User and Password recovery from '.$sitename;
$emailmessage .= '
Welcome to user and password recovery email system.

Here is your information:
-------------------------------------------------
User:'.$row['username'].'
Password:'.$row['password'].'
-------------------------------------------------

This was an auto send by the user from '.$siteurl.'.

Please save your email where you can remember your account information. Do not share with anyone else. Thank you for using our service.
';
  send_mail($row['email'],$emailsubject,$emailmessage);
  $MainContent .= '<center><font color="green">Email has been send.</font></center>';
  }else{
  $MainContent .= '<center><font color="red">Error!</font></center>';
  }
  return '<div id="hmenu"><ul></ul><div><br>'.$MainContent.'<br><div id="hmenu"><ul></ul><div>';
}
?>