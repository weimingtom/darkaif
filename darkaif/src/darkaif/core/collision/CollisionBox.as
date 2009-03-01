package darkaif.core.collision 
{
	
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	*/
	public class CollisionBox 
	{
		public var posx:Number = 0;
		public var posy:Number = 0;
		public var posz:Number = 0;
		
		public var minx:Number = -8;
		public var maxx:Number = 8;
		public var miny:Number = -8;
		public var maxy:Number = 8;
		public var minz:Number = -8;
		public var maxz:Number = 8; //16
		
		public var rotx:Number = 0;
		public var roty:Number = 0;
		public var rotz:Number = 0;
		
		public function CollisionBox() 
		{
			
		}
		
	}
	
}