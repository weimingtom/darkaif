<?php
//=================================================================================================
//
//=================================================================================================
//echo 'REGISTER PANEL';
//This section will handle the register account for added the new member.
session_start(); //You need to start this code for the session to be working
//Method of Registration: 0 = Disable 1 = Normal, 2 = Email Auth, 3 = Admin Auth
//echo '<br>'.md5($_POST['code']) . '-' .$_SESSION['key'];
if (!empty($_POST['Fname'])and !empty($_POST['Lname'])and !empty($_POST['gender']) and !empty($_POST['userid'])and($_POST['password'] == $_POST['verify_password'])and($_POST['email'] == $_POST['verify_email'])and(strpos($_POST['email'],".") >= 1)and(strpos($_POST['email'],"@") >= 1)and($_POST['agree'] == 'yes')and (md5($_POST['code'])== $_SESSION['key'])and (checkmember_exist($_POST['userid'],$_POST['email']) == false)){
  //$validation_code = md5(time().$_POST['email']);
  $is_activated = 0;
   register_member($_POST['Fname'],$_POST['Lname'],$_POST['gender'],$_POST['userid'],$_POST['password'],$_POST['email'],$is_activated,$validation_code);
   #echo 'pass';
}else{
$MainContent .= '<div id="hmenu"><ul></ul><div> <br> <center>';
$MainContent .= '<font color="red">-REGISTER FAIL-</font>';
$MainContent .= text_register();
$MainContent .= '</center> <br> <div id="hmenu"><ul></ul><div>';
}
//=================================================================================================
// This will check user and email if exist
//=================================================================================================
function checkmember_exist($usermember,$email){
         $db_members = DB_PREFIX."members";
         //echo $db_members;
         $query = "select * from $db_members where username='$usermember' or email='$email'";
         $sql = mysql_query($query) or die(mysql_error());
         $count = mysql_num_rows($sql); //This help if there any member exist in the data base if '1' or not '0' to be exist!
         $row = mysql_fetch_array($sql);
         if ($count > 0){ //IF THERE ONE MEMBER MATCHING THIS NAME
            //echo 'yes';
            if ($row['name'] == $usermember){
               $MainContent .= '<center><font color="red">User Name Exist Try Another Name</font></center>';
            }
            if ($row['email'] == $email){
               $MainContent .= '<center><font color="red">Email Exist Try Another Email</font></center>';
            }
            #echo '<br>'.$row['name'];
            #echo '<br>'.$row['email'];
            echo $MainContent;
            return true;

         }else{
           //echo 'no';
           return false;
         }
}
//=================================================================================================
// Register the member
//=================================================================================================
function register_member($firstname,$lastname,$gender,$username,$password,$useremail,$is_activated,$validation_code){
//This part help the code where the current local for the settings or config to get access to the database
/*
if (strlen(strstr($_SERVER['REQUEST_URI'], 'scripts')) > 1) {
	require('../config.php');
	#echo "[-scripts folder-]";
}else{
	require('scripts/config.php');
	#echo "[-localhost-]";
}
*/
require('config.php');
include('mail_site.php');
if ($register > 0){
mysql_connect($host,$user,$pass) or die(mysql_error());
mysql_select_db($database) or die(mysql_error());
$db_members = $prefix."members";
$urip = $_SERVER['REMOTE_ADDR'];
$datestamp =  date('Y-m-d-H-i-s');
$md_membername = md5($username);
$memberpassword = $password;
$coded_password = md5($memberpassword);
$LCusername =  strtolower($username);

$mailsubject = 'Your Account from '.$sitename;
$mailmessage .= 
'Welcome to '.$sitename.'.

Your Account Information:
-------------------------------------------------
User Name:'.$username.'
Password:'.$password.'
-------------------------------------------------';
//===============================================================================================//
// Normal
//===============================================================================================//
if($register == 1){
$is_activated = '1';
$message = '<font color="green">You been Register!<br> You can now login into the site.</font>';

}
//===============================================================================================//
// Activate Key
//===============================================================================================//
if($register == 2){
$is_activated = '0';
$validation_code = md5(time().$_POST['email']);
$mailmessage .='
-------------------------------------------------
Link:'.$siteurl.'?action=activatekey
Key Code:'.$validation_code.'
-------------------------------------------------';
$message = '<font color="green">You been Register!</font><br> <font color="red">Email will send to you for verify email address.</font>';
}
//===============================================================================================//
// Admin Approval
//===============================================================================================//
if($register == 3){
$is_activated = '0';
$mailmessage .='
-------------------------------------------------
You Have you wait for Admin Approval to get access to this site.
-------------------------------------------------';
$message = '<font color="green">You been Register!</font><br> <font color="red">You have to wait for Admin Approval to get access to this site.</font>';
}
//===============================================================================================//
//===============================================================================================//
$mailmessage .='
You created your account at '.$siteurl.' from that site. Save your information in case you forgot.

Thank you for joining our site.';

send_mail($useremail,$mailsubject,$mailmessage);


mysql_query("INSERT INTO $db_members
       (id_encrypt,date_register,ip_address,status,status_no,title,firstname,lastname,gender,name,username,password,p_encrypt,email,is_activated,validation_code)
VALUES('$md_membername','$datestamp','$urip','offline','0','Member','$firstname','$lastname','$gender','$username','$LCusername','$memberpassword','$coded_password ','$useremail','$is_activated','$validation_code')")
or die(mysql_error());

//message
$MainContent .= '<center>';
$MainContent .= $message;
$MainContent .= '</center>';

//echo 'register member code';
}else{
$MainContent .= '<center>';
$MainContent .= '<font color="red">[-Register Disable-]</font>';
$MainContent .= '</center>';
}
echo $MainContent;//doesn't link to the main content
}
?>