<?php
//echo $bodycontent;
$tablestyle = ' style="border:1px solid #363430;" ';
$membername = 'guest';
#$bodycontent .= '';
if($_GET['maps'] =='index'){
$bodycontent .= '[Map Status]';

$db_table = $prefix."mapdata";
$query = "SELECT * FROM $db_table ";
$result = mysql_query($query) or die(mysql_error());
$num_rows = mysql_num_rows($result);
$bodycontent .= '<br>[Number of maps]:'.$num_rows;
$bodycontent .= '<br>[Number of flag maps]:'.'none';


}
else if($_GET['maps'] =='maps'){
$bodycontent .= '<table width="100%">';
$bodycontent .= '<tr style="border:1px solid #363430;">
	<td style="border:1px solid #363430;background:#22201d;">ID HASH</td>
	<td style="border:1px solid #363430;background:#22201d;">Name</td>
	<td style="border:1px solid #363430;background:#22201d;">Author</td>
	<td style="border:1px solid #363430;background:#22201d;">Flag</td>
	<td style="border:1px solid #363430;background:#22201d;">Date</td>
	<td style="border:1px solid #363430;background:#22201d;">Categories</td>
	<td style="border:1px solid #363430;background:#22201d;">Type</td>
	<td style="border:1px solid #363430;background:#22201d;">Actions</td>
</tr>';

$db_table = $prefix."mapdata";
$query = "SELECT * FROM $db_table ";
#echo $query;
$result = mysql_query($query) or die(mysql_error());
#$row = mysql_fetch_array($result);
#$bodycontent .= '[-]';

while ($row = mysql_fetch_array($result)) { //
#echo $row['idhash'];
#$bodycontent .= 
    $bodycontent .= '<tr style="border:1px solid #363430;">
	<td'.$tablestyle.'>'.$row['idhash'].'</td>
	<td'.$tablestyle.'>'.$row['name'].'</td>
	<td'.$tablestyle.'>'.$row['authorname'].'</td>
	<td'.$tablestyle.'>'.$row['flag'].'</td>
	<td'.$tablestyle.'>'.$row['date'].'</td>
	<td'.$tablestyle.'>Categories</td>
	<td'.$tablestyle.'>Type</td>
	<td'.$tablestyle.'> 
		<a href="?maps=edit&mapid='.$row['idhash'].'">EDIT</a> 
		<a href="?maps=delete&mapid='.$row['idhash'].'">DELETE</a> 
		</td>
	</tr>';
}

$bodycontent .= '</table>';
}
else if ($_GET['maps'] == 'edit') {
	$db_table = $prefix."mapdata";
	$query = "SELECT * FROM $db_table WHERE idhash='{$_GET['mapid']}'";
	#echo $query;
	$result = mysql_query($query) or die(mysql_error());
	#$row = mysql_fetch_array($result);
	#$bodycontent .= '[-]';
	$bodycontent .= '<table width="80%"><form method="post" action="?maps=update&mapid='.$_GET['mapid'].'">';
while ($row = mysql_fetch_array($result)) { //
#echo $row['idhash'];
#$bodycontent .= 

$bodycontent .= '
	<tr style="border:1px solid #363430;"><td style="border:1px solid #363430;background:#22201d;">ID HASH</td><td'.$tablestyle.'>'.$row['idhash'].'</td></tr>
	<tr style="border:1px solid #363430;"><td style="border:1px solid #363430;background:#22201d;">Name</td><td'.$tablestyle.'><input type="text" name="mapname" value="'.$row['name'].'"></td></tr>
	<tr style="border:1px solid #363430;"><td style="border:1px solid #363430;background:#22201d;">Author</td><td'.$tablestyle.'>'.$row['authorname'].'</td></tr>
	<tr style="border:1px solid #363430;"><td style="border:1px solid #363430;background:#22201d;">Flag</td><td'.$tablestyle.'>'.$row['flag'].'</td></tr>
	<tr style="border:1px solid #363430;"><td style="border:1px solid #363430;background:#22201d;">Date</td><td'.$tablestyle.'>'.$row['date'].'</td></tr>
	<tr style="border:1px solid #363430;"><td style="border:1px solid #363430;background:#22201d;">Categories</td><td'.$tablestyle.'>Categories</td></tr>
	<tr style="border:1px solid #363430;"><td style="border:1px solid #363430;background:#22201d;">Type</td><td'.$tablestyle.'>Type</td></tr>
	<tr style="border:1px solid #363430;"><td style="border:1px solid #363430;background:#22201d;">MapData</td><td'.$tablestyle.'>
		<textarea cols="80%" rows="30" name="mapdata">'.$row['mapdata'].'</textarea>
	</td></tr>
	<tr><td></td><td><input type="submit" value="submit"></td></tr>
';
$bodycontent .= '</form></table>';
$bodycontent .= '<br>';
}

}
else if ($_GET['maps'] == 'update') {
	$bodycontent  .= '[-MAP-][-UPDATE-][-DONE-]';
	#echo $_POST['mapdata'];
	#echo $_POST['mapname'];
	$db_table = $prefix."mapdata";
	$query = "UPDATE $db_table SET name='{$_POST['mapname']}',mapdata='{$_POST['mapdata']}' WHERE idhash='{$_GET['mapid']}'";
	$result = mysql_query($query) or die(mysql_error());
}
elseif($_GET['maps'] == 'uploadmap') {
$fontcolor = "white";
$background = "#22201D";
$foreground = "#363430";
if (!isset($_POST['submit'])){
	$bodycontent .= '<br>
	<center>
	<table bgcolor="'.$background.'">
	<form enctype="multipart/form-data" action="?maps=upload" method="POST">
	<tr bgcolor="'.$foreground.'"><td colspan="3"><center>File Submit</center></td></tr>

	<tr bgcolor="'.$foreground.'"><td>
	File name</td><td>:</td><td><input name="filename" type="text" value="test object"></td>
	</tr>
	<tr bgcolor="'.$foreground.'"><td>
	Image</td><td>:</td> <td><input name="" type="text" value="test"></td>
	</tr bgcolor="'.$foreground.'">
	<tr bgcolor="'.$foreground.'"><td>
	Share Level</td><td>:</td><td>
	<select name="sharelevel">
	<option value ="0" >No Share</option>
	<option value ="1" selected="selected">Share And No Mod</option>
	<option value ="2" >Share And Ask</option>
	<option value ="3" >Share and Modified</option>
	</select>

	</td>
	</tr>
	<tr bgcolor="'.$foreground.'"><td>
	Description</td><td>:</td><td><textarea name="info">None Information.</textarea></td>
	</tr>
	<tr bgcolor="'.$foreground.'"><td>
	Choose a file
	<td>:</td>
	<td>
	<input name="uploadedfile" type="file"></td>
	</td></tr>
	<tr bgcolor="'.$foreground.'"><td colspan="3"><center><input type="submit" value="Upload File"></center></td></tr>
	</form>
	</table>
	</center><br>';
}else{
}
//<input type="hidden" name="MAX_FILE_SIZE" value="100000" />
}
else if ($_GET['maps'] == 'upload') {
	include('uploadmapdata.php');
}
else if ($_GET['maps'] == 'delete') {
	$db_table = $prefix."mapdata";
	$query = "SELECT * FROM $db_table WHERE idhash='{$_GET['mapid']}'";
	$result = mysql_query($query) or die(mysql_error());
	$row = mysql_fetch_array($result);
	
	$bodycontent .= '[Confirm Delete Map?]';
	$bodycontent .= '<table>';
	$bodycontent .= '<tr><td colspan="2">';
	$bodycontent .= ' Name:'.$row['name'];
	$bodycontent .= '</td></tr>';
	$bodycontent .= '<tr><td><center><form method="post" action="?maps=del"> <input type="submit" value="Sumbit" >
		<input type="hidden" name="mapid" value="'.$_GET['mapid'].'" />
		</form></center>';
	$bodycontent .= '</td><td><center><form method="post" action="?maps=index"> <input type="submit" value="Cancel" ></form></center></td></tr>';
	$bodycontent .= '</table>';
}
else if ($_GET['maps'] == 'del') {
	$bodycontent .= '[-] '.$_POST['mapid'].' [-] '.'DELETE';
	#echo $_POST['mapid'];
	$db_table = $prefix."mapdata";
	$query = "SELECT * FROM $db_table WHERE idhash='{$_POST['mapid']}'";
	$result = mysql_query($query) or die(mysql_error());
	$row = mysql_fetch_array($result);
	
	//delete file from dir location
	unlink('../'.$row['filelocation']); 
	//delete it from the data base
	mysql_query("DELETE FROM $db_table WHERE idhash='{$_POST['mapid']}'") 
	or die(mysql_error()); 
}
else if ($_GET['maps'] == 'flags') {
	$bodycontent .= 'FLAG MAPS';
	/*
	#echo $_POST['mapid'];
	$db_table = $prefix."mapdata";
	$query = "SELECT * FROM $db_table WHERE idhash='{$_POST['mapid']}'";
	$result = mysql_query($query) or die(mysql_error());
	*/
}

?>