<?php
#echo 'hello world';
$tablestyle = ' style="border:1px solid #363430;" ';
$tablestyle2 = ' style="border:1px solid #363430;background:#22201d;" ';
if($_GET['home'] == 'index') {
	$bodycontent .= 'Home';
	
	$db_posting = $prefix."page";
	$query = "SELECT * FROM $db_posting ORDER BY id DESC";
	$result = mysql_query($query)or die(mysql_error());
	$pagemessage .= '<li style="background:#22201D;">'.$type.'</li>';
	$nopostings = mysql_num_rows($result); 
	
	$bodycontent .= '<table width="100%">';
	$bodycontent .= '<tr>
		<td '.$tablestyle2.' >Type:</td>
		<td '.$tablestyle2.' >Subject:</td>
		<td '.$tablestyle2.' >Date:</td>
		<td '.$tablestyle2.' >Level:</td>
		<td '.$tablestyle2.' >Created By:</td>
		<td '.$tablestyle2.' >Actions:</td>
		
	</tr>';
	while ($row = mysql_fetch_array($result)) { 
	$bodycontent .= '<tr>
		<td '.$tablestyle.' >'.$row['category'].'</td>
		<td '.$tablestyle.' >'.$row['title'].'</td>
		<td '.$tablestyle.' >'.$row['date'].'</td>
		<td '.$tablestyle.' >'.$row['level'].'</td>
		<td '.$tablestyle.' >'.$row['username'].'</td>
		<td '.$tablestyle.' ><a href="?home=edit&id='.$row['id'].'">EDIT</a> | <a href="?home=delete&id='.$row['id'].'">DELETE</a></td>
		
	</tr>';
	
	}
	$bodycontent .= '<table>';
}
else if($_GET['home'] == 'news') {
	$bodycontent .= 'new';
	include('postnotice.php');
	$bodycontent .= page('news');
	$bodycontent .= page('news','1');	
}
else if($_GET['home'] == 'events') {
	$bodycontent .= 'events';
	include('postnotice.php');
	$bodycontent .= page('events');
	$bodycontent .= page('events','1');
}
else if($_GET['home'] == 'updates') {
	$bodycontent .= 'updates';
	include('postnotice.php');
	$bodycontent .= page('updates');
	$bodycontent .= page('updates','1');
}
else if($_GET['home'] == 'post') {
	$bodycontent .= 'post';
	$url_submit = 'newsposting.php';
	//echo '<link rel="stylesheet" type="text/css" href="../default.css" />';
	$url_submit = '?home=newpost';
	$MainContent .= '
	<center>
	<table border="1" cellpadding="0" cellspacing="0" class="tbtl">';
	//echo '<form method="post" action="index.php?action=posting">';
	$MainContent .= '<form method="post" action="'.$url_submit.'">';
	$MainContent .= '
	<tr><td colspan="2" class="tbbr_title">Page Post</td></tr>
	<tr><td class="tbbr">Subject:</td>
	<td class="tbbr"><input type="text" size="50" maxlength="100" name="subject" class="input"></td>
	</tr><tr>
	<td class="tbbr">Category:</td>
	<td>';

	$MainContent .= '<select name="category">';
		$MainContent .= '<option value="news">news</option>';
		$MainContent .= '<option value="events">events</option>';
		$MainContent .= '<option value="updates">updates</option>';
		$MainContent .= '</select>';
	
	$MainContent .= '</td>
	</tr><tr>
	<td colspan=2 class="tbbr"><textarea rows="10" cols="45" name="body" wrap="message" class="input"></textarea></td>
	</tr><tr>
	<td colspan=2 class="tbbr">
	<center>
	<input type="hidden" name="linkpage" value="'.$url_submit.'">
	<input type="hidden" name="posting" value="true">
	<input type="submit" value="submit" name="submit" class="input"></center>
	</td></tr>
	</table></center > ';
	$bodycontent .= $MainContent;
}
else if($_GET['home'] == 'newpost') {
	#$bodycontent = 'newpost';
	if(empty($_POST['category'])||empty($_POST['subject'])||empty($_POST['body'])){
		//echo 'Missing a field';
		$bodycontent .= 'Missing a field';
}
else{
	$db_page = $prefix."page";
	$userid = '0';
	$username = 'Admin';
	$to_subject = $_POST['subject'];
	$to_category = $_POST['category'];
	$to_message = $_POST['body'];

	$time = time();
	$mark_time = date('Y',$time).date('m',$time).date('d',$time).strftime('%H%M%S');
	mysql_query("INSERT INTO $db_page
	(title,category,body,date,userid,username,level,hide)
	VALUES('$to_subject ', '$to_category', '$to_message', '$mark_time', '$userid', '$username', '0', '0')")or die(mysql_error());
}
}
else if ($_GET['home'] == 'delete') {
#echo 'Hello';
	$bodycontent .= '<center>Confirmation deletion of this notice post?<br>This is the final page!';
	$bodycontent .= '<br>ID OBJECT: '.$_GET['id'];
	$bodycontent .= '<table>';
	$bodycontent .= '<tr><td>';
	$bodycontent .= '<form method="post"  action="?home=del&id='.$_GET['id'].'">';
	$bodycontent .= '<input type="submit" value="submit">';
	$bodycontent .= '</form>';
	$bodycontent .= '</td><td>';
	$bodycontent .= '<form method="post" action="?objectfiles=index">';
	$bodycontent .= '<input type="submit" value="Cancel">';
	$bodycontent .= '</form>';
	$bodycontent .= '</td></tr>';
	$bodycontent .= '</table></center>';
}
else if ($_GET['home'] == 'del') {	
	//echo $_GET['id'];
	$idpost = $_GET['id'];
	$db_table = $prefix."page";
	mysql_query("DELETE FROM $db_table WHERE id='{$idpost}'") 
	or die(mysql_error());
	$bodycontent .= 'POST DELETED!';
}
else if ($_GET['home'] == 'edit') {	
	//echo $_GET['id'];
	$idpost = $_GET['id'];
	$url_submit = '?home=update';
	
	$db_posting = $prefix."page";
	$query = "SELECT * FROM $db_posting WHERE id='{$idpost}'";
	$result = mysql_query($query)or die(mysql_error());
	$nopostings = mysql_num_rows($result); 
	$row = mysql_fetch_array($result);
	$MainContent .= '
	<center>
	<table border="1" cellpadding="0" cellspacing="0" class="tbtl">';
	//echo '<form method="post" action="index.php?action=posting">';
	$MainContent .= '<form method="post" action="'.$url_submit.'">';
	$MainContent .= '
	<tr><td colspan="2" class="tbbr_title">Page Post</td></tr>
	<tr><td class="tbbr">Subject:</td>
	<td class="tbbr"><input type="text" size="50" maxlength="100" name="subject" value="'.$row['title'].'" class="input"></td>
	</tr><tr>
	<td class="tbbr">Category:</td>
	<td>';

	$MainContent .= '<select name="category">';
		$MainContent .= '<option value="news" '; if ($row['category'] == 'news') { $MainContent .= 'selected="selected"'; } $MainContent .= '>news</option>';
		$MainContent .= '<option value="events" '; if ($row['category'] == 'events') { $MainContent .= 'selected="selected"' ; } $MainContent .= '>events</option>';
		$MainContent .= '<option value="updates" '; if ($row['category'] == 'updates') { $MainContent .= 'selected="selected"' ; } $MainContent .= '>updates</option>';
		$MainContent .= '</select>';
	
	$MainContent .= '</td>
	</tr><tr>
	<td colspan=2 class="tbbr"><textarea rows="10" cols="45" name="body" wrap="message" class="input">'.$row['body'].'</textarea></td>
	</tr><tr>
	<td colspan=2 class="tbbr">
	<center>
	<input type="hidden" name="id" value="'.$row['id'].'">
	<input type="hidden" name="posting" value="true">
	<input type="submit" value="submit" name="submit" class="input"></center>
	</td></tr>
	</table></center > ';
	$bodycontent .= $MainContent;
}
else if ($_GET['home'] == 'update') {	
	$to_subject = $_POST['subject'];
	$to_category = $_POST['category'];
	$to_message = $_POST['body'];
	$to_idpost = $_POST['id'];
	$db_table = $prefix."page";
	$query = "UPDATE $db_table SET title='$to_subject',category='$to_category',body='$to_message' WHERE id='{$to_idpost}'" ; //enginetype //category
	$sql = mysql_query($query) or die(mysql_error());
}

?>