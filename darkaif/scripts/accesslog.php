<?php
/**
* ...
* @author Darknet
* Copy Rights (c) http://darkaif.googlecode.com
*/
//===============================================
//Building Safe Login Area
//===============================================
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

#==================================================================================================
# SESSION DEFAULT
#==================================================================================================
function session_defaults() {
$time = time();
$_SESSION['logged'] = false;
$_SESSION['username'] = null;
$_SESSION['cookie'] = 'darkaif'; // Deafault name to look up for our cookie
$_SESSION['remember'] = false;
setcookie($_SESSION['cookie'],$_SESSION['uid'],$time-COOKIETIME-3600);
$_SESSION['uid'] = null;
}
#==================================================================================================
# Debug
#==================================================================================================
function session_debug(){
#echo '<hr>';
if ($_SESSION['logged'] == true){$logded_msg =  'true';}else{$logded_msg =  'false';}
   echo 'logged: ' . $logded_msg;
   echo '<br> uid: '.$_SESSION['uid'];
   echo '<br> username: '.$_SESSION['username'];
   echo '<br>cookie: '.$_SESSION['cookie'];
   echo '<br>cookie sub: '.$_COOKIE[$_SESSION['cookie']];

if ($_SESSION['remember'] == true){ $remember_msg =  'true';}else{$remember_msg =  'false';}
echo '<br>remember: '.$remember_msg.'<hr>';
}
#==================================================================================================
# CHECK COOKIES
#==================================================================================================
function check_cookies(){
 if (!isset($_COOKIE[$_SESSION['cookie']])){return false;}else{return true;}
}
#==================================================================================================
# ACTIONS
#==================================================================================================
if ($_GET['action'] == 'logout'){
   session_logout();
   session_defaults();
}
//==== URL ACTIONS ==== START //
if ($_GET['action'] == 'register'){
	if (!isset($_POST['submit'])){
		echo text_register();
	}else{
		include('log_register.php');
	}
}
if ($_GET['action'] == 'forgotpassword'){}
if ($_GET['action'] == 'login'){
//echo 'LOGIN AREA';
//echo $_POST['userid'].":".$_POST['password'];
checkmember($_POST['userid'],$_POST['password']);
}
//==== URL ACTIONS ENDS ==== //
function checkmember($usermember,$userpassword){
$offset = 0; // initial offset is 0
while ($offset = strpos($_SERVER['REQUEST_URI'], "/",$offset + 1)){
      $current_dirno = $offset;
}
$accesspage_login_url = substr($_SERVER['REQUEST_URI'],$current_dirno + 1);
if ($accesspage_login_url == null){
$accesspage_login_url = 'index.php';
}
//echo $accesspage_login_url;
         //SET UP TABLE
         $db_members = DB_PREFIX."members";
         //echo "[".$db_members."]";
         //echo $usermember;
         //echo $userpassword;
         //SELECT TABLE
         $query = "select * from $db_members where username='$usermember' and password='$userpassword'";
         $sql = mysql_query($query) or die(mysql_error());
         $count = mysql_num_rows($sql); //This help if there any member exist in the data base if '1' or not '0' to be exist!
         //echo $count;
         $row = mysql_fetch_array($sql);
         //echo $row['id'];
         if ($row['ban'] == 1){
            echo 'BAN IN EFFECT';
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

            setcookie($_SESSION['cookie'],$_SESSION['uid'],$time+COOKIETIME);                           // SET COOKIE
            #echo COOKIETIME.' '.$_SESSION['uid'];
            mysql_query("UPDATE $db_members SET status='online',ip_address='$urip',session='$HASHUID'
            WHERE id= '$ID_MEMBER'")or die(mysql_error());
            $_SESSION['logged'] = true;
            header("Location:index.php"); //current dir
         }else{
               //$_SESSION['logged'] = false;
               //echo 'MEMBER DO NOT EXIST!';
         }
         }//BAN IF
}
#==================================================================================================
# Logout member
#==================================================================================================
function session_logout(){
         $accesspage_login_url = 'index.php'; //REDIRECT URL PAGE TO MAIN PAGE
         $db_members = DB_PREFIX."members";
         $urip = $_SERVER['REMOTE_ADDR'];
         $usermember = $_SESSION['username'];
         $UID_SESSION = $_SESSION['uid'];
         $time = time();
         //DATABASE CONNECT
         setcookie($_SESSION['cookie'],$_SESSION['uid'],$time-COOKIETIME);
         mysql_query("UPDATE $db_members SET status='offline',session=''
         WHERE session='$UID_SESSION' AND ip_address='$urip' AND name='$usermember'")or die(mysql_error());
         header("Location:$accesspage_login_url"); //current dir
}
//=================================================================================================
// CHECK LOGIN UID AND USERNAME
//=================================================================================================
function session_memberlogin(){
$offset = 0; // initial offset is 0
while ($offset = strpos($_SERVER['REQUEST_URI'], "/",$offset + 1)){
      $current_dirno = $offset;
}
$accesspage_login_url = substr($_SERVER['REQUEST_URI'],$current_dirno + 1);
if ($accesspage_login_url == null){
$accesspage_login_url = 'index.php';
}elseif ($_GET['action'] == 'login'){
$accesspage_login_url = 'index.php';
}
  $db_members = DB_PREFIX."members";
  $urip = $_SERVER['REMOTE_ADDR'];
  $usermember = $_SESSION['username'];
  $UID_SESSION = $_SESSION['uid'];

  $query = "select * from $db_members where name='$usermember' AND session='$UID_SESSION' AND ip_address='$urip'";
  $sql = mysql_query($query) or die(mysql_error());
  $count = mysql_num_rows($sql); //This help if there any member exist in the data base if '1' or not '0' to be exist!
  if ($count > 0){
     #echo 'MEMBER EXIST!<br>';
     $row = mysql_fetch_array($sql);
     #echo $row['realname'].'<br>';
     //echo 'test';
     $_SESSION['name'] = $row['name'];
     $urip = $_SERVER['REMOTE_ADDR'];                                                             // IP MEMBER
     $time = time();                                                                              // TIME
     $ID_MEMBER = $row['id'];                                                                     // ID MEMBER
     $HASHUID = md5($row['id'].$time);                                                            // ID & TIME HASH
     $_SESSION['uid'] = $HASHUID;                                                                 // SESSION UID HASH

     setcookie($_SESSION['cookie'],$_SESSION['uid'],$time+COOKIETIME);                           // SET COOKIE
     #echo COOKIETIME.' '.$_SESSION['uid'];
     mysql_query("UPDATE $db_members SET status='online',ip_address='$urip',session='$HASHUID'
     WHERE id= '$ID_MEMBER'")or die(mysql_error());
     $_SESSION['logged'] = true;
     header("Location:$accesspage_login_url"); //current dir
     }else{
           $_SESSION['logged'] = false;
           #echo 'MEMBER DO NOT EXIST!';
     }
}
#==================================================================================================
# COOKIES CHECK
#==================================================================================================
if (check_cookies()== true){
//echo 'Cookies is On';
}else{
  //echo 'Cookies is Off';
  if ($_SESSION['remember'] == true){//If remember is set to ture then checkon the cookie
  session_memberlogin();
  }else{
    if ($_POST['loginpage'] == true){//Incase it over ride the order of codes
    }else{
      session_defaults();
    }
  }
}
?>