<script type="text/javascript" src="js/prototype/prototype.js"></script>

	<!-- jsProgressBarHandler core -->
	<script type="text/javascript" src="js/bramus/jsProgressBarHandler.js">



      Event.observe(window, 'load', function() {

          firstManualPB = new JS_BRAMUS.jsProgressBar($('hereComesMyFirstProgressBar'), 50, {animate: false, width: 240, height: 24});

          secondManualPB = new JS_BRAMUS.jsProgressBar($('hereComesMySecondProgressBar'), 10, {animate: true, showText: false});

      }, false);

</script>


	<style type = "text/css">

		/* General Links */
		a:link { text-decoration : none; color : #3366cc; border: 0px;}
		a:active { text-decoration : underline; color : #3366cc; border: 0px;}
		a:visited { text-decoration : none; color : #3366cc; border: 0px;}
		a:hover { text-decoration : underline; color : #ff5a00; border: 0px;}
		img { padding: 0px; margin: 0px; border: none;}
	</style>



      <span class="firstManualPB" id="hereComesMyFirstProgressBar"></span>

      <div class="percentImage1" id="hereComesMyFirstProgressBar">[ Loading Progress Bar ]</div>




<?php
//          <span class="options"><a href="#" onclick="myJsProgressBarHandler.setPercentage('element1','+5');return false;">
//          <img src="images/icons/add.gif" alt="" title="" onmouseout="$('Text1').innerHTML ='&laquo; Select Options'" onmouseover="$('Text1').innerHTML ='Add 5%'"/></a>
//          </span>

?>