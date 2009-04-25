<?php

function buildprogressbar(){
$strbar = '';
$strbar .= '<link rel="stylesheet" type="text/css" href="statusIndicator.css">
<script type="text/javascript" src="statusIndicator.js"></script>
<div id="statusIndicator" class="statusBar">
<img class="whiteOverlay" id="whiteOverlay" src="progressbar-gray.gif">';
return $strbar;
}

function progressbarpercent($percent){
$strbar = '';
$strbar .= '<script type="text/javascript">
setPercentage('.$percent.');
</script>';
return $strbar;
}


?>