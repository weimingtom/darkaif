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
}


?>