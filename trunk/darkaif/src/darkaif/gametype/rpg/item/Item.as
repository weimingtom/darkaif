/**
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package darkaif.gametype.rpg.item {
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	* 
	* Information: This will deal with item base but not all item will be built that there are other class for building items.
	* 
	* This depend how many query and reduce load time.
	*/
	//{
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.events.Event;
	import org.flashdevelop.utils.FlashConnect;
	//}
	public class Item {
		//{VARIABLES
		public var itemdata:Array = new Array();
		public var request:URLRequest = new URLRequest();
		public var loader:URLLoader = new URLLoader();
		public var indexnumber:int = 0;
		public var username:String = 'admin';
		public var userid:String = 'admin';
		public var itemxml:XML = new XML();
		public var urlpage:String = 'http://localhost/darkaif/scripts/item/shopitem.php';
		public var shopname:String = 'package';
		public var itemname:String = 'class';
		public var variables:URLVariables = new URLVariables();
		public var buyprice:String = '';
		//}
		public function Item() {
		}
		//{ GET SET FUNCTIONS
		public function setUserid(name:String):void {
			this.userid = name;
		}
		public function getUserid():String {
			return this.userid;
		}
		
		public function setUsername(name:String):void {
			this.username= name;
		}
		public function getUsername():String {
			return this.username;
		}
		
		public function setItemname(name:String):void {
			this.itemname = name;
		}
		public function getItemname():String {
			return this.itemname;
		}
		
		public function setShopname(name:String):void {
			this.shopname = name;
		}
		public function getShopname():String {
			return this.shopname;
		}
		
		public function setIndexnumber(name:int):void {
			this.indexnumber = name;
		}
		public function getIndexnumber():int {
			return this.indexnumber;
		}
		
		public function setItemxml(tmpxml:XML):void {
			this.itemxml = tmpxml;
		}
		
		public function getItemxml():XML{
			return this.itemxml;
		}
		
		public function setItemdata(tmparray:Array):void {
			this.itemdata = tmparray;
		}
		public function getItemdata():Array {
			return this.itemdata;
		}
		
		//}END FUNCTIONS GET AND SET
		
		//get item list data base from npc in used shop
		public function currentitem():void {
			
		}
		
		//ADD ITEM
		public function additem(shop:String,name:String,bprice:Number,sprice:Number):void {
			this.itemdata.push(new Array({'shopname':shop},{'itemname':name},{'buyprice':bprice},{'sellprice':sprice},{'description':''},{'id':'0'}));
		}
		
		//Create a black item
		public function createitem():void {
			//total add new item
		}
		//SET ITEM DESCRIPTION
		public function setitemdescription():void {
			
		}
		//SET ITEM NAME
		public function setitemname():void {
			
		}
		//SET SELL ITEM
		public function setitemprice():void {
			
		}
		//SET BUY ITEM
		public function setitembuy():void {
			
		}
		//SET ID ITEM
		public function setitemid():void {
			
		}
		
		public function total():int {
			//FlashConnect.trace(String(this.itemdata.length));
			return this.itemdata.length;
		}
		
		public function sell():void {
			//FlashConnect.trace(String(this.itemdata[indexnumber]['sellprice']));
		}
		
		public function buy():void {
			//FlashConnect.trace(String(this.itemdata[indexnumber]['buyprice']));
		}
		
		//next item on the list
		public function next():void {
			this.indexnumber++;
			if (this.indexnumber > int(this.itemdata.length)) {//you need to convert the int else cause an error
				this.indexnumber = int(this.itemdata.length);
			}
			//FlashConnect.trace("ED:"+String(int(this.itemdata.length)));
		}
		
		// going back to the current item
		public function back():void {
			this.indexnumber--;
			if (this.indexnumber < 0) {
				this.indexnumber = 0;
			}
		}
	}
	
}
