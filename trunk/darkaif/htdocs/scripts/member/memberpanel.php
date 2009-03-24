<?php
/**
* ...
* @author Darknet
* Copy Rights (c) http://darkaif.googlecode.com
*/

//echo 'hello member panel';

$db_members = DB_PREFIX."members";
$username = $_SESSION['username'];
$query = "select * from $db_members where username='$username'";
$sql = mysql_query($query) or die(mysql_error());
$count = mysql_num_rows($sql); //This help if there any member exist in the data base if '1' or not '0' to be exist!
//echo $count;
$row = mysql_fetch_array($sql);

//$_SESSION['username'] = $row['name'];
#echo $row['name'];

$menuname_bgcolor = "#646060";
$menuborder_bgcolor = "#FFFFFF";

$body .= '
<br>
<center>
<table width="300" border="1" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
<tr>
<td>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="'.$menuborder_bgcolor.'">
<tr>
<td colspan="3" bgcolor="'.$menuname_bgcolor.'"><strong>Member Accout</strong></td>
</tr>

<tr>
<td width="78">Name</td>
<td width="6">:</td>
<td width="294">'.$row['name'].'</td>
</tr>

<tr>
<td width="78">First Name</td>
<td width="6">:</td>
<td width="294">'.$row['firstname'].'</td>
</tr>

<tr>
<td width="78">Last Name</td>
<td width="6">:</td>
<td width="294">'.$row['lastname'].'</td>
</tr>

<tr>
<td width="78">Gender</td>
<td width="6">:</td>
<td width="294">'.$row['gender'].'</td>
</tr>

<tr>
<td width="78">Birthday</td>
<td width="6">:</td>
<td width="294">'.$row['birthday'].'</td>
</tr>

<tr>
<td width="78">email</td>
<td width="6">:</td>
<td width="294">'.$row['email'].'</td>
</tr>

<tr>
<td width="78">Fame</td>
<td width="6">:</td>
<td width="294">'.$row['fame'].'</td>
</tr>

<tr>
<td width="78">Rank</td>
<td width="6">:</td>
<td width="294">'.$row['rank'].'</td>
</tr>

<tr>
<td width="78">Credits Points</td>
<td width="6">:</td>
<td width="294">'.$row['credit_points'].'</td>
</tr>

<tr>
<td width="78">Money Points</td>
<td width="6">:</td>
<td width="294">'.$row['money_points'].'</td>
</tr>

<tr>
<td width="78">Cash Points</td>
<td width="6">:</td>
<td width="294">'.$row['cash_points'].'</td>
</tr>
</table></td></tr></table>

</center><br>';


/*
$body .= '<br>Name:'.$row['name'];
$body .= '<br>First Name:'.$row['firstname'];
$body .= '<br>Last Name:'.$row['lastname'];
$body .= '<br>Gender:'.$row['gender'];
$body .= '<br>Birthday:'.$row['birthday'];
$body .= '<br>email:'.$row['email'];
$body .= '<br>';
$body .= '<br>fame:'.$row['fame'];
$body .= '<br>rank:'.$row['rank'];
$body .= '<br>';
$body .= '<br>Credits:'.$row['credit_points'];
$body .= '<br>Credits:'.$row['money_points'];
$body .= '<br>Credits:'.$row['cash_points'];
$body .= '<br>';
*/
$MainContent .= $body;

?>