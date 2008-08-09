/**
* ...
* @author Default
* @version 0.1
*/

package
{
    import flash.display.Sprite;
    import flash.geom.Rectangle;

    public class ScrollContent extends Sprite
    {
        // elements
        protected var content:Sprite;
        protected var scrollbar:Scrollbar;
        protected var contentHeight:Number;
       
        /**
         * Constructor
         */
        public function ScrollContent( clip:Sprite, scroller:Scrollbar, scrollRect:Rectangle )
        {
            content = clip;
            contentHeight = clip.height;
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