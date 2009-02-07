package darkaif.entities 
{
	
	/**
	 * ...
	 * @author Darknet
	 * Copy Rights (c) http://darkaif.googlecode.com
	 */
	public class Entity 
	{
		public var posx:Number = 0;
		public var posy:Number = 0;
		public var posz:Number = 0;
		
		public var oldposx:Number = 0;
		public var oldposy:Number = 0;
		public var oldposz:Number = 0;
		
		public var rotx:Number = 0;
		public var roty:Number = 0;
		public var rotz:Number = 0;
		
		public var balive:Number = true;
		
		public var boxcollision:Array = new Array();
		public var spherecollision:Array = new Array();
		
		public function Entity() 
		{
			
		}
		
	}
	
}