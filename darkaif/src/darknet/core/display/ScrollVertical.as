package darknet.core.display 
{
	//{
	import darknet.core.event.ScrollEvent;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	//}
	
	/**
	 * ...
	 * @author Darknet
	 */
	
	public class ScrollVertical extends Sprite
	{
		
		//{
		public var tracker:Sprite = new Sprite();
		public var pheight:Number = 64;
		public var pwidth:Number = 14;
		public var barheight:Number = 64;
		public var barwidth:Number = 14;
		
		public var bgcolor:uint = 0x999999;
		public var fgcolor:uint = 0x000000;
		public var percentage:Number = 0;
		public var scrollpercent:Number = 0.5;
		//}
		
		public function ScrollVertical() {
			create();
			draw();
		}
		
		public function create():void {
			tracker.addEventListener(MouseEvent.MOUSE_DOWN, trackstartdrag);
			tracker.addEventListener(MouseEvent.MOUSE_UP, trackstopdrag);
			addChild(tracker);
		}
		
		public function draw():void {
			if (percentage < 0) { percentage = 0;}
			if (percentage > 1) { percentage = 1; }
			
			graphics.clear();
			graphics.beginFill(bgcolor);
			graphics.drawRect(0, 0, pwidth, pheight);
			graphics.endFill();
			
			if (barheight < 7) {
				barheight = 7;
			}
			if (barheight <= 0) {
				barheight = 1;
			}
			
			tracker.graphics.clear();
			tracker.graphics.beginFill(fgcolor);
			tracker.graphics.drawRect(0, 0, barwidth, barheight);
			tracker.graphics.endFill();
		}
		
		public function trackstartdrag(event:MouseEvent):void {
			tracker.startDrag( false, new Rectangle( 0, 0, 0, pheight - tracker.height) );
			//tracker.startDrag( false, new Rectangle( 0, 0, 0, tracker.height - pheight ) );
			//tracker.startDrag();
			tracker.addEventListener(MouseEvent.MOUSE_MOVE, trackmove);
		}
		public function trackmove(event:Event):void {
			percentage = 1 - (((pheight - tracker.height) -tracker.y) / (pheight - tracker.height));
			dispatchEvent(new ScrollEvent(ScrollEvent.PERCENT, percentage));
			//trace("percentage:"+percentage);
		}
		public function trackstopdrag(event:MouseEvent):void {
			tracker.stopDrag();
			tracker.removeEventListener(MouseEvent.MOUSE_MOVE, trackmove);
		}
		
		public function set _pheight(p_height:Number):void {
			pheight = p_height;
			barheight = p_height * scrollpercent;
			//trace(barheight);
			draw();
		}
		public function get _pheight():Number {
			return pheight;
		}
		
		public function set _pwidth(p_width:Number):void {
			pwidth = p_width;
			draw();
		}
		
		public function get _pwidth():Number {
			return pwidth;
		}
		
		public function set percent(num:Number):void {
			if (num < 0) {num = 0;}
			if (num > 1) {num = 1;}
			
			percentage = num;
			tracker.y = (pheight-barheight) * num;
			draw();
			dispatchEvent(new ScrollEvent(ScrollEvent.PERCENT, num));
		}
		
		public function get percent():Number {
			return percentage;
		}
		
		public function set trackerpercent(num:Number):void {
			barheight = pheight * num;
			draw();
		}
		
	}
	
}