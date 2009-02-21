/**
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package darkaif.frame 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.geom.Rectangle;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import org.flashdevelop.utils.FlashConnect;
	
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	*/
	public class Frame extends Sprite
	{
		public var fheight:Number = 20;
		public var fwidth:Number = 192;
		public var panel_space:Number = 2;
		public var bwidth:Number = 8;
		public var bheight:Number = 8;
		public var fminheight:Number = 20;
		public var fminwidth:Number = 64;
		
		public var sprite_rightsizing:Sprite = new Sprite();
		public var sprite_bottomrightsizing:Sprite = new Sprite();
		public var sprite_leftsizing:Sprite = new Sprite();
		public var sprite_bottomleftsizing:Sprite = new Sprite();
		public var sprite_bottomsizing:Sprite = new Sprite();
		public var sprite_topsizing:Sprite = new Sprite();
		public var sprite_toprightsizing:Sprite = new Sprite();
		public var sprite_topleftsizing:Sprite = new Sprite();
		
		public var sprite_closebox:Sprite = new Sprite();
		public var sprite_togglescreensize:Sprite = new Sprite();
		public var sprite_togglemize:Sprite = new Sprite();
			
		public var menu_frame:Sprite = new Sprite();
		public var menu_panel:Sprite = new Sprite();
		public var menu_content:Sprite = new Sprite();
		public var menu_container:Sprite = new Sprite();
		
		public function Frame(){
			sprite_closebox.graphics.beginFill(0xFFFFFF);
			sprite_closebox.graphics.drawRect(fwidth-(bwidth*0+0)-bwidth-panel_space, fheight-bheight-panel_space, bwidth, bheight);
			sprite_closebox.addEventListener(MouseEvent.MOUSE_OVER, displayActiveState);
			sprite_closebox.addEventListener(MouseEvent.MOUSE_OUT, displayInactiveState);
			sprite_closebox.addEventListener(MouseEvent.MOUSE_UP , displayDrageupState);
			sprite_closebox.addEventListener(MouseEvent.MOUSE_DOWN, displayDragedownState);
			sprite_closebox.addEventListener(MouseEvent.CLICK, displayMessage);
			sprite_closebox.name = 'closebox';
			
			sprite_togglescreensize.graphics.beginFill(0xFFFFFF);
			sprite_togglescreensize.graphics.drawRect(fwidth - (bwidth * 1 + 1) - bwidth - panel_space, fheight - bheight - panel_space, bwidth, bheight);
			sprite_togglescreensize.addEventListener(MouseEvent.MOUSE_OVER, displayActiveState);
			sprite_togglescreensize.addEventListener(MouseEvent.MOUSE_OUT, displayInactiveState);
			sprite_togglescreensize.addEventListener(MouseEvent.MOUSE_UP , displayDrageupState);
			sprite_togglescreensize.addEventListener(MouseEvent.MOUSE_DOWN, displayDragedownState);
			sprite_togglescreensize.addEventListener(MouseEvent.CLICK, displayMessage);
			sprite_togglescreensize.name = 'togglescreensize';
			
			sprite_togglemize.graphics.beginFill(0xFFFFFF);
			sprite_togglemize.graphics.drawRect(fwidth - (bwidth * 2 + 2) - bwidth - panel_space, fheight - bheight - panel_space, bwidth, bheight);
			sprite_togglemize.addEventListener(MouseEvent.MOUSE_OVER, displayActiveState);
			sprite_togglemize.addEventListener(MouseEvent.MOUSE_OUT, displayInactiveState);
			sprite_togglemize.addEventListener(MouseEvent.MOUSE_UP , displayDrageupState);
			sprite_togglemize.addEventListener(MouseEvent.MOUSE_DOWN, displayDragedownState);
			sprite_togglemize.addEventListener(MouseEvent.CLICK, displayMessage);
			sprite_togglemize.name = 'togglemize';
			
			
			sprite_rightsizing.graphics.beginFill(0x778899);
			sprite_rightsizing.graphics.drawRect(fwidth, 0, 10, 10);
			sprite_rightsizing.name = 'rightsizing';
			
			sprite_leftsizing.graphics.beginFill(0x778899);
			sprite_leftsizing.graphics.drawRect(0, 0, 10, 10);
			sprite_leftsizing.name = 'leftsizing';
			
			sprite_topsizing.graphics.beginFill(0x778899);
			sprite_topsizing.graphics.drawRect(0, 0, 10, 10);
			sprite_topsizing.name = 'topsizing';
			
			sprite_bottomsizing.graphics.beginFill(0x778899);
			sprite_bottomsizing.graphics.drawRect(0, fheight, 10, 10);
			sprite_bottomsizing.name = 'bottomsizing';
			
			sprite_bottomleftsizing.graphics.beginFill(0xb0c4de);
			sprite_bottomleftsizing.graphics.drawRect(0, fheight, 10, 10);
			sprite_bottomleftsizing.name = 'bottomleftsizing';
			
			sprite_bottomrightsizing.graphics.beginFill(0xb0c4de);
			sprite_bottomrightsizing.graphics.drawRect(fwidth, fheight, 10, 10);
			sprite_bottomrightsizing.name = 'bottomrightsizing';
			
			sprite_toprightsizing.graphics.beginFill(0xb0c4de);
			sprite_toprightsizing.graphics.drawRect(fwidth, 0, 10, 10);
			sprite_toprightsizing.name = 'toprightsizing';
			
			sprite_topleftsizing.graphics.beginFill(0xb0c4de);
			sprite_topleftsizing.graphics.drawRect(0, 0, 10, 10);
			sprite_topleftsizing.name = 'topleftsizing';
			
			//{text
			var title_name:TextField = new TextField();
			title_name.text = "Menu Panel";
			title_name.selectable = false;
			title_name.defaultTextFormat = new TextFormat();
			title_name.autoSize = TextFieldAutoSize.CENTER;
			title_name.textColor = 0xFFFFFF;
			
			var format:TextFormat = title_name.getTextFormat();
			FlashConnect.trace(format.font);
			//format.font = "_sans";
			format.font = "OCR A Extended";
			FlashConnect.trace(format.font);
			format.align = TextFormatAlign.CENTER;
			title_name.setTextFormat(format);
			//title_name.
			//title_name.background = true;
			//}
			
			menu_container.addChild(title_name);
			menu_container.addChild(sprite_closebox);
			menu_container.addChild(sprite_togglescreensize);
			menu_container.addChild(sprite_togglemize);
			
			menu_container.addChild(sprite_rightsizing);
			menu_container.addChild(sprite_leftsizing);
			menu_container.addChild(sprite_bottomsizing);
			menu_container.addChild(sprite_topsizing);
			
			menu_container.addChild(sprite_toprightsizing);
			menu_container.addChild(sprite_topleftsizing);
			menu_container.addChild(sprite_bottomleftsizing);
			sprite_bottomrightsizing.addEventListener(MouseEvent.MOUSE_DOWN, displayDragedownState);
			sprite_bottomrightsizing.addEventListener(MouseEvent.MOUSE_UP , displayDrageupState);
			menu_container.addChild(sprite_bottomrightsizing);
			
			
			
			//menu_panel.graphics.beginFill(0x00FFFF);
			//menu_panel.graphics.drawRect(0, 0, 100, 22);
			
			menu_container.graphics.beginFill(0x363430);
			menu_container.graphics.drawRect(0, 0, fwidth, fheight);
			
			addChild(menu_container);
			//addEventListener(MouseEvent.MOUSE_DOWN, displayDragedownState);
			//addEventListener(MouseEvent.MOUSE_UP , displayDrageupState);
			
		}
		
		private function displayDragedownState(event:MouseEvent):void // color = 0x22201d
		{
			//mouseChildren = true;
			//mouseChildren = false;
			//event.target.startDrag();
			event.currentTarget.startDrag();
			//startDrag();
			var num:int;
			if (event.currentTarget.name == 'closebox')
			{
				num = 0;
				event.currentTarget.graphics.clear();
			event.currentTarget.graphics.beginFill(0x22201d);
			event.currentTarget.graphics.drawRect(fwidth - (bwidth * num + num) - bwidth - panel_space, fheight - bheight - panel_space, bwidth, bheight);
			}
			if (event.currentTarget.name == 'togglescreensize')
			{
				num = 1;
				event.currentTarget.graphics.clear();
			event.currentTarget.graphics.beginFill(0x22201d);
			event.currentTarget.graphics.drawRect(fwidth - (bwidth * num + num) - bwidth - panel_space, fheight - bheight - panel_space, bwidth, bheight);
			}
			if (event.currentTarget.name == 'togglemize')
			{
				num = 2;
				event.currentTarget.graphics.clear();
			event.currentTarget.graphics.beginFill(0x22201d);
			event.currentTarget.graphics.drawRect(fwidth - (bwidth * num + num) - bwidth - panel_space, fheight - bheight - panel_space, bwidth, bheight);
			}
		}
		
		private function displayDrageupState(event:MouseEvent):void // color = 0x0000FF
		{
			//mouseChildren = false;
			//mouseChildren = true;
			//event.target.stopDrag();
			event.currentTarget.stopDrag();
			
			//stopDrag();
			var num:int;
			if (event.currentTarget.name == 'closebox')
			{
				num = 0;
				event.currentTarget.graphics.clear();
			event.currentTarget.graphics.beginFill(0x0000FF);
			event.currentTarget.graphics.drawRect(fwidth - (bwidth * num + num) - bwidth - panel_space, fheight - bheight - panel_space, bwidth, bheight);
			}
			if (event.currentTarget.name == 'togglescreensize')
			{
				num = 1;
				event.currentTarget.graphics.clear();
			event.currentTarget.graphics.beginFill(0x0000FF);
			event.currentTarget.graphics.drawRect(fwidth - (bwidth * num + num) - bwidth - panel_space, fheight - bheight - panel_space, bwidth, bheight);
			}
			if (event.currentTarget.name == 'togglemize')
			{
				num = 2;
				event.currentTarget.graphics.clear();
			event.currentTarget.graphics.beginFill(0x0000FF);
			event.currentTarget.graphics.drawRect(fwidth - (bwidth * num + num) - bwidth - panel_space, fheight - bheight - panel_space, bwidth, bheight);
			}	
		}
		
		private function displayActiveState(event:MouseEvent):void // color = 0x999999
		{
			// Hide the over state of the button.
			//event.currentTarget.getChildByName("over").alpha = 100;

			var num:int;
			if (event.currentTarget.name == 'closebox')
			{
				num = 0;
				event.currentTarget.graphics.clear();
			event.currentTarget.graphics.beginFill(0x999999);
			event.currentTarget.graphics.drawRect(fwidth - (bwidth * num + num) - bwidth - panel_space, fheight - bheight - panel_space, bwidth, bheight);
			}
			if (event.currentTarget.name == 'togglescreensize')
			{
				num = 1;
				event.currentTarget.graphics.clear();
			event.currentTarget.graphics.beginFill(0x999999);
			event.currentTarget.graphics.drawRect(fwidth - (bwidth * num + num) - bwidth - panel_space, fheight - bheight - panel_space, bwidth, bheight);
			}
			if (event.currentTarget.name == 'togglemize')
			{
				num = 2;
				event.currentTarget.graphics.clear();
			event.currentTarget.graphics.beginFill(0x999999);
			event.currentTarget.graphics.drawRect(fwidth - (bwidth * num + num) - bwidth - panel_space, fheight - bheight - panel_space, bwidth, bheight);
			}
			
		}
		private function displayInactiveState(event:MouseEvent):void //color = 0xFFFFFF
		{
			var num:int;
			if (event.currentTarget.name == 'closebox')
			{
				num = 0;
				event.currentTarget.graphics.clear();
			event.currentTarget.graphics.beginFill(0xFFFFFF);
			event.currentTarget.graphics.drawRect(fwidth - (bwidth * num + num) - bwidth - panel_space, fheight - bheight - panel_space, bwidth, bheight);
			}
			if (event.currentTarget.name == 'togglescreensize')
			{
				num = 1;
				event.currentTarget.graphics.clear();
			event.currentTarget.graphics.beginFill(0xFFFFFF);
			event.currentTarget.graphics.drawRect(fwidth - (bwidth * num + num) - bwidth - panel_space, fheight - bheight - panel_space, bwidth, bheight);
			}
			if (event.currentTarget.name == 'togglemize')
			{
				num = 2;
				event.currentTarget.graphics.clear();
			event.currentTarget.graphics.beginFill(0xFFFFFF);
			event.currentTarget.graphics.drawRect(fwidth - (bwidth * num + num) - bwidth - panel_space, fheight - bheight - panel_space, bwidth, bheight);
			}
			//event.target.stopDrag();
			//FlashConnect.trace(event.currentTarget.name);
		}
		
		private function drawicon(name:String,color:uint):void
		{
			/*
			if ( event.currentTarget.name == ( 'closebox' || 'togglescreensize' || 'togglescreensize' ) )
			{
				var num:int;
				if (event.currentTarget.name == 'closebox')
				{
					num = 0;
				}
				else if (event.currentTarget.name == 'togglescreensize')
				{
					num = 1;
				}
				else if (event.currentTarget.name == 'togglescreensize')
				{
					num = 2;
				}
				else
				{
					num = 0;
				}
				event.currentTarget.graphics.clear();
				event.currentTarget.graphics.beginFill(0x0000FF);
				event.currentTarget.graphics.drawRect(fwidth - (bwidth * num + num) - bwidth - panel_space, fheight - bheight - panel_space, bwidth, bheight);
			}
			*/
		}
		//Display a message in the Output window. 
		private function displayMessage(event:MouseEvent):void {
			event.currentTarget.graphics.clear();
			event.currentTarget.graphics.beginFill(0x000000);
			event.currentTarget.graphics.drawRect(fwidth - (bwidth * 0 + 0) - bwidth - panel_space, fheight - bheight - panel_space, bwidth, bheight);
			FlashConnect.trace(event.currentTarget.name);
		}
	}
	
}