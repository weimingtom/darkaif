package darkaif.core.display
{
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	*/
    import flash.display.Sprite;
    import flash.events.MouseEvent;

    public class Scrollbar extends Sprite{
        // elements
		public var content_height:int = 200;
		public var content_width:int = 10;
		public var _height:int = 10;
		public var _width:int = 10;
        protected var slider:Slider;
        protected var up_arrow:Sprite;
        protected var down_arrow:Sprite;       
        protected var scrollSpeed:Number = .1;
       
        // read/write percentage value relates directly to the slider
        public function get percent():Number { return slider.percent; }
        public function set percent( p:Number ):void { slider.percent = p; }
       
        /**
         * Constructor
         */
        public function Scrollbar(){
            createElements();
        }
        
		// executes when the up arrow is pressed
        protected function arrowPressed( e:MouseEvent ):void{
            var dir:int = (e.target == up_arrow) ? -1 : 1;
            slider.percent += dir * scrollSpeed;
        }
        
		/**
         * Create and initialize the slider and arrow elements.
         */
        protected function createElements():void{
            slider = new Slider(); //class package for scrolling button like type.
			//slider.b_height = this.content_height;
			//top button
            up_arrow = new Sprite();
            up_arrow.graphics.beginFill( 0x666666, 1 );
            up_arrow.graphics.drawRect( 0, 0, _width,_height );
            up_arrow.graphics.endFill();
			//bottom button
            down_arrow = new Sprite();
            down_arrow.graphics.beginFill( 0x666666, 1 );
			down_arrow.graphics.drawRect( 0, 0,_width,_height );
            down_arrow.graphics.endFill();
           
            slider.y = up_arrow.height;//this set the 
            //down_arrow.y = slider.y + slider.height + 400;
			down_arrow.y = slider.y + slider.height;
            //down_arrow.x = 16;
            up_arrow.addEventListener( MouseEvent.MOUSE_DOWN, arrowPressed );
            down_arrow.addEventListener( MouseEvent.MOUSE_DOWN, arrowPressed );
           
            addChild(slider);
            addChild(up_arrow);
            addChild(down_arrow);
        }
		
		protected function destoryElements():void{
			removeChild(slider);
            removeChild(up_arrow);
            removeChild(down_arrow);
		}
        
		/**
         * Override the add and remove event listeners, so that SliderEvent.CHANGE events will be
         * subscribed to the Slider directly.
         *
         * There is issues with this however, Event.CHANGE events will get subscribed directly too Slider as well.
         */
        public override function addEventListener( type:String, listener:Function, useCapture:Boolean=false, priority:int=0, useWeakReference:Boolean=false ):void{
            if ( type === SliderEvent.CHANGE ){
                slider.addEventListener( SliderEvent.CHANGE, listener, useCapture, priority, useWeakReference );
                return;
            }
            super.addEventListener( type, listener, useCapture, priority, useWeakReference );
        }
        
		public override function removeEventListener( type:String, listener:Function, useCapture:Boolean=false ):void{
            if ( type === SliderEvent.CHANGE ){
                slider.removeEventListener( SliderEvent.CHANGE, listener, useCapture );
                return;
            }
            super.removeEventListener( type, listener, useCapture );
        }
		
		public function set Content_height(setheight:int):void {
			//content_height = setheight;
			slider.B_height = setheight - up_arrow.height - down_arrow.height;// srcoll bar background height. Subtract two button srcoll button.
			//slider.B_height = setheight;
			//trace(slider.B_height+":"+setheight);
			//slider.B_height = 40;
			
			removeChild(down_arrow);
			down_arrow = new Sprite();
            down_arrow.graphics.beginFill( 0x666666, 1 );
			down_arrow.graphics.drawRect( 0, 0,_width,_height);
            down_arrow.graphics.endFill();
			down_arrow.y = slider.y + slider.height; //down button
			
            down_arrow.addEventListener( MouseEvent.MOUSE_DOWN, arrowPressed );
			addChild(down_arrow);//This deal with sqaure button for down srcoll button using mouse button.
		}
		
		public function get Content_height():int {
			return slider.B_height;// srcoll bar background height. Subtract two button srcoll button.
			
		}
    }
}