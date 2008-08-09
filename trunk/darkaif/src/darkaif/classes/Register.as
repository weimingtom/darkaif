/**
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package darkaif.classes {
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	* 
	* simple register class
	* no frame.
	*/
	//{
	import flash.net.URLVariables;
	import flash.net.URLRequest;
	import flash.net.URLLoader;
	import flash.events.Event;
	import org.flashdevelop.utils.FlashConnect;
	//}
	
	public class Register {
		public var variables:URLVariables = new URLVariables();
		public var loader:URLLoader = new URLLoader();
		public var request:URLRequest = new URLRequest();
		public var username:String = 'un None';
		public var password:String = 'p None';
		public var passwordverfity:String = 'pv None';
		public var email:String = 'e None';
		public var emailverfity:String = 'ev None';
		public var gender:String = 'g none';
		public var birthday:String = 'b 3112200X';
		//url dir for debug use full address
		public var urlpage:String = 'http://localhost/darkaif/scripts/member/register.php';
		//url dir for not debuging use local to prevent hack
		//public var urlpage:String = 'scripts/member/register.php';
		
		public function Register() {
			
		}
		//{SETTER/GETTER
		//Pro. NAME
		public function get Name():String {
			return this.username;
			//FlashConnect.trace("Name");
		}
		public function set Name(Name:String):void {
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
		
		public function get Passwordverfity():String {
			return this.passwordverfity;
			//FlashConnect.trace("Name");
		}
		public function set Passwordverfity(Name:String):void {
			this.passwordverfity = Name;
			//FlashConnect.trace(""+Name);
		}
		
		public function get Email():String {
			return this.email;
			//FlashConnect.trace("Name");
		}
		public function set Email(Name:String):void {
			this.email = Name;
			//FlashConnect.trace(""+Name);
		}
		
		public function get Emailverfity():String {
			return this.emailverfity;
			//FlashConnect.trace("Name");
		}
		public function set Emailverfity(Name:String):void {
			this.emailverfity = Name;
			//FlashConnect.trace(""+Name);
		}
		
		public function get Gender():String {
			return this.gender;
			//FlashConnect.trace("Name");
		}
		public function set Gender(Name:String):void {
			this.gender = Name;
			//FlashConnect.trace(""+Name);
		}
		
		public function get Birthday():String {
			return this.birthday;
			//FlashConnect.trace("Name");
		}
		public function set Birthday(Name:String):void {
			this.birthday = Name;
			//FlashConnect.trace(""+Name);
		}
		
		public function get url():String {
			return this.urlpage;
		}
		public function set url(Name:String):void {
			this.urlpage = Name;
		}
		//}
		//check valid input
		public function CheckInput():void {
			//work on name with any space
			var passw:Boolean = false;
			var name:Boolean = false;
			var mail:Boolean = false;
			
			if (this.password == this.passwordverfity) {
				passw = true;
				FlashConnect.trace('Pasword Pass!');
			}
			if (this.email == this.emailverfity) {
				mail = true;
				FlashConnect.trace('Email Pass!');
			}
			if ((mail == true) && (passw == true)) {
				FlashConnect.trace('Account Pass!');
			}else {
				FlashConnect.trace('Account Fail');
			}
			FlashConnect.trace('CHECK');
		}
		
		// send data
		public function SendData():void {
			variables.username = this.username;
			variables.password = this.password;
			variables.retypepassword = this.passwordverfity;
			variables.email = this.email;
			variables.retype = this.emailverfity;
			variables.gender = this.gender;
			variables.birthday = this.birthday;
			
			FlashConnect.trace('Name:' + this.username);
			FlashConnect.trace('Password:' + this.password);
			FlashConnect.trace('Password Verfity:' + this.passwordverfity);
			FlashConnect.trace('Email:' + this.email);
			FlashConnect.trace('Email Verfity:' + this.gender);
			FlashConnect.trace('Birthday:' + this.birthday);
			
			request.url = urlpage;
			request.data = variables;
			loader.load(request); //sends the request
			loader.addEventListener(Event.COMPLETE, loadingdata);
		}
		
		public 	function loadingdata(e:Event):void {
			FlashConnect.trace('DATA:'+ (e.target.data));
		}
		
	}
	
}
