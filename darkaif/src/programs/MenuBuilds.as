/**
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package  programs
{
	//{
	import darkaif.frame.*;
	import darkaif.interact.MenuFrame;
	import darkaif.interact.MenuPanel;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	import darkaif.core.display.Button;
	//}
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	* 
	* Infromatin: Working on the menu frame and other menu stuff.
	*/
	public class MenuBuilds extends Sprite
	{
		public function MenuBuilds() 
		{
			var MainEditorSprite:Sprite = new Sprite();
			var menusprite:Sprite = new Sprite();
			menusprite.graphics.beginFill(0xEEEEFF);
			menusprite.graphics.drawRect(0, 0, 64, 64);
			var MainEditorPanel:MenuToolPanel =  new MenuToolPanel();
			MainEditorPanel._pheight = 13*7;
			//MainEditorPanel._pwidth = 10;
			//MainEditorPanel.addcontent(menusprite);
			
			//MainEditorPanel
			//new map
			var button:Button = new Button("New");
			button._width = 98;
			//var sbutton:Sprite = button.getsprite();
			MainEditorSprite.addChild(button);
			
			//open map
			button = new Button("Open");
			button._width = 98;
			button.y = 13;
			MainEditorSprite.addChild(button);
			
			//save
			button = new Button("Save");
			button._width = 98;
			button.y = 13*2;
			MainEditorSprite.addChild(button);
			
			//save as
			button = new Button("Save As");
			button._width = 98;
			button.y = 13 * 3;
			MainEditorSprite.addChild(button);
			
			//tools
			button = new Button("Tools");
			button._width = 98;
			button.y = 13 * 4;
			MainEditorSprite.addChild(button);
			
			//MainEditorPanel.addcontent(MainEditorSprite);
			addChild(MainEditorPanel);
			
			//===========================================================================
			//working -testing
			
			//var framesizing:Framesizing = new Framesizing();
			//addChild(frame);
			
			//var framesizing:Framesizing = new Framesizing();
			//addChild(framesizing);
			
			/*
			var content:Sprite = new Sprite();
			var scrollbar:Scrollbar = new Scrollbar();
			var scroll_rect:Rectangle = new Rectangle( 0, 0, 100, 50 );
			
			content.graphics.beginFill( 0xFF0000, 1 );
            content.graphics.drawRect( 0, 0, 100, 50 );
            content.graphics.beginFill( 0x00FF00, 1 );
            content.graphics.drawRect( 0, 50, 100, 50 );
            content.graphics.beginFill( 0x0000FF, 1 );
            content.graphics.drawRect( 0, 100, 100, 50 );
            content.graphics.endFill();
			
			var rect:Rectangle = new Rectangle( 0, 0, 100, 50 ); //set limit to be viewable
            var sc:ScrollContent = new ScrollContent( content, scrollbar, rect );
           
            scrollbar.x = content.width;
			scrollbar.Content_height = 50; //adjust bar height
            addChild( content );
            addChild( scrollbar );
			*/
			
			
			//===========================================================================
			//working -testing
			//var menu:Menu =  new Menu();
			//addChild(menu);
			
			//===========================================================================
			//not working -testing
			//var menuframe:MenuFrame = new MenuFrame();
			//addChild(menuframe);
			
			//===========================================================================
			//not working -testing
			//var menupanel:MenuPanel = new MenuPanel()
			//addChild(menupanel);
		}
		
	}
	
}