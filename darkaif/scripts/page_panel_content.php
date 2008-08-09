<?php
/*=================================================================================================
This section will support the content of the main page function.
=================================================================================================*/
#$MainContent .= 'Hello <div class="hr">&nbsp;</div>';
if ($_GET['home'] == 'news') {
include('page_panel_news.php');
$MainContent .= '<center>'.page('news').'</center>';
}elseif ($_GET['home'] == 'about'){
        include('content/about.php');
}elseif ($_GET['member'] == 'member'){
        include('member/memberpanel.php');
}elseif ($_GET == null){ //Default if get array is null for index.php?...
#$MainContent .= '';
include('page_panel_main.php');
}
#echo page('news');

//memberpanel.php

//check if array is null
#if ($_GET != null){
#echo 'NO Null';
#}else{
#echo 'Yes Null';
#}


#==================================================================================================
#$MainContent .= $_GET;

#$MainContent .= print_r($_GET);

#foreach ($_GET as $key => $value) {
#$MainContent .= $key." - ".$value."";
#}
#$MainContent .= print_r($_GET);
#for($GETARRAY = 0;$GETARRAY < count($_GET) ; $GETARRAY++ ){
#$MainContent .= print_r($GETARRAY);
#}
?>