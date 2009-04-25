<?php
include('config.php');

mysql_connect($accessdata['host'],$accessdata['username'],$accessdata['password']) or die(mysql_error());
mysql_select_db($accessdata['database']) or die(mysql_error());
//echo 'Hello';
if($_POST['map'] == 'galaxymap') {
header ("content-type: text/xml");
$db_table = $accessdata['prefix']."galaxy";
$query = "SELECT * FROM $db_table";
$result = mysql_query($query) or die(mysql_error());
$bodycontent .= '<data>';
while ($row = mysql_fetch_array($result)) {
$bodycontent .= '<map>';
$bodycontent .= '<id>'.$row['id'].'</id>';
$bodycontent .= '<name>'.$row['name'].'</name>';
$bodycontent .= '<x>'.$row['x'].'</x>';
$bodycontent .= '<y>'.$row['y'].'</y>';
$bodycontent .= '<z>'.$row['z'].'</z>';
$bodycontent .= '</map>';
}
$bodycontent .= '</data>';
echo $bodycontent;
}

if($_POST['map'] == 'solarsystemmap') {
	header ("content-type: text/xml");
	$db_table = $accessdata['prefix']."solarsystem";
	$query = "SELECT * FROM $db_table WHERE idgalaxy='{$_POST['galaxyid']}'";
	$result = mysql_query($query) or die(mysql_error());
	$bodycontent .= '<data>';
	while ($row = mysql_fetch_array($result)) {
		$bodycontent .= '<map>';
		$bodycontent .= '<id>'.$row['id'].'</id>';
		$bodycontent .= '<name>'.$row['name'].'</name>';
		$bodycontent .= '<x>'.$row['x'].'</x>';
		$bodycontent .= '<y>'.$row['y'].'</y>';
		$bodycontent .= '<z>'.$row['z'].'</z>';
		$bodycontent .= '</map>';
	}
	$bodycontent .= '</data>';
	echo $bodycontent;
	//echo 'hello';
}

if($_POST['map'] == 'planetmmap') {
	header ("content-type: text/xml");
	$db_table = $accessdata['prefix']."planet";
	$query = "SELECT * FROM $db_table WHERE idsolarsystem='{$_POST['solarsystemid']}'";
	$result = mysql_query($query) or die(mysql_error());
	$bodycontent .= '<data>';
	while ($row = mysql_fetch_array($result)) {
		$bodycontent .= '<map>';
		$bodycontent .= '<id>'.$row['id'].'</id>';
		$bodycontent .= '<name>'.$row['name'].'</name>';
		$bodycontent .= '<ringradius>'.$row['ringradius'].'</ringradius>';
		$bodycontent .= '<ownername>'.$row['ownername'].'</ownername>';
		$bodycontent .= '<size>'.$row['size'].'</size>';
		$bodycontent .= '</map>';
	}
	$bodycontent .= '</data>';
	echo $bodycontent;
	//echo 'hello';
}

?>