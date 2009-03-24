<?php
include('page_panel_menu.php');
include('page_panel_content.php');

	echo '
	<center>
	<div><!--a href="index.php"><img src="data/images/corebot_banner02.jpg"--></a></div>
	<div id="mainbody">
	<div id="hmenu">';
	      echo $navigation_panel;
	echo '
	</div>
	<div id="warper">
	<center>';
          echo '<div id="vmenu">';
          echo $panel_menu;
          echo '</div>';
	echo '</center>
	<center> </center>
	
	<!--div id="vmenu">';
	echo 'test area....';
	echo '</div>
	</div-->
	
	<div id="content">';
	echo $MainContent;
	echo '</div>
	</div>
	<div id="hmenu">';
		echo '<a href="index.php">Home</a>';
	echo '
	</div>
	</div>
</center>';
?>