/**
* ...
* @author Default
* @version 0.1
*/

package {
    import flash.ui.ContextMenu;
    import flash.ui.ContextMenuItem;
    import flash.ui.ContextMenuBuiltInItems;
    import flash.display.Sprite;
    import flash.text.TextField;

    public class ContextMenuItemExample extends Sprite {
        private var myContextMenu:ContextMenu;

        public function ContextMenuItemExample() {
            myContextMenu = new ContextMenu();
            removeDefaultItems();
            addCustomMenuItems();
            this.contextMenu = myContextMenu;
            addChild(createLabel());
        }

        private function removeDefaultItems():void {
            myContextMenu.hideBuiltInItems();

            var defaultItems:ContextMenuBuiltInItems = myContextMenu.builtInItems;
            defaultItems.print = true;
        }

        private function addCustomMenuItems():void {
            var item:ContextMenuItem = new ContextMenuItem("Hello World");
			var item2:ContextMenuItem = new ContextMenuItem("Hello World me");
            myContextMenu.customItems.push(item);
			myContextMenu.customItems.push(item2);
        }
        
        private function createLabel():TextField {
            var txtField:TextField = new TextField();
            txtField.text = "Right Click Here";
            return txtField;
        }
    }
}