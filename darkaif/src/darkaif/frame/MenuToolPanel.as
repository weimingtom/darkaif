/**
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package darkaif.frame 
{
	//{
	import flash.display.Sprite;
	import flash.display.Graphics;
	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize;
	
	import org.flashdevelop.utils.FlashConnect;
	
	//}
	
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	* 
	* TODO:simple menu
	* TODO:drag menu
	* TODO:open and collspae menu
	* TODO:CLEAN UP
	*/
	public class MenuToolPanel extends Sprite
	{
		
		//{ variables
		public var container_panel:Sprite = new Sprite();
		public var menu_panel:Sprite = new Sprite();
		public var menu_automize_panel:Sprite = new Sprite();
		public var automize:int = 0;
		public var status_panel:Sprite = new Sprite();
		public var content_panel:Sprite = new Sprite();
		public var srcoll_panel:Sprite = new Sprite();
		public var contentholder:Sprite = new Sprite();
		
		public var Label_Menu:TextField = new TextField();
		public var Label_Status:TextField = new TextField();
		
		//public var pheight:Number = 13 * 2;
		public var pheight:Number = 13;
		public var pwidth:Number = 100;
		
		public var pheightmax:Number = 100;
		public var pheightmin:Number = 13+13;
		public var pwidthmax:Number = 100;
		public var pwidthmin:Number = 100;
		
		//color
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
		
		//public var 
		//}
		
		public function MenuToolPanel() 
		{
			//make shadow
			contentholder.x = 0;
			contentholder.y = 14;
			var dropShadow:DropShadowFilter = new DropShadowFilter();
			dropShadow.color = 0x000000;
			dropShadow.blurX = 10;
			dropShadow.blurY = 10;
			//dropShadow.angle = 45+90;
			//dropShadow.angle = 135;
			dropShadow.angle = 0;
			dropShadow.alpha = 0.5;
			dropShadow.distance = 10;
			
			//text format
			var format:TextFormat = new TextFormat();
			format.size = 10;
			format.font = "OCR A Extended";
			format.color = 0xF5F5F5;
			
			//container_panel
			//container_panel.graphics.beginFill(panelfgcolor);
			//container_panel.graphics.lineStyle(1);
			//container_panel.graphics.beginFill(panelbgcolor);
			//container_panel.graphics.drawRect(0, 0, pwidth, this.pheight);
			//add filter Cast shadow
			var filtersArray:Array = new Array(dropShadow);
			container_panel.filters = filtersArray;
			
			drawmenupanel();
			
			//MAIN MENU PANEL
			//menu_panel.graphics.beginFill(panelfgcolor);
			//menu_panel.graphics.lineStyle(1);
			//menu_panel.graphics.beginFill(menuout);
			//menu_panel.graphics.drawRect(0, 0, pwidth - 32, 13);
			
			//ADD FUNCTION FOR USER
			menu_panel.addEventListener(MouseEvent.MOUSE_UP, stopdragpanel);
			menu_panel.addEventListener(MouseEvent.MOUSE_DOWN, startdragpanel);
			menu_panel.addEventListener(MouseEvent.MOUSE_OVER, menupanel_over);
			menu_panel.addEventListener(MouseEvent.MOUSE_OUT, menupanel_out);
			
			//CREATE TEXT
			Label_Menu.text = "Menu Panel";
			Label_Menu.selectable = false;
			Label_Menu.setTextFormat(format);
			
			//ADD MENU TEXT
			menu_panel.addChild(Label_Menu);
			//ADD CHILD MENU PANEL SPRITE
			container_panel.addChild(menu_panel);
			
			//CREATE TOGGLE IMAGE BUTTON SPRTIE
			//menu_automize_panel.graphics.beginFill(panelfgcolor);
			//menu_automize_panel.graphics.lineStyle(1);
			//menu_automize_panel.graphics.beginFill(buttontoggleout);
			//menu_automize_panel.graphics.drawRect(pwidth - 32, 0, 32, 13);
			
			//ADD CHILD USER FUNCTIONS
			menu_automize_panel.addEventListener(MouseEvent.MOUSE_DOWN, automizetoggle);
			menu_automize_panel.addEventListener(MouseEvent.MOUSE_OVER, menu_automize_panel_over);
			menu_automize_panel.addEventListener(MouseEvent.MOUSE_OUT, menu_automize_panel_out);
			
			//ADD CHILD TOGGLE BUTON SPRITE
			container_panel.addChild(menu_automize_panel);
			
			//CREATE CONTENT BODY SPRITE
			//content_panel.graphics.beginFill(0xEEEEEE);
			//content_panel.graphics.beginFill(panelfgcolor);
			//content_panel.graphics.lineStyle(1);
			//content_panel.graphics.drawRect(0, 13, pwidth, pheight - 13*2);//main body
			
			//ADD CHILD CONTENT BODY SPRITE
			container_panel.addChild(content_panel);
			
			//CREATE BOTTOM STATUS SPRITE
			//status_panel.graphics.beginFill(panelfgcolor);
			//status_panel.graphics.lineStyle(1);
			//status_panel.graphics.beginFill(menuout);
			//status_panel.graphics.drawRect(0, this.pheight - 13, pwidth, 13);
			
			//CREATE STATUS TEXT 
			Label_Status.text = 'status';
			Label_Status.selectable = false;
			Label_Status.autoSize = TextFieldAutoSize.LEFT;
			Label_Status.setTextFormat(format);
			Label_Status.y = pheight - 13;
			
			//ADD CHILD STATUS TEXT 
			status_panel.addChild(Label_Status);
			
			//ADD CHILD STATUS PANEL
			container_panel.addChild(status_panel);
			
			//ADD CHILD MAIN container
			addChild(container_panel);
			
			content_panel.addChild(contentholder);
		}
		
		public function drawmenupanel():void{
			container_panel.graphics.clear();
			container_panel.graphics.beginFill(panelfgcolor);
			container_panel.graphics.lineStyle(1);
			container_panel.graphics.beginFill(panelbgcolor);
			container_panel.graphics.drawRect(0, 0, pwidth, this.pheight);
			
			menu_panel.graphics.clear();
			menu_panel.graphics.beginFill(panelfgcolor);
			menu_panel.graphics.lineStyle(1);
			menu_panel.graphics.beginFill(menuout);
			menu_panel.graphics.drawRect(0, 0, pwidth - 32, 13);
			
			menu_automize_panel.graphics.clear();
			menu_automize_panel.graphics.beginFill(panelfgcolor);
			menu_automize_panel.graphics.lineStyle(1);
			menu_automize_panel.graphics.beginFill(buttontoggleout);
			menu_automize_panel.graphics.drawRect(pwidth - 32, 0, 32, 13);
			
			content_panel.graphics.clear();
			content_panel.graphics.beginFill(0xEEEEEE);
			content_panel.graphics.beginFill(panelfgcolor);
			content_panel.graphics.lineStyle(1);
			content_panel.graphics.drawRect(0, 13, pwidth, pheight - 13*2);//main body
			
			status_panel.graphics.clear();
			status_panel.graphics.beginFill(panelfgcolor);
			status_panel.graphics.lineStyle(1);
			status_panel.graphics.beginFill(menuout);
			status_panel.graphics.drawRect(0, this.pheight - 13, pwidth, 13);
			
			Label_Status.y = pheight - 13;
		}
		
		public function startdragpanel(event:MouseEvent):void{
			container_panel.startDrag();
		}
		
		public function stopdragpanel(event:MouseEvent):void{
			container_panel.stopDrag();
		}
		
		//MENU TOGGLE BUTTON LISTEN FUNCTION
		public function automizetoggle(event:MouseEvent):void{
			//FlashConnect.trace("toggle: "+ automize);
			automize++;
			if (automize > 1)
			{
				automize = 0;
			}
			automizetogglecolor();
		}
		
		//MENU TOGGLE BUTTON COLOR CHANGE STATE ICON
		public function automizetogglecolor():void{
			menu_automize_panel.graphics.clear();
			menu_automize_panel.graphics.beginFill(panelfgcolor);
			menu_automize_panel.graphics.lineStyle(1);
			
			content_panel.graphics.clear();
			content_panel.graphics.beginFill(panelfgcolor);
			content_panel.graphics.lineStyle(1);
			content_panel.graphics.beginFill(panelbgcolor);
			
			container_panel.graphics.clear();
			container_panel.graphics.beginFill(panelfgcolor);
			container_panel.graphics.lineStyle(1);
			container_panel.graphics.beginFill(panelbgcolor);	
			
			status_panel.graphics.clear();
			status_panel.graphics.beginFill(panelfgcolor);
			status_panel.graphics.lineStyle(1);
			status_panel.graphics.beginFill(menuout);
			
			if (automize == 1)
			{
				menu_automize_panel.graphics.beginFill(buttontoggleout2);
				content_panel.graphics.drawRect(0, 13, pwidth, 0);
				container_panel.graphics.drawRect(0, 0, pwidth, 13 + 13);
				status_panel.graphics.drawRect(0, 13, pwidth, 13);
				Label_Status.y = 13;
				hidecontent();
			}
			else
			{
				//close
				menu_automize_panel.graphics.beginFill(buttontoggleout);
				content_panel.graphics.drawRect(0, 13, pwidth, pheight - 13*2); //main body
				container_panel.graphics.drawRect(0, 0, pwidth, pheight);
				status_panel.graphics.drawRect(0, pheight - 13, pwidth, 13);
				Label_Status.y = pheight - 13;
				
				showcontent();
			}
			menu_automize_panel.graphics.drawRect(pwidth - 32, 0, 32, 13);
			
		}
		
		//MENU TOGGLE BUTTON OVER
		public function menu_automize_panel_over(event:MouseEvent):void{
			menu_automize_panel.graphics.clear();
			menu_automize_panel.graphics.beginFill(panelfgcolor);
			menu_automize_panel.graphics.lineStyle(1);
			menu_automize_panel.graphics.beginFill(buttontoggleover);
			menu_automize_panel.graphics.drawRect(pwidth - 32, 0, 32, 13);
		}
		
		//MENU TOGGLE BUTTON OUT
		public function menu_automize_panel_out(event:MouseEvent):void{
			menu_automize_panel.graphics.clear();
			//check if the mouse move out of the mouse.
			if (automize == 1)
			{
				menu_automize_panel.graphics.beginFill(panelfgcolor);
				menu_automize_panel.graphics.lineStyle(1);
				menu_automize_panel.graphics.beginFill(buttontoggleout2);
			}
			else
			{
				menu_automize_panel.graphics.beginFill(panelfgcolor);
				menu_automize_panel.graphics.lineStyle(1);
				menu_automize_panel.graphics.beginFill(buttontoggleout);
			}
			menu_automize_panel.graphics.drawRect(pwidth - 32, 0, 32, 13);
		}
		
		//MENU PANEL OVER
		public function menupanel_over(event:MouseEvent):void{
			menu_panel.graphics.clear();
			menu_panel.graphics.beginFill(panelfgcolor);
			menu_panel.graphics.lineStyle(1);
			menu_panel.graphics.beginFill(menuover);
			menu_panel.graphics.drawRect(0, 0, pwidth - 32, 13);
		}
		
		//MENU PANEL OUT
		public function menupanel_out(event:MouseEvent):void{
			menu_panel.graphics.clear();
			menu_panel.graphics.beginFill(panelfgcolor);
			menu_panel.graphics.lineStyle(1);
			menu_panel.graphics.beginFill(menuout);
			menu_panel.graphics.drawRect(0, 0, pwidth - 32, 13);
		}
		
		public function set _pheight(height:Number):void{
			if (height >= pheight){
			this.pheight = height;
			drawmenupanel();
			}
		}
		
		public function get _pheight():Number{
			return this.pheight;
		}
		
		public function set _pwidth(width:Number):void{
			if (width >= pwidthmin){
			this.pwidth = width;
			drawmenupanel();
			}
		}
		
		public function get _pwidth():Number{
			return this.pwidth;
		}
		
		//TODO: add, remove, show, hide content
		public function addcontent(objectsprite:Sprite):void{
			objectsprite.x = 1; //offset
			objectsprite.y = 14; //offset
			contentholder = objectsprite;
			content_panel.addChild(contentholder);
		}
		
		public function removecontent(objectsprite:Sprite):void{
			container_panel.removeChild(contentholder);
		}
		
		public function showcontent():void{
			content_panel.addChild(contentholder);
		}
		
		public function hidecontent():void{
			content_panel.removeChild(contentholder);
		}
		
	}
	
}