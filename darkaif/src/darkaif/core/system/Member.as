package darkaif.classes {
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	* 
	* Information: Creating this class will help improve what I am doing here. 
	* Just for the basic setup and work flow.
	* 
	* Access and 
	*/
	public class Member {
		//Hash
		public var ID:String = '';
		public var IDHASH:String = '';
		public var MemberID = '';
		public var MemberHash = '';
		
		//Name
		public var Name:String = '';
		public var FakeName:String = '';
		public var AliasName:String = '';
		
		//Access Level
		public var AccountType:String = 'guest';
		public var Access:String = '';
		public var LevelAccess:String = '0';
		public var ForumAccess:String = '0';
		public var GameAccess:String = '0';
		
		//IP Stuff
		public var HostAddress:String = '';
		public var IPAddress:String = '';
		public var IPPort:int = 8080;
		
		public function Member() {
			
		}	//Main Class of member
	}	//class main
}	//