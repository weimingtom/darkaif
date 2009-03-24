<?php
echo '
<center>
<div><a href="index.php"><img src="data/images/corebot_banner02.jpg"></a></div>
<div id="mainbody">
	<div id="hmenu">';
	      echo $navigation_panel;
echo '
</div>
<div id="warper">
<center>';
          echo '<div id="hmenu">';
          echo $panel_menu; #echo 'asdasda';
          echo '</div>';
	echo '</center>
	<center> </center>
        <div>';
echo $MainContent;
echo '
</div>
</div>
</div>
</center>';
?>