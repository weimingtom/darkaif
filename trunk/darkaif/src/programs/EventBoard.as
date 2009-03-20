package programs
{
	
	//{ packages
	import away3d.test.Panel;
	import darkaif.core.display.Button;
	import darkaif.frame.MenuToolPanel;
	import darkaif.core.display.Scrollbar;
	import darkaif.core.display.ScrollContent;
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
	public class EventBoard extends Sprite {
		
		//{ variables
		public var urlboardpage:String = "data/board/board.xml";
		//public var urlboardpage:String = "board.xml";
		//public var urlboardpage:String = "http://darkaif.googlecode.com/svn/trunk/apps/board.xml";
		public var urlrequest:URLRequest = new URLRequest();
		public var loader:URLLoader = new URLLoader();
		public var boardxml:XML = new XML();
		public var contentpanel:MenuToolPanel = new MenuToolPanel();
		public var contentbody:Sprite = new Sprite();
		public var eventpanel:MenuToolPanel = new MenuToolPanel();
		public var contenttext:TextField = new TextField();
		public var scrollbar:Scrollbar = new Scrollbar();
		public var rect:Rectangle = new Rectangle( 0, 0, 200, 90);
		public var buttonevents:Array = new Array();
		
		//}
		
		public function EventBoard() 
		{
			
			urlrequest.url = urlboardpage;
			loader.load(urlrequest);
			//contentpanel.contentholder.addChild(scrollbar);
			
			loader.addEventListener(Event.COMPLETE, logindata);
			
			function logindata(e:Event):void {
				//trace(e.target.data);
				boardxml = new XML(e.target.data);
				//trace(boardxml.board.information);
				buildbutton();
			}
		}
		
		//build event information news
		public	function buildbutton():void {
				//contentbody = new Sprite();
				var Panel_x:Number = 0;
				var Panel_y:Number = 0;
				for (var buttonno:int = 0; buttonno <  boardxml.board.length();buttonno++ ) {
					//trace("id:" + buttonno);
					//trace(boardxml.board[buttonno].title);
					var Button_Tmp:Button = new Button(String(boardxml.board[buttonno].title));
					Button_Tmp.x = Panel_x + 0*88; 
					Button_Tmp.y = Panel_y + buttonno * 15;
					Button_Tmp._width = 184;
					Button_Tmp.name = String(buttonno);
					//Button_Tmp.name = boardxml.board[buttonno].id;
					Button_Tmp.addEventListener(MouseEvent.CLICK, 
					function diplayboard(e:Event):void { //this will handle ID stuff here else instancexx
						trace("in listener:" + e.target.name);
						
						try {
							removeChild(contentpanel);
						}
						catch(e:Error) {
							trace(e);
						}
						boarddisplaycontent(e.target.name);
					});
					buttonevents.push(Button_Tmp);
					contentbody.addChild(Button_Tmp);
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
				//addChild(contentpanel);
		}
		
		//show board panel
		public	function boarddisplaycontent(id:int):void {
			for (var eventno:int = 0; eventno < boardxml.board.length(); eventno++ ) {
				if (id == eventno) {
					//contentpanel.contentholder = new Sprite();
					//contentpanel.contentholder
					var contentbutton:Button = new Button("Close");
					contentbutton.x = 160;
					contentbutton.y = 157;
					contentbutton.addEventListener(MouseEvent.CLICK, closecontentbutton);
					contenttext.border = true;
					contenttext.background = true;
					contenttext.text = boardxml.board[eventno].content;
					contenttext.height = 155;
					contenttext.width = 200;
					contenttext.wordWrap = true;
					contentpanel.contentholder.addChild(contentbutton);
					contentpanel._pheight = 200;
					contentpanel._pwidth = 200;
					contentpanel.contentholder.addChild(contenttext);
					addChild(contentpanel);
				}
			}
		}
		
		public function closecontentbutton(event:MouseEvent):void {
			removeChild(contentpanel);
		}
		
	}
	
}