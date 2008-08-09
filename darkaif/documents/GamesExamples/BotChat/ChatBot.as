/** 
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package  {
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	* 
	* Information:This stage is s protype and working on two code languages and one database for mysql.
	* This for chat bot for player interact.
	* Following some stages may change in order funtion correctly.
	* 
	* Stage 1:
	* Build simple chat code.
	* 
	* Stage 2: 
	* Add on the current code or clean up how to code.
	* Check pattern code.
	* 
	* Stage 3: 
	* CMD code for bot to execute cmd some simple event.
	* 
	* Note:Need to fix error if there new parttern
	*/
	//{PACKAGE
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.events.KeyboardEvent;
	import org.flashdevelop.utils.FlashConnect;
	//}PACKAGE

	public class ChatBot extends Sprite{
		//{VARIABLES
		public var Text_OutPut:TextField = new TextField(); //OUTPUT TEXT
		public var InputChat:TextField = new TextField(); 	//CHAT INPUT
		public var ChatLog:String = '';						//TMP STRINGS				
		public var Height:Number = 100;						//Chat Box Size
		public var Width:Number = 200;						//Chat Box Size
		public var variables:URLVariables = new URLVariables();	//VARIABLES
		public var request:URLRequest = new URLRequest();		//GET THE PAGE
		public var loader:URLLoader = new URLLoader();			//LOAD THE DATA		
		//This will be the table database from the data that is needed to convert later
		//Incase there are diferent meaning but same result of the word phase
		public var xml:XML =  new XML(); 
		//}VARIABLES
		public function ChatBot() {
			variables.username = 'guest';	//Check What Ever If It is a guest
			variables.ip = '0.0.0.0';		//This will create id for person or revisit the bot will know him or not
			variables.botid = 'default';	//Current Bot
			variables.pattern = '';			//Get User Question or Input
			//variables //Need to add bit more for memory stuff
			//{TEXT_OUTPUT			
			//OUTPUT TEXT
			Text_OutPut.text = 'Chat Bot Room!\n';
			Text_OutPut.wordWrap = true;
			Text_OutPut.width = Width;
			Text_OutPut.border = true;
			Text_OutPut.background = true;
			addChild(Text_OutPut);
			
			//INPUT TEXT CHAT
			InputChat.y = Text_OutPut.height;
			InputChat.background = true;
			InputChat.height = 22;
			InputChat.width = Width;
			InputChat.border = true;			
			InputChat.type = TextFieldType.INPUT;
			addChild(InputChat);
			//}TEXT_OUTPUT
			
			//LISTEN FOR ENTER KEY
			InputChat.addEventListener(KeyboardEvent.KEY_DOWN,ChatEnter);
			
			//EXECUTE QUERY KEY
			function ChatEnter(e:KeyboardEvent):void{				
				if(e.keyCode == 13){//ENTER KEY
					FlashConnect.trace('PRESS' + e.keyCode); //SHOW KEY NUMBER
					
					ChatLog = Text_OutPut.text; //Carry the string
					
					ChatLog = ChatLog + variables.username + ": " + InputChat.text + '\n'; // Add the chat log
					request.url = 'scripts/bot/bot_category.php'; //get the bot brain
					variables.pattern = InputChat.text; //input value from your input
					request.data = variables; //set the data 
					Text_OutPut.text = String(ChatLog); //show log
					
					loader.load(request); //GET URL PAGE
					
					loader.addEventListener(Event.COMPLETE, doneLoading); //CHECK IF FILE IS FINISH
					
					InputChat.text = ''; //CLEAR USER TEXT WHEN USER IS ENTER KEY IS PRESS
					FlashConnect.trace(ChatLog); //SHOW OUTPUT
				}
			}
			function doneLoading(event:Event):void {
				
				xml =  new XML(event.target.data); //GET DATA FROM URL PAGE				
				FlashConnect.trace("DONE"); //EXECUTE DONE WHEN FILE LOADED IS COMPLETE
				
				/*
				FlashConnect.trace(String(xml.children().children().length()));
				//FlashConnect.trace(String(xml.children()[0]).children());
				FlashConnect.trace(
				String(xml.children()[0].children()[0]  )// This the first list for pattern
				);
				FlashConnect.trace(
				String(xml.children()[0].children()[3]  )// This the first list for pattern
				);
				//ChatLog = ChatLog + variables.botid + ": " + xml.children()[0].children()[0] + '\n';
				*/
				
				//OUTPUT FOR BOT FOR TALKING
				ChatLog = ChatLog + variables.botid + ": " + String(xml.children()[0].children()[3]) + '\n';
				//OUTPUT TEXT 
				Text_OutPut.text = ChatLog;
				//ADJUST SCROLL WHEN NEW TEXT IS UPDATE AND MOVE PANEL TEXT SCROLL
				Text_OutPut.scrollV = Text_OutPut.textHeight + Text_OutPut.height;
			}
		}
		

		
	}
	
}
