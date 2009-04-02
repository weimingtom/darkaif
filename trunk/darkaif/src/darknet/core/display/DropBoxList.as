package darknet.core.display {
	
	//{packages
	import darkaif.core.display.Scrollbar;
	import darkaif.core.display.ScrollContent;
	import darknet.core.event.DropBoxEvent;
	import darknet.core.event.ScrollEvent;
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

	public class DropBoxList extends Sprite {
		
		//{ variables
		public var backgroundcolor:uint = 0xd3d3d3;
		public var boxbackgroundcolor:uint = 0x363430;
		public var setheight:Number = 14;
		public var setwidth:Number = 92;
		public var togglebutton:Button = new Button("+");
		public var boxlist:Array = new Array();
		public var boxboxdisplay:int = 5;
		public var buttonheight:Number = 14;
		public var btoggle:Boolean = false;
		public var boxsprite:Sprite = new Sprite();
		public var scrollbar:ScrollBarVertical = new ScrollBarVertical();
		public var contentlist:Sprite = new Sprite();
		public var fieldname:TextField = new TextField();
		public var sc:ScrollContentVertical;
		public var id:String;
		
		public var boxheight:Number = 14 * 5;
		public var boxwidth:Number = setwidth;
		
		public var contentheight:Number = 0;
		
		//}
		
		public function DropBoxList() {
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
			togglebutton.x = setwidth;
			togglebutton.addEventListener(MouseEvent.CLICK, togglebuttonclick);
			addChild(togglebutton);
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
			//contentlist = new Sprite(); //need to handle new scroll bar every time it open up -it effect image size
			while(contentlist.numChildren){
				for (var i:int = 0; i < contentlist.numChildren; i++) {
					contentlist.removeChildAt(i);
				}
			}
			
			boxsprite.y = buttonheight;
			scrollbar.y = buttonheight;
			scrollbar.x = setwidth;
			contentlist.y = buttonheight;
			
			if (boxlist.length == 0) {
				boxsprite.graphics.clear()
				boxsprite.graphics.beginFill(boxbackgroundcolor);
				boxsprite.graphics.drawRect(0, 0, setwidth, buttonheight * 1);
				scrollbar._pheight = boxsprite.height;
			}else if (boxlist.length > boxboxdisplay) {
				boxsprite.graphics.clear()
				boxsprite.graphics.beginFill(boxbackgroundcolor);
				boxsprite.graphics.drawRect(0, 0, setwidth, buttonheight * boxboxdisplay);
				scrollbar._pheight = boxsprite.height;
			}else {
				boxsprite.graphics.clear()
				boxsprite.graphics.beginFill(boxbackgroundcolor);
				boxsprite.graphics.drawRect(0, 0, setwidth, buttonheight * boxlist.length);
				scrollbar._pheight = buttonheight * boxlist.length;
			}
			var rect:Rectangle = new Rectangle(0, 0, boxsprite.width, boxsprite.height);
			contentlist.graphics.clear();
			contentlist.graphics.beginFill(boxbackgroundcolor);
			contentlist.graphics.drawRect(0, 0, setwidth, buttonheight * boxlist.length);
			
			for (var buttonno:int = 0; buttonno < boxlist.length;buttonno++ ) {
				var buildbutton:Button = new Button(boxlist[buttonno].name);
				buildbutton.name = String(boxlist[buttonno].id);
				//trace("--"+boxlist[buttonno].name);
				buildbutton.datastring = String(boxlist[buttonno]);
				buildbutton.addEventListener(MouseEvent.CLICK, setfieldname);
				buildbutton.addEventListener(MouseEvent.CLICK, togglebuttonclick);
				buildbutton.y = buttonno * 14;
				buildbutton._width = setwidth;
				contentlist.addChild(buildbutton);
			}
			
			//trace('contentlist:' + contentlist.height);
			contentheight = boxlist.length * buttonheight;
			//trace('contentheight:' + contentheight);
			//trace('rect:' + rect.height);
			//rect.height = contentheight;
			sc = new ScrollContentVertical( contentlist, scrollbar, rect);
			
			//trace("height:"+contentlist.height);
			contentlist.scrollRect = rect;
			scrollbar.addEventListener(ScrollEvent.PERCENT, updateContent);
			//bar adjust
			var scrollbarpercent:Number = (boxheight / contentheight);
			
			//trace("dropbox:" + scrollbarpercent);
			//trace("?" + (boxheight / contentheight)+":"+boxheight+":"+contentheight);
			if ((scrollbarpercent > 1)&&(scrollbarpercent < 0)) {
				scrollbar.trackerpercent = 1;
			}else{
				scrollbar.trackerpercent = scrollbarpercent;
			}
			
			function updateContent(event:ScrollEvent):void {
				//trace('update...'+event.percent);
				var scrollable:Number = contentheight - contentlist.scrollRect.height;
				//trace(scrollbarpercent);
				scrollbar.trackerpercent = scrollbarpercent;
				//trace("MAX:"+contentheight+"[MIN]"+ contentlist.scrollRect.height +"[>]"+scrollable);
				var sr:Rectangle = contentlist.scrollRect.clone();
				sr.y = scrollable * event.percent;
				contentlist.scrollRect = sr;
			}
			
			addChild(scrollbar);
			addChild(boxsprite);
			addChild(contentlist);
		}
		
		public function cleardrawlist():void {
			removeChild(boxsprite);
			removeChild(scrollbar);
			removeChild(contentlist);
		}
		
		public function setfieldname(event:Event):void {
			//trace("target name:" + event.target.name);
			fieldname.text = event.currentTarget.name;
			for (var boxlistno:int = 0; boxlistno < boxlist.length; boxlistno++ ) {
				if (event.currentTarget.name == boxlist[boxlistno].id) {
					fieldname.text = boxlist[boxlistno].name;
					id = boxlist[boxlistno].id;
					dispatchEvent(new DropBoxEvent(DropBoxEvent.SELECT,boxlist[boxlistno].name));
					break;
				}
				else
				{
					fieldname.text = 'none';
				}
				
			}
			//fieldname.text = event.target.name;
			
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
			//fieldname.border = true;
			//fieldname.
		}
		
		public function getboxname():String {
			//trace("name:"+fieldname.text);
			return String(fieldname.text);
		}
		
		public function getidname():String {
			//trace("name:"+fieldname.text);
			return String(id);
		}
	}
}
