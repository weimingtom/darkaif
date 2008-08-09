/**
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package  {
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	* This section test out the classes from the darkaif 
	* darkaif code might br name differently later on.
	* 
	* THIS SECTION IS TO TEST OUT THE CLASSES
	*/
	//{PACKAGE
	//flash files
	import darkaif.audio.audio;
	import darkaif.classes.Character;
	import darkaif.classes.Item;
	import darkaif.classes.ItemDataBase;
	import darkaif.classes.ItemShop;
	import flash.display.Sprite;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.ui.ContextMenuItem;
	import flash.text.TextField;
	//my files
	import darkaif.classes.gamelogin;
	import darkaif.frame.*;
	import darkaif.classes.Register;
	//faslh devolop
	import org.flashdevelop.utils.FlashConnect;
	//}
	public class classes extends Sprite{
		
		public function classes() {
			//{
			/*
			var buttonArray:Array = new Array();
			
			
			var itemshop:ItemShop = new ItemShop();
			itemshop.GetData();
			var itemdataarray:Array = new Array();
			//itemshop.CheckData();
			itemdataarray = itemshop.getItemArray();
			FlashConnect.trace('-------------------');
			itemshop.CheckData();
			FlashConnect.trace('-------------------');
			//FlashConnect.trace(String(itemshop.getItemArray()));
			//itemshop.total();
			
			//FlashConnect.trace('CLASS ARRAY:'+String(itemdataarray.length));
			//FlashConnect.trace("ARRAY TEST:"+String(itemdataarray[2].length));
			
			
			for each (var value:Object in itemdataarray) {
				FlashConnect.trace("IA"+String(value));
				// iterates through each value
			}
			
			
			var t:Timer = new Timer(1000);
			t.start();
			t.addEventListener(TimerEvent.TIMER, tick, false, 0, true);
			function tick(e:TimerEvent):void {
				itemshop.CheckData();
				if (itemshop.total() > 0) {
					t.stop();
				}
				FlashConnect.trace('TOTAL:' + itemshop.total());
			}
			*/
			
			var dataitem:Array = new Array(); 
			dataitem['name'] = 'none';
			dataitem['type'] = 'notype';
			
			var char_:Character = new Character();
			
		}
		
	}
	
}
