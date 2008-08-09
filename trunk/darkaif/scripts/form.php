<?php
/**
* ...
* @author Darknet
* Copy Rights (c) http://darkaif.googlecode.com
*/

function check_url(){
    $logstring = '';
    //Use the currently url link to be able to login on the same page
    $offset = 0; // initial offset is 0
    while ($offset = strpos($_SERVER['REQUEST_URI'], "/",$offset + 1)){
          $current_dirno = $offset;
    }
    $accesspage_login_url = substr($_SERVER['REQUEST_URI'],$current_dirno + 1);
    if ($accesspage_login_url == 'index.php'){
       $accesspage_login_url = 'index.php?action=login';
    }elseif ($accesspage_login_url == null){
            $accesspage_login_url = 'index.php?action=login';
    }
}
function sheck_captchadir(){
         if ((strpos($_SERVER['REQUEST_URI'],"sources") >= 1)){
            $img_location = '"../access/captcha.php"';
         }else{
               $img_location = '"sources/access/captcha.php"';
         }
         return $img_location;
}
#==================================================================================================
# MEMBER LOGIN SCREEN
#==================================================================================================
function logintext(){
$accesspage_login_url = 'index.php?action=login';

$menuname_bgcolor = "#646060";
$menuborder_bgcolor = "#FFFFFF";

//echo $accesspage_login_url;
   //Check the link for the image key location
   if ((strpos($_SERVER['REQUEST_URI'],"sources") >= 1)){$img_location = '"../access/captcha.php"';}else{$img_location = '"sources/access/captcha.php"';}
#<div class="box-wrapper" !--style="position: relative;"-->
      $logstring .= 
'<table width="300" border="1" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
<tr>
<form name="form1" method="post" action="'.$accesspage_login_url.'">
<td>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="'.$menuborder_bgcolor.'">
<tr>
<td colspan="3" bgcolor="'.$menuname_bgcolor.'"><strong>Member Login </strong></td>
</tr>
<tr>
<td width="78">Username</td>
<td width="6">:</td>
<td width="294"><input name="userid" type="text" id="myusername"></td>
</tr>
<tr>
<td>Password</td>
<td>:</td>
<td><input name="password" type="text" id="mypassword"></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><input type="hidden" name="loginpage" value="true">
	<input type="submit" name="Submit" value="Login">';
	$logstring .= '<a href="?action=register"> sign up </a>';
	 $logstring .= '</td></tr></table></td></form></tr></table>';
      return $logstring;
} //End Function

