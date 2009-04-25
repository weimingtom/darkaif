<?php
$menulink = array();
//$menulink = array('galaxy create','?galaxy=creat')
array_push($menulink, array('galaxy','Galaxy', '?galaxy=galaxy'));
//array_push($menulink, array('galaxy solar', 'Solar', '?galaxy=galaxysolar'));
array_push($menulink, array('member', 'member', '?member=member'));
array_push($menulink, array('home', 'Logout', '?action=logout'));

for($HERF = 0;$HERF < count($menulink) ; $HERF++ ){
	$menu .= ' <a href="'.$menulink[$HERF][2].'">'.$menulink[$HERF][1].'</a> ';
}

if ($_GET['member'] != null){
$menu .= '<br>';
$menu .= ' <a href="?member=createmember">Create Member</a> ';
$menu .= ' <a href="?member=memberlist">Member List</a> ';
$menu .= '';

}

if ($_GET['galaxy'] != null){
$menu .= '<br>';
$menu .= ' <a href="?galaxy=creategalaxy">CreateGalaxy</a> ';
$menu .= ' <a href="?galaxy=galaxymap">Galaxy Map</a> ';
}


if($_SESSION['hashsession']){
$_SESSION['hashsession'];
$menu .= ' <a href="?building=list">Buildings</a> ';
$menu .= ' <a href="?shipyard=list">Shipyard</a> ';
$menu .= ' <a href="?research=list">Research</a> ';
$menu .= ' <a href="?defence=list">Defence</a> ';


}











?>