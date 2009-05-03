<?php

/*
Information: Character object is for player, monster, npc meshs are build.
This is for level map placement and loading area.
Need to deal with name and idhash tag part
*/
include('config.php');

mysql_connect($host,$username,$password) or die(mysql_error());
mysql_select_db($database) or die(mysql_error());

$time = time();
$idmeshhash = md5($time.$_POST['name']);
$usernamemember = 'guest';
$usernamememberhash = md5($usernamemember);
$xmloutput = '';
$xmloutput .= '<data>
';

if(($_POST['name'] != null) and ($_POST['action'] == 'save')){
//echo '['.$_POST['name']."=".$_POST['idhash'].']';

	$db_table = $prefix."characterobject";
	
	if (!empty($_POST['idhash'])){
		$query = "SELECT * FROM $db_table WHERE idhash='{$_POST['idhash']}'";
		//echo '1=';
	}else {
		//echo '0=';
		$query = "SELECT * FROM $db_table WHERE name='{$_POST['name']}' AND authorname='{$usernamemember}'";
	}
	
	$result = mysql_query($query) or die(mysql_error());
	$row = mysql_fetch_array($result);
	$count = mysql_num_rows($result);
	//$count = 1;
	//echo $count;
	
	if ($count) {//update file
		//echo 'there...';
		$query = "UPDATE $db_table SET animationdata='{$_POST['animdata']}' WHERE idhash='{$row['idhash']}'";
		$sql = mysql_query($query) or die(mysql_error());
		$xmloutput .= '<message>saveupdate</message>';
	}else {//save file and build it
		echo 'not there...';//not there
		mysql_query("INSERT INTO $db_table
		(idhash,name,animationdata,version,idauthor,authorname,date)
		VALUES('{$idmeshhash}','{$_POST['name']}','{$_POST['animdata']}','1','{$usernamememberhash}','{$usernamemember}','{$time}')")
		or die(mysql_error());
		$xmloutput .= '<message>save</message><idhash>'.$idmeshhash.'</idhash>';
	}
}else if(($_POST['name'] != null) and ($_POST['action'] == 'savemeshdata')){
//echo '['.$_POST['name']."=".$_POST['idhash'].']';

	$db_table = $prefix."characterobject";
	
	if (!empty($_POST['idhash'])){
		$query = "SELECT * FROM $db_table WHERE idhash='{$_POST['idhash']}'";
		//echo '1=';
	}else {
		//echo '0=';
		$query = "SELECT * FROM $db_table WHERE name='{$_POST['name']}' AND authorname='{$usernamemember}'";
	}
	
	$result = mysql_query($query) or die(mysql_error());
	$row = mysql_fetch_array($result);
	$count = mysql_num_rows($result);
	//$count = 1;
	//echo $count;
	
	if ($count) {//update file
		//echo 'there...';
		$query = "UPDATE $db_table SET meshdata='{$_POST['meshdata']}' WHERE idhash='{$row['idhash']}'";
		$sql = mysql_query($query) or die(mysql_error());
		$xmloutput .= '<message>saveupdate</message>';
	}else {//save file and build it
		echo 'not there...';//not there
		mysql_query("INSERT INTO $db_table
		(idhash,name,meshdata,version,idauthor,authorname,date)
		VALUES('{$idmeshhash}','{$_POST['name']}','{$_POST['meshdata']}','1','{$usernamememberhash}','{$usernamemember}','{$time}')")
		or die(mysql_error());
		$xmloutput .= '<message>save</message><idhash>'.$idmeshhash.'</idhash>';
	}
}
else if (($_POST['idhash'] != null) and ($_POST['action'] == 'load')) {
	$actionset = array();
	$db_table = $prefix."entityobject";
	$query = "SELECT * FROM $db_table";
	$result = mysql_query($query) or die(mysql_error());
	while ($row = mysql_fetch_array($result)) {	
		//array_push($querybuilding, array('id' => $row['id'],'idplanet' => $row['idplanet'],'name' => $row['name'],'idtag' => $row['idtag'],'timebuild' => $row['timebuild']));
		array_push($actionset, array('idmesh' => $row['idmesh'], 'name' => $row['name'], 'animationdata' => $row['animationdata']));
		//echo 'build';
	}
	
	$db_table = $prefix."characterobject";
	$query = "SELECT * FROM $db_table WHERE idhash='{$_POST['idhash']}'";
	$result = mysql_query($query) or die(mysql_error());
	//$row = mysql_fetch_array($result);
	$count = mysql_num_rows($result);
	
	//$count = 1;
	//echo $count;
while ($row = mysql_fetch_array($result)) {	
$xmloutput .= '<character>
  <name>'.$row['name'].'</name>
  <idhash>'.$row['idhash'].'</idhash>
  ';
$xmloutput .= $row['meshdata'];
	//convert xml to be able to read them
	$dom = new domDocument();
	$dom->loadXML($row['animationdata']);
	$s = simplexml_import_dom($dom);
	$animationset = array();
	//echo $s->mesh[0]->name;
	for ( $counter = 0; $counter < count($s->mesh); $counter++) {
		//echo $s->mesh[$counter]->name;
		//echo $s->mesh[$counter]->idhash;
		array_push($animationset, array('name' => $s->mesh[$counter]->name, 'idhash' => $s->mesh[$counter]->idhash));
	}
	//build and match actionset
	$customxmla = '';
	$customxmla .= '<animationset>';
	for ( $meshcount = 0; $meshcount < count($animationset); $meshcount++) {
		$customxmla .= '<mesh>';
		$customxmla .= '<name>'.$animationset[$meshcount]['name'].'</name>';
		$customxmla .= '<idhash>'.$animationset[$meshcount]['idhash'].'</idhash>';
		for ($actioncount = 0; $actioncount < count($actionset); $actioncount++ ) {
			if ($actionset[$actioncount]['idmesh'] == $animationset[$meshcount]['idhash']) {
				$animdata = $actionset[$actioncount]['animationdata'];
				$customxmla .= $animdata;
			}
		}
		$customxmla .= '</mesh>';	
	}
	$customxmla .= '</animationset>';
	//echo $customxmla;
	$xmloutput .= $customxmla;
$xmloutput .= '
</character>';
}
}


if(($_POST == null) and ($_GET == null)) {
	$db_table = $prefix."characterobject";
	$query = "SELECT * FROM $db_table ";
	$result = mysql_query($query) or die(mysql_error());
	//$row = mysql_fetch_array($result);
	header ("content-type: text/xml");
	while ($row = mysql_fetch_array($result)) { //
$xmloutput .= '
<character>
	<name>'.$row['name'].'</name>
	<idhash>'.$row['idhash'].'</idhash>
</character>';
	}
}

$xmloutput .= '
</data>';
echo $xmloutput;


?>