<?php
$url_submit = 'newsposting.php';
//echo '<link rel="stylesheet" type="text/css" href="../default.css" />';

$MainContent .= '
<center>
<table border="1" cellpadding="0" cellspacing="0" class="tbtl">';
//echo '<form method="post" action="index.php?action=posting">';
$MainContent .= '<form method="post" action="'.$url_submit.'">';
$MainContent .= '
<tr><td colspan="2" class="tbbr_title">Page Post</td></tr>
<tr><td class="tbbr">Subject:</td>
<td class="tbbr"><input type="text" size="50" maxlength="100" name="subject" class="input"></td>
</tr><tr>
<td class="tbbr">Category:</td>
<td><input type="text" size="50" maxlength="100" name="category" value="news" class="input"></td>
</tr><tr>
<td colspan=2 class="tbbr"><textarea rows="10" cols="45" name="body" wrap="message" class="input"></textarea></td>
</tr><tr>
<td colspan=2 class="tbbr">
<center>
<input type="hidden" name="linkpage" value="'.$url_submit.'">
<input type="hidden" name="posting" value="true">
<input type="submit" value="submit" name="submit" class="input"></center>
</td></tr>
</table></center>';
include('posting_send.php');

print $MainContent;
?>