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
		public var bspawnspaceship:Boolean = false;
		public var bspawncapitalship:Boolean = false;
		public var bspawnobject:Boolean = false;
		public var spawncapitalship:String = "";
		public var spawncapitalshipid:String = "";
		public var spawnstationid:String = "";
		public var spawnpointid:String = "";
		public var location:String = "none"; //
		
		public var posx:Number = 0;
		public var posy:Number = 0;
		public var posz:Number = 0;
		
		public var rotx:Number = 0;
		public var roty:Number = 0;
		public var rotz:Number = 0;
		
		public var spawnposx:Number = 0;
		public var spawnposy:Number = 0;
		public var spawnposz:Number = 0;
		
		public var spawnrotx:Number = 0;
		public var spawnroty:Number = 0;
		public var spawnrotz:Number = 0;
		
		public function Player() 
		{
			
		}
		
	}
	
}