<?php

/*
* -Loading files from mysql database
* -Requried donwload function ro execute script
* -Get user access
*/

include('config.php');

mysql_connect($host,$username,$password) or die(mysql_error());
mysql_select_db($database) or die(mysql_error());

$time = time();

$usernamemember = 'guest';
$usernamememberhash = md5($usernamemember);

if (($_GET == null)and($_POST['file'] == null)){ //if there no get url it will create the list
	$db_table = $prefix."objectfile";
	$query = "SELECT * FROM $db_table";
	$result = mysql_query($query) or die(mysql_error());
	header("content-type: text/xml");
	$bodycontent .= '<?xml version="1.0" encoding="utf-8" ?><data>';
	while ($row = mysql_fetch_array($result)){ //
		$bodycontent .= '
<file>
	<idobject>' . $row['idhash'].'</idobject>
	<name>' . $row['name'].'</name>
	<type>' . $row['filetype'].'</type>
</file>';
	}
	$bodycontent .= '</data>';
	echo $bodycontent;
}

if (($_GET['file'] != null)and ($_GET['datatype'] == null) and($_GET['action'] == null)){ //this is an id to get the file and send it to the flash app or download it.
	$db_table = $prefix."objectfile";
	$query = "SELECT * FROM $db_table WHERE idhash='{$_GET['file']}'";
	$result = mysql_query($query) or die(mysql_error());
	$row = mysql_fetch_array($result);
	$datafilelocation = '../'.$row['filelocation']; //file location
	$datafilename = $row['filename']; //file name
	$datafiletype = $row['filetype']; //file type
	$type = filetype($datafilelocation); //file type
	//echo $type;
	// Get a date and timestamp
	$today = date("F j, Y, g:i a");
	$time = time();//created date file
	header("content-type:$type");
	header("Content-Disposition: attachment;filename=$datafilename");//download
	header('Pragma: no-cache');
	header('Expires: 0');
	readfile($datafilelocation);
}

else if(($_POST['file'] != null) and  ($_POST['datatype'] == 'xmldata')){
	//echo'hello';
	$db_table = $prefix."objectfile";
	$query = "SELECT * FROM $db_table WHERE idhash='{$_POST['file']}'";
	$result = mysql_query($query) or die(mysql_error());
	$row = mysql_fetch_array($result);
	
	if(!empty($row['idmeshdata'])){
		//echo '[1]';//idmesh found
		$meshdataxml = $_POST['meshdata'];
		$db_table = $prefix."meshdata";
		$query = "SELECT * FROM $db_table WHERE idhash='{$row['idmeshdata']}'";
		$result = mysql_query($query) or die(mysql_error());
		$row = mysql_fetch_array($result);
		echo $row['meshdata'];
	}

}
else if(($_POST['file'] != null) and ($_POST['action'] == 'save')){
//This is the mesh data in xml format
//echo 'hello save:';
	$db_table = $prefix."objectfile";
	$query = "SELECT * FROM $db_table WHERE idhash='{$_POST['file']}'";
	$result = mysql_query($query) or die(mysql_error());
	$row = mysql_fetch_array($result);
	//echo $row['idmeshdata'];
	if(!empty($row['idmeshdata'])){
		//echo '[1]';//idmesh found
		$meshdataxml = $_POST['meshdata'];
		$db_table = $prefix."meshdata";
		$query = "UPDATE $db_table SET meshdata='{$meshdataxml}' WHERE idhash='{$row['idmeshdata']}'";
		$sql = mysql_query($query) or die(mysql_error());
		echo '<data>saveupdate<data>';
	}else{
		//echo '[0]';//idmesh not found
		//echo md5($time.$row['idmeshdata']);
		$idmesh = $row['idhash'];
		$idmeshhash = md5($time.$row['idhash']);
		//echo $idmesh;
		$meshdataxml = $_POST['meshdata'];
		//$meshdataxml = '<hello world>';
		
		$db_table = $prefix."objectfile";
		$query = "UPDATE $db_table SET idmeshdata='{$idmeshhash}' WHERE idhash='{$idmesh}'";
		$sql = mysql_query($query) or die(mysql_error());
		
		$db_meshdata = $prefix.'meshdata';
		mysql_query("INSERT INTO $db_meshdata
		(idhash,idmesh,meshdata,version,idauthor,authorname,date)
		VALUES('{$idmeshhash}','{$idmesh}','{$meshdataxml}','1','{$usernamemember}','{$usernamememberhash}','{$time}')")
		or die(mysql_error());
		echo '<data>save<data>';
		
		//mysql_query("INSERT INTO $db_members
		//(id_encrypt,date_register,ip_address,status,status_no,title,firstname,lastname,gender,name,username,password,p_encrypt,email,is_activated,validation_code)
		//VALUES('$md_membername','$datestamp','$urip','offline','0','Member','','','s','$usernameaccount','$LCusername','{$_POST['pass']}','$coded_password ','$email','1','admin')")
		//or die(mysql_error());
	}
}
else if(($_POST['file'] != null) and ($_POST['action'] == 'saveanimdata')){
	$db_table = $prefix."objectfile";
	$query = "SELECT * FROM $db_table WHERE idhash='{$_POST['file']}'";
	$result = mysql_query($query) or die(mysql_error());
	$row = mysql_fetch_array($result);
	//echo $row['idmeshdata'];
	if(!empty($row['identityobject'])){
		//echo '[1]';//idmesh found
		$meshdataxml = $_POST['animdata'];
		$db_table = $prefix."entityobject";
		$query = "UPDATE $db_table SET animationdata='{$meshdataxml}' WHERE idhash='{$row['identityobject']}'";
		$sql = mysql_query($query) or die(mysql_error());
		echo '<data>animationdatasaveupdate</data>';
	}else{
		//echo '[0]';//idmesh not found
		//echo md5($time.$row['idmeshdata']);
		$idmesh = $row['idhash'];
		$idmeshhash = md5($time.$row['idhash']);
		//echo $idmesh;
		$meshdataxml = $_POST['animdata'];
		//$meshdataxml = '<hello world>';
		
		//update object file
		$db_table = $prefix."objectfile";
		$query = "UPDATE $db_table SET identityobject='{$idmeshhash}' WHERE idhash='{$idmesh}'";
		$sql = mysql_query($query) or die(mysql_error());
		
		//add object data
		$db_meshdata = $prefix.'entityobject';
		mysql_query("INSERT INTO $db_meshdata
		(idhash,idmesh,animationdata,version,idauthor,authorname,date)
		VALUES('{$idmeshhash}','{$idmesh}','{$meshdataxml}','1','{$usernamemember}','{$usernamememberhash}','{$time}')")
		or die(mysql_error());
		echo '<data>animationdatasave</data>';
		
	}
}
else if(($_POST['file'] != null) and  ($_POST['action'] == 'loadanimdata')){
	//mesh id
	$db_table = $prefix."objectfile";
	$query = "SELECT * FROM $db_table WHERE idhash='{$_POST['file']}'";
	$result = mysql_query($query) or die(mysql_error());
	$row = mysql_fetch_array($result);
	
	//entitly id
	if(!empty($row['identityobject'])){
		$db_table = $prefix."entityobject";
		$query = "SELECT * FROM $db_table WHERE idhash='{$row['identityobject']}'";
		$result = mysql_query($query) or die(mysql_error());
		$row = mysql_fetch_array($result);
		echo $row['animationdata'];
	}
}
?>