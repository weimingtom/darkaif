package darkaif.core.display
{
	//{ packages
	import darkaif.core.display.Button;
	import darkaif.interact.RectButton;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.display.Graphics;
	import flash.text.TextFormat;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.utils.unescapeMultiByte;
	import flash.net.URLRequest;
	import flash.net.URLLoader;
	//}
	
	/**
	 * ...
	 * @author Darknet
	 * Copy Rights (c) http://darkaif.googlecode.com
	 */
	public class NPCMessageBox extends Sprite
	{
		//{ start variables
		//public var npc_messagebox:Sprite = new Sprite();
		public var npc_name:TextField = new TextField();
		public var npc_text:TextField = new TextField();
		public var npc_shop:Sprite = new Sprite();
		public var npc_quest:Sprite = new Sprite();
		public var npc_panel:Sprite = new Sprite();
		//public var npc_string:String = "Hello my name is npc! What can I do for you? I can do the folling command from the admin that i can only aollow. Quest, Shop, Talk, and tips about the game. This is currently under going testing and fixing some simple or hard coding to my program functions.";
		public var npc_string:String = 'tmp';
		public var npcscripturl:String = 'data/npcs/npcscriptlist.xml';
		public var npcshopurl:String = 'data/npcs/npcshoplist.xml';
		public var npcquesturl:String = 'data/npcs/npcquestlist.xml';
		
		public var textcount:int = 0;
		public var npcid:int = 0;
		public var npcname:String = "npc2";
		
		public var npcscriptxml:XML = new XML();
		public var npcshopxml:XML = new XML();
		public var npcquestxml:XML = new XML();
		
		public var buttonnext:Button = new Button("Next");
		public var buttonclose:Button = new Button("Close");
		public var buttondecline:Button = new Button("Decline");
		public var buttonaccept:Button = new Button("Accept");
		
		//} end variables
		
		public function NPCMessageBox() {
			initnpcscriptxml();
			var talkbutton:Button = new Button("Chat Me");
			talkbutton.addEventListener(MouseEvent.CLICK, shownpcbox);
			//addChild(talkbutton);
		}
		
		public function shownpcbox(event:MouseEvent):void {
			ShowNPCMessageBox();
		}
		
		public function initnpcscriptxml():void {
			var urlrequest:URLRequest = new URLRequest(npcscripturl);
			var urlloader:URLLoader = new URLLoader(urlrequest);
			urlloader.addEventListener("complete", initdata)
			
			function initdata(event:Event):void {
				npcscriptxml = new XML(event.target.data);
				initnpcshopxml();
			}
		}		
		
		public function initnpcshopxml():void {
			var urlrequest:URLRequest = new URLRequest(npcshopurl);
			var urlloader:URLLoader = new URLLoader(urlrequest);
			urlloader.addEventListener("complete", initdata)
			
			function initdata(event:Event):void {
				//trace(event.target.data);
				npcshopxml = new XML(event.target.data);
				initnpcquestxml();
			}
		}
		
		public function initnpcquestxml():void {
			var urlrequest:URLRequest = new URLRequest(npcscripturl);
			var urlloader:URLLoader = new URLLoader(urlrequest);
			urlloader.addEventListener("complete", initdata)
			
			function initdata(event:Event):void {
				npcscriptxml = new XML(event.target.data);
				ShowNPCMessageBox();
			}
		}
		
		public function ShowNPCMessageBox():void {
			textcount = 0;
			//npcscriptxml.npcscript.scriptlist
			for (var noscript:int = 0; noscript < npcscriptxml.npcscript.length() ; noscript++ ) {
				if (npcscriptxml.npcscript[noscript].name == npcname) {
					npcid = noscript;
					//trace("found:" + npcid)
					//trace('found!');
					npc_text.text = npcscriptxml.npcscript[noscript].scriptlist.message[textcount].text;
					break;
				}
			}
			
			var format:TextFormat = new TextFormat();
			format.size = 10;
			format.font = "OCR A Extended";
			//format.color = 0xF5F5F5;
			
			//trace(npc_string.length);
			//trace(npc_string.search(' '));
			//for (var spaceno:int = 0; spaceno < npc_string.length; spaceno++) {
			//trace(npc_string.split();
			//trace("npc letter:" + npc_string.split(/' '*?/));
			///}
			
			
			//{ Button
			var endchatbutton:Button = new Button("End Chat");
			endchatbutton.x = 198;
			endchatbutton.addEventListener(MouseEvent.CLICK, npcEndChatCLICK);
			
			buttonnext.y = 85;
			buttonnext.x = 212;
			buttonnext._width = 40;
			buttonnext.addEventListener(MouseEvent.CLICK, npcNextCLICK);
			
			buttonclose.y = 85;
			buttonclose.x = 212;
			buttonclose._width = 40;
			buttonclose.addEventListener(MouseEvent.CLICK, npcCloseCLICK);
			
			var buttonshop:Button = new Button("Shop");
			buttonshop.x = 4;
			buttonshop.y = 85;
			buttonshop._width = 40;
			buttonshop.addEventListener(MouseEvent.CLICK, npcShopCLICK);
			
			var buttonquest:Button = new Button("Quest");
			buttonquest.x = 50;
			buttonquest.y = 85;
			buttonquest._width = 40;
			buttonquest.addEventListener(MouseEvent.CLICK, npcQuestCLICK);
			
			//} Button
			
			//{ frame panel
			npc_name.text = "NPC";
			npc_name.x = 4;
			npc_name.setTextFormat(format);
			//npc_name.border = true;
			npc_name.height = 16;
			//npc_name.
			
			//npc_text.text = npc_string;
			npc_text.wordWrap = true;
			npc_text.setTextFormat(format);
			npc_text.border = true;
			npc_text.x = 4;
			npc_text.y = 16;
			npc_text.height = 66;
			npc_text.width = 248;
			
			npc_panel.graphics.beginFill(0xFFFFFF);
			npc_panel.graphics.lineStyle(1);
			npc_panel.graphics.beginFill(0xEFEFEF);
			npc_panel.graphics.drawRect(0, 0, 256, 100);
			
			npc_panel.y = 100;
			
			//}
			
			//{ add child
			//npcscriptxml.npcscript[noscript].scriptlist.message[textcount].text;
			//trace("NPC ID:"+npcid+" NPC TEXT: "+npcscriptxml.npcscript[npcid].scriptlist.message.length())
			if( npcscriptxml.npcscript[npcid].scriptlist.message.length() > 1){
				npc_panel.addChild(buttonnext);
			}else {
				npc_panel.addChild(buttonclose);
			}
			
			npc_panel.addChild(buttonquest);
			npc_panel.addChild(buttonshop);
			npc_panel.addChild(endchatbutton);
			npc_panel.addChild(npc_name);
			npc_panel.addChild(npc_text);
			addChild(npc_panel);
			//}add child
		}
		
		//{ function
		
		// ACCEPT
		public function npcAcceptCLICK(event:MouseEvent):void {
			//removeChild(npc_panel);
		}
		
		// DECLINE
		public function npcDeclineCLICK(event:MouseEvent):void {
			//removeChild(npc_panel);
		}
		
		// CHAT
		public function npcEndChatCLICK(event:MouseEvent):void {
			removeChild(npc_panel);
		}
		
		// NEXT
		public function npcNextCLICK(event:MouseEvent):void {
			textcount++;
			var format:TextFormat = new TextFormat();
			npc_text.text = npcscriptxml.npcscript[npcid].scriptlist.message[textcount].text;
			format.size = 10;
			format.font = "OCR A Extended";
			npc_text.setTextFormat(format);
			
			
			if( npcscriptxml.npcscript[npcid].scriptlist.message.length() > textcount){
				npc_panel.removeChild(buttonnext);
				npc_panel.addChild(buttonclose);
			}
			
			//npc_text.text = 
		}
		
		// SHOP
		public function npcShopCLICK(event:MouseEvent):void {
			//removeChild(npc_panel);
		}
		
		// QUEST
		public function npcQuestCLICK(event:MouseEvent):void {
			//removeChild(npc_panel);
		}
		
		// Close
		public function npcCloseCLICK(event:MouseEvent):void {
			removeChild(npc_panel);
		}
		
		//} end function
		
	}
	
}