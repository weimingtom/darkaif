package darkaif.core.display {
	
	//{packages
	import darkaif.core.display.Scrollbar;
	import darkaif.core.display.ScrollContent;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize;
	//}
	
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	* 
	* Information: This dropbox working few bugs. This not depth code yet.
	* 
	* This required packages support.
	* 
	*/

	public class DropBox extends Sprite {
		
		//{ variables
		public var backgroundcolor:uint = 0xd3d3d3;
		public var boxbackgroundcolor:uint = 0x363430;
		public var setheight:Number = 14;
		public var setwidth:Number = 92;
		public var toggleubtton:Button = new Button("+");
		public var boxlist:Array = new Array();
		public var boxboxdisplay:int = 5;
		public var buttonheight:Number = 14;
		public var btoggle:Boolean = false;
		public var boxsprite:Sprite = new Sprite();
		public var scrollbar:Scrollbar = new Scrollbar();
		public var contentlist:Sprite = new Sprite();
		public var fieldname:TextField = new TextField();
		public var sc:ScrollContent;
		//}
		
		public function DropBox() {
			fieldname.text = "none";
			var format:TextFormat = new TextFormat();
			format.size = 10;
			format.font = "OCR A Extended";
			
			//fieldname.autoSize = TextFieldAutoSize.LEFT;
			//if (fieldname.width > setwidth) {
			//	fieldname.width = setwidth;
			///}
			fieldname.width = setwidth;
			
			fieldname.selectable = false;
			fieldname.alwaysShowSelection = false;
			fieldname.setTextFormat(format);
			
			//fieldname.width = 64;
			fieldname.height = 14;
			//fieldname.border = true;
			
			graphics.beginFill(backgroundcolor);
			graphics.drawRect(0, 0, setwidth, setheight);
			toggleubtton.x = setwidth;
			toggleubtton.addEventListener(MouseEvent.CLICK, togglebuttonclick);
			addChild(toggleubtton);
			addChild(fieldname);
		}
		
		public function togglebuttonclick(event:Event):void {
			var oldbtoggle:Boolean = btoggle;
			if (!oldbtoggle) {
				btoggle = true;
				//trace("show")
				drawlist();
			}else {
				btoggle = false;
				//trace("hide");
				cleardrawlist();
			}
			//trace(boxlist.length)
		}
		
		public function drawlist():void {
			//trace("======");
			contentlist = new Sprite(); //need to handle new scroll bar every time it open up -it effect image size
			//sc = null;
			boxsprite.y = buttonheight;
			scrollbar.y = buttonheight;
			scrollbar.x = setwidth;
			contentlist.y = buttonheight;
			//contentlist.height = buttonheight * boxlist.length;
			if (boxlist.length > boxboxdisplay) {
				boxsprite.graphics.clear()
				boxsprite.graphics.beginFill(boxbackgroundcolor);
				//boxsprite.graphics.drawRect(0, 0, setwidth, buttonheight * boxboxdisplay);
				boxsprite.graphics.drawRect(0, 0, setwidth, buttonheight * boxboxdisplay);
				scrollbar.Content_height = boxsprite.height;
			}else {
				boxsprite.graphics.clear()
				boxsprite.graphics.beginFill(boxbackgroundcolor);
				boxsprite.graphics.drawRect(0, 0, setwidth, buttonheight * boxlist.length);
				scrollbar.Content_height = buttonheight * boxlist.length;
			}
			//trace("bar height:"+scrollbar.Content_height);
			var rect:Rectangle = new Rectangle(0, 0, boxsprite.width, boxsprite.height);
			contentlist.graphics.clear();
			contentlist.graphics.beginFill(boxbackgroundcolor);
			contentlist.graphics.drawRect(0, 0, setwidth, buttonheight * boxlist.length);
			
			//trace("boxlist:" +(buttonheight * boxlist.length));
			for (var buttonno:int = 0; buttonno < boxlist.length;buttonno++ ) {
				var buildbutton:Button = new Button(boxlist[buttonno]);
				buildbutton.name = String(boxlist[buttonno]);
				//trace("--"+boxlist[buttonno]);
				buildbutton.datastring = String(boxlist[buttonno]);
				buildbutton.addEventListener(MouseEvent.CLICK, setfieldname);
				buildbutton.addEventListener(MouseEvent.CLICK, togglebuttonclick);
				buildbutton.y = buttonno * 14;
				buildbutton._width = setwidth;
				contentlist.addChild(buildbutton);
			}
			
			//contentlist.graphics.endFill();
			//trace("main class:h:" + contentlist.height);
			//trace("boxlist:" +(buttonheight * boxlist.length));
			//contentlist.height = 14 * 8;
			//sc = new ScrollContent( contentlist, scrollbar, rect );
			sc = new ScrollContent( contentlist, scrollbar, rect);
			//addChild(sc);
			addChild(scrollbar);
			addChild(boxsprite);
			addChild(contentlist);
		}
		
		public function cleardrawlist():void {
			//sc = null;
			//removeChild(sc);
			//sc = null;
			removeChild(boxsprite);
			removeChild(scrollbar);
			removeChild(contentlist);
		}
		
		public function setfieldname(event:Event):void {
			//trace("target name:" + event.target.name);
			//fieldname.text = event.target.text_label.text;
			fieldname.text = event.currentTarget.name;
			//trace(event.target.name);
			//fieldname.text = String(event.target.datastring);
			
			var format:TextFormat = new TextFormat();
			format.size = 10;
			format.font = "OCR A Extended";
			
			//fieldname.autoSize = TextFieldAutoSize.LEFT;
			
			fieldname.selectable = false;
			fieldname.alwaysShowSelection = false;
			fieldname.setTextFormat(format);
			
			if (fieldname.width > setwidth) {
				fieldname.width = setwidth;
			}
			fieldname.height = 14;
			fieldname.border = true;
			//fieldname.
		}
		
		public function getboxname():String {
			trace("name:"+fieldname.text);
			return String(fieldname.text);
		}
	}
}
