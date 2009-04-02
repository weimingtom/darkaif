package darknet.core.display 
{
	//{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import darknet.core.event.ScrollEvent;
	//}
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class ScrollBarVertical extends Sprite
	{
		
		//{
		public var pheight:Number = 64;
		public var pwidth:Number = 14;
		public var bheight:Number = 7;
		public var bwidth:Number = 14;
		public var bwidthmin:Number = 7;
		public var bwidthmax:Number = 14;
		
		public var buttonup:Sprite = new Sprite();
		public var buttondown:Sprite = new Sprite();
		public var scroll:ScrollVertical = new ScrollVertical();
		public var bcolor:uint = 0x363430;
		public var percentage:Number = 1;
		protected var scrollSpeed:Number = 0.1;
		//}
		
		public function ScrollBarVertical() {	
			create();
			draw();
		}
		
		public function create():void {
			buttonup.addEventListener(MouseEvent.CLICK, buttonup_downstate);
			buttondown.addEventListener(MouseEvent.CLICK, buttondown_downstate);
			scroll.addEventListener(ScrollEvent.PERCENT,scrollpercent);
			
			addChild(buttonup);
			addChild(scroll);
			addChild(buttondown);
		}
		
		public function draw():void {
			buttonup.graphics.clear();
			buttonup.graphics.beginFill(bcolor);
			buttonup.graphics.drawRect(0,0,bwidth,bheight);
			buttonup.graphics.endFill();
			
			scroll.y = bheight;
			scroll._pheight = pheight - (bheight*2);
			
			buttondown.graphics.clear();
			buttondown.graphics.beginFill(bcolor);
			buttondown.graphics.drawRect(0,pheight - bheight,bwidth,bheight);
			buttondown.graphics.endFill();
		}
		
		public function buttonup_downstate(event:Event):void {
			//trace('up');
			//scroll.percent = scroll.percent - (scrollSpeed *0.1);
			scroll.percent = scroll.percent - (scrollSpeed);
			if (scroll.percent < 0) {
				scroll.percent = 0;
			}
		}
		public function buttondown_downstate(event:Event):void {
			//trace('down' );
			//scroll.percent = scroll.percent + (scrollSpeed * 0.1);
			scroll.percent = scroll.percent + (scrollSpeed);
			if (scroll.percent > 1) {
				scroll.percent = 1;
			}
		}
		
		public function set _pheight(num:Number):void {
			pheight = num;
			draw();
		}
		
		public function scrollpercent(event:ScrollEvent):void {
			//trace(">" + percentage);
			//trace(">" + scroll.percent);
			if (!scroll.percent) {
				percentage = 0;
			}else {
				percentage = event.percent;
			}
			dispatchEvent(new ScrollEvent(ScrollEvent.PERCENT, percentage));
		}
		
		public function set trackerpercent(num:Number):void {
			//trace(num);
			if((num > 0) &&(num < 1)){
				scroll.trackerpercent = num;
			}else {
				scroll.trackerpercent = 1;
			}
		}
		
	}
	
}