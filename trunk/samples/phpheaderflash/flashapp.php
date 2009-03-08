<?php
$filename = 'main.swf';
header("Content-Type:application/x-shockwave-flash");
#header("Content-Disposition: attachment;filename=$filename");
header('Pragma: no-cache');
header('Expires: 0');
readfile($filename);
?>