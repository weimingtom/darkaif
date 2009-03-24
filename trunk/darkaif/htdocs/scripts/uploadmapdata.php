<?php
$db_table = $prefix.'objectfile';
$objectname = $_POST['filename'];
$membername = "guest";
$datapath = "";

echo '<link rel="stylesheet" type="text/css" href="scripts/default.css" />';
// These will be the types of file that will pass the validation.
$allowed_filetypes = array('.xml');
$xml_filetypes = array('xml');

$max_filesize = 524288; // Maximum filesize in BYTES (currently 0.5MB).
//$max_filesize = 100000; // Maximum filesize in BYTES (currently 0.5MB).

$target_path = 'data/maps/';

$filename = $_FILES['uploadedfile']['name']; // Get the name of the file (including file extension).
$ext = substr($filename, strpos($filename,'.'), strlen($filename)-1); // Get the extension from the filename.
#echo $ext;

	// Check if the filetype is allowed, if not DIE and inform the user.
	if(!in_array($ext,$allowed_filetypes)){
		die('The file you attempted to upload is not allowed.');
	}
	// Now check the filesize, if it is too large then DIE and inform the user.
	if (filesize($_FILES['uploadedfile']['tmp_name']) > $max_filesize){
		die('The file you attempted to upload is too large.');
	}
	#echo md5(basename($_FILES['uploadedfile']['name']));
	$datestamp =  date('Y-m-d-H-i-s');
	$hashname = md5($datestamp.basename($_FILES['uploadedfile']['name']));
	
	//file name and set path
	$target_path = $target_path.$membername.'_'.$hashname.$ext;
	$datapath = "maps";

	$objectnametext = basename($_FILES['uploadedfile']['name']);
	
	#mysql_connect($host,$username,$password) or die(mysql_error());
	#mysql_select_db($database) or die(mysql_error());
	
	$db_table = $prefix."mapdata";
	$query = "SELECT * FROM $db_table WHERE authorname='$membername' AND filename='$objectnametext'";
	$result = mysql_query($query) or die(mysql_error());
	
	$count = mysql_num_rows($result);
	if ($count) {
		$bodycontent .= '[==File Exist==]<br>'.$objectnametext.'<br>';
	}else {
		if (move_uploaded_file($_FILES['uploadedfile']['tmp_name'], '../'.$target_path)) {//update load file
			$datasize = filesize($_FILES['uploadedfile']['tmp_name']); //Maximum filesize in BYTES (currently 0.5MB).
			//file save and get it
			$xmlfilepathsave = '../'.$target_path;
			$xmlDoc = new DOMDocument();
			$xmlDoc->load($xmlfilepathsave);
			$xmldata = $xmlDoc->saveXML();

			#echo $datafile;
			
			mysql_query("INSERT INTO $db_table
				(idhash,name,filelocation,filetype,idauthor,authorname,datatype,date,filename,fileversion,sharelevel,filesize,description,imageid,mapdata,flag,locked)
				VALUES( '$hashname','$objectname','$target_path','$ext','guest','guest','$datapath','$datestamp','$objectnametext','1','{$_POST['sharelevel']}','$datasize','{$_POST['info']}','none','$xmldata','0','0')")
				or die(mysql_error());
			/*
			mysql_query("INSERT INTO $db_table
				(idhash,name,filelocation,filetype,idauthor,authorname,datatype,date,filename,fileversion,sharelevel,filesize,description,imageid)
				VALUES( '$hashname','$objectname','$target_path','$ext','guest','guest','$datapath','$datestamp','$objectnametext','1','{$_POST['sharelevel']}','$datasize','{$_POST['info']}','none')")
				or die(mysql_error());
			*/
			//mapdata
			$bodycontent .= '<br>MAP UPLOAD DONE.';
		} else{
			$bodycontent .= "There was an error uploading the file, please try again!";
		}
	}
	$bodycontent .= '<br>[-DONE-HERE-]';
?>