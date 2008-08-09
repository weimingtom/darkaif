package darkaif.classes 
{
	
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	* 
	* Information:Idea
	* This for guild for people who want to help and do thing for fun like adventure.
	*/
	public class Guild 
	{	
		public var leadername:String = '';
		public var name:String = 'Clan';
		public var titlename:String = 'None';
		public var groupname:String = 'None';
		
		public var members:Array = new Array();//member name,level
		public var memberlist:Array = new Array();//member rank name,level,accesses
		
		public var posts:Array = new Array();
		public var messages:Array = new Array();
		
		public var ID:String = '';
		public var IDHASH:String = '';
		
		public var level:int = 0;
		public var levelexperience:int = 0;
		public var rank:int = 0;
		public var rankname:String = '';
		
		public var guildlist:Array = new Array(); //clan friendly and foe
		
		public function Guild() 
		{
			
		}
		
	}
	
}