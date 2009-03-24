<?php
#error_reporting(E_ALL);
if($_GET['flashapp'] == 'index') {
	$db_table = $prefix."flashapp";
	$bodycontent .= '[status]';
	$query = "SELECT * FROM $db_table ";
	$result = mysql_query($query) or die(mysql_error());
	#$row = mysql_fetch_array($result);
	$num_rows = mysql_num_rows($result);
	$bodycontent .= '<br>[Number of Flash Apps]:'.$num_rows;
	$bodycontent .= '<br>[Flags No.]:'.'none';
}
else if ($_GET['flashapp'] == 'games') {
	$tablestyle = ' style="border:1px solid #363430;" ';
	$bodycontent .= '[game apps]';
	$bodycontent .= '<table width="100%">';
	$bodycontent .= '<tr style="border:1px solid #363430;">
	<td style="border:1px solid #363430;background:#22201d;">ID HASH</td>
	<td style="border:1px solid #363430;background:#22201d;">Name</td>
	<td style="border:1px solid #363430;background:#22201d;">Author</td>
	<td style="border:1px solid #363430;background:#22201d;">Flag</td>
	<td style="border:1px solid #363430;background:#22201d;">Date</td>
	<td style="border:1px solid #363430;background:#22201d;">Categories</td>
	<td style="border:1px solid #363430;background:#22201d;">Type</td>
	<td style="border:1px solid #363430;background:#22201d;">Access Level</td>
	<td style="border:1px solid #363430;background:#22201d;">Actions</td>
	</tr>';

	$db_table = $prefix."flashapp";
	$query = "SELECT * FROM $db_table";
	$result = mysql_query($query) or die(mysql_error());
	#echo $query ;
	while ($row = mysql_fetch_array($result)) { //
		#echo $row['idhash'];
		$bodycontent .= '<tr style="border:1px solid #363430;">
		<td'.$tablestyle.'>'.$row['idhash'].'</td>
		<td'.$tablestyle.'>'.$row['name'].'</td>
		<td'.$tablestyle.'>'.$row['authorname'].'</td>
		<td'.$tablestyle.'>'.$row['flag'].'</td>
		<td'.$tablestyle.'>'.$row['date'].'</td>
		<td'.$tablestyle.'>'.$row['category'].'</td>
		<td'.$tablestyle.'>'.$row['type'].'</td>
		<td'.$tablestyle.'>'.$row['sharelevel'].'</td>
		<td'.$tablestyle.'> <a href="?flashapp=edit&id='.$row['idhash'].'">EDIT</a> <a href="?flashapp=delete&id='.$row['idhash'].'">DELETE</a> </td>
		</tr>';
	}
	$bodycontent .= '</table>';
}
else if ($_GET['flashapp'] == 'uploadflash') {
$fontcolor = "white";
$background = "#22201D";
$foreground = "#363430";

if (!isset($_POST['submit'])){
	$bodycontent .= '<br>
	<center>
	<table bgcolor="'.$background.'">
	<form enctype="multipart/form-data" action="?flashapp=upload" method="POST">
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
	<option value ="0" >Public</option>
	<option value ="1" >Member</option>
	<option value ="2" >Moderator</option>
	<option value ="3" >Game Master</option>
	<option value ="4" >Administrator</option>
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
	</center> <br> ';
	//<option value ="1" selected="selected">Member</option>
}else{
}
//<input type="hidden" name="MAX_FILE_SIZE" value="100000" />
}
else if ($_GET['flashapp'] == 'upload') {
	include('uploadflash.php');
}
else if ($_GET['flashapp'] == 'edit') {
$id = $_GET['id'];
	$db_table = $prefix."flashapp";
	$query = "SELECT * FROM $db_table WHERE idhash='$id'";
	$result = mysql_query($query) or die(mysql_error());
	$bodycontent .= '<table cellspacing="2" cellpadding="2" width="100%" bgcolor="white">';
	$bodycontent .= '<form method="post"  action="?flashapp=update&id='.$_GET['id'].'" >';
	
	while ($row = mysql_fetch_array($result)){ //
		$bodycontent .= '
		<tr> <td>Object ID:</td> <td bgcolor="22201d">' . $row['idhash'].'</td> </tr>
		
		<tr><td>Name:</td> <td>'.' <input name="filename" type="text" value="'.$row['name'].'"> '.'</td> </tr>
		<tr> <td>File Type:</td><td> '.$row['filetype'].' </td> </tr>
		<tr> <td> Image: </td> <td>';
		//restricted access to incase iamge is not the same for the models or texture that is fake
		if (($row['datatype'] != 'images') || ($row['imageid'] == null)||($row['imageid'] == 'none')) {
			if (($row['imageid'] == null) && ($row['datatype'] != 'models')||($row['imageid'] == 'none') && ($row['datatype'] != 'models'))  {
				$convertimagebutton = true;
				
			}else {
				$bodycontent .= '<input name="imageid" type="text" value="'.$row['imageid'].'">';// .$row['imageid'];
			}
		}else {
			$bodycontent .= ''.$row['imageid'].'';
		}
		
		$bodycontent .= '</td> </tr>
		<tr><td>Information:</td><td> <textarea name="info" cols="50%" rows="10%">'.$row['description'].'</textarea></td> </tr>
		<tr> <td> Localtion: </td><td> '.$row['datatype'].'</td> </tr>
		<tr> <td>Access: </td> <td> ';
		$bodycontent .= '<select name="sharelevel">';
		if($row['accesslevel'] == 0){
			$bodycontent .= '<option value ="0" selected="selected">public</option>';
		}else {
			$bodycontent .= '<option value ="0" >public</option>';
		}
		if($row['accesslevel'] == 1){
			$bodycontent .= '<option value ="1" selected="selected">member</option>';
		}else {
			$bodycontent .= '<option value ="1" >member</option>';
		}
		if($row['accesslevel'] == 2){
			$bodycontent .= '<option value ="2" selected="selected">moderator</option>';
		}else {
			$bodycontent .= '<option value ="2">moderator</option>';
		}
		if($row['accesslevel'] == 3){
			$bodycontent .= '<option value ="3" selected="selected" >administrators</option>';
		}else {
			$bodycontent .= '<option value ="3">administrators</option>';
		}	
		$bodycontent .= '</td> </tr>';
		$bodycontent .= '<tr><td>';
		$bodycontent .= 'category';
		//selected="selected"
		$bodycontent .= '</td><td>';
		$bodycontent .= '</select>';
		$bodycontent .= '<select name="category">';
		$bodycontent .= '<option value="other">other</option>';
		$bodycontent .= '<option value="app">app</option>';
		$bodycontent .= '<option value="rpg">rpg</option>';
		$bodycontent .= '<option value="rts">rts</option>';
		$bodycontent .= '<option value="fps">fps</option>';
		$bodycontent .= '</select>';
		$bodycontent .= '</td> </tr>';
		$bodycontent .= '<tr><td>';
		$bodycontent .= 'type';
		//selected="selected"
		$bodycontent .= '</td><td>';
		$bodycontent .= '<select name="type">';
		$bodycontent .= '<option value="other">other</option>';
		$bodycontent .= '<option value="le">Level Editor</option>';
		$bodycontent .= '<option value="dm">Death Match</option>';
		$bodycontent .= '<option value="tdm" check>Team Death Match</option>';
		$bodycontent .= '<option value="fps">Capture The Flag</option>';
		$bodycontent .= '<option value="as">Assault</option>';
		$bodycontent .= '<option value="rt">Real Time</option>';
		$bodycontent .= '<option value="p">Puzzle</option>';
		$bodycontent .= '<option value="mg">Mind Games</option>';
		$bodycontent .= '<option value="d">Duel</option>';
		$bodycontent .= '</select>';
		$bodycontent .= '</td> </tr>';
		$bodycontent .= '<tr><td>';
		$bodycontent .= 'enginetype';
		//selected="selected"
		$bodycontent .= '</td><td>';
		$bodycontent .= '<select name="enginetype">';
		$bodycontent .= '<option value="none">none</option>';
		$bodycontent .= '<option value="sandy">Sandy</option>';
		$bodycontent .= '<option value="papervision">Papervision</option>';
		$bodycontent .= '<option value="away3d">away3d</option>';
		$bodycontent .= '</select>';
		$bodycontent .= '</td> </tr>';
		
		
		$bodycontent .='</td> </tr>
		<tr><td></td><td> '.'<input type="submit" value="submit">'.'</td> </tr>';
	}
	$bodycontent .= '</form>';
	$bodycontent .= '</table>';
	if($convertimagebutton){
		$MainContent .= '<form method="post" action="image.php?image='.$_GET['id'].'&convert=image">
			<input type="submit" value="ConvertThumbnail"> </form> ';
	}
	#$bodycontent .= '<br>[Edit MODE]';
	#$bodycontent .= 'EDIT';
}
else if ($_GET['flashapp'] == 'update') {
//echo 
	$bodycontent .= "name:".$_POST['filename']."<br>id:".$_GET['id'].'<br>INFOR:'.$_POST['info'].'<br>IMAGE ID:'.$_POST['imageid']."<br>";
	$idhash = $_GET['id'];
	$filetext = $_POST['filename'];
	
	$sharelevel = $_POST['sharelevel'];
	$objectinfo = $_POST['info'];
	$imageid = $_POST['imageid'];
	
	$db_table = $prefix."flashapp";
	$query = "UPDATE $db_table SET name='$filetext', sharelevel='{$sharelevel}', description='{$objectinfo}', imageid='{$imageid}', type='{$_POST['type']}', enginetype='{$_POST['enginetype']}',category='{$_POST['category']}' WHERE idhash='{$idhash}'" ; //enginetype //category
	$sql = mysql_query($query) or die(mysql_error());
	
	$bodycontent .= '<br>[UPDATE...]';
}
else if ($_GET['flashapp'] == 'delete') {
$bodycontent .= 'DELETE PAGE';

$bodycontent .= '<center>Confirmation deletion this object?<br>This is the final page! Else click on something else.';
$bodycontent .= '<table>';
#$bodycontent .= '<tr><td colspan="2">';
#$bodycontent .= '<input type="checkbox" name="delthumbnail"> Delete Thumbnail? (Image File)';
#$bodycontent .= '</td></tr><tr><td>';
$bodycontent .= '<tr><td>';
$bodycontent .= '<form method="post"  action="?flashapp=del&id='.$_GET['id'].'">';
$bodycontent .= '<input type="submit" value="submit"></center>';
$bodycontent .= '</form>';
$bodycontent .= '</td><td>';
$bodycontent .= '<form method="post"  action="?objectfiles=index">';
$bodycontent .= '<input type="submit" value="Cancel"></center>';
$bodycontent .= '</form>';
$bodycontent .= '</td></tr>';
$bodycontent .= '</table>';

}
else if ($_GET['flashapp'] == 'del') {
	$db_table = $prefix."flashapp";
	$query = "SELECT * FROM $db_table WHERE idhash='{$_GET['id']}'";
	$result = mysql_query($query) or die(mysql_error());
	$row = mysql_fetch_array($result);
	
	$db_table = $prefix."flashapp";
	//delete file from dir location
	unlink('../'.$row['filelocation']);
	//delete it from the data base
	mysql_query("DELETE FROM $db_table WHERE idhash='{$_GET['id']}'") 
	or die(mysql_error());  
	$bodycontent .= 'Object ID:'.$_GET['id'].' [-]'.'Deleted!';


$bodycontent .= 'FILE DELETE!';


}
?>