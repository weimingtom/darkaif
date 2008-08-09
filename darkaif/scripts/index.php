<?php
/**
* ...
* @author Darknet
* Copy Rights (c) http://darkaif.googlecode.com
*/
//=================================================================================================
//
//=================================================================================================
echo 'WARNING!';

  if ($_SERVER['SERVER_ADDR'] == '127.0.0.1'){
	$dir = dir(".");
	#echo '<h1>Index of '.$_SERVER['REQUEST_URI'].'<ul></h1>';
	//List files in images directory
	while (($file = $dir->read()) !== false){
		echo "<li><a href=".$file.">" . $file . "</li>";
	}
	echo '</ul>';
	$dir->close();
  }


?>