<?php
$page_navigation_menu = array();
array_push($page_navigation_menu, array('index', 'Home',     '?home=home',      '0'));
#array_push($page_navigation_menu, array('Index', 'News',     '?home=news',      '0'));
#array_push($page_navigation_menu, array('Index', 'demos',     '?demos=demos',      '0'));
#array_push($page_navigation_menu, array('Index', 'Member',   '?member=member',  '0'));
#array_push($page_navigation_menu, array('Index', 'Bot',      '?bot=bot','0'));
array_push($page_navigation_menu, array('index', 'Games',    '?games=games','0'));
#array_push($page_navigation_menu, array('Index', 'Explore',  '?explore=explore','0'));
array_push($page_navigation_menu, array('index', 'Forum',    '?forum=forum',     '0'));
array_push($page_navigation_menu, array('index', 'Support',  '?support=support', '0'));
if ((login_check() == true)){
	array_push($page_navigation_menu, array('index', 'Logout' ,  '?action=logout',  '0'));
}else {
	array_push($page_navigation_menu, array('index', 'Login' ,  '?action=login',  '0'));
}
#array_push($page_navigation_menu, array('Index', 'Admin' ,  '?action=logout',  '1'));

//This for access if trying to hack this will prevent it in some case
$page_panel_main_navigation = array();

array_push($page_panel_main_navigation, 'member');
array_push($page_panel_main_navigation, 'games');
#array_push($page_panel_main_navigation, 'bot');
#array_push($page_panel_main_navigation, 'explore');
array_push($page_panel_main_navigation, 'fourm');
array_push($page_panel_main_navigation, 'support');
array_push($page_panel_main_navigation, 'home');

$page_panel_menu = array();
#array_push($page_panel_menu, array('home',   'Home',    '?home=home',       '0'));
array_push($page_panel_menu, array('home',   'Home',    '?home=home',       '0'));
array_push($page_panel_menu, array('home',   'News',    '?home=news',       '0'));
array_push($page_panel_menu, array('home',   'Events',    '?home=events',       '0'));
array_push($page_panel_menu, array('home',   'Updates',    '?home=updates',       '0'));
#array_push($page_panel_menu, array('home',   'About',    '?home=about',     '0'));
#array_push($page_panel_menu, array('member', 'Member',  '?member=member',   '0'));

array_push($page_panel_menu, array('member', 'Account Info.',  '?member=accountinfo',   '0'));
array_push($page_panel_menu, array('member', 'Messages',  '?member=messages',   '0'));
array_push($page_panel_menu, array('member', 'Settings',  '?member=settings',   '0'));

array_push($page_panel_menu, array('games',  'Games',   '?games=games',     '0'));
array_push($page_panel_menu, array('games',  'Game Launch',   '?games=gamelaunch',     '0'));
array_push($page_panel_menu, array('games',  'News',   '?games=news',     '0'));
array_push($page_panel_menu, array('games',  'Categories',   '?games=categories',     '0'));
#array_push($page_panel_menu, array('games',  'Object Files',   '?games=objectfiles',     '0'));
#array_push($page_panel_menu, array('games',  'Upload File',   '?games=uploadfile',     '0'));

array_push($page_panel_menu, array('forum',  'Forum',   '?forum=forum',     '0'));

array_push($page_panel_menu, array('support','Support', '?support=support', '0'));
array_push($page_panel_menu, array('support','FAQS',    '?support=faqs',    '0'));
#array_push($page_panel_menu, array('support','Licences',    '?support=licences','0'));
array_push($page_panel_menu, array('logout', 'Logout',  '?action=logout',   '0'));

#echo $page_panel_main_navigation[1];
#$panel_menu = "";
$panel_menu .= '<ul>';
for($HERF = 0; $HERF < count($page_panel_menu) ; $HERF++ ) {//bar panel
	for($HERF1 = 0;$HERF1 < count($page_panel_main_navigation) ; $HERF1++ ){//nav panel
		//check array matches the get from navgation menu get<navname>=var
		if ($_GET[$page_panel_main_navigation[$HERF1]] != null) {
			//get the menu name when set to <navname>=var 
			$_urlget = $page_panel_main_navigation[$HERF1] ;
			break;
		}
	}
	//echo '['.$_urlget.']';
	//current string action / current strings list check"
    if ($_urlget == $page_panel_menu[$HERF][0]) {
		#echo 'PANEL:'.$_urlget;
		$panel_menu .= '<li><a href="'.$page_panel_menu[$HERF][2].'">'.$page_panel_menu[$HERF][1].'</a></li>';
    }elseif($_GET == null){ //default home page links
		if(('home' == $page_panel_menu[$HERF][0])){ //incase the menu is not home parent
			$panel_menu .= '<li><a href="'.$page_panel_menu[$HERF][2].'">'.$page_panel_menu[$HERF][1].'</a></li>';
		}
    }
}
$panel_menu .= '</ul>';
$navigation_panel .= '<ul>';
for($HERF = 0;$HERF < count($page_navigation_menu) ; $HERF++ ){
	$navigation_panel .= '<li><a href="'.$page_navigation_menu[$HERF][2].'">'.$page_navigation_menu[$HERF][1].'</a></li>';
}
$navigation_panel .= '</ul>';
#echo $navigation_panel;


?>