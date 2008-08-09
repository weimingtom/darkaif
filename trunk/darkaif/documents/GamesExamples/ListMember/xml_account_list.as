/** 
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package  {
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	* 
	* Information: Working able for array build code. Need to loop iusses is next.
	* 
	* NEEDED!
	* 
	*/
	//{IMPORT
	import flash.display.BitmapData;
	import flash.text.TextField;
	import flash.display.Sprite;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.events.Event;
	import flash.net.URLRequestMethod;
	import org.flashdevelop.utils.FlashConnect;
	//}IMPORT
	public class xml_account_list extends Sprite{
		
		public function xml_account_list() {
			 var accounts:Array = new Array();
			
			var variables:URLVariables = new URLVariables();
			variables.username = "Admin";
			//variables.password = "";
			
			var tdisplay:TextField = new TextField();
			tdisplay.text = "hello";
			tdisplay.width = 1024;
			addChild(tdisplay);
			
			
			var request:URLRequest = new URLRequest();
			////insert in the location of the php script //////////
			request.url = 'scripts/xmlphp/xml_account_list.php';
			//xml_account_list.php
			///////////////////////////////////////////////////////
			
			request.data = variables;
			FlashConnect.trace("DATA:" + request.data);
			tdisplay.text = String(request.data);
			
			
			var loader:URLLoader = new URLLoader();
			loader.load(request);
			
			loader.addEventListener(Event.COMPLETE, createTable);
			function createTable(event:Event):void {
				var accountxml:XML = XML(event.target.data);
				FlashConnect.trace("LOAD DONE");
				//"XML: \n" + accountxml.length() 1 members table
				//"XML: \n" + accountxml.children()[0] show first account
				//"XML: \n" + accountxml.children().length() 2 how many members
				//"XML: \n" + accountxml.children()[0].children().length() 2 how many sub table 
				//"XML: \n" + accountxml.children().children()[0] show username 1st
				//"XML: \n" + accountxml.children().children()[1] show password
				//"XML: \n" + accountxml.children().children()[2] show username 2nd
				//"XML: \n" + accountxml.children().children()[3] show password
				//"XML: \n" + accountxml.children().children().length() 4
				//FlashConnect.trace("XML: \n" + accountxml);
				FlashConnect.trace('helo'
				//"XML: \n" + accountxml.children()[0].children()[0] + //2 how many members
				//"XML: \n" + accountxml.children()[0].children()[1]
				);
				
				//accounts
				for (x = 0; x < accountxml.children()[0].children().length(); x++) {
					accounts[x] =  [accountxml.children()[x].children()[0],accountxml.children()[x].children()[1]];
												//index of the user account						//index of password
				}
				FlashConnect.trace(accounts[0][0]);
				
				for each(var value:* in accounts){
				FlashConnect.trace(value);
				}
				
				//for each(var value:* in accountxml){
				//FlashConnect.trace(value);
				//}	
			}
			
		}
	}
}
