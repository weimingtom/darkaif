package  programs
{
	import darknet.core.display.ScrollVertical;
	import darknet.core.display.ScrollBarVertical;
	import flash.display.Sprite;
	import darknet.core.event.ScrollEvent;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class DemoScroll extends Sprite
	{
		
		public function DemoScroll() 
		{
			var scroll:ScrollBarVertical = new ScrollBarVertical();
			//scroll.x = 14;
			//scroll.y = 14;
			//scroll._pheight = 50;
			
			scroll.addEventListener(ScrollEvent.PERCENT, scrollpercent );
			
			
			function scrollpercent(event:ScrollEvent):void {
				trace(event.percent);
			}
			
			addChild(scroll);
		}
		
	}
	
}