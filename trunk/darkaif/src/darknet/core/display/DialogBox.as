package darknet.core.display 
{
	
	//{ packages
	import darknet.core.event.PanelEvent;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.events.MouseEvent;
	import darknet.core.event.PanelCloseEvent;
	//}
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class DialogBox extends Sprite
	{
		//{
		public var toppanel:Sprite = new Sprite();
		public var bodypanel:Sprite = new Sprite();
		public var Label_Menu:TextField = new TextField();
		public var closepanelbutton:Button = new Button("x");
		public var actionpanel:String;
		
		public var bheight:Number = 14;
		public var bwidth:Number = 14;
		
		public var pheight:Number = 64;
		public var pwidth:Number = 128;
		//}
		
		public function DialogBox() {
			
			addChild(toppanel);
			addChild(closepanelbutton);
			bodypanel.y = bheight;
			addChild(bodypanel);
			
			//addEventListener(PanelCloseEvent.CHANGE, closeeventpanel);
			closepanelbutton.addEventListener(MouseEvent.MOUSE_DOWN, closeeventbutton);
			
			var format:TextFormat = defaulttextformat();
			
			Label_Menu.text = 'Dialog';
			//Label_Menu.border = true;
			Label_Menu.height = 16;
			Label_Menu.selectable = false;
			Label_Menu.alwaysShowSelection = false;
			Label_Menu.setTextFormat(format);
			Label_Menu.addEventListener(MouseEvent.MOUSE_DOWN, dragdown_main);
			Label_Menu.addEventListener(MouseEvent.MOUSE_UP, dragup_main);
			toppanel.addEventListener(MouseEvent.MOUSE_DOWN, dragdown_main);
			toppanel.addEventListener(MouseEvent.MOUSE_UP, dragup_main);
			
			addChild(Label_Menu);
			drawpanel();
		}
		
		public function drawpanel():void {
			graphics.clear();
			graphics.beginFill(0xd3d3d3);
			graphics.drawRect(0, 0, pwidth, pheight);
			graphics.endFill();
			
			toppanel.graphics.clear();
			toppanel.graphics.beginFill(0x999999);
			toppanel.graphics.drawRect(0, 0, pwidth, bheight);
			toppanel.graphics.endFill();
			
			Label_Menu.width = pwidth-bwidth;
			
			closepanelbutton.x = pwidth  - closepanelbutton._width;
			
		}
		
		public function set _pheight(p_height:Number):void {
			pheight = p_height;
			drawpanel();
		}
		
		public function get _pheight():Number {
			return pheight;
		}
		
		public function set _pwidth(p_width:Number):void {
			pwidth = p_width;
			drawpanel();
		}
		
		public function get _pwidth():Number {
			return pwidth;
		}
		
		//mouse down
		public function dragdown_main(event:Event):void {
			this.startDrag();
		}
		//mouse up 
		public function dragup_main(event:Event = null):void {
			this.stopDrag();
		}
		
		public function closeeventbutton(event:Event):void {
			//trace('close dialog');
			actionpanel = 'close';
			dispatchEvent(new PanelEvent(PanelEvent.CLOSE, actionpanel));
		}
		
		public function content(spritepanel:Sprite):void {
			//bodypanel = new Sprite();
			//this will remove sprite that was use last
			for (var i:int = 0; i < bodypanel.numChildren; i++) {
				bodypanel.removeChildAt(i);
			}
			bodypanel.y = bheight;
			bodypanel.addChild(spritepanel);
			//trace("[[" + bodypanel.numChildren);
			//addChild(bodypanel);
			//trace("[[" + numChildren);
		}
		
		public function set textname(strname:String):void {
			var format:TextFormat = defaulttextformat();
			Label_Menu.text = strname;
			Label_Menu.setTextFormat(format);
		}
		public function get textname():String {
			return Label_Menu.text;
		}
		
		public function defaulttextformat():TextFormat {
			var format:TextFormat = new TextFormat();
			format.size = 10;
			format.font = "OCR A Extended";
			//format.color = 0xF5F5F5;
			return format;
		}
	}
	
}