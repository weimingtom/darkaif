<?php
#error_reporting(E_ALL);
#include('config.php');
#echo '[---]';
#$bodycontent .= '[Objects Files] Your Files for game build -.-;';
#$MainContent .= $username . "---";

#mysql_connect($host,$username,$password) or die(mysql_error());
#mysql_select_db($database) or die(mysql_error());

$membername = 'guest';
$db_table = $prefix."objectfile";
if ($_GET['objectfiles'] == 'index') {
	$db_table = $prefix."objectfile";
	$query = "SELECT * FROM $db_table";
	$result = mysql_query($query) or die(mysql_error());

	$bodycontent .= '<table cellspacing="1" cellpadding="1" width="100%">';
	$bodycontent .= '
	<tr bgcolor="363430">
	<td>Object ID:</td><td>Name:</td><td>File Type:</td><td>Image:</td><td>Localtion:</td><td>Actions:</td>
	</tr>';

	while ($row = mysql_fetch_array($result)){ //
    $bodycontent .= '<tr bgcolor="black"><td bgcolor="22201d">' . $row['idhash'].'</td><td>'. $row['name'].'</td> <td>'.$row['filetype'].' </td><td>'.
	'<div id="imageid">
		<ul> <li> <a href=""> [image]'.
		'</a>
		<ul><li><img src="image.php?image='.$row['idhash'].'"><a href="#"></a></li></ul>
		</li>
	<ul>
	</div></td><td>'.$row['datatype'].'</td><td>'.'<a href="?objectfiles=edit&id='.$row['idhash'].'">EDIT</a> | <a href="?objectfiles=delete&id='.$row['idhash'].'">DELETE</a> '.'</td></tr>';
	}
	$bodycontent .= '</table>';
	//style="background:url(image.php)no-repeat;"
}
elseif ($_GET['objectfiles'] == 'models') {
	$db_table = $prefix."objectfile";
	$query = "SELECT * FROM $db_table WHERE datatype='{$_GET['objectfiles']}'";
	$result = mysql_query($query) or die(mysql_error());

	$bodycontent .= '<table cellspacing="1" cellpadding="1" width="100%">';
	$bodycontent .= '
	<tr bgcolor="363430">
	<td>Object ID:</td><td>Name:</td><td>File Type:</td><td>Image:</td><td>Localtion:</td><td>Actions:</td>
	</tr>';

	while ($row = mysql_fetch_array($result)){ //
    $bodycontent .= '<tr bgcolor="black"><td bgcolor="22201d">' . $row['idhash'].'</td><td>'. $row['name'].'</td> <td>'.$row['filetype'].' </td><td>'.
	'<div id="imageid">
		<ul> <li> <a href=""> [image]'.
		'</a>
		<ul><li><img src="image.php?image='.$row['idhash'].'"><a href="#"></a></li></ul>
		</li>
	<ul>
	</div></td><td>'.$row['datatype'].'</td><td>'.'<a href="?objectfiles=edit&id='.$row['idhash'].'">EDIT</a> | <a href="?objectfiles=delete&id='.$row['idhash'].'">DELETE</a> '.'</td></tr>';
	}
	$bodycontent .= '</table>';

}
elseif ($_GET['objectfiles'] == 'images'){
	$db_table = $prefix."objectfile";
	$query = "SELECT * FROM $db_table WHERE datatype='{$_GET['objectfiles']}'";
	$result = mysql_query($query) or die(mysql_error());

	$bodycontent .= '<table cellspacing="1" cellpadding="1" width="100%">';
	$bodycontent .= '
	<tr bgcolor="363430">
	<td>Object ID:</td><td>Name:</td><td>File Type:</td><td>Image:</td><td>Localtion:</td><td>Actions:</td>
	</tr>';

	while ($row = mysql_fetch_array($result)){ //
    $bodycontent .= '<tr bgcolor="black"><td bgcolor="22201d">' . $row['idhash'].'</td><td>'. $row['name'].'</td> <td>'.$row['filetype'].' </td><td>'.
	'<div id="imageid">
		<ul> <li> <a href=""> [image]'.
		'</a>
		<ul><li><img src="image.php?image='.$row['idhash'].'"><a href="#"></a></li></ul>
		</li>
	<ul>
	</div></td><td>'.$row['datatype'].'</td><td>'.'<a href="?objectfiles=edit&id='.$row['idhash'].'">EDIT</a> | <a href="?objectfiles=delete&id='.$row['idhash'].'">DELETE</a> '.'</td></tr>';
	}
	$bodycontent .= '</table>';
}
else if ($_GET['objectfiles'] == 'edit') {
	$id = $_GET['id'];
	$db_table = $prefix."objectfile";
	$query = "SELECT * FROM $db_table WHERE idhash='$id'";
	$result = mysql_query($query) or die(mysql_error());
	$bodycontent .= '<table cellspacing="2" cellpadding="2" width="100%" bgcolor="white">';
	$bodycontent .= '<form method="post"  action="?objectfiles=submit&id='.$_GET['id'].'" >';
	
	while ($row = mysql_fetch_array($result)){ //
		$bodycontent .= '
		<tr> <td>Object ID:</td> <td bgcolor="22201d">' . $row['idhash'].'</td> </tr>
		
		<tr><td>Name:</td> <td>'.' <input name="filename" type="text" value="'.$row['name'].'"> '.'</td> </tr>
		<tr> <td>File Type:</td><td> '.$row['filetype'].' </td> </tr>
		<tr> <td> Image: </td> <td>';
		//restricted access to incase iamge is not the same for the models or texture that is fake
		if (($row['datatype'] == 'models')||($row['imageid'] == null)) {
			if (($row['imageid'] == null) && ($row['datatype'] != 'models'))  {
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
		<tr> <td> Share Level: </td> <td> ';
		$bodycontent .= '<select name="sharelevel">';
				if($row['sharelevel'] == 0){
					$bodycontent .= '<option value ="0" selected="selected">No Share</option>';
				}else {
					$bodycontent .= '<option value ="0" >No Share</option>';
				}
				if($row['sharelevel'] == 1){
					$bodycontent .= '<option value ="1" selected="selected">Share And No Mod</option>';
				}else {
					$bodycontent .= '<option value ="1" >Share And No Mod</option>';
				}
				if($row['sharelevel'] == 2){
					$bodycontent .= '<option value ="2" selected="selected">Share And Ask</option>';
				}else {
					$bodycontent .= '<option value ="2">Share And Ask</option>';
				}
				if($row['sharelevel'] == 3){
					$bodycontent .= '<option value ="3" selected="selected" >Share and Modified</option>';
				}else {
					$bodycontent .= '<option value ="3">Share and Modified</option>';
				}
				
				$bodycontent.= '</select>';
		$bodycontent .='</td> </tr>
		<tr><td></td><td> '.'<input type="submit" value="submit">'.'</td> </tr>
		';
	}
	$bodycontent .= '</form>';
	$bodycontent .= '</table>';
	if($convertimagebutton){
		$bodycontent .= '<form method="post" action="image.php?image='.$_GET['id'].'&convert=image">
			<input type="submit" value="ConvertThumbnail"> </form> ';
	}
	$bodycontent .= '<br>[Edit MODE]';
	
}
else if ($_GET['objectfiles'] == 'submit') {
	//echo
	$bodycontent .= "[name]: ".$_POST['filename']."<br>[IMAGE ID]: ".$_POST['imageid'].'<br>[Information]:'.$_POST['info'];
	$idhash = $_GET['id'];
	$filetext = $_POST['filename'];
	
	$sharelevel = $_POST['sharelevel'];
	$objectinfo = $_POST['info'];
	$imageid = $_POST['imageid'];
	
	$query = "UPDATE $db_table SET name='$filetext', sharelevel='{$sharelevel}', description='{$objectinfo}', imageid='{$imageid}' WHERE idhash='{$idhash}'" ;
	$sql = mysql_query($query) or die(mysql_error());
	
	$bodycontent .= '<br>[UPDATED]';
}
else if ($_GET['objectfiles'] == 'delete') {

$bodycontent .= '<center>Confirmation deletion this object?<br>This is the final page! Else click on something else.';
$bodycontent .= '<table>';
$bodycontent .= '<tr><td colspan="2">';
$bodycontent .= '<input type="checkbox" name="delthumbnail"> Delete Thumbnail? (Image File)';
$bodycontent .= '</td></tr><tr><td>';
$bodycontent .= '<form method="post"  action="?objectfiles=del&id='.$_GET['id'].'">';
$bodycontent .= '<input type="submit" value="submit"></center>';
$bodycontent .= '</form>';
$bodycontent .= '</td><td>';
$bodycontent .= '<form method="post"  action="?objectfiles=index">';
$bodycontent .= '<input type="submit" value="Cancel"></center>';
$bodycontent .= '</form>';
$bodycontent .= '</td></tr>';
$bodycontent .= '</table>';

}
else if ($_GET['objectfiles'] == 'del') {
	
	$db_table = $prefix."objectfile";
	$query = "SELECT * FROM $db_table WHERE idhash='{$_GET['id']}'";
	$result = mysql_query($query) or die(mysql_error());
	$row = mysql_fetch_array($result);
	//this will delete your thumbnail image
	if ($row['datatype'] == 'images') {
		$thumbnailid = $row['imageid'];
		$db_table = $prefix."thumbnail";
		$query = "SELECT * FROM $db_table WHERE idhash='{$thumbnailid}'";
		$result = mysql_query($query) or die(mysql_error());
		$row = mysql_fetch_array($result);
		#echo $row['filelocation'];
		//delete file from dir location
		unlink('../'.$row['filelocation']);
		//delete it from the data base
		mysql_query("DELETE FROM $db_table WHERE idhash='{$thumbnailid}'") 
		or die(mysql_error());
		
	}
	$db_table = $prefix."objectfile";
	//delete file from dir location
	unlink('../'.$row['filelocation']);
	//delete it from the data base
	mysql_query("DELETE FROM $db_table WHERE idhash='{$_GET['id']}'") 
	or die(mysql_error());  
	$bodycontent .= 'Object ID:'.$_GET['id'].' [-]'.'Deleted!';
}
else if ($_GET['objectfiles'] == 'uploadfile') {
$fontcolor = "white";
$background = "#22201D";
$foreground = "#363430";

if (!isset($_POST['submit'])){
$bodycontent .= '<br>
<center>
<table bgcolor="'.$background.'">
<form enctype="multipart/form-data" action="?objectfiles=upload" method="POST">
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
else if ($_GET['objectfiles'] == 'upload') {
	include('uploadobjectfile.php');
}
else if ($_GET['objectfiles'] == 'thumbnail') {

	$db_table = $prefix."thumbnail";
	$query = "SELECT * FROM $db_table";
	$result = mysql_query($query) or die(mysql_error());

	$bodycontent .= '<table cellspacing="1" cellpadding="1" width="100%">';
	$bodycontent .= '<tr bgcolor="363430">
	<td>Object ID:</td><td>Name:</td><td>File Type:</td><td>Image:</td><td>Localtion:</td><td>Actions:</td>
	</tr>';

	while ($row = mysql_fetch_array($result)){ //
    $bodycontent .= '<tr bgcolor="black"><td bgcolor="22201d">' . $row['idhash'].'</td><td>'. $row['name'].'</td> <td>'.$row['filetype'].' </td><td>'.
	'<div id="imageid">
		<ul> <li> <a href=""> [image]'.
		'</a>
		<ul><li><img src="image.php?image='.$row['idhash'].'&thumbnail=image" ><a href="#"></a></li></ul>
		</li>
	<ul>
	</div></td><td>'.$row['datatype'].'</td><td>'.' | <a href="?objectfiles=thumbnaildelete&id='.$row['idhash'].'">DELETE</a> '.'</td></tr>';
	}//<a href="?objectfiles=edit&id='.$row['idhash'].'">EDIT</a>
	$bodycontent .= '</table>';
}
else if ($_GET['objectfiles'] == 'thumbnaildelete') {
	
	$bodycontent .= '<center>Confirmation deletion this object?<br>This is the final page! Else click on something else.';
	$bodycontent .= '<br>ID OBJECT: '.$_GET['id'];
	$bodycontent .= '<table>';
	$bodycontent .= '<tr><td>';
	$bodycontent .= '<form method="post"  action="?objectfiles=thumbnaildel&id='.$_GET['id'].'">';
	$bodycontent .= '<input type="submit" value="submit">';
	$bodycontent .= '</form>';
	$bodycontent .= '</td><td>';
	$bodycontent .= '<form method="post" action="?objectfiles=index">';
	$bodycontent .= '<input type="submit" value="Cancel">';
	$bodycontent .= '</form>';
	$bodycontent .= '</td></tr>';
	$bodycontent .= '</table></center>';
}
else if ($_GET['objectfiles'] == 'thumbnaildel') {
	$thumbnailid = $_GET['id'];
	$db_table = $prefix."objectfile";
	$query = "UPDATE $db_table SET imageid='' WHERE imageid='{$thumbnailid}'";
	$sql = mysql_query($query) or die(mysql_error());

	$db_table = $prefix."thumbnail";
	$query = "SELECT * FROM $db_table WHERE idhash='{$thumbnailid}'";
	$result = mysql_query($query) or die(mysql_error());
	$row = mysql_fetch_array($result);
	$bodycontent .= $db_table.$row['filelocation'];
	//delete file from dir location
	
	unlink('../'.$row['filelocation']);
	//delete it from the data base
	mysql_query("DELETE FROM $db_table WHERE idhash='{$thumbnailid}'") 
	or die(mysql_error());
	
	$bodycontent .= '[DELETE]';

}
#$bodycontent .= '<br>[---END]';

?>