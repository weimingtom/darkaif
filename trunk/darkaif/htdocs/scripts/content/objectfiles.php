<?php
include('scripts/config.php');
#echo '[---]';
  $MainContent .= '[Objects Files] Your Files for game build -.-;';
  #$MainContent .= $username . "---";
  
#mysql_connect($host,$username,$password) or die(mysql_error());
#mysql_select_db($database) or die(mysql_error());

$membername = 'guest';
$db_table = $prefix."objectfile";
if ($_GET['edit'] == null) {

$db_table = $prefix."objectfile";
$query = "SELECT * FROM $db_table WHERE authorname='{$membername}'";
$result = mysql_query($query) or die(mysql_error());

	$MainContent .= '<table cellspacing="1" cellpadding="1" width="100%">';
	$MainContent .= '
	<tr bgcolor="363430">
	<td>Object ID:</td><td>Name:</td><td>File Type:</td><td>Image:</td><td>Localtion:</td><td>Actions:</td>
	</tr>';

	while ($row = mysql_fetch_array($result)){ //
    $MainContent .= '<tr bgcolor="black"><td bgcolor="22201d">' . $row['idhash'].'</td><td>'. $row['name'].'</td> <td>'.$row['filetype'].' </td><td>'.
	'<div id="imageid">
		<ul> <li> <a href=""> [image]'. //.$row['imageid'].'
		'</a>
		<ul><li><img src="image.php?image='.$row['idhash'].'"><a href="#"></a></li></ul>
		</li>
	<ul>
	</div></td><td>'.$row['datatype'].'</td><td>'.'<a href="?games=objectfiles&edit=edit&id='.$row['idhash'].'">EDIT</a> | <a href="?games=objectfiles&edit=delete&id='.$row['idhash'].'">DELETE</a> '.'</td></tr>';
	}
	$MainContent .= '</table>';
	//style="background:url(image.php)no-repeat;"
	/*
	$MainContent .= '<br>';
	$MainContent .= 'Thumbnail Image';
	
	$db_table = $prefix."thumbnail";
	$query = "SELECT * FROM $db_table";
	$result = mysql_query($query) or die(mysql_error());

	$MainContent .= '<table cellspacing="1" cellpadding="1" width="80%">';
	$MainContent .= '
	<tr bgcolor="363430">
	<td>Object ID:</td><td>Image:</td><td>Actions:</td>
	</tr>';

	while ($row = mysql_fetch_array($result)){ //
    $MainContent .= '<tr bgcolor="black">
		<td bgcolor="22201d">' . $row['idhash'].'</td><td>'.
	'<div id="imageid">
		<ul> <li> <a href=""> [image]'.
		'</a>
		<ul><li><img src="image.php?image='.$row['idhash'].'"><a href="#"></a></li></ul>
		</li>
	<ul>
	</div></td><td>'.'<a href="?objectfiles=edit&id='.$row['idhash'].'">EDIT</a> | <a href="?objectfiles=delete&id='.$row['idhash'].'">DELETE</a> '.'</td></tr>';
	}
	$MainContent .= '</table>';
	*/
	
}else if ($_GET['edit'] == 'edit') {
	$id = $_GET['id'];
	$db_table = $prefix."objectfile";
	$query = "SELECT * FROM $db_table WHERE idhash='$id'";
	$result = mysql_query($query) or die(mysql_error());
	$MainContent .= '<table cellspacing="2" cellpadding="2" width="100%" bgcolor="white">';
	$MainContent .= '<form method="post"  action="?games=objectfiles&edit=submit&id='.$_GET['id'].'" >';
	
	while ($row = mysql_fetch_array($result)){ //
		$MainContent .= '
		<tr> <td>Object ID:</td> <td bgcolor="22201d">' . $row['idhash'].'</td> </tr>
		
		<tr><td>Name:</td> <td>'.' <input name="filename" type="text" value="'.$row['name'].'"> '.'</td> </tr>
		<tr> <td>File Type:</td><td> '.$row['filetype'].' </td> </tr>
		<tr> <td> Image: </td> <td>';
		//restricted access to incase iamge is not the same for the models or texture that is fake
		if (($row['datatype'] != 'images') || ($row['imageid'] == null)||($row['imageid'] == 'none')) {
			if (($row['imageid'] == null) && ($row['datatype'] != 'models')||($row['imageid'] == 'none') && ($row['datatype'] != 'models'))  {
				$convertimagebutton = true;
				
			}else {
				$MainContent .= '<input name="imageid" type="text" value="'.$row['imageid'].'">';// .$row['imageid'];
			}
		}else {
			$MainContent .= ''.$row['imageid'].'';
		}
		
		$MainContent .= '</td> </tr>
		<tr><td>Information:</td><td> <textarea name="info" cols="50%" rows="10%">'.$row['description'].'</textarea></td> </tr>
		<tr> <td> Localtion: </td><td> '.$row['datatype'].'</td> </tr>
		<tr> <td> Share Level: </td> <td> ';
		$MainContent .= '<select name="sharelevel">';
				if($row['sharelevel'] == 0){
					$MainContent .= '<option value ="0" selected="selected">No Share</option>';
				}else {
					$MainContent .= '<option value ="0" >No Share</option>';
				}
				if($row['sharelevel'] == 1){
					$MainContent .= '<option value ="1" selected="selected">Share And No Mod</option>';
				}else {
					$MainContent .= '<option value ="1" >Share And No Mod</option>';
				}
				if($row['sharelevel'] == 2){
					$MainContent .= '<option value ="2" selected="selected">Share And Ask</option>';
				}else {
					$MainContent .= '<option value ="2">Share And Ask</option>';
				}
				if($row['sharelevel'] == 3){
					$MainContent .= '<option value ="3" selected="selected" >Share and Modified</option>';
				}else {
					$MainContent .= '<option value ="3">Share and Modified</option>';
				}
				
				$MainContent .= '</select>';
		$MainContent .='</td> </tr>
		<tr><td></td><td> '.'<input type="submit" value="submit">'.'</td> </tr>
		';
	}
	$MainContent .= '</form>';
	$MainContent .= '</table>';
	if($convertimagebutton){
		$MainContent .= '<form method="post" action="image.php?image='.$_GET['id'].'&convert=image">
			<input type="submit" value="ConvertThumbnail"> </form> ';
	}
	$MainContent .= '<br>[Edit MODE]';
	
}else if ($_GET['edit'] == 'submit') {
	//echo 
	$MainContent .= "name:".$_POST['filename']."<br>id:".$_GET['id'].'<br>INFOR:'.$_POST['info'].'<br>IMAGE ID:'.$_POST['imageid']."<br>";
	$idhash = $_GET['id'];
	$filetext = $_POST['filename'];
	
	$sharelevel = $_POST['sharelevel'];
	$objectinfo = $_POST['info'];
	$imageid = $_POST['imageid'];
	
	$query = "UPDATE $db_table SET name='$filetext', sharelevel='{$sharelevel}', description='{$objectinfo}', imageid='{$imageid}' WHERE idhash='{$idhash}'" ;
	$sql = mysql_query($query) or die(mysql_error());
	
	$MainContent .= '<br>[Submit MODE]';
}else if ($_GET['edit'] == 'delete') {

$MainContent .= '<center>Confirmation deletion this object?<br>This is the final page! Else click on something else.';
$MainContent .= '<br><table><tr><td>';
$MainContent .= '<form method="post" action="?games=objectfiles&edit=del&id='.$_GET['id'].'">';
$MainContent .= '<input type="submit" value="submit">';
$MainContent .= '</form>';
$MainContent .= '</td><td>';
$MainContent .= '<form method="post"  action="?games=objectfiles">';
$MainContent .= '<input type="submit" value="Cancel">';
$MainContent .= '</form>';
$MainContent .= '</td></tr></table></center>';

}else if ($_GET['edit'] == 'del') {
	$MainContent .= '[-]'.$_GET['id'].'[-]';
	$db_table = $prefix."objectfile";
	$query = "SELECT * FROM $db_table WHERE idhash='{$_GET['id']}'";
	$result = mysql_query($query) or die(mysql_error());
	$row = mysql_fetch_array($result);
	if($row['datatype'] == 'imgaes'){
		$imageidobject = $row['imageid'];
	}
	//delete file from dir location
	unlink($row['filelocation']); 
	//delete it from the data base
	mysql_query("DELETE FROM $db_table WHERE idhash='{$_GET['id']}'") 
	or die(mysql_error());  
	
	if($imageidobject != null){
		$db_table = $prefix."thumbnail";
		$query = "SELECT * FROM $db_table WHERE idhash='{$imageidobject}'";
		$result = mysql_query($query) or die(mysql_error());
		$row = mysql_fetch_array($result);
	
		unlink($row['filelocation']); 
		mysql_query("DELETE FROM $db_table WHERE idhash='{$imageidobject}'") 
		or die(mysql_error()); 
	}
}  
$MainContent .= '</ul><br>[---END]';

?>