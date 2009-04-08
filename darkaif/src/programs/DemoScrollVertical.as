package  programs
{
	import darknet.core.display.ScrollVertical;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class DemoScrollVertical extends Sprite
	{
		
		public function DemoScrollVertical() 
		{
			var scroll:ScrollVertical = new ScrollVertical();
			
			
			scroll.percent = 0.8;
			scroll.trackerpercent = 0.10;
			
			addChild(scroll);
		}
		
	}
	
}