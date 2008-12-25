package darkaif.entities 
{
	
	/**
	 * ...
	 * @author Darknet
	 * Copy Rights (c) http://darkaif.googlecode.com
	 */
	public class Player 
	{
		public var playername:String = "none";
		public var targetplayername:String = "none";
		public var targetobjectname:String = "none";
		public var shipname:String;
		public var bot:Boolean = false;
		public var bbot:Boolean = false;
		public var teamno:int = 0;
		public var squardid:int = 0;
		public var clantag:String;
		public var classjob:String;
		public var faction:String;
		public var bspawn:Boolean = false;
		
		public function Player() 
		{
			
		}
		
	}
	
}