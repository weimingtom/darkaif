<?php
$fontcolor = "white";
$background = "#22201D";
$foreground = "#363430";

if (!isset($_POST['submit'])){
$MainContent .= '<br>
<center>
<table bgcolor="'.$background.'">
<form enctype="multipart/form-data" action="uploader.php" method="POST">
<tr bgcolor="'.$foreground.'"><td colspan="3"><center>File Submit</center></td></tr>

<tr bgcolor="'.$foreground.'"><td>
File name</td><td>:</td><td><input name="filename" type="text" value="test object"></td>
</tr>
<tr bgcolor="'.$foreground.'"><td>
Image</td><td>:</td> <td><input name="" type="text" value="test"></td>
</tr bgcolor="'.$foreground.'">
<tr bgcolor="'.$foreground.'"><td>
Share Level</td><td>:</td><td>
<select name="sharelevel">
<option value ="0" >No Share</option>
<option value ="1" selected="selected">Share And No Mod</option>
<option value ="2" >Share And Ask</option>
<option value ="3" >Share and Modified</option>
</select>

</td>
</tr>
<tr bgcolor="'.$foreground.'"><td>
Description</td><td>:</td><td><textarea name="info">None Information.</textarea></td>
</tr>
<tr bgcolor="'.$foreground.'"><td>
Choose a file
<td>:</td>
<td>
<input name="uploadedfile" type="file"></td>
</td></tr>
<tr bgcolor="'.$foreground.'"><td colspan="3"><center><input type="submit" value="Upload File"></center></td></tr>
</form>
</table>
</center><br>';
}else{
}
$MainContent .= '<br><center>[]
<br>Respect people works.
<br>Do not upload repeat copies that you will be locked account.
<br>Do not upload Naughty content and materails result ban from site.
<br>Site are being updated. Please respect people who are working this site trying their best.
<br>Also if you submit your materials our site that your agreeing to our term that might change with respect people materials works.
<br>[]
</center>';

//<input type="hidden" name="MAX_FILE_SIZE" value="100000" />
?>
