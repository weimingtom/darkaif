<?php

function send_mail($email,$subject,$message){
  include('config.php');
  require_once("Mail.php");
$settings;
$db_settings = $prefix."settings";
         //echo $db_members;
         $query = "select * from $db_settings";
         $sql = mysql_query($query) or die(mysql_error());
         //$row = mysql_fetch_array($sql);

         //echo $row['variable'];
         while ($row = mysql_fetch_array($sql)) {
               #echo '<br>'.$row["variable"]. " | ".$row["value"]. "-".$row["description"];
               $settings[$row["variable"]] = $row["value"];
         }
#echo '<br>-----'.$settings['sendmail_from'];

$recipients = $email;
$headers["From"] = $settings['sendmail_from'];
$headers["To"] = $email;
$headers["Subject"] = $subject;
$mailmsg = $message;


$smtpinfo["host"] = $settings['smtp_host'];
$smtpinfo["port"] = $settings['smtp_port'];
if ($settings['smtp_auth'] == 'true'){$auth = true;}else{$auth = false;}
$smtpinfo["auth"] = $auth;
$smtpinfo["username"] = $settings['smtp_login'];
$smtpinfo["password"] = $settings['smtp_pass'];

$mail_object =& Mail::factory("smtp", $smtpinfo);
$mail_object->send($recipients, $headers, $mailmsg);
/*
echo '<br>] '.$headers["From"];
echo '<br>] '.$headers["To"];
echo '<br> ]'.$subject;
echo '<br> ]'.$message;

echo '<br>] '.$smtpinfo["host"];
echo '<br>] '.$smtpinfo["port"];
echo '<br>] '.$smtpinfo["auth"];
echo '<br>] '.$smtpinfo["username"];
echo '<br>] '.$smtpinfo["password"];
echo '<br>hello';
*/
}



?>