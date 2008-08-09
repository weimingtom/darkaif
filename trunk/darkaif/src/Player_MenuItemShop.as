/**
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package  {
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	* Information: This a code test still working this section to later inlcude in item class.
	* This will help test out the item code and system. The data is save when run loading. 
	* Need to reloaded data from the server.
	* 
	* To do list:
	* -Create a simple list of item to buy icon.
	* -Delete, refresh, update, add, remove, data,list,execute
	* -Create Button for Buying numbers items
	* -Create Context scroll able for if item list when the list is big.
	* -Create Image Items.
	* -Query For buying and loading data from server
	* -Auto size the textfield for error
	* -need to work on position and offset objects
	* 
	* Errors:
	* -loading data when there no location found
	* 
	* Clean: Not yet. Running test to see it updated.
	* 
	* Required:
	* -php
	* -mysql
	* 
	*/
	import darkaif.classes.Item; //package from game dev. src
	import darkaif.classes.ItemShop; //package from game dev. src
	import darkaif.interact.RectButton; //package from game dev. src
	import darkaif.frame.*; //package from game dev. src -Deal with Scroll stuff -Need to improve some code stuff
	import flash.geom.Rectangle;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.MouseEvent;
	import flash.text.TextFieldType;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import org.flashdevelop.utils.FlashConnect;
	
	public class Player_MenuItemShop extends Sprite{
		public var Name:String = '';
		public var Location:Array = new Array();
		public var buttonArray:Array = new Array();
		public var item_data:Array = new Array();
		public var itemshop:ItemShop = new ItemShop();
		public var itemdataarray:Array = new Array();
		public var t:Timer = new Timer(1000);
		public var Label_ItemSprite:Sprite = new Sprite();
		public var Label_ItemShop:TextField = new TextField();
		
		public function Player_MenuItemShop() {
			Label_ItemShop.text = 'Item Shop:';
			addChild(Label_ItemShop);
			var label_name:TextField = new TextField();
			var label_price:TextField = new TextField();
			var label_actions:TextField = new TextField();
			//layout > Item Name > Price > Actions
			
			label_name.text = "Name";
			label_name.y = 20 ;
			label_name.x = 0;
			label_price.text = "Price"
			label_price.x = 80;
			label_price.y = 20;
			label_actions.text = "Actions";
			label_actions.x = 120;
			label_actions.y = 20;
			var label_quantity:TextField = new TextField();
			label_quantity.text = 'Stocks';
			label_quantity.type = TextFieldType.INPUT; 
			label_quantity.x = 120;
			label_quantity.y = 90;
			
			addChild(label_quantity);
			addChild(label_name);
			addChild(label_price);
			addChild(label_actions);
			
			var Input_quantity:TextField = new TextField();
			Input_quantity.type = TextFieldType.INPUT; 
			Input_quantity.text = '0';
			Input_quantity.height = 11;//resize shape
			Input_quantity.width = 32;//resize shape
			Input_quantity.x = 155;//layout
			Input_quantity.y = 92; //layout
			Input_quantity.background = true; //change the background
			Input_quantity.border = true; //outside line
			var format:TextFormat = new TextFormat();
			format.size = 7;//font size
			Input_quantity.setTextFormat(format);//change font settings
			addChild(Input_quantity);
			
			//{
			itemshop.GetData();
			//itemshop.CheckData();
			itemdataarray = itemshop.getItemArray();
			FlashConnect.trace('-------------------');
			itemshop.CheckData();//Class check if works.
			FlashConnect.trace('-------------------');
			
			t.start();
			t.addEventListener(TimerEvent.TIMER, tick, false, 0, true);//Execute loading data load from package class
			
			function tick(e:TimerEvent):void {// function tick, it will load the file from the server
				itemshop.CheckData();
				if (itemshop.total() > 0) {//If total number item is loaded execute code to create item shop base section
					t.stop();
					item_data = itemshop.getItemArray();
					FlashConnect.trace('-------------------');
					var count:int = 0;
					for each (var value:Object in itemdataarray) {//Write Data input from server query
						count ++;
						FlashConnect.trace('ITEM NAME:' + String(value[1])); //Current item data array from item class
						var Label_item:TextField = new TextField();
						Label_item.text = String(count) + ": " +String(value[1]); //Class ItemShop
						//Label_item.border = true;
						Label_item.height = 20; //adjust the size of the text height
						Label_item.y = (12 * count) - 12; //offset for zero
						Label_ItemSprite.addChild(Label_item);//add item to the sprite
						
						var Label_price:TextField = new TextField();
						Label_price.text = String(value[2]); //Class ItemShop
						//Label_price.border = true;
						Label_price.height = 20; //adjust the size of the text height
						Label_price.y = (12 * count) - 12; //offset for zero
						Label_price.x = 80 //move the text to right 
						Label_ItemSprite.addChild(Label_price);//add item to the sprite
						
						var Button_Buy:RectButton = new RectButton("Buy");
						Button_Buy.Text = String(value[1])
						Button_Buy.height = 12;//adjust size of the button
						Button_Buy.width = 30; //addjust size of the button
						Button_Buy.x = 120; //move the text to right 
						Button_Buy.y = (count * 12) - 12; //offset for zero
						Button_Buy.addEventListener(MouseEvent.CLICK, displayMessage); //add listen for that buton current item
						Label_ItemSprite.addChild(Button_Buy);
						
						function displayMessage(event:MouseEvent):void {
							//FlashConnect.trace(String(value[1])); //hmm it the same string 
							// Output the name of the clicked button.
							//FlashConnect.trace(event.currentTarget.name);
							
							//When the click is trigger this code will execute query data to buy data
							FlashConnect.trace(event.currentTarget.label_str + ":" + event.currentTarget.text); //Need to change some private to public to get access name in class package.
							FlashConnect.trace("NUMBER:" + String(Input_quantity.text));
							itemshop.Query_name = event.currentTarget.text
							itemshop.Quantity = int(Input_quantity.text);
							itemshop.Query_submit();
						}
					}
					var scrollbar:Scrollbar = new Scrollbar();//create srcoll bar
					var rect:Rectangle = new Rectangle( 0, 0, 200, 50);//Draw the border area panel
					var sc:ScrollContent = new ScrollContent( Label_ItemSprite, scrollbar, rect );//content panel to srcoll
					Label_ItemSprite.y = 40;
					Label_ItemSprite.graphics.beginFill( 0xFF0000, 1 );
					Label_ItemSprite.graphics.drawRect( 0, 0, Label_ItemSprite.height, Label_ItemSprite.width ); //this show you that area are drawing to make the item content
					addChild(Label_ItemSprite);//content for the item
					scrollbar.x = Label_ItemSprite.width;//128 + 32;//move the scroll bar
					scrollbar.y = 40;
					scrollbar.Content_height = rect.height;//set the scroll bar height
					addChild(scrollbar);//add the srcoll bar
					//need to fix the scroll bar and the content area.
				}
				FlashConnect.trace('TOTAL:' + itemshop.total());
			}//end function tick
			//}
		}
		
	}// Class ItemShopStand	
}//package