/* ================================================================================================

================================================================================================ */
function text_register(){
//if ((strpos($_SERVER['REQUEST_URI'],"sources") >= 1)){$img_location = '"../access/captcha.php"';}else{$img_location = '"sources/access/captcha.php"';}
$img_location = "scripts/captchahrash.php";
              /*
         $logstring .='<center><form method="post" action="'.$submitpage.'">
         <table border="1" cellpadding="0" cellspacing="0" bgcolor="gray">
         <tr bgcolor=#383E40><td colspan=2 class="tbbr_title">
         <center><font color=white>Register Form</font></center>
         </td></tr>
         <tr>
         <td  class="tbbr">First Name:</td>
         <td  class="tbbr"><input type="text" size="12" maxlength="12" name="Fname" value="'.$_POST['Fname'].'" class="input">
         </td></tr>
         <tr><td  class="tbbr">Last Name:</td>
         <td  class="tbbr"><input type="text" size="12" maxlength="36" name="Lname" value="'.$_POST['Lname'].'" class="input"></td></tr>
         <tr><td  class="tbbr">Gender:</td><td  class="tbbr">';
         if ($_POST['gender'] == "Male"){
            $logstring .='Male<input type="radio" value="Male" name="gender" checked="checked"> Female<input type="radio" value="Female" name="gender" >';
         }elseif ($_POST['gender'] == "Female"){
            $logstring .='Male<input type="radio" value="Male" name="gender"> Female<input type="radio" value="Female" name="gender" checked="checked">';
         }else{
               $logstring .='Male<input type="radio" value="Male" name="gender"> Female<input type="radio" value="Female" name="gender">';
         }
         $logstring .='</td></tr>
         <tr><td  class="tbbr">User ID:</td><td  class="tbbr"><input type="text" size="12" maxlength="12" name="userid" value="'.$_POST['userid'].'" class="input"><br></td></tr>
         <tr><td  class="tbbr">Password:</td><td  class="tbbr"><input type="text" size="12" maxlength="36" name="password" value="'.$_POST['password'].'" class="input"></td></tr>
         <tr><td  class="tbbr">Verify Password:</td><td  class="tbbr"><input type="text" size="12" maxlength="30" name="verify_password" value="'.$_POST['verify_password'].'" class="input"></td></tr>
         <tr><td  class="tbbr">E-mail:</td><td  class="tbbr"><input type="text" size="30" maxlength="50" name="email" value="'.$_POST['email'].'" class="input"></td></tr>
         <tr><td  class="tbbr">Verify E-mail:</td><td  class="tbbr"><input type="text" size="30" maxlength="50" name="verify_email" value="'.$_POST['verify_email'].'" class="input"></td></tr>
         <tr><td colspan=2 class="tbbr"><center><img src='.$img_location.' border="1">
         <br><input type="text" size="20" maxlength="20" name="code"  class="input">
         <br><font color="white">[<input type="checkbox" name="agree" value="yes" checked="checked"> I Agree ] <a href="index.php?action=agreement" target="_blank">Agreement Terms</a></font></center></td></tr>
         <tr><td colspan=2 class="tbbr"><center>
         <input type="hidden" name="register" value="true">
         <input type="submit" value="submit" name="submit" class="input"></center></td></tr>
         </table></form></center>';
         return $logstring;
               */
         $accesspage_login_url = 'index.php?action=register';

$menuname_bgcolor = "#646060";
$menuborder_bgcolor = "#FFFFFF";

//echo $accesspage_login_url;
   //Check the link for the image key location
   //if ((strpos($_SERVER['REQUEST_URI'],"sources") >= 1)){$img_location = '"../access/captcha.php"';}else{$img_location = '"sources/access/captcha.php"';}
#<div class="box-wrapper" !--style="position: relative;"-->
      $logstring .= 
'<table width="300" border="1" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
<tr>
<form name="form1" method="post" action="'.$accesspage_login_url.'">
<td>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="'.$menuborder_bgcolor.'">
<tr>
<td colspan="3" bgcolor="'.$menuname_bgcolor.'"><strong>Register Form </strong></td>
</tr>
<tr>
<td width="78">First Name</td>
<td width="6">:</td>
<td width="294"><input type="text" size="12" maxlength="12" name="Fname" value="'.$_POST['Fname'].'" class="input"></td>
</tr>

<tr>
<td width="78">Last Name</td>
<td width="6">:</td>
<td width="294"><input type="text" size="12" maxlength="36" name="Lname" value="'.$_POST['Lname'].'" class="input"></td>
</tr>

<tr>
<td width="78">Gender</td>
<td width="6">:</td>
<td width="294">';
if ($_POST['gender'] == "Male"){
            $logstring .='Male<input type="radio" value="Male" name="gender" checked="checked"> Female<input type="radio" value="Female" name="gender" >';
         }elseif ($_POST['gender'] == "Female"){
            $logstring .='Male<input type="radio" value="Male" name="gender"> Female<input type="radio" value="Female" name="gender" checked="checked">';
         }else{
               $logstring .='Male<input type="radio" value="Male" name="gender"> Female<input type="radio" value="Female" name="gender">';
         }


$logstring .='

</td>
</tr>

<tr>
<td width="78">Username</td>
<td width="6">:</td>
<td width="294"><input type="text" size="12" maxlength="30" name="userid" value="'.$_POST['userid'].'" class="input">(3-30)</td>
</tr>
<tr>
<td>Password</td>
<td>:</td>
<td><input type="text" size="12" maxlength="30" name="password" value="'.$_POST['password'].'" class="input"></td>
</tr>

<tr>
<td>Re-Password</td>
<td>:</td>
<td><input type="text" size="12" maxlength="30" name="verify_password" value="'.$_POST['verify_password'].'" class="input"></td>
</tr>

<tr>
<td>Email</td>
<td>:</td>
<td><input type="text" size="30" maxlength="100" name="email" value="'.$_POST['email'].'" class="input"></td>
</tr>

<tr>
<td>Re-Email</td>
<td>:</td>
<td><input type="text" size="30" maxlength="100" name="verify_email" value="'.$_POST['verify_email'].'" class="input"></td>
</tr>


<tr>
<td><img src='.$img_location.' border="1"></td>
<td>:</td>
<td><input type="text" size="20" maxlength="20" name="code"  class="input">
</td>
</tr>
<tr>
<td colspan="3">
    <center><font color="white">[<input type="checkbox" name="agree" value="yes" checked="checked"> I Agree ] <a href="index.php?action=agreement" target="_blank">Agreement Terms</a></font></center>
</td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><input type="hidden" name="register" value="true">
	<input type="submit" name="submit" value="submit">';
	 $logstring .= '</td></tr></table></td></form></tr></table>';
      return $logstring;
}
/* ================================================================================================

================================================================================================ */
function text_activate(){
$accesspage_login_url = 'index.php?action=activatekey';
$menuname_bgcolor = "#646060";
$menuborder_bgcolor = "#FFFFFF";

//echo $accesspage_login_url;
   //Check the link for the image key location
   if ((strpos($_SERVER['REQUEST_URI'],"sources") >= 1)){$img_location = '"../access/captcha.php"';}else{$img_location = '"sources/access/captcha.php"';}
#<div class="box-wrapper" !--style="position: relative;"-->
      $logstring .=
'<table width="300" border="1" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
<tr>
<form name="form1" method="post" action="'.$accesspage_login_url.'">
<td>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="'.$menuborder_bgcolor.'">
<tr>
<td colspan="3" bgcolor="'.$menuname_bgcolor.'"><strong>Activate Key Account</strong></td>
</tr>
<tr>
<td width="78">Username</td>
<td width="6">:</td>
<td width="294"><input name="userid" type="text" id="myusername"></td>
</tr>
<tr>
<td>Activate Key</td>
<td>:</td>
<td><input name="act_key" type="text"></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><input type="hidden" name="activate_page" value="true">
           <input type="submit" value="submit" name="submit" class="input">';
	 $logstring .= '</td></tr></table></td></form></tr></table>';
      return $logstring;
}
/* ================================================================================================

================================================================================================ */
function form_forgotpassword(){
$accesspage_login_url = 'index.php?action=forgotpassword';
$menuname_bgcolor = "#646060";
$menuborder_bgcolor = "#FFFFFF";

//echo $accesspage_login_url;
   //Check the link for the image key location
   if ((strpos($_SERVER['REQUEST_URI'],"sources") >= 1)){$img_location = '"../access/captcha.php"';}else{$img_location = '"sources/access/captcha.php"';}
#<div class="box-wrapper" !--style="position: relative;"-->
      $logstring .= 
'<table width="300" border="1" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
<tr>
<form name="form1" method="post" action="'.$accesspage_login_url.'">
<td>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="'.$menuborder_bgcolor.'">
<tr>
<td colspan="3" bgcolor="'.$menuname_bgcolor.'"><strong>Forgot User/Password</strong></td>
</tr>
<tr>
<td width="78">Username</td>
<td width="6">:</td>
<td width="294"><input name="userid" type="text" id="myusername"></td>
</tr>
<tr>
<td width="78"></td>
<td width="6"></td>
<td width="294">Either One</td>
</tr>
<tr>
<td>Email</td>
<td>:</td>
<td><input name="email" type="text"></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><input type="hidden" name="forgotpassword" value="true">
	<input type="submit" name="submit" value="submit">';
	 $logstring .= '</td></tr></table></td></form></tr></table>';
      return $logstring;
}

?>