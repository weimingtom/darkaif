<?php
$tablestyle = ' style="border:1px solid #363430;" ';
$tablestyle2 = ' style="border:1px solid #363430;background:#22201d;" ';

if($_GET['accounts'] == 'index'){
  $db_table = $prefix."members";
	$bodycontent .= '[status]';
	$query = "SELECT * FROM $db_table ";
	$result = mysql_query($query) or die(mysql_error());
	#$row = mysql_fetch_array($result);
	$num_rows = mysql_num_rows($result);
	$bodycontent .= '<br>[Number of members]:'.$num_rows;
	
	$bodycontent .= '<br>[Number of moderators]:'.'none';
	$bodycontent .= '<br>[Number of game masters]:'.'none';
	$bodycontent .= '<br>[Number of administrators]:'.'none';
}
else if($_GET['accounts'] == 'members'){

	$bodycontent .= '[status]';
	$db_table = $prefix."members";
	$query = "SELECT * FROM $db_table";
	$result = mysql_query($query) or die(mysql_error());

	$bodycontent .= '<table width="100%">';
	$bodycontent .= '<tr>
            <td '.$tablestyle2.' >Member Name:</td>
            <td '.$tablestyle2.' >Level Access:</td>
            <td '.$tablestyle2.' >Forum Access:</td>
            <td '.$tablestyle2.' >Valid Code:</td>
            <td '.$tablestyle2.' >Ban:</td>
            <td '.$tablestyle2.' >Actions:</td>
        </tr>';

	while ($row = mysql_fetch_array($result)) {
        $bodycontent .= '<tr>
            <td '.$tablestyle.' >'.$row['username'].'</td>
            <td '.$tablestyle.' >'.$row['access_level'].'</td>
            <td '.$tablestyle.' >'.$row['forum_access'].'</td>
            <td '.$tablestyle.' >'.$row['validation_code'].'</td>
            <td '.$tablestyle.' >'.$row['ban'].'</td>
            <td '.$tablestyle.' >'.'EDIT | DELETE'.'</td>
        </tr>';
        }
        $bodycontent .= '</table>';
}else if($_GET['accounts'] == 'registeruser'){

$bodycontent .='<table>';

$bodycontent .= '<form method="post" action="?accounts=register">';

$bodycontent .= '<tr><td>';
$bodycontent .= 'USER:'.'<input name="user" value="" />';
$bodycontent .= '</td></tr>';

$bodycontent .= '<tr><td>';
$bodycontent .= 'PASS:'.'<input name="pass" value="" />';
$bodycontent .= '</td></tr>';
//
$bodycontent .= '<tr><td>';
$bodycontent .= 'EMAIL:'.'<input name="email" value="" />';
$bodycontent .= '</td></tr>';

$bodycontent .= '<tr><td>';
$bodycontent .= 'Level:'.'<input name="level" value="1" />';
$bodycontent .= '</td></tr>';

$bodycontent .= '<tr><td>';
$bodycontent .= '<input type="submit" value="submit" />';
$bodycontent .= '</td></tr>';

$bodycontent .='</form>';
$bodycontent .='</table>';
$bodycontent .='';

}else if ($_GET['accounts'] == 'register') {
//echo $_POST['user'];
	if(!empty($_POST['name']) || !empty($_POST['pass']) || !empty($_POST['email'])) {
		$usernameaccount = $_POST['user'];
		$memberpassword = $_POST['pass'];
		$userlevel = $_POST['level'];
		$email = $_POST['email'];
		$db_members = $prefix."members";
		$urip = $_SERVER['REMOTE_ADDR'];
		$datestamp =  date('Y-m-d-H-i-s');
		//echo $usernameaccount."-".$memberpassword."-".$email;
		
		$md_membername = md5($usernameaccount);
		$memberpassword = $passwordaccount;
		$coded_password = md5($memberpassword);
		$LCusername =  strtolower($usernameaccount);
		
		$db_table = $prefix."members";
		$query = "SELECT * FROM $db_table WHERE username='{$LCusername}' or email='{$email}' ";
		$result = mysql_query($query) or die(mysql_error());

		//$row = mysql_fetch_array($result);
		//$count = mysql_num_rows($sql);
		$rows = mysql_num_rows($result);
		echo $rows;
		if($rows > 0) {
			//echo 'FOUND!';
			$bodycontent .= 'USER NAME OR EMAIL IS IN THE DATABASE...';
		}else {
			//echo 'NOT FOUND!';
			mysql_query("INSERT INTO $db_members
			(id_encrypt,date_register,ip_address,status,status_no,title,firstname,lastname,gender,name,username,password,p_encrypt,email,is_activated,validation_code)
			VALUES('$md_membername','$datestamp','$urip','offline','0','Member','','','s','$usernameaccount','$LCusername','{$_POST['pass']}','$coded_password ','$email','1','admin')")
			or die(mysql_error());
		}	
	}else {
		$bodycontent .= 'MISSING FIELD...';
	}
	
//$bodycontent .= $_POST['user'];
//$bodycontent .= '<br>' . $_POST['pass'];
}


?>