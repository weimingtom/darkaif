/** 
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package darkaif.display {
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	*/
	import flash.display.Sprite;
	import org.flashdevelop.utils.FlashConnect;
	import flash.events.MouseEvent;

	public class Dialog extends Sprite {
	private var Width:Number = 128;
	private var Height:Number = 24;
    private var backgroundColor:uint = 0xFFCC00;
    private var overColor:uint = 0xCCFF00;
    private var downColor:uint = 0x00CCFF;		
		
		public function Dialog(){
			buttonMode = true;
			draw(Width, Height, backgroundColor);
			
			addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
			addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
			addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);			
		}
		
		private function draw(w:uint, h:uint, bgColor:uint):void {
			graphics.clear();
			graphics.beginFill(bgColor);
			graphics.drawRect(0, 0, w, h);
			graphics.endFill();
		}
		
		public function mouseOverHandler(event:MouseEvent):void {
			FlashConnect.trace("mouseOverHandler");
			draw(Width, Height, overColor);
		}
		
		public function mouseOutHandler(event:MouseEvent):void {
			FlashConnect.trace("mouseOutHandler");
			draw(Width, Height, backgroundColor);
		}
		
		public function mouseDownHandler(event:MouseEvent):void {
			FlashConnect.trace("mouseDownHandler");
			draw(Width, Height, downColor);
		}
		
		public function mouseUpHandler(event:MouseEvent):void {
			FlashConnect.trace("mouseUpHandler");
			draw(Width, Height, overColor);
		}		
	}
	
}
