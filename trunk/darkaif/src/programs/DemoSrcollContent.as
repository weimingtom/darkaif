package  programs
{
	import darknet.core.display.ScrollBarVertical;
	import darknet.core.display.ScrollContentVertical;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class DemoSrcollContent extends Sprite
	{
		
		public function DemoSrcollContent() 
		{
			var content:Sprite = new Sprite();
            var scrollbar:ScrollBarVertical = new ScrollBarVertical();
            var rect:Rectangle = new Rectangle( 0, 0, 500, 50 );
		   
            content.graphics.beginFill( 0xFF0000, 1 );
            content.graphics.drawRect( 0, 0, 100, 50 );
            content.graphics.beginFill( 0x00FF00, 1 );
            content.graphics.drawRect( 0, 50, 100, 50 );
            content.graphics.beginFill( 0x0000FF, 1 );
            content.graphics.drawRect( 0, 100, 100, 50 );
            content.graphics.endFill();
			scrollbar.x = content.width;
			scrollbar._pheight = rect.height;
            var sc:ScrollContentVertical = new ScrollContentVertical( content, scrollbar, rect );
			
			addChild( content );
            addChild( scrollbar );
		}
		
	}
	
}