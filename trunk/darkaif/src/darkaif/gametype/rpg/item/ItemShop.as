/**
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package darkaif.gametype.rpg.item {
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	* 
	* This will buy and sell item. This part is just a test not yet buildt tested.
	* 
	* Data and return from server not working for some reason
	* 
	* Trouble area: alaway double check if the array return value is equal to the value output.
	* 
	* for each (var value:Object in itemdataarray) {
	*	FlashConnect.trace(String(value));
	*	// iterates through each value
	* }
	*/
	//{
	import flash.events.TimerEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.events.Event;
	import flash.utils.Timer;
	import org.flashdevelop.utils.FlashConnect;
	//}
	public class ItemShop {
		//{
		public var ItemArray:Array = new Array();
		public var memberid:String = 'admin';
		public var itemclass:Item = new Item();
		public var request:URLRequest = new URLRequest();
		public var loader:URLLoader = new URLLoader();
		public var urlpage:String = 'http://localhost/darkaif/scripts/item/shopitem.php';
		public var itemxml:XML = new XML();
		public var variables:URLVariables = new URLVariables();
		public var t:Timer = new Timer(0);
		public var quantity:int = 0;
		public var query_name:String = '';
		public var query_variable:String = ''; //this will url base submit 
		public var query_data:String = '';//item,quantity
		public var query_dir:String = 'http://localhost/darkaif/scripts/item/';
		public var query_file:String = 'item.php';
		public var query_type:String = '';//buy,sell
		public var query_check:String = 'None';
		//}
		public function ItemShop() {
			//{ XML SHEET
			/*
			var itemxml:XML = 
			<shopitem>
				<item>
					<shopname>default </shopname>
					<itemname> bottle </itemname>
					<buyprice> 1 </buyprice>
					<sellprice> 1 </sellprice>
				</item>
				<item>
					<shopname>default </shopname>
					<itemname> Can </itemname>
					<buyprice> 1 </buyprice>
					<sellprice> 1 </sellprice>
				</item>
				<item>
					<shopname>default </shopname>
					<itemname> Paper </itemname>
					<buyprice> 1 </buyprice>
					<sellprice> 1 </sellprice>
				</item>
				<item>
				<shopname>default </shopname>
				<itemname> Letter </itemname>
				<buyprice> 1 </buyprice>
				<sellprice> 1 </sellprice>
				</item >
			</shopitem > ;
			*/
			//}
			
			t.start();
			t.addEventListener(TimerEvent.TIMER, tick, false, 0, true);
			FlashConnect.trace("GETDATA F.:"+String(this.ItemArray.length));
		}
		
		public function tick(e:TimerEvent):void {
			//note for some resaon it did not update the array
			FlashConnect.trace("GETDATA TICK.:" + String(this.ItemArray.length));
			/*
			for each (var value:Object in ItemArray) {
				FlashConnect.trace("IA"+String(value));
				// iterates through each value
			}
			*/
			if (this.ItemArray.length > 0) {
				t.stop();
			}
		}
		
		public function GetData():void{
			//itemclass.additem('default','paper', 10.11, 12.12);//itemclass.additem('default','paper', 10.11, 12.12);
			request.url = urlpage;
			//request.data = variables;
			loader.load(request); //sends the request
			loader.addEventListener(Event.COMPLETE, LoadItemData);
			//var t:Timer = new Timer(1000);
			//t.start();
			//t.addEventListener(TimerEvent.TIMER, tick, false, 0, true);
			//FlashConnect.trace("GETDATA F.:" + String(this.ItemArray.length));
		}
		
		//array error
		public function LoadItemData(e:Event):void {
			//return data from lader not sure how to return it
			itemxml = new XML(e.target.data);
			for (var i:int = 0; i < itemxml.children().length(); i++ ) {
				this.ItemArray.push(new Array(itemxml.item[i].shopname, itemxml.item[i].itemname, itemxml.item[i].buyprice, itemxml.item[i].sellprice));//add array by pushing with out countner add
				//{ EXTRA ARRAY INFORMAITON
				//this array work format ItemArray[][]
				//this.ItemArray.push(new Array(itemxml.item[i].shopname, itemxml.item[i].itemname, itemxml.item[i].buyprice, itemxml.item[i].sellprice));
				
				//This array works format ItemArray[][]
				//this.ItemArray[i] = new Array(itemxml.item[i].shopname, itemxml.item[i].itemname, itemxml.item[i].buyprice, itemxml.item[i].sellprice);
				
				//this does not work for some reseaon
				//this.ItemArray.push(itemxml.item[i].shopname, itemxml.item[i].itemname, itemxml.item[i].buyprice, itemxml.item[i].sellprice);
				
				//FlashConnect.trace(String(itemxml.item[i].itemname));
				//}
			}
			//FlashConnect.trace("Data:" + String(this.ItemArray.length));
			//SetShopItemArray(this.ItemArray);
			FlashConnect.trace("data loading...");
			FlashConnect.trace(e.target.data);
		}
		
		public function SetShopItemArray(myitemarrray:Array):void {
			this.ItemArray = myitemarrray;
		}
		
		public function CheckData():void {
			FlashConnect.trace("--ITEM SHOP CLASS--");
			FlashConnect.trace("IA"+String(this.itemxml.children().length())); //XML
			FlashConnect.trace("IAL"+String(this.ItemArray.length));		   //XML
		}
		
		public function total():int {
			//FlashConnect.trace(String(ItemArray.length));
			return this.ItemArray.length;
		}
		
		public function getItemArray():Array {
			//FlashConnect.trace('GET ARRAY:' + String(this.ItemArray));
			//FlashConnect.trace('GET ARRAY:' + String(this.ItemArray.length));
			return this.ItemArray;
		}
		
		public function set Urlpage(Name:String):void {
			this.urlpage = Name;
		}
		
		public function get Urlpage():String {
			return this.urlpage;
		}
		
		//this.itemdata.push(new Array({'shopname':shop},{'itemname':name},{'buyprice':bprice},{'sellprice':sprice},{'description':''},{'id':'0'}));
		public function set Quantity(num:int):void{
			this.quantity = num;
		}
		
		//{Start How many item to buy
		public function get Quantity():int{
			return this.quantity;
		}
		
		public function set Query_name(text:String):void{
			this.query_name = text;
		}
		//}End How many item to buy
		
		public function get Query_name():String{
			return this.query_name;
		}
		
		public function get Query_type():String
		{
			return this.query_type;
		}
		
		public function set Query_type(text:String):void
		{
			this.query_type = text;
		}
		
		public function query_url():void 
		{	
			FlashConnect.trace("Doing query");
			request.url = (query_dir + query_file);
			FlashConnect.trace("Query Url:"+String(request.url));
			loader.load(request); //sends the request
			loader.addEventListener(Event.COMPLETE, LoadItemData);	
			//result <shopitem><item><shopname>None </shopname><itemname> None </itemname><buyprice> 1 </buyprice><sellprice> 1 </sellprice></item></shopitem>
		}
		
		public function Query_submit():void
		{
			FlashConnect.trace("---QUERY SERVER--");
			FlashConnect.trace("Query Name:" + String(this.query_name));
			FlashConnect.trace("quantity:" + String(quantity));
			query_url();
		}
	}
}
