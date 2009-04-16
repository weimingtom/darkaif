<?php
//$bodycontent .= 'HELLO';
include('progressbar.php');

mysql_connect($accessdata['host'],$accessdata['username'],$accessdata['password']) or die(mysql_error());
mysql_select_db($accessdata['database']) or die(mysql_error());
set_time_limit(999);
if($_GET['galaxy'] == 'galaxy') {

}
elseif($_GET['galaxy'] == 'creategalaxy') {

$bodycontent .= '<table>';
$bodycontent .= '<form method="post" action="?galaxy=buildgalaxy">';

$bodycontent .= '<tr>';
$bodycontent .= '<td>galaxy max: <input type="text" name="galaxyno" value="9"></td>';
$bodycontent .= '</tr>';

$bodycontent .= '<tr>';
$bodycontent .= '<td>random height: <input type="text" name="height" value="100"></td>';
$bodycontent .= '</tr>';

$bodycontent .= '<tr>';
$bodycontent .= '<td>random length: <input type="text" name="length" value="100"></td>';
$bodycontent .= '</tr>';

$bodycontent .= '<tr>';
$bodycontent .= '<td>random width: <input type="text" name="width" value="100"></td>';
$bodycontent .= '</tr>';

$bodycontent .= '<tr>';
$bodycontent .= '<td><input type="submit" value="submit"></td>';
$bodycontent .= '</tr>';

$bodycontent .= '</form>';
$bodycontent .= '</table>';

}
elseif($_GET['galaxy'] == 'buildgalaxy') {
echo $_POST['galaxyno'].$_POST['height'].$_POST['length'].$_POST['width'];
$galaxyno = 0;
$db_table = $accessdata['prefix']."galaxy"; //$db_database_prefix."members";
	while($galaxyno < $_POST['galaxyno']) {
		$position_x = rand( -($_POST['width']/2), ($_POST['width']/2));
		$position_y = rand( -($_POST['height']/2), ($_POST['height']/2));
		$position_z = rand( -($_POST['length'] / 2), ($_POST['length'] / 2));
		$time = time();
		$query = "INSERT INTO $db_table
		(name,x,y,z,date)
		VALUES('nameless', '{$position_x}', '{$position_y}', '{$position_z}', '{$time}')";
		mysql_query($query) or die(mysql_error());
		$galaxyno++;
	}
	$bodycontent .= 'galaxy build:'.$_POST['galaxyno'];
}
elseif($_GET['galaxy'] == 'galaxymap') {
$db_table = $accessdata['prefix']."galaxy";
$query = "SELECT * FROM $db_table";
$result = mysql_query($query) or die(mysql_error());
$bodycontent .= '<table border="1">';
$bodycontent .= '<tr><td>ID</td><td>Name</td><td>Position</td><td>Number of Solar System</td><td>Solar System Map</td></tr>';
while ($row = mysql_fetch_array($result)) {
$bodycontent .= '<tr>';
$bodycontent .= '<td>'.$row['id'].'</td>';
$bodycontent .= '<td>'.$row['name'].'</td>';
$bodycontent .= '<td>'.$row['x'].':'.$row['y'].':'.$row['z'].'</td>';

$bodycontent .= '<td>';

$db_table = $accessdata['prefix']."solarsystem";
$query = "SELECT * FROM $db_table WHERE idgalaxy='{$row['id']}'";
$resultcount = mysql_query($query) or die(mysql_error());
$num_rows = mysql_num_rows($resultcount); 

$bodycontent .= $num_rows;


$bodycontent .='</td>';

$bodycontent .= '<td><a href="?galaxy=solarsystem&galaxyid='.$row['id'].'">Map</a> <a href="?galaxy=createsolarsystem&galaxyid='.$row['id'].'">Create Solar System</a></td>';
$bodycontent .= '</tr>';
}
$bodycontent .= '</table>';
}
elseif($_GET['galaxy'] == 'solarsystem') {
echo buildprogressbar();
$galaxyid = $_GET['galaxyid'];
$db_table = $accessdata['prefix']."solarsystem";
$query = "SELECT * FROM $db_table WHERE idgalaxy='{$galaxyid}'";
$result = mysql_query($query) or die(mysql_error());
$bodycontent .= '[Galaxy ID]:'.$galaxyid;
$bodycontent .= '<br><a href="?galaxy=createsolarsystemplanet&galaxyid='.$galaxyid.'">Create Solar System Planet</a>';
$bodycontent .= '<table border="1">';
$bodycontent .= '<tr><td>ID</td><td>Name</td><td>Position</td><td>Number of Planets</td><td>Actions</td></tr>';
$solarsystemrows = mysql_num_rows($result); 
$count = 0;
while ($row = mysql_fetch_array($result)) {
	$percent = ($count / $solarsystemrows) * 100;
	echo progressbarpercent($percent);
	ob_flush();
	flush();
	
	$bodycontent .= '<tr>';
	$bodycontent .= '<td>'.$row['id'].'</td>';
	$bodycontent .= '<td>'.$row['name'].'</td>';
	$bodycontent .= '<td>'.$row['x'].':'.$row['y'].':'.$row['z'].'</td>';

	$bodycontent .= '<td>';

	$db_table = $accessdata['prefix']."planet";
	$query = "SELECT * FROM $db_table WHERE idsolarsystem='{$row['id']}'";
	$resultcount = mysql_query($query) or die(mysql_error());
	$num_rows = mysql_num_rows($resultcount); 

	$bodycontent .= $num_rows;
	$bodycontent .='</td>';
	$bodycontent .= '<td><a href="?galaxy=planet&solarsystemid='.$row['id'].'">Map</a></td>';
	$bodycontent .= '</tr>';
	$count++;
}
//echo progressbarpercent(0);
$bodycontent .= '</table>';


}
elseif($_GET['galaxy'] == 'createsolarsystem') {
$bodycontent .= '<table>';
$bodycontent .= '<form method="post" action="?galaxy=buildsolarsystem">';

$bodycontent .= '<tr>';
$bodycontent .= '<td>Creating Solar System</td>';
$bodycontent .= '</tr>';

$bodycontent .= '<tr>';
$bodycontent .= '<td>Galaxy ID <input type="text" name="galaxyid" value="'.$_GET['galaxyid'].'"> ';
$bodycontent .= '</tr>';


$bodycontent .= '<tr>';
$bodycontent .= '<td>Solar System Max: <input type="text" name="solarsystemno" value="500"></td>';
$bodycontent .= '</tr>';

$bodycontent .= '<tr>';
$bodycontent .= '<td>random height: <input type="text" name="height" value="100"></td>';
$bodycontent .= '</tr>';

$bodycontent .= '<tr>';
$bodycontent .= '<td>random length: <input type="text" name="length" value="1000"></td>';
$bodycontent .= '</tr>';

$bodycontent .= '<tr>';
$bodycontent .= '<td>random width: <input type="text" name="width" value="1000"></td>';
$bodycontent .= '</tr>';

$bodycontent .= '<tr>';
$bodycontent .= '<td><input type="submit" value="submit"></td>';
$bodycontent .= '</tr>';

$bodycontent .= '</form>';
$bodycontent .= '</table>';
}
elseif($_GET['galaxy'] == 'buildsolarsystem') {

echo buildprogressbar();
echo '<br>This may take a while to build the solar system.';

$solarsystem = 0;
$db_table = $accessdata['prefix']."solarsystem"; 
	while ($solarsystem < $_POST['solarsystemno']) {
		/*
		
		echo '<script type="text/javascript">
		setPercentage('.$percent.');
		< / script > ';
		*/
		$percent = ($solarsystem / $_POST['solarsystemno']) * 100;
		echo progressbarpercent($percent);
		ob_flush();
		flush();
		//sleep(1);
		
		$position_x = rand( -($_POST['width']/2), ($_POST['width']/2));
		$position_y = rand( -($_POST['height']/2), ($_POST['height']/2));
		$position_z = rand( -($_POST['length'] / 2), ($_POST['length'] / 2));
		$time = time();
		$query = "INSERT INTO $db_table
		(name,idgalaxy,x,y,z,date)
		VALUES('nameless','{$_POST['galaxyid']}','{$position_x}', '{$position_y}', '{$position_z}', '{$time}')";
		mysql_query($query) or die(mysql_error());
		$solarsystem++;
	}
	$bodycontent .= 'Number Solar System Build:'.$_POST['solarsystemno'].' Galaxy ID:'.$_POST['galaxyid'];
	//echo progressbarpercent(0);
}
elseif($_GET['galaxy'] == 'createsolarsystemplanet') {
$bodycontent .= 'Note this will take 2 minute or more to finish building the planets. Time Out (500)';
$bodycontent .= '<table>';
$bodycontent .= '<form method="post" action="?galaxy=buildsolarsystemplanet&galaxyid='.$_GET['galaxyid'] .'">';

$bodycontent .= '<tr>';
$bodycontent .= '<td>Creating Solar System Planets</td>';
$bodycontent .= '</tr>';

$bodycontent .= '<tr>';
$bodycontent .= '<td>Galaxy ID: <input type="text" name="galaxyid" value="'.$_GET['galaxyid'].'"></td>';
$bodycontent .= '</tr>';

$bodycontent .= '<tr>';
$bodycontent .= '<td>Number of Planets: <input type="text" name="planetno" value="15"></td>';
$bodycontent .= '</tr>';


$bodycontent .= '<tr>';
$bodycontent .= '<td>Planet Ring Size: <input type="text" name="radius" value="100"></td>';
$bodycontent .= '</tr>';

$bodycontent .= '<tr>';
$bodycontent .= '<td>Planet Random Min Size: <input type="text" name="planetmin" value="50"></td>';
$bodycontent .= '</tr>';

$bodycontent .= '<tr>';
$bodycontent .= '<td>Planet Random Max Size: <input type="text" name="planetmax" value="150"></td>';
$bodycontent .= '</tr>';

$bodycontent .= '<tr>';
$bodycontent .= '<td><input type="submit" value="submit"></td>';
$bodycontent .= '</tr>';

$bodycontent .= '</form>';
$bodycontent .= '</table>';
}
elseif($_GET['galaxy'] == 'buildsolarsystemplanet') {
echo buildprogressbar();
echo '<br> This will take more than 2 minute...';
	$galaxyid = $_GET['galaxyid'];
	$db_table = $accessdata['prefix']."solarsystem";
	$query = "SELECT * FROM $db_table WHERE idgalaxy='{$galaxyid}'";
	$result = mysql_query($query) or die(mysql_error());
	$rowcount = mysql_num_rows($result);
	$solarsystemcount = 0;
	while ($row = mysql_fetch_array($result)) {
		$solarsystemid = $row['id'];
		$planet = 0;
		$percent = ($solarsystemcount / $rowcount) * 100;
		echo progressbarpercent($percent);	
		ob_flush();
		flush();
		while ($planet < $_POST['planetno']) {
			$ringradius = rand( 10, ($_POST['radius']));
			$size = rand($_POST['planetmin'], $_POST['planetmax']);
			$time = time();
			$db_table = $accessdata['prefix']."planet";
			$query = "INSERT INTO $db_table
			(name,idsolarsystem,ringradius,size,date)
			VALUES('nameless','{$solarsystemid}','{$ringradius}','{$size}','{$time}')";
			mysql_query($query) or die(mysql_error());
			$planet++;
		}
		$solarsystemcount++;
	}
$bodycontent .= 'Finish building solarplanets...';
}
elseif($_GET['galaxy'] == 'planet') {

$solarsystemid = $_GET['solarsystemid'];
$db_table = $accessdata['prefix']."planet";
$query = "SELECT * FROM $db_table WHERE idsolarsystem='{$solarsystemid}'";
$result = mysql_query($query) or die(mysql_error());

$bodycontent .= '[Solar System ID]:'.$_GET['solarsystemid'];
$bodycontent .= '<table border="1">';
$bodycontent .= '<tr><td>ID</td><td>Name</td><td>ringradius</td><td>Actions</td></tr>';
while ($row = mysql_fetch_array($result)) {
$bodycontent .= '<tr>';
$bodycontent .= '<td>'.$row['id'].'</td>';
$bodycontent .= '<td>'.$row['name'].'</td>';
$bodycontent .= '<td>'.$row['ringradius'].'</td>';
$bodycontent .= '<td><a href="">Map</a></td>';
$bodycontent .= '</tr>';
}
$bodycontent .= '</table>';

}

?>