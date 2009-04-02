package darknet.core.display 
{
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	import darknet.core.event.ScrollEvent;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class ScrollContentVertical 
	{
		protected var content:Sprite;
		protected var scrollbar:ScrollBarVertical;
        protected var contentHeight:Number = 100;
		
		public function ScrollContentVertical(clip:Sprite, scroller:ScrollBarVertical, scrollRect:Rectangle) 
		{
			content = clip;
            contentHeight = clip.height;
			content.scrollRect = scrollRect;
			scrollbar = scroller;
            scrollbar.addEventListener( ScrollEvent.PERCENT, updateContent );
		}
		
		public function updateContent( e:ScrollEvent ):void
        {
            var scrollable:Number = contentHeight - content.scrollRect.height;
            var sr:Rectangle = content.scrollRect.clone();
			sr.y = scrollable * e.percent; 
            content.scrollRect = sr;
        }
		
	}
	
}