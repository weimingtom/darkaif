<?php
session_start();

function system_logout(){
        session_unregister("username");
		session_unregister("hashsession");
}
//$_SESSION['username']
function loginplanel(){
	include('config.php');
	$accesspage_login_url = 'index.php?action=login';
	$menuname_bgcolor = "#646060";
	$menuborder_bgcolor = "#FFFFFF";

	if ((strpos($_SERVER['REQUEST_URI'],"sources") >= 1)){$img_location = '"../access/captcha.php"';}else{$img_location = '"sources/access/captcha.php"';}
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
         if ($register > 0){
         $logstring .= ' <a href="?action=register">Register</a> ';
         }else{
         $logstring .= ' Register [Disable] ';
         }
	 $logstring .= '</td></tr></table></td></form></tr></table>';
      return $logstring;
} //End Function

if($_GET['action'] == 'login') {

	$db_table = $accessdata['prefix']."member";
	$query = "SELECT * FROM $db_table WHERE username='{$_POST['userid']}' AND password='{$_POST['password']}'";
	$result = mysql_query($query) or die(mysql_error());
	$row = mysql_fetch_array($result);

	$date = date('YmdHis');
	$date = $date + 100;//one hour
	$hashsession = md5($date);

	if ($row['username'] == $_POST['userid']) {
		//create session control
		$db_table2 = $accessdata['prefix']."member";
		$query2 = "UPDATE $db_table2 SET session='{$hashsession}', sessiontime='{$date}' WHERE id='{$row['id']}'";
		$sql = mysql_query($query2) or die(mysql_error());
		
		$db_table = $accessdata['prefix']."planet";
		$query3 = "SELECT * FROM $db_table WHERE id='{$row['homeplanetid']}'";
		$result3 = mysql_query($query3) or die(mysql_error());
		$row3 = mysql_fetch_array($result3);
		
		$db_table = $accessdata['prefix']."solarsystem";
		$query4 = "SELECT * FROM $db_table WHERE id='{$row3['idsolarsystem']}'";
		$result4 = mysql_query($query4) or die(mysql_error());
		$row4 = mysql_fetch_array($result4);
		
		$_SESSION['username'] = $row['username'];
		$_SESSION['hashsession'] = $hashsession;
	}else {
	
	}
}
if($_GET['action'] == 'logout') {
	system_logout();
}

if (!$_SESSION['hashsession']){
	echo loginplanel();
}


?>