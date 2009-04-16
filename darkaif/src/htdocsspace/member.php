<?php
echo date(' Y-m-d : H:i:s ');
if($_GET['member'] == 'member') {
	$bodycontent .='<br>MEMBER SECTION';
}
else if($_GET['member'] == 'createmember') {

$bodycontent .= '<table>';
$bodycontent .= '<form method="post" action="?member=buildmember">';

$bodycontent .= '<tr>';
$bodycontent .= '<td>Creating Account</td>';
$bodycontent .= '</tr>';

$bodycontent .= '<tr>';
$bodycontent .= '<td>Username <input type="text" name="musername" value="guest">';
$bodycontent .= '</tr>';


$bodycontent .= '<tr>';
$bodycontent .= '<td>Password<input type="text" name="mpassword" value="guest"></td>';
$bodycontent .= '</tr>';

$bodycontent .= '<tr>';
$bodycontent .= '<td>Email: <input type="text" name="email" value="guest@guest.com"></td>';
$bodycontent .= '</tr>';

$bodycontent .= '<tr>';
$bodycontent .= '<td><input type="submit" value="submit"></td>';
$bodycontent .= '</tr>';

$bodycontent .= '</form>';
$bodycontent .= '</table>';
}
else if ($_GET['member'] == 'buildmember') {

$musername =  $_POST['musername'];
$musernamehash = md5($musername);
$mpassword = $_POST['mpassword'];
$mpasswordhash = md5($mpassword);
$memail = $_POST['email'];

$date = date('YmdHis');

$db_table = $accessdata['prefix']."member";
$query = "INSERT INTO $db_table
(userid,username,password,hashpassword,email,date)
VALUES('{$musernamehash}', '{$musername}', '{$mpassword}', '{$mpasswordhash}', '{$memail}', '{$date}')";
mysql_query($query)or die(mysql_error());
echo 'done';

}
else if ($_GET['member'] == 'memberlist') {
$db_table = $accessdata['prefix']."member";
$query = "SELECT * FROM $db_table";
$result = mysql_query($query) or die(mysql_error());

$bodycontent .= '<table border="1">';
$bodycontent .= '<tr><td>ID</td><td>User Name</td><td>Home Planet</td><td>Set Planet</td><td>Actions</td></tr>';
while ($row = mysql_fetch_array($result)) {

$bodycontent .= '<tr><td>'.$row['id'].'</td><td>'.$row['username'].'</td><td>'.$row['homeplanetid'].'</td><td>'.$row['setplanetid'].'</td><td>';
if ($row['homeplanetid'] == null){
	$bodycontent .= '<a href="?member=membersethomeplanet&memberid='.$row['id'].'">Set Home Planet</a>';
}
$bodycontent .= '</td></tr>';

}
$bodycontent .= '</table>';
}
else if ($_GET['member'] == 'membersethomeplanet') {
//echo 'HELLO?';
//$bodycontent .= 'HELLO?';
$memberid = $_GET['memberid'];
$db_table = $accessdata['prefix']."planet";
$query = "SELECT * FROM $db_table WHERE idowner IS NULL ";
$result = mysql_query($query) or die(mysql_error());
$resultcount = mysql_num_rows($result);
$randmatch = rand(0, $resultcount);
echo '<br>UNUSE PlANET:'. $resultcount;
$count = 0;
while ($row = mysql_fetch_array($result)) {
	$count++;
	if ($randmatch == $count) {
		echo '<br>RANDOM:>'. $row['id'];//planet id
		
		$db_table = $accessdata['prefix']."member";
		$query = "SELECT * FROM $db_table WHERE id='{$memberid}'";
		$result2 = mysql_query($query) or die(mysql_error());
		$row2 = mysql_fetch_array($result2);
		
		$db_table3 = $accessdata['prefix']."planet";
		$query3 = "UPDATE $db_table3 SET idowner='{$row2['userid']}',ownername='{$row2['username']}' WHERE id='{$row['id']}'";
		$sql = mysql_query($query3) or die(mysql_error());
		
		$db_table4 = $accessdata['prefix']."member";
		$query4 = "UPDATE $db_table4 SET homeplanetid='{$row['id']}',setplanetid='{$row['id']}' WHERE id='{$memberid}'";
		$sql = mysql_query($query4) or die(mysql_error());
		
		break;
	}
}

}

?>