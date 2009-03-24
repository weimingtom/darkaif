<?php
#$allowed_filetypes = array('.jpg', '.gif', '.bmp', '.png','.dae', '.ase', '.md2', '.txt', '.flv','.obj','.mlt');
  $MainContent .= '[Games Categories]';
  #$gamecategories = array('rpg','rts','fps');
  //for($HERF = 0;$HERF < count($page_panel_menu) ; $HERF++ ){
  for ($gametype = 0;$gametype < count($gamecategories);$gametype++ ){
      $MainContent .= '<br><a href="?games=categories&gametype='.$gamecategories[$gametype].'">'.$gamecategories[$gametype].'</a>';
  }
  
if($_GET['gametype'] != null ){

  $db_table = $prefix."flashapp";
  if($_GET['gametype'] == 'others'){

    $query = "SELECT * FROM $db_table";
  }else{
    $query = "SELECT * FROM $db_table WHERE category='{$_GET['gametype']}'";
  }
  $result = mysql_query($query) or die(mysql_error());
  
  $tablestyle = ' style="border:1px solid #363430;" ';
  $MainContent .= '<table width="100%">';
  $MainContent .= '<tr style="border:1px solid #363430;">

	<td style="border:1px solid #363430;background:#22201d;">Name</td>
	<td style="border:1px solid #363430;background:#22201d;">Author</td>

	<td style="border:1px solid #363430;background:#22201d;">Date</td>
	<td style="border:1px solid #363430;background:#22201d;">Categories</td>
	<td style="border:1px solid #363430;background:#22201d;">Type</td>
	<td style="border:1px solid #363430;background:#22201d;">Access</td>
	<td style="border:1px solid #363430;background:#22201d;">Actions</td>
   </tr>';
  while ($row = mysql_fetch_array($result)) { //
  $MainContent .= '<tr style="border:1px solid #363430;">
	
	<td '.$tablestyle.'>'.$row['name'].'</td>
	<td '.$tablestyle.'>'.$row['authorname'].'</td>
	
	<td '.$tablestyle.'>'.$row['date'].'</td>
	<td '.$tablestyle.'>'.$row['category'].'</td>
	<td '.$tablestyle.'> '.$row['type'].'</td>
	<td'.$tablestyle.'>';
	//.$row['accesslevel'].
	if ($row['accesslevel'] == '0') {
		$MainContent .= 'public';
	}
	if ($row['accesslevel'] == '1') {
		$MainContent .= 'member';
	}
	if ($row['accesslevel'] == '2') {
		$MainContent .= 'moderator';
	}
	if ($row['accesslevel'] == '3') {
		$MainContent .= 'game master';
	}
	if ($row['accesslevel'] == '4') {
		$MainContent .= 'administrators';
	}
	
	
	$MainContent .='</td>
	<td '.$tablestyle.' >
		<a href="?games=gamelaunch&flashid='.$row['idhash'].'">PLAY</a>
		<a href="?games=gamelaunch&action=report&id='.$row['idhash'].'">REPORT</a>
	</td>
	</tr>';
  }
  $MainContent .= '</table>';
}

?>