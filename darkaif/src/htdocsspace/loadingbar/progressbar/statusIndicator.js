/*	Set the overlay graphic to blank out the background
	so it looks like the status indicator is set to the
	right percentage.	*/
function setPercentage(percentage)
	{
	/*	We're subtracting (percentage * 3) from 300 because the div
		width is 300 pixels.  If it was 400 wide we'd do 
		400 - (percentage*4).  	*/
	newWidth = 300 - (percentage * 3) + 'px';
	document.getElementById('whiteOverlay').style.width = newWidth;
	}