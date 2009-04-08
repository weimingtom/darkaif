package darknet.core.display 
{
	import darknet.core.event.ScrollEvent;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class TrackBar extends Sprite
	{
		//{
		public var pheight:Number = 14;
		public var pwidth:Number = 100;
		
		//public var barheight:Number = 7;
		//public var barwidth:Number = 100;
		
		public var bgcolor:uint = 0xc8c8c8;
		public var tracker:Sprite = new Sprite();
		public var trackercolor:uint = 0x363430;
		public var trackerheight:Number = 14;
		public var trackerwidth:Number = 7;
		
		public var percent:Number = 0;
		//}
		
		public function TrackBar() 
		{
			create();
			draw();
		}
		
		public function create():void {
			tracker.addEventListener(MouseEvent.MOUSE_DOWN, startdragtracker);
			tracker.addEventListener(MouseEvent.MOUSE_OUT, stopdragtracker);
			tracker.addEventListener(MouseEvent.MOUSE_UP,stopdragtracker);
			addChild(tracker);
		}
		
		public function startdragtracker(event:Event):void {
			tracker.startDrag(false, new Rectangle(0, 0, pwidth - tracker.width, 0));
			tracker.addEventListener(MouseEvent.MOUSE_MOVE, movedragtracker);
		}
		
		public function stopdragtracker(event:Event):void {
			tracker.stopDrag();
			tracker.removeEventListener(MouseEvent.MOUSE_MOVE, movedragtracker);
		}
		
		public function movedragtracker(event:Event):void {
			percentage();
		}
		
		public function draw():void {
			graphics.clear();
			graphics.beginFill(bgcolor);
			graphics.drawRect(0, 0, pwidth, pheight);
			graphics.endFill();
			
			tracker.graphics.clear();
			tracker.graphics.beginFill(trackercolor);
			tracker.graphics.drawRect(0, 0, trackerwidth, trackerheight);
			tracker.graphics.endFill();
		}
		
		public function percentage():void {
			percent = ((tracker.x) / (pwidth - tracker.width));
			//trace(percent);
			dispatchEvent(new ScrollEvent(ScrollEvent.PERCENT, percent));
		}
		
		public function set _pheight(num:Number):void {
			pheight = num;
			draw();
		}
		public function get _pheight():Number {
			return pheight;
		}
		public function set _pwidth(num:Number):void {
			pwidth = num;
			draw();
		}
		public function get _pwidth():Number {
			return pwidth;
		}
	}
	
}