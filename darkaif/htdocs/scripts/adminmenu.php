<?php
//admin menu
//echo $navmenu;
#$navmenu .= '<a href="#"></a>';
$navmenu .= '| <a href="?home=index">Home</a> ';
$navmenu .= '| <a href="?flashapp=index">Flash App.</a> ';
$navmenu .= '| <a href="?accounts=index">Accounts</a> ';
$navmenu .= '| <a href="?maps=index">Maps</a> ';
$navmenu .= '| <a href="?objectfiles=index">Object files</a> ';
$navmenu .= '| <a href="?entity=index">Entity</a> ';
$navmenu .= '| <a href="?monster=index">Flags</a> ';
$navmenu .= '| <a href="?monster=index">Config</a> ';
$navmenu .= '| <a href="?monster=index">System</a> ';
$navmenu .= '| <a href="?action=logout">Logout</a> ';

if($_GET['home'] != null){
$subnavmenu .= '| <a href="?home=index">Home</a> ';
$subnavmenu .= '| <a href="?home=news">News</a> ';
$subnavmenu .= '| <a href="?home=events">Events</a> ';
$subnavmenu .= '| <a href="?home=updates">Updates</a> ';
$subnavmenu .= '| <a href="?home=post">Post</a> ';
}

if($_GET['accounts'] != null){
$subnavmenu .= '| <a href="?accounts=index">Accounts</a> ';
$subnavmenu .= '| <a href="?accounts=members">Members</a> ';
$subnavmenu .= '| <a href="?accounts=permissions">Permissions</a> ';
$subnavmenu .= '| <a href="?accounts=bans">Bans</a> ';
$subnavmenu .= '| <a href="?accounts=messages">Messages</a> ';
$subnavmenu .= '| <a href="?accounts=flags">Flags</a> ';
}

if($_GET['flashapp'] != null){
$subnavmenu .= '| <a href="?flashapp=index">Flash App.</a> ';
$subnavmenu .= '| <a href="?flashapp=games">Games</a> ';
$subnavmenu .= '| <a href="?flashapp=uploadflash">UpLoad Flash</a> ';
}
if($_GET['maps'] != null){
$subnavmenu .= '| <a href="?maps=index">Home</a> ';
$subnavmenu .= '| <a href="?maps=maps">Maps</a> ';
$subnavmenu .= '| <a href="?maps=uploadmap">UpLoad Map</a> ';
$subnavmenu .= '| <a href="?maps=flags">Flags</a> ';
}
if($_GET['objectfiles'] != null){
$subnavmenu .= '| <a href="?objectfiles=index">Home</a> ';
$subnavmenu .= '| <a href="?objectfiles=models">Models</a> ';
$subnavmenu .= '| <a href="?objectfiles=images">Images</a> ';
$subnavmenu .= '| <a href="?objectfiles=thumbnail">Thumbnail</a> ';
$subnavmenu .= '| <a href="?objectfiles=uploadfile">Upload File</a> ';
$subnavmenu .= '| <a href="?objectfiles=flags">Flags</a> ';
}
//Entity
if($_GET['entity'] != null){
$subnavmenu .= '| <a href="?entity=index">Entity</a> ';
$subnavmenu .= '| <a href="?entity=players">Players</a> ';
$subnavmenu .= '| <a href="?entity=characters">Characters</a> ';
$subnavmenu .= '| <a href="?entity=monsters">Monsters</a> ';
$subnavmenu .= '| <a href="?entity=npc">NPC</a> ';
$subnavmenu .= '| <a href="?entity=vehicles">Vehicles</a> ';
#$subnavmenu .= '| <a href="?entity=vehicles">Vehicles</a> ';
$subnavmenu .= '| <a href="?entity=flags">Flags</a> ';
}

?>