<?php

$db_table = $accessdata['prefix']."member";
$query = "SELECT * FROM $db_table WHERE session='{$_SESSION['hashsession']}'";
$result = mysql_query($query) or die(mysql_error());
$row2 = mysql_fetch_array($result);

//$db_table = $accessdata['prefix']."planet";
//$query = "SELECT * FROM $db_table WHERE session='{$_SESSION['hashsession']}'";
//$result = mysql_query($query) or die(mysql_error());
//$row = mysql_fetch_array($result);
/*

Metal Mine					building
Crystal Mine				building
Deuterium Syntheizer		building
Solar Plant					building
Robotics Factory			building
Farm						building
Habitat						building
Shipyard					building

Metal Storage				building
Crystal Storage				building
Deuterium Storage			building
Research Lab				building

Terraformer					building
Missile Silo				building

Alliance Depot				building
*/


if ($_GET['building'] == 'list' ) {
	$querybuilding = array();
	$building = array();
	$buildingtechtree = array();
	echo 'query';
	$db_querybuilding = $accessdata['prefix']."querybuilding";
	$query_querybuilding = "SELECT * FROM $db_querybuilding WHERE idplanet='{$row2['setplanetid']}'";
	$result_querybuilding = mysql_query($query_querybuilding) or die(mysql_error());
	while ($row = mysql_fetch_array($result_querybuilding)) {
		//echo 'query';
		array_push($querybuilding, array('id' => $row['id'],'idplanet' => $row['idplanet'],'name' => $row['name'],'idtag' => $row['idtag'],'timebuild' => $row['timebuild']));
	}
	
	//TECH TREE
	$db_table = $accessdata['prefix']."technologytree";
	$query = "SELECT * FROM $db_table WHERE buildtype='building'";
	$result = mysql_query($query) or die(mysql_error());
	while ($row = mysql_fetch_array($result)) {
		array_push($buildingtechtree, array('name' => $row['name'] ,'idtag' => $row['idtag'],'timebuild' => $row['timebuild']));
	}
	//BUILDING
	$db_building = $accessdata['prefix']."building";
	$query_building = "SELECT * FROM $db_building WHERE idplanet='{$row2['setplanetid']}'";
	$result_building = mysql_query($query_building) or die(mysql_error());
	while ($row = mysql_fetch_array($result_building)) {
		array_push($building, array('id' => $row['id'] ,'name' => $row['name'] ,'idtag' => $row['idtag'],'level' => $row['level']));
	}
	
	$bodycontent .= 'Number Buildings:'. count($buildingtechtree);
	
	//show building, level, build,
	foreach ($buildingtechtree as &$value) {
		$bodycontent .= '<br>'. $value['name'];
		foreach($building as & $buildinglevel) {
			if($value['idtag'] == $buildinglevel['idtag']){
				$bodycontent .= ' [Level:'. $buildinglevel['level'].']';
				break;
			}
		}
		if(!count($querybuilding)){//check if build does not over it
			$bodycontent .= ' <a href="?building=constuction&build='.$value['idtag'].'&planetid='.$row2['setplanetid'].' ">Build</a>' ;
		}else {
			$bodycontent .= ' [building...]';
		}
	}	
	
	$db_querybuilding = $accessdata['prefix']."querybuilding";
	$query_querybuilding = "SELECT * FROM $db_querybuilding WHERE idplanet='{$row2['setplanetid']}'";
	$resultquerybuilding = mysql_query($query_querybuilding) or die(mysql_error());
	
	
	foreach($querybuilding as &$querybuild) {
		$bodycontent .= '<br>'. '[id]'.$querybuild['name'] . 'Build: ' .$querybuild['timebuild'] . "||".date('YmdHis').' DIFF:'.($querybuild['timebuild'] - date('YmdHis'))  .'====';
		if ($querybuild['timebuild'] < date('YmdHis')) {
			$bodycontent .= 'FINISH';
			
			$level = 0;
			$idbuilding = '';
			$buildingfound = false;
			foreach($building as & $build) {
				if ($querybuild['idtag'] == $build['idtag']) {
					$buildingfound = true;
					$level = $build['level'];
					$idbuilding = $build['id'];
					break;
				}
			}
			//DELETE
			$db_querybuilding2 = $accessdata['prefix']."querybuilding";
			$querybuilding2 = "DELETE FROM $db_querybuilding2 WHERE id='{$querybuild['id']}'";
			$resultdel = mysql_query($querybuilding2) or die(mysql_error());
			
			if (!$buildingfound) {
				//echo 'add';
				$db_table = $accessdata['prefix']."building";
				$query = "INSERT INTO $db_table
				(idplanet,name,idtag,level,date)
				VALUES('{$querybuild['idplanet']}','{$querybuild['name']}','{$querybuild['idtag']}',1, '{$date}')";
				mysql_query($query) or die(mysql_error());
				
			}else {
				//echo 'update level:'.$level.' ID:'.$idbuilding;
				$db_table = $accessdata['prefix']."building";
				$level++;
				$query = "UPDATE $db_table SET level='{$level}' WHERE id='{$idbuilding}'";
				$sql = mysql_query($query) or die(mysql_error());
			}
		}
	}
}
if ($_GET['building'] == 'constuction' ) {
	//echo 'build...';
	$db_table = $accessdata['prefix']."technologytree";
	$query = "SELECT * FROM $db_table WHERE idtag='{$_GET['build']}'";
	$result = mysql_query($query) or die(mysql_error());
	$row = mysql_fetch_array($result);
	//$bodycontent .= 'BUILDING...';
	$bodycontent .= $row['name'].' [BUILDING...]';
	
	//$row['name']
	//$row['idtag']
	$datestamp = date('YmdHis');
	$date = date('YmdHis');
	$date += $row['timebuild'];
	$db_table = $accessdata['prefix']."querybuilding";
	$query = "INSERT INTO $db_table
	(idplanet,name,idtag,timebuild,date)
	VALUES('{$_GET['planetid']}','{$row['name']}','{$row['idtag']}','{$date}','{$datestamp}')";
	mysql_query($query) or die(mysql_error());
	
	//$db_table = $accessdata['prefix']."building";
	//$query2 = "SELECT * FROM $db_table WHERE idtag='{$_GET['build']}'";
	//$result2 = mysql_query($query2) or die(mysql_error());
	//$row2 = mysql_fetch_array($result2);
}


//$_SESSION['hashsession'];
?>