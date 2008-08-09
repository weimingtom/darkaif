/**
* ...
* @author Default
* SRC = LINK = http://www.blogaboutflash.com/2008/01/make-your-own-custom-right-click-menu.html
*/

/**
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/

package  {
	import flash.display.Sprite;
    import flash.ui.ContextMenu;
    import flash.ui.ContextMenuItem;
    import flash.ui.ContextMenuBuiltInItems;
    import flash.events.ContextMenuEvent;
	import org.flashdevelop.utils.FlashConnect;

	public class rightclickmenu extends Sprite{
		
		public function rightclickmenu() {
			var mymenu:ContextMenu = new ContextMenu();
			mymenu.hideBuiltInItems();
			
			var menuitem1:ContextMenuItem = new ContextMenuItem('Hello World');
			var menuitem2:ContextMenuItem = new ContextMenuItem("Go to My Page");
			menuitem2.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, doSomething);
			
			//add to the ContextMenuItem
			mymenu.customItems.push(menuitem1);
			mymenu.customItems.push(menuitem2);
			
			//show in the main mouse right click
			this.contextMenu = mymenu;
			FlashConnect.trace(""+this.contextMenu.customItems);
			
			function doSomething(e:ContextMenuEvent):void {
				//var url:String = "http://www.kennylin.com";
				//var request:URLRequest = new URLRequest(url);
				//navigateToURL(request, '_blank');
			}
			
		}
		
	}
	
}
