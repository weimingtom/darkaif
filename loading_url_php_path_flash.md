# Basic: #
> This is a simple php script that download the files from a different location folder or directory. This php script use header that make it easy to download the file. Flash (actionscript3) will able to read the data once the data is finish downloaded.

```
<?php
$filename = 'main.swf';
//$filename = 'download/main.swf';
header("Content-Type:application/x-shockwave-flash");
#header("Content-Disposition: attachment;filename=$filename");//this download file
header('Pragma: no-cache');
header('Expires: 0');
readfile($filename);
?>
```