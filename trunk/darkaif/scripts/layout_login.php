<?php
echo '
<center>
<div><a href="index.php"><img src="data/images/corebot_banner02.jpg"></a></div>
<div id="mainbody">
	<div id="hmenu">
	';
	      echo $navigation_panel;
		#echo '<li><a href="?home=home">Home</a></li>';
		#echo '<li><a href="?home=news">News</a></li>';
		#echo '<li><a href="index=fourm">Forum</a></li>';
		#echo '<li><a href="?support=support">Support</a></li>';
	echo '
</div>
<div id="warper">
<center>';
          echo '<div id="hmenu">';
          #echo 'support';
          //echo $navigation_panel;
          echo $panel_menu; #echo 'asdasda';
          echo '</div>';
        #include('content_panel.php'); //body CONTENT
	echo '</center>
	<center> </center>
<div>';
echo $MainContent;
echo '
</div>
</div>
</div>
</center>';
#<center><div class="hr">&nbsp;</div> </center>
#<div class="hr">Welcome Guest &nbsp;</div>
#<div class="hr">&nbsp;</div>

?>