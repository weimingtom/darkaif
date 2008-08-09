<?php
/**
* ...
* @author Darknet
* Copy Rights (c) http://darkaif.googlecode.com
*
* This will support login access that it will be secson and not cookies that it will check user.
id
user
time
remember
logged
*/
session_start(); // This must at the top else it not work right
include('form.php');

define("LOGIN_ERROR",$login_error);
define("DB_SERVER",$Host);
define("DB_USER",$Username);
define("DB_PASSWORD",$Password);
define("DB_TABLE",$Database);
define("DB_PREFIX",$Prefix);
define("COOKIETIME",3600);//3600 = 1 hour

//DATABASE CONNECT SERVER
$db = mysql_connect(DB_SERVER,DB_USER,DB_PASSWORD) or die(mysql_error());
mysql_select_db(DB_TABLE,$db) or die(mysql_error());

function system_logout(){
        session_unregister ("username");
        session_unregister ("sign");
        session_unregister ("time");
}

if ($_GET['action'] == 'logout'){
   system_logout();
}
//==== URL ACTIONS ==== START //
if ($_GET['action'] == 'register'){
	if (!isset($_POST['submit'])){
           $MainContent .= '<div id="hmenu"><ul></ul><div>';
           $MainContent .= '<br><center>';
	   $MainContent .= text_register();
           $MainContent .= '</center><br>';
           $MainContent .= '<div id="hmenu"><ul></ul><div>';
	}else{
		include('log_register.php');
	}
}
if ($_GET['action'] == 'forgotpassword'){
	if (!isset($_POST['submit'])){
	   $MainContent .= '<div id="hmenu"><ul></ul><div>';
           $MainContent .= '<br><center>';
           $MainContent .= form_forgotpassword();
           $MainContent .= '</center><br>';
           $MainContent .= '<div id="hmenu"><ul></ul><div>';
	}else{
		include('log_forgot.php');
	        $MainContent .= getuser_email($_POST['userid'],$_POST['email']);
		//userid
	}
}
if (($_GET['action'] == 'login')and(!empty($_POST['userid']))and(!empty($_POST['userid'])) ){
checkmember($_POST['userid'],$_POST['password']);
}
if ($_GET['action'] == 'activatekey'){
   if (!isset($_POST['submit'])){
      $MainContent .= '<div id="hmenu"><ul></ul><div>';
      $MainContent .= '<br><center>';
      $MainContent .= text_activate();
      $MainContent .= '</center><br>';
      $MainContent .= '<div id="hmenu"><ul></ul><div>';
   }else{
         if($_POST['activate_page']){
         //echo $_POST['userid'].'-'.$_POST['act_key'].'-'.$_POST['activate_page'];
                include('log_activatekey.php');
                if (register_keycheck($_POST['userid'],$_POST['act_key'])){
		   $MainContent .= '<div id="hmenu"><ul></ul><div><center><br><font color="green">E-MAIL AND KEY CODE ARE VERFITY! <br>Congratulation, you can now enter the website by login.</font></center><br> <div id="hmenu"><ul></ul><div>';
		   //echo '<center><font color="green">E-MAIL AND KEY CODE ARE VERFITY! <br>Congratulation, you can now enter the website by login.</font></center>';
               }else{
                     $MainContent .= '<div id="hmenu"><ul></ul><div><br><center><font color="red">KEY CODE FAIL!</font> <br> <a href="?action=activatekey">Activate Key</a></center><br><div id="hmenu"><ul></ul><div>';
                     //echo '<font color="red">KEY CODE FAIL!</font> <br> <a href="?action=activatekey">Activate Key</a>';
               }
               //echo 'check';
          }
   }
}
//==== URL ACTIONS ENDS ==== //
function checkmember($usermember,$userpassword){
  //echo '<br>'.$usermember;
  //echo '<br>'.$userpassword;
  //echo '<br>';
$offset = 0; // initial offset is 0
while ($offset = strpos($_SERVER['REQUEST_URI'], "/",$offset + 1)){
      $current_dirno = $offset;
}
$accesspage_login_url = substr($_SERVER['REQUEST_URI'],$current_dirno + 1);
if ($accesspage_login_url == null){
$accesspage_login_url = 'index.php';
}
         $db_members = DB_PREFIX."members";
         //echo $db_members;
         $query = "select * from $db_members where username='$usermember' and password='$userpassword'";
         $sql = mysql_query($query) or die(mysql_error());
         $count = mysql_num_rows($sql); //This help if there any member exist in the data base if '1' or not '0' to be exist!
         //echo $count;
         $row = mysql_fetch_array($sql);
         //echo $row['id'];
         if ($count == 0){
            $MainContent .= '<center>';
            $MainContent .= '<a href="index.php?action=forgotpassword">Forgot User/Password?</a>';
            $MainContent .= '</center>';
         }
         if (($row['ban'] == 1)or ($row['access_level'] == 0)or ($row['is_activated'] == 0)){
           if ($count > 0){
              if ($row['ban'] == 1){
                 $MainContent .= '<center>';
                 $MainContent .= '<font color="red">BAN IN EFFECT</font>';
                 $MainContent .= '</center>';
              }
              if ($row['access_level'] == 0){
                 $MainContent .= '<center>';
                 $MainContent .= "<font color='red'>You don't have access to login in. You have to wait for Admin Approval.</font>";
                 $MainContent .= '</center>';
              }
              if ($row['is_activated'] == 0){
                 $MainContent .= '<center>';
                 $MainContent .= "<font color='red'>You don't have email verify or Admin Approval.</font>";
                 $MainContent .='</center>';
              }
           }
         }else{
         if ($count > 0){ //IF THERE ONE MEMBER MATCHING THIS NAME
            //echo 'MEMBER EXIST!<br>';
            //echo $row['name'].'<br>';
            $_SESSION['username'] = $row['name'];
            $urip = $_SERVER['REMOTE_ADDR'];                                                             // IP MEMBER
            $time = time();                                                                              // TIME
            $ID_MEMBER = $row['id'];                                                                     // ID MEMBER
            $HASHUID = md5($row['id'].$time);                                                            // ID & TIME HASH
            $_SESSION['uid'] = $HASHUID;                                                                 // SESSION UID HASH
            if ($_POST['set'] == 'ON'){
               $_SESSION['remember'] = true;
            }else{
              $_SESSION['remember'] = false;
            }

            //setcookie($_SESSION['cookie'],$_SESSION['uid'],$time+COOKIETIME);                           // SET COOKIE
            #echo COOKIETIME.' '.$_SESSION['uid'];
            mysql_query("UPDATE $db_members SET status='online',ip_address='$urip',session='$HASHUID'
            WHERE id= '$ID_MEMBER'")or die(mysql_error());
            $_SESSION['logged'] = true;
            header("Location:index.php"); //current dir
         }
               //$_SESSION['logged'] = false;
               //echo 'MEMBER DO NOT EXIST!';
         }//BAN IF
         echo $MainContent;
}

//===============================================================================================//
// LOGIN CHECK FUNCTION
//===============================================================================================//
function login_check(){
         if (!$_SESSION['username']){
            //echo '<br>'.'username no';
            return false;
         }else{
               //echo '<br>'.'username nope'.$_SESSION['username'];
               return true;
         }
}
//===============================================================================================//

?>