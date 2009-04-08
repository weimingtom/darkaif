package  programs
{
	import darknet.core.display.ScrollBarVertical;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class DemoScrollBarVertical extends Sprite
	{
		
		public function DemoScrollBarVertical() 
		{
			var scroll:ScrollBarVertical = new ScrollBarVertical();
			scroll.trackerpercent = 0.50;
			addChild(scroll);
		}
		
	}
	
}