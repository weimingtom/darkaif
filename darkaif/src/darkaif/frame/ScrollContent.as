package darkaif.frame 
{	
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	*/
    import flash.display.Sprite;
    import flash.geom.Rectangle;
	import org.flashdevelop.utils.FlashConnect;

    public class ScrollContent extends Sprite
    {
        // elements
        protected var content:Sprite;
        protected var scrollbar:Scrollbar;
        protected var contentHeight:Number = 100;
       
        /**
         * Constructor
         */
        public function ScrollContent( clip:Sprite, scroller:Scrollbar, scrollRect:Rectangle )
        {
            content = clip;
            this.contentHeight = clip.height;
            content.scrollRect = scrollRect;
            scrollbar = scroller;
            scrollbar.addEventListener( SliderEvent.CHANGE, updateContent );
        }
       
        public function updateContent( e:SliderEvent ):void
        {
            var scrollable:Number = contentHeight - content.scrollRect.height;
            var sr:Rectangle = content.scrollRect.clone();
            sr.y = scrollable * e.percent;           
            content.scrollRect = sr;
        }
    }
	
}