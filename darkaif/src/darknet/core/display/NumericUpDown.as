package darknet.core.display 
{
	//{
	import darknet.core.event.NumericUpDownEvent;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldType;
	//}
	
	/**
	 * ...
	 * @author Darknet
	 */
	
	public class NumericUpDown extends Sprite {
		
		public var pheight:Number = 14;
		public var pwidth:Number = 64;
		public var bheight:Number = 14;
		public var bwidth:Number = 14;
		public var upsprite:Sprite = new Sprite();
		public var downsprite:Sprite = new Sprite();
		public var textnumber:TextField = new TextField();
		public var currentnumber:Number = 0;
		public var bcolorover:uint = 0x808080;
		//public var bcolorout:uint = 0x363430;
		//public var bcolorup:uint = 0x363430;
		
		public var bcolorout:uint = 0xc8c8c8;
		public var bcolorup:uint = 0xc8c8c8;
		public var bcolordown:uint = 0xa9a9a9;
		public var bgcolor:uint = 0x999999;
		//public var bcolorline:uint = 0xc8c8c8;
		public var bcolorline:uint = 0x0000FF;
		
		public function NumericUpDown() {
			createpanel();
			drawpanel();
		}
		
		public function createpanel():void {
			upsprite.addEventListener(MouseEvent.MOUSE_UP, up_upstate);
			upsprite.addEventListener(MouseEvent.MOUSE_OVER, up_overstate);
			upsprite.addEventListener(MouseEvent.MOUSE_OUT, up_outstate);
			upsprite.addEventListener(MouseEvent.MOUSE_DOWN, up_downstate);
			addChild(upsprite);
			
			downsprite.addEventListener(MouseEvent.MOUSE_UP, down_upstate);
			downsprite.addEventListener(MouseEvent.MOUSE_OVER, down_overstate);
			downsprite.addEventListener(MouseEvent.MOUSE_OUT, down_outstate);
			downsprite.addEventListener(MouseEvent.MOUSE_DOWN, down_downstate);
			addChild(downsprite);
			
			textnumber.text = String(currentnumber);
			textnumber.height = 14;
			textnumber.width = pwidth - bwidth;
			var format:TextFormat = defaulttextformat();
			textnumber.setTextFormat(format);
			textnumber.type = TextFieldType.INPUT;
			textnumber.addEventListener(KeyboardEvent.KEY_DOWN, enterkey);
			addChild(textnumber);
		}
		
		public function destroypanel():void {
			removeChild(upsprite);
			removeChild(downsprite);
			
			removeChild(textnumber);
		}
		
		public function drawpanel():void {
			graphics.clear();
			graphics.lineStyle(1);
			graphics.beginFill(bgcolor);
			graphics.drawRect(0, 0, pwidth, pheight);
			graphics.endFill();
			draw_upsprite(bcolorout);
			draw_downsprite(bcolorout);
		}
		
		public function up_upstate(event:MouseEvent):void {
			draw_upsprite(bcolorup);
		}
		public function up_overstate(event:MouseEvent):void {
			draw_upsprite(bcolorover);
		}
		public function up_downstate(event:MouseEvent):void {
			draw_upsprite(bcolordown);
			plusnumber();
		}
		public function up_outstate(event:MouseEvent):void {
			draw_upsprite(bcolorout);
		}
		
		public function down_upstate(event:MouseEvent):void {
			draw_downsprite(bcolorup);
			minusnumber();
		}
		public function down_overstate(event:MouseEvent):void {
			draw_downsprite(bcolorover);
		}
		public function down_downstate(event:MouseEvent):void {
			draw_downsprite(bcolordown);
		}
		public function down_outstate(event:MouseEvent):void {
			draw_downsprite(bcolorout);
		}
		
		//sprite section
		public function draw_downsprite(color:uint):void {
			downsprite.x = pwidth - bwidth;
			downsprite.y = pheight - (bheight / 2);
			downsprite.graphics.clear();
			downsprite.graphics.lineStyle(1);
			downsprite.graphics.beginFill(color);
			downsprite.graphics.drawRect(0, 0, bwidth, (bheight/2));
			downsprite.graphics.endFill();
		}
		public function draw_upsprite(color:uint):void {
			upsprite.x = pwidth - bwidth;
			upsprite.graphics.clear();
			upsprite.graphics.lineStyle(1);
			upsprite.graphics.beginFill(color);
			upsprite.graphics.drawRect(0, 0, bwidth, (bheight/2));
			upsprite.graphics.endFill();
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
		
		public function set valuenumber(p_num:Number):void {
			currentnumber = p_num;
			textnumber.text = String(p_num);
			var format:TextFormat = defaulttextformat();
			textnumber.setTextFormat(format);
			dispatchEvent(new NumericUpDownEvent(NumericUpDownEvent.VALUE,currentnumber));
		}
		
		public function get valuenumber():Number {
			return currentnumber;
		}
		
		public function plusnumber():void {
			//trace('plusnumber');
			var num:Number = Number(textnumber.text);
			if (num) {
				//trace('good');
				currentnumber = num;
				currentnumber++;
			}else {
				//trace('bad');
				currentnumber++;
			}
			textnumber.text = String(currentnumber);
			var format:TextFormat = defaulttextformat();
			textnumber.setTextFormat(format);
			dispatchEvent(new NumericUpDownEvent(NumericUpDownEvent.VALUE,currentnumber));
		}
		public function minusnumber():void {
			//trace('minusnumber');
			var num:Number = Number(textnumber.text);
			if (num) {
				currentnumber = num;
				currentnumber--;
			}else {
				currentnumber--;
			}
			textnumber.text = String(currentnumber);
			var format:TextFormat = defaulttextformat();
			textnumber.setTextFormat(format);
			dispatchEvent(new NumericUpDownEvent(NumericUpDownEvent.VALUE,currentnumber));
		}
		public function enterkey(event:KeyboardEvent):void {
			if (event.keyCode == 13) {
				trace('update enter...');
				var num:Number = Number(textnumber.text);
				if (num) {
					//trace('good');
					currentnumber = num;
				}else {
					//trace('bad');
					currentnumber;
				}
				//trace('enter');
				textnumber.text = String(currentnumber);
				dispatchEvent(new NumericUpDownEvent(NumericUpDownEvent.ENTER,Number(currentnumber)));
			}
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