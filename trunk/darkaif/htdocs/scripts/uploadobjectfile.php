<?php
$db_table = $prefix."objectfile";
$objectname = $_POST['filename'];
$membername = "guest";
$datapath = "";
$currentpath = '../';

echo '<link rel="stylesheet" type="text/css" href="scripts/default.css" />';
$allowed_filetypes = array('.jpg', '.gif', '.bmp', '.png','.dae', '.ase', '.md2', '.flv','.obj','.mlt','.3ds','.kmz','.swf','.flv'); // These will be the types of file that will pass the validation.
$mesh_filetypes = array('.ase', '.md2', '.dae', '.3ds', '.obj', '.mlt','.kmz');
$mat_filetypes = array('.jpg','.bmp','.png','.gif');
$flash_filetypes = array('.swf','.flv');

$max_filesize = 524288; // Maximum filesize in BYTES (currently 0.5MB).
//$max_filesize = 100000; // Maximum filesize in BYTES (currently 0.5MB).
#$target_path = "../data/";
$target_path = "data/";
$targetmesh_path = 'data/models/';
$targetimage_path = 'data/images/';
$targetflash_path = '../data/apps/';

$target_path = $target_path . basename( $_FILES['uploadedfile']['name']);
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

	if (in_array($ext, $mat_filetypes)) {
		#echo '[Texture Path]';
		$target_path = $targetimage_path . $membername."_".basename($_FILES['uploadedfile']['name']);
		#echo '[-]'.$target_path.'[-]';
		$datapath = "images";
	}
	  
	if (in_array($ext, $mesh_filetypes)) {
		#echo '[Mesh Path]';
		$target_path = $targetmesh_path . $membername."_".basename($_FILES['uploadedfile']['name']);
		$datapath = "models";
	}
	$objectnametext = basename($_FILES['uploadedfile']['name']);
	
	#mysql_connect($host,$username,$password) or die(mysql_error());
	#mysql_select_db($database) or die(mysql_error());
	
	$db_table = $prefix."objectfile";
	$query = "SELECT * FROM $db_table WHERE authorname='guest' AND filename='$objectnametext'";
	$result = mysql_query($query) or die(mysql_error());
	
	$count = mysql_num_rows($result);
	if ($count) {
		$bodycontent .= '[File Exist:>]<br>'.$objectnametext.'<br>';
	}else {
		
		if (move_uploaded_file($_FILES['uploadedfile']['tmp_name'], '../'.$target_path)) {//update load file
			#echo $_FILES['uploadedfile']['tmp_name']." [] \n";
			$bodycontent .= "<br>The file ".  basename($_FILES['uploadedfile']['name'])." has been uploaded.";
			#echo '<br>'.$filename;
			#echo '<br>'.$target_path;
			$bodycontent .= '<br>Share Level:'.$_POST['sharelevel'].'';
			$datasize = filesize($_FILES['uploadedfile']['tmp_name']); //Maximum filesize in BYTES (currently 0.5MB).
			$bodycontent .= '<br> Files size in byte:'.$datasize;
			$bodycontent .= '<br>Information: '.$_POST['info'];
			
			mysql_query("INSERT INTO $db_table
				(idhash,name,filelocation,filetype,idauthor,authorname,datatype,date,filename,version,sharelevel,filesize,description)
				VALUES( '$hashname','$objectname','$target_path','$ext','guest','guest','$datapath','$datestamp','$objectnametext','1','{$_POST['sharelevel']}','$datasize','{$_POST['info']}')")
				or die(mysql_error());
			
		} else{
			$bodycontent .= "There was an error uploading the file, please try again!";
		}
	}
	$bodycontent .= '<br>[upload][-DONE-HERE-]';
?>