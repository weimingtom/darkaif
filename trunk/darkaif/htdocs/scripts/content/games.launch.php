<?php
//$_GET['flashid'];
#$MainContent  .= 'hello?';
$flashheight = 480;
$flashwidth = 640;

if ($_GET['flashid'] != null) {
	$db_members = DB_PREFIX."members";
	$query = "select * from $db_members where username='{$_SESSION['username']}'";
	$sql = mysql_query($query) or die(mysql_error());
	#$count = mysql_num_rows($sql);
	$row = mysql_fetch_array($sql);
	$accesslevelmember = $row['access_level'];//member access

   $db_table = $prefix."flashapp";
   $query = "SELECT * FROM $db_table WHERE idhash='{$_GET['flashid']}'";
   $result = mysql_query($query) or die(mysql_error());
   $row = mysql_fetch_array($result);
   #echo $_GET['flashid'];
	if($accesslevelmember >= $row['sharelevel']) {
   if ($_GET['flashid'] == $row['idhash']) {
      if ($row['height'] != null) {
         $flashheight = $row['height'];
      }
      if ($row['width'] != null) {
         $flashwidth = $row['width'];
      }
   }

   $MainContent .= '[Games]
   <center>
   <object classid="" width="'.$flashwidth .'" height="'.$flashheight .'">
        <param name="movie" value="flashapp.php?flashid='.$_GET['flashid'].'" />
        <!--[if !IE]>-->
        <object type="application/x-shockwave-flash" data="flashapp.php?flashid='.$_GET['flashid'].'" width="'.$flashwidth .'" height="'.$flashheight.'">
        <!--<![endif]-->
          <p>Alternative content</p>
        <!--[if !IE]>-->
        </object>
        <!--<![endif]-->
        </object>
        </center> ';
	}else {
		$MainContent .= '<center>Sorry, You have no have access to this flash app. Access level:'.$row['accesslevel'].'</center>';
	}
}
?>