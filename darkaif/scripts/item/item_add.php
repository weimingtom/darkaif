<?php
/**
* ...
* @author Darknet
* Copy Rights (c) http://darkaif.googlecode.com
*/
require('../config.php');

mysql_connect($host,$user,$pass) or die(mysql_error());
mysql_select_db($database) or die(mysql_error());
$db_shopitem = $prefix."shopitem";

//$query="INSERT into {$db_shopitem} (name,map,x,y,showimage) VALUES ('{$one}','{$two}','{$three}','{$four}','true')";

//$query = "SELECT * FROM $db_shopitem WHERE username='$username' AND password='$password'";
//$resultID = mysql_query($query) or die(mysql_error());

if (!isset($_POST['submit'])){
}else{
echo 'HELOE';
$itemname = $_POST['itemname'];
$itemid = md5($itemname);
$itemnamehash = md5($itemname);
$shopname = $_POST['shopname'];
$shopid = md5($shopname);
$itembuy = $_POST['buyprice'];
$itemsell = $_POST['sellprice'];
$datestamp =  date('YmdHis');
$timestamp =  date('His');
$query = "INSERT into {$db_shopitem} (shopid,shopname,nameid,name,namehash,buyprice,sellprice,time,date) 
VALUES ('$shopid','$shopname','$itemid','$itemname','$itemnamehash','$itembuy','$itemsell','$timestamp','$datestamp')";
mysql_query($query) or die(mysql_error());
}
echo '
<table border="1" cellpadding="0" cellspacing="0">
	<form method="POST" action="item_add.php">
	<tr>
		<td>
			Item Name
		</td>
		<td>
			Shop Name
		</td>
		<td>
			Buy Price
		</td>
		<td>
			Sell Price
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" size="16" maxlength="36" name="itemname" value="" class="input">
		</td>
		<td>
			<input type="text" size="16" maxlength="36" name="shopname" value="default" class="input">
		</td>
		<td>
			<input type="text" size="16" maxlength="36" name="buyprice" value="1" class="input">
		</td>
		<td>
			<input type="text" size="16" maxlength="36" name="sellprice" value="1" class="input">
		</td>
	</tr>
		<tr>
		<td colspan="4">
			<center><input type="submit" value="submit" name="submit" class="input"></center>
		</td>
	</tr>
	</form>
</table>
';

$query = "SELECT * FROM $db_shopitem";
$resultID = mysql_query($query) or die(mysql_error());

$xml_output= '<shopitem>';
while ($rowID = mysql_fetch_array($resultID)){
	$xml_output.= '<item>';
    $xml_output.= '<shopname><br> '.$rowID['shopname'].' </shopname>';
	$xml_output.= '<itemname> '.$rowID['name'].' </itemname>';
	$xml_output.= '<buyprice> '.$rowID['buyprice'].' </buyprice>';
	$xml_output.= '<sellprice> '.$rowID['sellprice'].' </sellprice>';
	$xml_output.= '</item>';
}
$xml_output.= '</shopitem>';
echo $xml_output;
?>