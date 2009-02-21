package  
{
	//{
	import away3d.test.Panel;
	import darkaif.frame.Button;
	import darkaif.frame.MenuToolPanel;
	import darkaif.frame.Scrollbar;
	import darkaif.frame.ScrollContent;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.text.TextField;
	//}
	
	/**
	 * ...
	 * @author @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	 */
	public class EventBoard extends Sprite{
		//{
		public var urlboardpage:String = "board.xml";
		public var urlrequest:URLRequest = new URLRequest();
		public var loader:URLLoader = new URLLoader();
		public var boardxml:XML = new XML();
		public var contentpanel:MenuToolPanel = new MenuToolPanel();
		public var contentbody:Sprite = new Sprite();
		public var eventpanel:MenuToolPanel = new MenuToolPanel();
		public var contenttext:TextField = new TextField();
		public var scrollbar:Scrollbar = new Scrollbar();
		public var rect:Rectangle = new Rectangle( 0, 0, 200, 90);
		//}
		
		public function EventBoard() 
		{
			
			urlrequest.url = urlboardpage;
			loader.load(urlrequest);
			contentpanel.contentholder.addChild(contenttext);
			//contentpanel.contentholder.addChild(scrollbar);
			
			loader.addEventListener(Event.COMPLETE, logindata);
			
			function logindata(e:Event):void {
				//trace(e.target.data);
				boardxml = new XML(e.target.data);
				//trace(boardxml.board.information);
				buildbutton();
			}
			
			function buildbutton():void {
				var Panel_x:Number = 0;
				var Panel_y:Number = 0;
				for (var buttonno:int = 0; buttonno <  boardxml.board.length();buttonno++ ) {
					//trace("id:" + buttonno);
					//trace(boardxml.board[buttonno].title);
					var Button_Tmp:Button = new Button(boardxml.board[buttonno].title);
					Button_Tmp.x = Panel_x + 0*88; 
					Button_Tmp.y = Panel_y + buttonno * 15;
					Button_Tmp._width = 184;
					Button_Tmp.name = String(buttonno);
					Button_Tmp.addEventListener(MouseEvent.CLICK, boarddisplaycontent);
					contentbody.addChild(Button_Tmp)
					eventpanel._pwidth = 200;
					scrollbar.x = Button_Tmp.width+4;
				}
				scrollbar.y = 1;
				scrollbar.Content_height = 88;
				contentbody.width = 188;
				contentbody.height = 150;
				eventpanel.contentholder.addChild(contentbody);
				eventpanel._pheight = 118;
				var sc:ScrollContent = new ScrollContent(contentbody, scrollbar, rect );
				eventpanel.contentholder.addChild(scrollbar);
				addChild(eventpanel);
				
			}
			
			function boarddisplaycontent(event:MouseEvent):void {
				var contentbutton:Button = new Button("Close");
				contentbutton.x = 160;
				contentbutton.y = 157;
				contentbutton.addEventListener(MouseEvent.CLICK,closecontentbutton);
				contenttext.border = true;
				contenttext.background = true;
				contenttext.text = boardxml.board[event.target.name].content;
				//trace(event.target.name+"--"+contenttext.text);
				contenttext.height = 155;
				contenttext.width = 200;
				contenttext.wordWrap = true;
				contentpanel.contentholder.addChild(contentbutton);
				contentpanel._pheight = 200;
				contentpanel._pwidth = 200;
				addChild(contentpanel);
			}
			
			function closecontentbutton(event:MouseEvent):void {
				removeChild(contentpanel);
			}
			
		}
		
	}
	
}