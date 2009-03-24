<?php
/**
* ...
* @author Darknet
* Copy Rights (c) http://darkaif.googlecode.com
*/
//Start the session so we can store what the security code actually is
session_start();
if($_GET['image'] != null){
	include('scripts/config.php');
	$idimage = $_GET['image'];
	mysql_connect($host,$username,$password) or die(mysql_error());
	mysql_select_db($database) or die(mysql_error());
	$membername = 'guest';
	$db_table = $prefix."objectfile";
	$query = "SELECT * FROM $db_table WHERE idhash='{$_GET['image']}'";
	$result = mysql_query($query) or die(mysql_error());
	$row = mysql_fetch_array($result);
	$uploadedfile = $row['filelocation'];
	#echo $row['imageid'];
	#echo 'HELLO'.$row['imageid'] ;
	#echo '[-]found[-]';
	
	if ($row['imageid'] != null ) {
		#echo 'found';
		$db_table = $prefix."thumbnail";
		$thumbnailid = $row['imageid'] ;
		#echo $thumbnailid;
		$query = "SELECT * FROM $db_table WHERE idhash='{$thumbnailid}'";
		$result = mysql_query($query) or die(mysql_error());
		$row = mysql_fetch_array($result);
		#echo $row['filelocation'];
		#echo '<img src="'.$row['filelocation'].'>';
		$uploadedfile = $row['filelocation'];
		#echo '[-]'.$uploadedfile.'[-]';
		if ($uploadedfile == null) {
			$uploadedfile = 'data/images/close.jpg';
		}
		#echo '[-]'.$uploadedfile.'[-]';
		#$uploadedfile = $row['filelocation'];
		$width = 64;
		$height = 64;
		
		list($width_orig, $height_orig) = getimagesize($uploadedfile);
		$ratio_orig = $width_orig/$height_orig;
		if ($width/$height > $ratio_orig) {
			$width = $height*$ratio_orig;
		} else {
			$height = $width/$ratio_orig;
		}
		$image_p = imagecreatetruecolor($width, $height);
		$image = imagecreatefromjpeg($uploadedfile);
		imagecopyresampled($image_p, $image, 0, 0, 0, 0, $width, $height, $width_orig, $height_orig);
		imagejpeg($image_p,$full_path, 100);
		header('Content-type: image/jpeg');
		imagejpeg($image_p,null, 100);
		imagedestroy($image_p);
		imagedestroy($image);
		
		/*
		$src = imagecreatefromjpeg($uploadedfile);
		list($width, $height) = getimagesize($uploadedfile);
		$newwidth = 64;
		$newheight = 64;
		$tmp = imagecreatetruecolor($newwidth, $newheight);
		imagecopyresampled($tmp, $src, 0, 0, 0, 0, $newwidth, $newheight, $width, $height);
		header("Content-Type: image/jpeg"); 
		imagejpeg($tmp,null,100);
		imagedestroy($src);
		imagedestroy($tmp);
		*/
	}
	else if ($_GET['convert'] == 'image')
	{
		#echo 'not found';
		//create a database
		$db_table = $prefix."thumbnail";
		$datestamp =  date('Y-m-d-H-i-s');
		$hashname = md5($datestamp.'_thumbnail'); //thumbnail name
		$ext = $row['filetype']; //ext name
		$datafilename = $hashname.'_thumbnail'.$ext;
		$datapath = 'data/images/';
		$full_path = $datapath.$datafilename;
		
		
		mysql_query("INSERT INTO $db_table
		(idhash,name,filelocation,filetype,idauthor,authorname,datatype,date,filename,imageid)
		VALUES( '$hashname','$hashname','$full_path','$ext','guest','guest','images','$datestamp','$datafilename','{$hashname}')")
		or die(mysql_error());
		
		
		//$_GET['image']
		//echo '---';
		$IDIMAGE = $_GET['image'];
		$db_table = $prefix."objectfile";
		
		mysql_query("UPDATE  $db_table SET imageid='{$hashname}' WHERE idhash='{$IDIMAGE}'")
		or die(mysql_error());
		
		
		//$src = imagecreatefromjpeg($uploadedfile);
		#header("Content-Type: image/jpeg"); 
		
		$uploadedfile = $row['filelocation'];
		$width = 64;
		$height = 64;
		
		list($width_orig, $height_orig) = getimagesize($uploadedfile);
		$ratio_orig = $width_orig/$height_orig;
		if ($width/$height > $ratio_orig) {
			$width = $height*$ratio_orig;
		} else {
			$height = $width/$ratio_orig;
		}
		$image_p = imagecreatetruecolor($width, $height);
		$image = imagecreatefromjpeg($uploadedfile);
		imagecopyresampled($image_p, $image, 0, 0, 0, 0, $width, $height, $width_orig, $height_orig);
		imagejpeg($image_p,$full_path, 100);
		header('Content-type: image/jpeg');
		imagejpeg($image_p,null, 100);
		imagedestroy($image_p);
		imagedestroy($image);
		
	}
	
}
exit();

?>