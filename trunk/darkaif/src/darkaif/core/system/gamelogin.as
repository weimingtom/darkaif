/**
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package darkaif.core.system {
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	* 
	* This will get game data for uiqie id
	* ID 
	* GAMEID
	* MEMBERID
	* BOTID
	* BATTLEID
	* SERVERID
	* SERVERNAME
	* GAMENAME
	* lOCALTION
	* SETTINGS
	* THEME
	* 
	* TIME
	* DATE
	*/
	//{
	import flash.net.URLVariables;
	import flash.net.URLRequest;
	import flash.net.URLLoader;
	import flash.events.Event;
	import org.flashdevelop.utils.FlashConnect;
	//}

	public class gamelogin {
		//{
		public var variables:URLVariables = new URLVariables();
		public var loader:URLLoader = new URLLoader();
		public var request:URLRequest = new URLRequest();
		public var username:String = 'admin';
		public var password:String = 'admin';
		//url dir for debug use full address
		public var urlpage:String = 'http://localhost/darkaif/scripts/member/gamelogin.php';
		//url dir for not debuging use local to prevent hack
		//public var urlpage:String = 'scripts/member/register.php';
		public var gameloginid:String = '00000000000000000000000000000000'; //0x32
		//}
		
		public function gamelogin() {
			
		}
		
		public function get Username():String {
			return this.username;
			//FlashConnect.trace("Name");
		}
		public function set Username(Name:String):void {
			this.username = Name;
			//FlashConnect.trace(""+Name);
		}
		
		public function get Pasword():String {
			return this.password;
			//FlashConnect.trace("Name");
		}
		public function set Password(Name:String):void {
			this.password = Name;
			//FlashConnect.trace(""+Name);
		}
		public function get Gameloginid():String {
			return this.gameloginid;
			//FlashConnect.trace("Name");
		}
		public function set Gameloginid(Name:String):void {
			this.gameloginid = Name;
			//FlashConnect.trace(""+Name);
		}
		
		// send data
		public function SendData():void {
			variables.username = this.username;
			variables.password = this.password;
			
			FlashConnect.trace('Name:' + this.username);
			FlashConnect.trace('Password:' + this.password);
			
			request.url = urlpage;
			request.data = variables;
			loader.load(request); //sends the request
			loader.addEventListener(Event.COMPLETE, loadingdata);
		}
		
		public 	function loadingdata(e:Event):void {
			FlashConnect.trace('LOGIN DATA:' + (e.target.data));
			//this.gameloginid = e.target.data;
			//this is a function
			this.Gameloginid = e.target.data;
		}
		
		//Need to fix this area for bit later on for now leave it as is
		public function CheckGameID():Boolean {
			if (this.Gameloginid == 'fail') {//this is from the php
				FlashConnect.trace('Login FAIL');
				return false;
			//Need to work on string and number check
			}else if (this.Gameloginid == '00000000000000000000000000000000') { //this from this file public var
				FlashConnect.trace('Login FAIL');
				return false;
			}else {
				FlashConnect.trace('Login Pass');
				return true;
			}
		}
		
	}
	
}
