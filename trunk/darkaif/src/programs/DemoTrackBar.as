package  programs
{
	import darknet.core.display.TrackBar;
	import darknet.core.event.ScrollEvent;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class DemoTrackBar extends Sprite
	{
		public var tackbar:TrackBar = new TrackBar();
		
		public function DemoTrackBar() 
		{
			
			tackbar.x = 14;
			tackbar.y = 14;
			tackbar._pwidth = 256;
			
			tackbar.addEventListener(ScrollEvent.PERCENT, percentscroll);
			
			function percentscroll(event:ScrollEvent):void {
				trace(event.percent);
			}
			
			addChild(tackbar);
		}
		
	}
	
}