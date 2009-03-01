/**
* ...
* @author Default
* @version 0.1
*/

package programs{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.geom.Rectangle;
	import darkaif.frame.*;

    public class ScrollbarExample extends Sprite
    {
        public function ScrollbarExample()
        {
            var content:Sprite = new Sprite();
            var scrollbar:Scrollbar = new Scrollbar();
            var rect:Rectangle = new Rectangle( 0, 0, 500, 50 );
		   
            content.graphics.beginFill( 0xFF0000, 1 );
            content.graphics.drawRect( 0, 0, 100, 50 );
            content.graphics.beginFill( 0x00FF00, 1 );
            content.graphics.drawRect( 0, 50, 100, 50 );
            content.graphics.beginFill( 0x0000FF, 1 );
            content.graphics.drawRect( 0, 100, 100, 50 );
            content.graphics.endFill();
           
            var sc:ScrollContent = new ScrollContent( content, scrollbar, rect );
           
            scrollbar.x = content.width;
			scrollbar.Content_height = rect.height;
           
            addChild( content );
            addChild( scrollbar );
        }
    }
}