/**
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package darkaif.core.display 
{
	//{ packages
	import flash.display.Sprite;
	import flash.display.Graphics;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize;
	import darkaif.core.event.SliderEvent;
	
	import org.flashdevelop.utils.FlashConnect;
	
	//}
	
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	* 
	* TODO:simple menu [part done]
	* TODO:drag menu [part done]
	* TODO:open and collspae menu [not build]
	* TODO:CLEAN UP [not done]
	*/
	
	public class ToolPanel extends Sprite{
		
		//{ variables
		public var pheight:Number = 13;
		public var pwidth:Number = 100;
		
		public var _height:Number = 14;
		public var _width:Number = 64;
		
		public var bodyheight:Number = 0;
		public var bodywidth:Number = 0;
		
		public var bmize:Boolean = false;
		
		//public var bottomleftsize:Sprite = new Sprite();
		public var bottomrightsize:Sprite = new Sprite();
		public var bodypanel:Sprite = new Sprite();
		//public var bodypanel:Sprite = new Sprite();
		
		public var toppanel:Sprite = new Sprite();
		public var bottompanel:Sprite = new Sprite();
		//public var scrollpanel:Sprite = new Sprite();
		
		public var Label_Menu:TextField = new TextField();
		public var Label_Status:TextField = new TextField();
		
		public var pheightmax:Number = 100;
		public var pheightmin:Number = 14*2;
		public var pwidthmax:Number = 100;
		public var pwidthmin:Number = 100;
		
		public var minibuttonheight:Number = 14;
		public var minibuttonwidth:Number = 14;
		
		public var buttonheight:Number = 14;
		public var buttonwidth:Number = 64;
		public var defaultbuttonwidth:Number = 14;
		
		public var closepanelbutton:Button = new Button("x");
		public var minisizetogglebutton:Button = new Button("_");
		
		public var scrollbar:ScrollPanel = new ScrollPanel();
		public var bsrollbarcontrol:Boolean = true;
		public var rect:Rectangle = new Rectangle();
		
		//{color
		public var menuover:uint = 0xD3D3D3; //0xA9A9A9
		public var menuout:uint = 0x363430; //0x363430
		public var menuup:uint = 0x00FFFF;
		public var menudown:uint = 0x00FFFF;
		
		public var buttonover:uint = 0x00FFFF;
		public var buttonout:uint = 0x87cefa;
		public var buttonup:uint = 0x00FFFF;
		public var buttondown:uint = 0x00FFFF;
		
		public var buttontoggleover:uint = 0xD3D3D3;
		public var buttontoggleout:uint = 0x808080;
		public var buttontoggleout2:uint = 0x000000;
		public var buttontoggleup:uint = 0x00FFFF;
		public var buttontoggledown:uint = 0x00FFFF;
		
		public var panelfgcolor:uint = 0xFFFFFF; //front ground
		public var panelbgcolor:uint = 0xF5F5F5; //back ground
		public var panelfcolor:uint = 0x00FFFF;
		
		public var fontcolor01:uint = 0x00FFFF;
		public var fontcolor02:uint = 0x00FFFF;
		
		//}
		
		//public var 
		//}
		
		public function ToolPanel(){
			setmenuname();
			drawtoolpanel();
			//scrollbar.Content_height = 20;
			bottomrightsize.x = pwidth - bottomrightsize.width;
			bottomrightsize.y = pheight - bottomrightsize.height;
			
			minisizetogglebutton.x = pwidth - 14 * 2;
			closepanelbutton.x = pwidth - 14 * 1;
			
			//bottomrightsize
			bottomrightsize.addEventListener(MouseEvent.MOUSE_DOWN, dragdown_bottomright);
			bottomrightsize.addEventListener(MouseEvent.MOUSE_MOVE, move_bottomright);
			bottomrightsize.addEventListener(MouseEvent.MOUSE_UP, dragup_bottomright);
			//toppanel
			toppanel.addEventListener(MouseEvent.MOUSE_DOWN, mainstartdrag);
			toppanel.addEventListener(MouseEvent.MOUSE_UP, mainstopdrag);
			//bottompanel
			bottompanel.addEventListener(MouseEvent.MOUSE_DOWN, mainstartdrag);
			bottompanel.addEventListener(MouseEvent.MOUSE_UP, mainstopdrag);
			
			Label_Menu.addEventListener(MouseEvent.MOUSE_DOWN, mainstartdrag);
			Label_Menu.addEventListener(MouseEvent.MOUSE_UP, mainstopdrag);
			addChild(toppanel);
			addChild(Label_Menu);
			scrollbar.addEventListener( SliderEvent.CHANGE, updateContent );
			addChild(scrollbar);
			addChild(bottompanel);
			addChild(bottomrightsize);
			addChild(minisizetogglebutton);
			addChild(closepanelbutton);
			bodypanel.y = buttonheight;
			
			addEventListener(Event.ENTER_FRAME, drawtoolpanel);
			
			rect = new Rectangle(0,0,pwidth,pheight);
		}
		
		public function content(panel:Sprite):void {
			bodypanel = panel;
			bodypanel.y = buttonheight;
			bodyheight = bodypanel.height;
			bodywidth = bodypanel.width;
			addChild(bodypanel);
			drawtoolpanel();
			scrollbar._pheight = pheight - (buttonheight * 2);
			bottomrightsize.x = pwidth - bottomrightsize.width;
			bottomrightsize.y = pheight -bottomrightsize.height;
		}
		
		public function setmenuname(menuname:String="tool panel"):void {
			var format:TextFormat = new TextFormat();
			format.size = 10;
			format.font = "OCR A Extended";
			//format.color = 0xF5F5F5;
			format.color = 0x000000;
			
			Label_Menu.text = menuname;
			Label_Menu.selectable = false;
			Label_Menu.height = buttonheight;
			Label_Menu.border = true;
			Label_Menu.setTextFormat(format);
			if (Label_Menu.width > pwidth-minibuttonwidth) {
				Label_Menu.width = pwidth-minibuttonwidth;
			}
			
		}
		
		public function setstatusname(menuname:String="status panel"):void {
			var format:TextFormat = new TextFormat();
			format.size = 10;
			format.font = "OCR A Extended";
			format.color = 0xF5F5F5;
			
			Label_Menu.text = menuname;
			Label_Menu.selectable = false;
			Label_Menu.autoSize = TextFieldAutoSize.LEFT;
			Label_Menu.border = true;
			Label_Menu.setTextFormat(format);
		}
		
		public function mainstartdrag(event:Event):void {
			this.startDrag();
		}
		
		public function mainstopdrag(event:Event):void {
			this.stopDrag();
		}
		
		public function updateContent( e:SliderEvent ):void {
			trace("update");
			var rect:Rectangle = new Rectangle(0,0,pwidth-minibuttonwidth,pheight-(buttonheight*2));
			bodypanel.scrollRect = rect;
			
			var scrolly:Number = rect.height - bodypanel.height;
			bodypanel.y = scrolly * scrollbar.percentage;
        }
		
		//draw panel
		public function drawtoolpanel(e:Event = null):void {
			var rect:Rectangle = new Rectangle();
			//trace("bodyheight"+bodyheight);
			//trace("height:"+pheight +":py"+ bodypanel.y+":ph"+bodypanel.height)
			//bodypanel.scrollRect.height -reflect pheight and doesn't exist if created
			//pheight -resize height
			if (pheight > bodyheight) {
				rect = new Rectangle(0,0,pwidth-minibuttonwidth,pheight - (buttonheight * 2));
				bodypanel.scrollRect = rect;
				//disable scroll
			}else {
				//note:this deal with offset sprites classes
				rect = new Rectangle(0,(bodyheight -(pheight-(minibuttonheight*2)))* scrollbar.percentage,pwidth-minibuttonwidth,(pheight - (buttonheight * 2)));
				bodypanel.scrollRect = rect;
				//trace("adjust");
			}
			
			
			if (pheight < pheightmin) {
				pheight = pheightmin;
			}
			if (pwidth < pwidthmin) {
				pwidth = pwidthmin;
			}
			
			scrollbar.x = pwidth - scrollbar.width;
			scrollbar.y = buttonheight;
			if (!bsrollbarcontrol){
				scrollbar._pheight = pheight - (buttonheight * 2);
			}
			//button
			minisizetogglebutton.x = pwidth - 14 * 2;
			closepanelbutton.x = pwidth - 14 * 1;
			
			//lablel adjust
			Label_Menu.height = buttonheight;
			Label_Menu.width = pwidth;
			if (Label_Menu.width > pwidth - (minibuttonwidth*2)) {
				Label_Menu.width = pwidth - (minibuttonwidth*2);
			}
			
			//{ draw graphic
			graphics.clear();
			graphics.beginFill(0xF5F5F5);
			graphics.drawRect(0, 0, pwidth, pheight);
			graphics.endFill();
			
			toppanel.graphics.clear();
			toppanel.graphics.beginFill(0xD3D3D3);
			toppanel.graphics.drawRect(0, 0, pwidth, buttonheight);
			toppanel.graphics.endFill();
			//toppanel.scrollRect.x--;
			
			bottompanel.y = pheight-minibuttonheight;
			bottompanel.graphics.clear();
			bottompanel.graphics.beginFill(0xD3D3D3);
			bottompanel.graphics.drawRect(0, 0, pwidth-minibuttonwidth, buttonheight);
			bottompanel.graphics.endFill();
			
			bottomrightsize.graphics.beginFill(0x363430);
			bottomrightsize.graphics.drawRect(0, 0, minibuttonwidth, minibuttonheight);
			bottomrightsize.graphics.endFill();
			//}
			
		}
		
		//mouse down
		public function dragdown_bottomright(event:Event):void {
			event.target.startDrag();
			bsrollbarcontrol = false;
		}
		
		//mouse up 
		public function dragup_bottomright(event:Event = null):void {
			event.target.stopDrag();
			bsrollbarcontrol = true;
			//setscrollheight();
			scrollbar._pheight = pheight - (buttonheight * 2);
			bottomrightsize.x = pwidth - bottomrightsize.width;
			bottomrightsize.y = pheight -bottomrightsize.height;
		}
		
		//this will update while mouse is move
		public function move_bottomright(event:Event):void {
			//event.target.stopDrag();
			pwidth = bottomrightsize.x+bottomrightsize.width;
			pheight = bottomrightsize.y+bottomrightsize.height;
			//bottomleftsize.y = bottomrightsize.y;
			drawtoolpanel();
		}
		
		/**
		 * @param _pheight panel size height
		 * 
		 */
		public function set _pheight(_height:Number):void {
			pheight = _height;
			drawtoolpanel();
			scrollbar._pheight = pheight - (buttonheight * 2);
			bottomrightsize.x = pwidth - bottomrightsize.width;
			bottomrightsize.y = pheight -bottomrightsize.height;
		}
	}
	
}