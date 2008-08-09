package darkaif.classes 
{
	
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	* 
	* Information:Idea
	* This for fights and battle fight against clans.
	*/
	public class Clan 
	{
		public var name:String = 'Clan';
		public var title:String = 'None';
		public var leadername:String = '';
		public var members:Array = new Array();
		public var ID:String = '';
		public var IDHASH:String = '';
		public var level:int = 0;
		public var levelexperience:int = 0;
		public var rank:int = 0;
		public var rankname:String = '';
		
		public var clanlist:Array = new Array(); //clan friendly and foe
		
		public function Clan() 
		{
			
		}
		
	}
	
}