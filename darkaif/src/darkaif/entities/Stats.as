package darkaif.entities 
{
	
	/**
	 * ...
	 * @author Darknet
	 * Copy Rights (c) http://darkaif.googlecode.com
	 */
	public class Stats 
	{
		public var condtions:Array = new Array();//stats effects[slow,slince]
		
		public var healthpoint:Number = 100;
		public var healthpointmax:Number = 100;
		
		public var magicpoint:Number = 100;
		public var magicpointmax:Number = 100;
		
		public var staminapoint:Number = 100;
		public var staminapointmax:Number = 100;
		
		public var tatcialpoint:Number = 100;
		public var tatcialpointmax:Number = 100;
		
		//this will store level up stats
		public var strength:Number = 1;
		public var dexterity:Number = 1;
		public var vitality:Number = 1;
		public var intelligence:Number = 1;
		public var agility:Number = 1;
		public var luck:Number = 1;
		public var stamina:Number = 1;
		
		//this will applay stats effects and others
		public var str:Number = 1;
		public var dex:Number = 1;
		public var vit:Number = 1;
		public var agi:Number = 1;
		public var ints:Number = 1;
		public var luc:Number = 1;
		public var sta:Number = 1;
		
		//this will determine attack and defence in order
		public var attack:Number = 1;
		public var defence:Number = 1;
		public var speed:Number = 1;
		public var critical:Number = 1;
		public var avoidably:Number = 1;
		public var magicattack:Number = 1;
		public var magicdefence:Number = 1;
		
		
		public function Stats() 
		{
			
		}
		
	}
	
}