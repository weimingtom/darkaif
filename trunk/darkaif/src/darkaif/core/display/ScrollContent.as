package darkaif.core.display
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
            contentHeight = clip.height;
			//trace("clipheight:"+clip.height);
            content.scrollRect = scrollRect;
            scrollbar = scroller;
            scrollbar.addEventListener( SliderEvent.CHANGE, updateContent );
			//addChild(clip);
			//addChild(scroller);
        }
       
        public function updateContent( e:SliderEvent ):void
        {
            var scrollable:Number = contentHeight - content.scrollRect.height;
			//trace("content height:" + contentHeight +": scroll content:" + content.scrollRect.height);
            var sr:Rectangle = content.scrollRect.clone();
			//trace("scroll:" + scrollable + ":" + e.percent);
			sr.y = scrollable * e.percent; 
            //sr.y = 44 * e.percent; 
			//trace(sr.y);
            content.scrollRect = sr;
        }
		
    }
	
}