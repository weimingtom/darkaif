<?php
$page_navigation_menu = array();
array_push($page_navigation_menu, array('Index', 'Home',     '?home=home',      '0'));
array_push($page_navigation_menu, array('Index', 'Member',   '?member=member',  '0'));
array_push($page_navigation_menu, array('Index', 'Bot',  '?bot=bot','0'));
array_push($page_navigation_menu, array('Index', 'Games',  '?games=games','0'));
array_push($page_navigation_menu, array('Index', 'Explore',  '?expore=explore','0'));
#array_push($page_navigation_menu, array('Index', 'Lanuch Game',  '?lanuchgame=lanuchgame','0'));
#array_push($page_navigation_menu, array('Index',  'Forum',   '?forum=forum',     '0'));
#array_push($page_navigation_menu, array('Index', 'Support',  '?support=support','0'));
array_push($page_navigation_menu, array('Index', 'Logout' ,  '?action=logout',  '0'));
#array_push($page_navigation_menu, array('Index', 'Admin' ,  '?action=logout',  '1'));

//This for access if trying to hack this will prevent it in some case
$page_panel_main_navigation = array();
array_push($page_panel_main_navigation, 'member');
array_push($page_panel_main_navigation, 'games');
array_push($page_panel_main_navigation, 'bot');
array_push($page_panel_main_navigation, 'explore');
#array_push($page_panel_main_navigation, 'lanuchgame');
#array_push($page_panel_main_navigation, 'fourm');
#array_push($page_panel_main_navigation, 'support');
array_push($page_panel_main_navigation, 'home');

$page_panel_menu = array();
#array_push($page_panel_menu, array('home',   'Home',    '?home=home',       '0'));
array_push($page_panel_menu, array('home',   'News',    '?home=news',       '0'));
array_push($page_panel_menu, array('home',   'About',    '?home=about',     '0'));
#array_push($page_panel_menu, array('member', 'Member',  '?member=member',   '0'));
array_push($page_panel_menu, array('member', 'Account Info.',  '?member=accountinfo',   '0'));
array_push($page_panel_menu, array('member', 'messages',  '?member=messages',   '0'));
array_push($page_panel_menu, array('member', 'Settings',  '?member=settings',   '0'));
#array_push($page_panel_menu, array('games',  'Games',   '?games=games',     '0'));
array_push($page_panel_menu, array('games',  'News',   '?games=news',     '0'));
array_push($page_panel_menu, array('games',  'Categories',   '?games=categories',     '0'));
#array_push($page_panel_menu, array('explore','Explore', '?explore=explore', '0'));
array_push($page_panel_menu, array('explore','Explore', '?explore=explore', '0'));
#array_push($page_panel_menu, array('forum',  'Forum',   '?forum=forum',     '0'));
#array_push($page_panel_menu, array('support','Support', '?support=support', '0'));
array_push($page_panel_menu, array('support','FAQS',    '?support=faqs',    '0'));
array_push($page_panel_menu, array('support','Licences',    '?support=licences','0'));
array_push($page_panel_menu, array('logout', 'Logout',  '?action=logout',   '0'));

array_push($page_panel_menu, array('bot','Bot',    '?bot=bot',    '0'));
array_push($page_panel_menu, array('bot','World',    '?bot=world',    '0'));
array_push($page_panel_menu, array('bot','Inventory',    '?bot=inventory',    '0'));
array_push($page_panel_menu, array('bot','Equipments',    '?bot=Equipments',    '0'));
array_push($page_panel_menu, array('bot','Shops',    '?bot=shops',    '0'));
array_push($page_panel_menu, array('bot','Battle',    '?bot=battle',    '0'));
array_push($page_panel_menu, array('bot','Battle Area',    '?bot=battlearea',    '0'));



#echo $page_panel_main_navigation[1];
$panel_menu .= '<ul>';
for($HERF = 0;$HERF < count($page_panel_menu) ; $HERF++ ){
          for($HERF1 = 0;$HERF1 < count($page_panel_main_navigation) ; $HERF1++ ){
                    //if get url is equal not url string action var for getting menu that is clicked
                    if ($_GET[$page_panel_main_navigation[$HERF1]] == $page_panel_menu[$HERF][0]) {
                       #echo 'Found!>'.$page_panel_main_navigation[$HERF1]."]]";
                       $_urlget =$page_panel_main_navigation[$HERF1];
                       #echo '>]>'. $_urlget;
                    }
					//last chack if url is not null for strng action var
					if ($_GET[$page_panel_main_navigation[$HERF1]] != null ){
                       #echo 'Found!>'.$page_panel_main_navigation[$HERF1]."]]";
                       $_urlget =$page_panel_main_navigation[$HERF1];
                       //echo 'NOT NULL';
					   //echo '[->'. $_urlget .'<-]'; echo '[-'.$page_panel_menu[$HERF][0].'-]';
                    }
					
          }
          #echo ']_'.$page_panel_menu[$HERF][0].'_[';
		  //current string action / current strings list check"
          if ($_GET[$_urlget] == $page_panel_menu[$HERF][0]){
             #echo '['.$HERF.']';
             #echo '['.$page_panel_menu[$HERF][0].']';
             $panel_menu .= '<li><a href="'.$page_panel_menu[$HERF][2].'">'.$page_panel_menu[$HERF][1].'</a></li>';
             //echo '[>'.$page_panel_menu[$HERF][1].'<]';
          }elseif ($_urlget == $page_panel_menu[$HERF][0]){
             #echo '['.$HERF.']';
             #echo '['.$page_panel_menu[$HERF][0].']';
             $panel_menu .= '<li><a href="'.$page_panel_menu[$HERF][2].'">'.$page_panel_menu[$HERF][1].'</a></li>';
             //echo '[>'.$page_panel_menu[$HERF][1].'<]';
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