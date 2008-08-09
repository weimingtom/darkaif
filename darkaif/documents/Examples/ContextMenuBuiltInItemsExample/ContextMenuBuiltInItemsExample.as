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

    public class ContextMenuBuiltInItemsExample extends Sprite {
        private var myContextMenu:ContextMenu;

        public function ContextMenuBuiltInItemsExample() {
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
            myContextMenu.customItems.push(item);
        }
        
        private function createLabel():TextField {
            var txtField:TextField = new TextField();
            txtField.text = "Right Click";
            txtField.x = this.stage.stageWidth/2 - txtField.width/2;
            txtField.y = this.stage.stageHeight/2 - txtField.height/2;
            return txtField;
        }
    }
}
