/** 
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package  {
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	*/
	//{
	import flash.display.Sprite;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.net.URLLoader;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize;
	import darkaif.interact.RectButton;
	import org.flashdevelop.utils.FlashConnect;
	import flash.events.MouseEvent;
	//}

	public class navmenu extends Sprite{
		public var button_bgcolor:uint = 0xEFEFEF;
		public var button_height:Number = 24;
		public var button_width:Number = 92;
		public var label_list:Array = new Array();
		private var __menuList:XMLList;
		private var __loader:URLLoader;
		
		public function navmenu() {
			//This can be xml format
			label_list[0] = 'Menu00';
			label_list[1] = 'Menu01';
			label_list[2] = 'Menu02';
			
			drawMenu();
			
			
			/* BUTTON FAIL
			for(var i:int = 0;i < label_list.length ;i++){
				//DrawLoadingBar(i*0,i*button_height);
				var text_label:RectButton =  new RectButton(label_list[i]);
				text_label.x = i*0;
				text_label.y = i*button_height;
				addChild(text_label);
				FlashConnect.trace('LIST NUMBER:' + i + ":" + i*button_height);
			}
			
			text_label.addEventListener("click",menu00);
			
			function menu00():void{
				FlashConnect.trace('Menu 00');
			}
			*/
			/*
			for(var i:int = 0;i < label_list.length ;i++){
				DrawLoadingBar(i*0,i*button_height);
				var text_label:TextField =  new TextField();
				text_label.text = label_list[i];
				text_label.x = i*0;
				text_label.border = true;
				text_label.autoSize = TextFieldAutoSize.CENTER;
				text_label.selectable = false;
				text_label.y = i*button_height;
				addChild(text_label);
				FlashConnect.trace('LIST NUMBER:' + i + ":" + i*button_height);
			}
			*/
		}
		public function DrawLoadingBar(positionx:int,positiony:int):void{ //Graphic 
			//graphics.clear(); //This will clear all the data from the object
			graphics.beginFill(button_bgcolor); //Fill the first Layer
			graphics.drawRect(positionx,positiony,button_width,button_height); //First Image Layer
		}	
		
		private function drawMenu():void {
			
			// This variable will hold the x position of the next button in the menu.
			var xPos:Number = 0;
			// Create a holder that will contain the menu.
			var menuHolder:Sprite = new Sprite();
			// Add the holder to the stage.
			addChild(menuHolder);			
			
			// Create text formatting for the text fields in the menu.
			var format:TextFormat = new TextFormat();
			format.font = "Verdana";
			format.color = 0x000000;
			format.size = 12;
			format.bold = true;
			
			// Loop through the list and create each button in the list.
			var count:int = 0;
			//for each (p in __menuList) {
			for(var p:int = 0; p < label_list.length; p++) {
				// Create the button.
				var button:Sprite = new Sprite();	
				button.name = "button"+count;
				// Disable the mouse events of all the objects within the button.
				button.mouseChildren = false;
				// Make the sprite behave as a button.
				button.buttonMode = true;
				
				// Create the label for the down button state.
				var label:TextField = new TextField();
				label.autoSize = TextFieldAutoSize.LEFT;
				label.selectable = false;
				label.defaultTextFormat = format;
				//label.text = __menuList[count].text();
				label.text = label_list[count];
				
				// Create a up state for the button.
				var up:Sprite = new Sprite();
				up.graphics.lineStyle(1, 0x000000);
				up.graphics.beginFill(0x00FF00);
				up.graphics.drawRect(0, 0, 100, 30);
				up.name = "up";
				
				// Create a over state for the button.
				var over:Sprite = new Sprite();
				over.graphics.lineStyle(1, 0x000000);
				over.graphics.beginFill(0xFFCC00);
				over.graphics.drawRect(0, 0, 100, 30);
				over.name = "over";
				
				// Adder the states and label to the button.
				button.addChild(up);
				button.addChild(over);
				button.addChild(label);				
				
				// Position the text in the center of the button.
				label.x = (button.width/2) - (label.width/2);
				label.y = (button.height/2) - (label.height/2);
				
				// Add mouse events to the button.
				button.addEventListener(MouseEvent.MOUSE_OVER, displayActiveState);
				button.addEventListener(MouseEvent.MOUSE_OUT, displayInactiveState);
				button.addEventListener(MouseEvent.MOUSE_DOWN, displayDragedownState);
				button.addEventListener(MouseEvent.MOUSE_UP ,displayDrageupState);
				button.addEventListener(MouseEvent.CLICK, displayMessage);
				
				// Add the button to the holder.
				menuHolder.addChild(button);
				// Position the button.
				button.x = xPos;
				// Increase the x position for the next button.
				xPos += button.width + 2;
				// Hide the over state of the button.
				over.alpha = 0;
				// Increase the count.
				count++;
			}
			
			// Postion The Menu.
			menuHolder.x = 20;
			menuHolder.y = 20;	
			
		}
		
		private function displayDragedownState(event:MouseEvent):void {
			event.target.startDrag();
			
		}
		private function displayDrageupState(event:MouseEvent):void {
			event.target.stopDrag();
		}
		
		
		/**
		 * Show the active state of the button. 
		 */
		private function displayActiveState(event:MouseEvent):void {
			// Hide the over state of the button.
			event.currentTarget.getChildByName("over").alpha = 100;
		}
		
		/**
		 * Hide the active state of the button. 
		 */
		private function displayInactiveState(event:MouseEvent):void {
			
			// Show the over state of the button.
			event.currentTarget.getChildByName("over").alpha = 0;
			//event.target.stopDrag();
		}
		
		/**
		 * Display a message in the Output window. 
		 */
		private function displayMessage(event:MouseEvent):void {
			
			// Output the name of the clicked button.
			FlashConnect.trace(event.currentTarget.name);
			if (event.currentTarget.name == 'button1') {
				FlashConnect.trace(event.currentTarget.name + 'Hello World');
			}
			if (event.currentTarget.name == 'button0') {
				FlashConnect.trace('Hello World');
			}
		}
	}
}
