<?php
/*=================================================================================================
This section will support the content of the main page function.
=================================================================================================*/
#$MainContent .= 'Hello <div class="hr">&nbsp;</div>';

#echo $_GET['home'] ."-]";

//index if get url not there

if($_GET == null) {
	include('home.php');
	$MainContent .= page('news');
	
	$MainContent .= page('news', '1');
	$MainContent .= '<br>';
	
	$MainContent .= page('events');
	$MainContent .= page('events', '1');
	$MainContent .= '<br>';
	
	$MainContent .= page('updates');
	$MainContent .= page('updates', '1');
}


if ($_GET['home'] == 'news') {

	$MainContent .= page('news');
	$MainContent .= page('news', '1');
	#$MainContent .= '--NEWS--';

}else if ($_GET['home'] == 'events') {
	$MainContent .= page('events');
	$MainContent .= page('events', '1');
	#$MainContent .= '--EVENTS--';
	#$MainContent .= '<center>'.page('events').'</center>';

}else if ($_GET['home'] == 'updates') {

	$MainContent .= page('updates');
	$MainContent .= page('updates', '1');
	#$MainContent .= '--EVENTS--';
	#$MainContent .= '<center>'.page('events').'</center>';
}else if ($_GET['home'] == 'about') {
	#$MainContent .= '--ABOUT--';
	include('about.php');
}else if ($_GET['home'] == 'home') {
	#$MainContent .= '--HOME--';
	include('home.php');
	/*
	include('page_panel_news.php');
	$MainContent .= page('news');
	$MainContent .= page('news', '1');
	$MainContent .= '<br>';
	
	$MainContent .= page('events');
	$MainContent .= page('events', '1');
	$MainContent .= '<br>';
	
	$MainContent .= page('updates');
	$MainContent .= page('updates', '1');
	#echo 'Hello';
	*/
}

if ($_GET['games'] == 'games') {
	#$MainContent .= '--HOME--';
	include('scripts/content/games.php');
	#echo 'Hello';
}else if ($_GET['games'] == 'gamelaunch') {
	#$MainContent .= '--HOME--';
	include('scripts/content/games.launch.php');
	#echo 'Hello';
}else if ($_GET['games'] == 'objectfiles') {
	#$MainContent .= '--HOME--';
	include('scripts/content/objectfiles.php');
	#echo 'Hello';
}else if ($_GET['games'] == 'news') {
	#$MainContent .= '--HOME--';
	include('scripts/content/games.news.php');
	#echo 'Hello';
}else if ($_GET['games'] == 'categories') {
	#$MainContent .= '--HOME--';
	include('scripts/content/games.categories.php');
	#echo 'Hello';
}else if ($_GET['games'] == 'uploadfile') {
	#$MainContent .= '--UPLOADED--';
	include('uploadpage.php');
	#echo 'Hello';
}

if ($_GET['support'] == 'faqs') {
	#$MainContent .= '--HOME--';
	include('scripts/content/faqs.php');
	#echo 'Hello';
}else if ($_GET['forum'] == 'forum') {
	#$MainContent .= '--HOME--';
	include('scripts/content/forum.php');
	#echo 'Hello';
}else if ($_GET['support'] == 'support') {
	#$MainContent .= '--HOME--';
	include('scripts/content/support.php');
	#echo 'Hello';
}

if ($_GET['action'] == 'login') {
	#$MainContent .= '--HOME--';
	$MainContent .= '<br><center>'.logintext().'</center><br>';
	#echo 'Hello';
}


?>