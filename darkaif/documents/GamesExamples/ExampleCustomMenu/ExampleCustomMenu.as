/**
* ...
* @author Darknet
* Copy Rights (c) http://darkaif.googlecode.com
* 
* Work Log: Fixed Menu and submenu
* 
*/

/** 
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/

package  {
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;

	public class ExampleCustomMenu extends Sprite{
		
		public function ExampleCustomMenu() {
			
			
			var moveposition_x:Number;
			var moveposition_y:Number;			
			var MenuMove:Boolean = false;
			var MenuFrame:Sprite = new MenuPanel();
			
			MenuFrame.addEventListener(MouseEvent.MOUSE_DOWN, Menu_DragDown);
			MenuFrame.addEventListener(MouseEvent.MOUSE_UP, Menu_DragUp);			
			MenuFrame.addEventListener(MouseEvent.MOUSE_MOVE, Menu_DragMove);			
			
			addChild(MenuFrame); //Main Menu
			
			MenuFrame.addEventListener(MouseEvent.MOUSE_MOVE,Menu_DragMove);
			MenuFrame.addEventListener(MouseEvent.MOUSE_UP,Menu_DragUp);
			MenuFrame.addEventListener(MouseEvent.MOUSE_DOWN,Menu_DragDown);
			
			function Menu_DragMove(event:MouseEvent):void{ //MOVE
				if (MenuMove == true){
					MenuFrame.x = mouseX + moveposition_x;
					MenuFrame.y = mouseY + moveposition_y;
				}
			}
			function Menu_DragDown(event:MouseEvent):void{ //DRAG DOWN
				moveposition_x = MenuFrame.x - mouseX;
				moveposition_y = MenuFrame.y - mouseY;
				MenuMove = true;				
			}			
			function Menu_DragUp(event:MouseEvent):void{ //STOP
				MenuMove = false;
			}			
			
		}
	}	
}

	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormatAlign;
	import flash.text.TextFormat;
	import flash.display.DisplayObject;
	import flash.text.TextFieldAutoSize;
	import org.flashdevelop.utils.FlashConnect;

	class MenuPanel extends Sprite{
		private var size:uint = 50;
		private var overSize:uint = 50; //60
		private var backgroundColor:uint = 0xFFCC00;
		private var overColor:uint = 0xCCFF00;
		private var downColor:uint = 0x00CCFF;
		
		private var _width:Number = 128;
		private var _height:Number = 22;
		private var _heightmax:Number = 16;
		
		private var position_x:Number = 0;
		private var position_y:Number = 0;
		private var MenuMove:Boolean = false;
		
		private var fontcolor:uint = 0;
		
		public function MenuPanel() {
			buttonMode = true;
			
			var MenuFrameClose:Sprite = new MenuButton();
			MenuFrameClose.x = _width - 16 - 2;
			MenuFrameClose.y = 2;
			addChild(MenuFrameClose);
			
			var MenuFrameMize:Sprite = new MenuButton();
			MenuFrameMize.x = _width - 2*16 - 3;
			MenuFrameMize.y = 2;
			addChild(MenuFrameMize);
			
			var Menu_Name:TextField = createLabel();
			Menu_Name.text = "Menu Name";		
			addChild(Menu_Name);
			
			draw(_width, _height, backgroundColor);
			this.addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
			this.addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
			this.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			this.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);			
			//this.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);			
		}
		private function createLabel():TextField {
			var label_txt:TextField = new TextField();
			label_txt.autoSize = TextFieldAutoSize.CENTER;
			label_txt.selectable = false;
			//label_txt.text = label_str;
			//label_txt.border = true;
			//label_txt.background = true;
			var format:TextFormat = label_txt.getTextFormat();
			format.font = "_sans";
			format.align = TextFormatAlign.CENTER;
			label_txt.setTextFormat(format);
			return label_txt;
		}		
		private function positionLabel(label:TextField, state:DisplayObject):void {
			label.x = state.width/2 - label.width/2;
			label.y = state.height/2 - label.height/2;
		}						
		private function draw(w:uint, h:uint, bgColor:uint):void {
			graphics.clear();
			graphics.beginFill(bgColor);
			graphics.drawRect(0, 0, w, h);
			graphics.endFill();
		}
		public function mouseOverHandler(event:MouseEvent):void {
			//FlashConnect.trace("mouseOverHandler");
			draw(_width, _height,overColor);
		}
		public function mouseOutHandler(event:MouseEvent):void {
			draw(_width, _height, backgroundColor);
		}
		public function mouseDownHandler(event:MouseEvent):void {
			draw(_width, _height, downColor);
		}
		public function mouseUpHandler(event:MouseEvent):void {
			draw(_width, _height, overColor);
		}
	}
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import org.flashdevelop.utils.FlashConnect;
	
	class MenuButton extends Sprite{		
		private var _width:uint = 16;
		private var _height:uint = 16;		
		private var overcolor:uint = 0x778899;
		private var upcolor:uint = 0xb0c4de;
		private var downcolor:uint = 0xd3d3d3;
		
		public function MenuButton(){
			buttonMode = true;
			draw(_width, _height, overcolor);
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
			draw(_width, _height,overcolor);
		}
		public function mouseOutHandler(event:MouseEvent):void {
			draw(_width, _height, upcolor);
		}
		public function mouseDownHandler(event:MouseEvent):void {
			draw(_width, _height, downcolor);
		}
		public function mouseUpHandler(event:MouseEvent):void {	
			draw(_width, _height, upcolor);
		}
	}
	