/**
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package  
{
	import darkaif.frame.Menu;
	import darkaif.frame.Scrollbar;
	import darkaif.frame.ScrollContent;
	import darkaif.interact.MenuFrame;
	import darkaif.interact.MenuPanel;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	
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
			
			//===========================================================================
			//working -testing
			
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