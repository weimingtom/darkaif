package darknet.core.display 
{
	
	//{packages
	import darknet.core.event.BoxListEvent;
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
	 */
	public class BoxList extends Sprite
	{
		
		//{ variables
		public var pheight:Number = 64;
		public var pwidth:Number = 92;
		
		public var bheight:Number = 14;
		public var bwidth:Number = 64;
		
		public var boxheight:Number = 64;
		public var boxwidth:Number = 64;
		
		public var bgcolor:uint = 0xd3d3d3;
		public var boxbackgroundcolor:uint = 0x363430;
		public var scrollbar:ScrollBarVertical = new ScrollBarVertical();
		public var contentlist:Sprite = new Sprite();
		
		public var list:Array = new Array();
		
		public var idname:String = '';
		public var id:String = '';
		//}
		
		public function BoxList(){
			create();	
			drawlist();
		}
		
		public function create():void {
			addChild(contentlist);
			addChild(scrollbar);
		}
		
		public function drawlist():void {
			
			graphics.clear();
			graphics.beginFill(bgcolor);
			graphics.drawRect(0, 0, pwidth, pheight);
			
			for (var contentlistno:int = 0; contentlistno < contentlist.numChildren; contentlistno++) {
				contentlist.removeChildAt(contentlistno);
			}
			
			scrollbar.x = pwidth - scrollbar.width;
			boxwidth = pwidth - scrollbar.width;
			boxheight = pheight;
			scrollbar._pheight = (boxheight);
			var contentheight:Number = bheight * list.length;
			for (var listno:int = 0; listno < list.length ; listno++) {
				var button:Button = new Button(list[listno].name);
				button.name = list[listno].id;
				button.y = 14 * listno;
				button._width = boxwidth - scrollbar.width;
				button._width = boxwidth;
				button.addEventListener(MouseEvent.CLICK,selectbutton)
				contentlist.addChild(button);
			}
			
			var rect:Rectangle = new Rectangle(0, 0, boxwidth, boxheight);
			contentlist.graphics.drawRect(0, 0, bwidth, bheight * list.length);
			var sc:ScrollContentVertical = new ScrollContentVertical(contentlist, scrollbar, rect);
			var scrollbarpercent:Number =  1-(((bheight * list.length) - pheight) / pheight);
			if (scrollbarpercent > 1) {scrollbarpercent = 1;}
			if (scrollbarpercent < 0) { scrollbarpercent = 0; }
			scrollbar.trackerpercent = scrollbarpercent;
			scrollbar.addEventListener(ScrollEvent.PERCENT, updateContent);
			
			function updateContent(event:ScrollEvent):void {
				var scrollable:Number = contentheight - contentlist.scrollRect.height;
				var sr:Rectangle = contentlist.scrollRect.clone();
				sr.y = scrollable * event.percent;
				contentlist.scrollRect = sr;
			}
		}
		
		public function selectbutton(event:Event):void {
			//trace(event.currentTarget.name);
			id = event.currentTarget.name;
			dispatchEvent(new BoxListEvent(BoxListEvent.SELECT, event.currentTarget.name));
		}
		
		public function clearlist():void {
			list = new Array();
			drawlist();
		}
		
		public function addlist(data:*):void {
			list.push(data);
			drawlist();
		}
		
		public function set _pheight(p_height:Number):void {
			pheight = p_height;
			drawlist();
		}
		public function get _pheight():Number {
			return pheight;
		}
		public function set _pwidth(p_width:Number):void {
			pwidth= p_width;
			drawlist();
		}
		public function get _pwidth():Number {
			return pwidth;
		}
		
		public function get _idname():String {
			return idname;
		}
		public function set _idname(strname:String):void {
			idname =strname;
		}
		public function get _id():String {
			return id;
		}
		public function set _id(strname:String):void {
			id = strname;
		}
		
	}
	
}