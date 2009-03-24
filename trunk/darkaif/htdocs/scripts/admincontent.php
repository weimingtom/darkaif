<?php
//echo $bodycontent;
if ($_GET['home'] != null ) {
	include('adminhome.php');
}
if ($_GET['accounts'] != null ) {
	include('adminaccounts.php');
}

if ($_GET['flashapp'] != null ) {
	include('adminflashapplication.php');
}

if ($_GET['maps'] != null ) {
	include('adminmapdata.php');
}

if ($_GET['objectfiles'] != null ) {
	include('adminobjectfiles.php');
}


?>