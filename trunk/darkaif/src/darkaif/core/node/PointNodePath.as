package darkaif.core.node 
{
	
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	*/
	public class PointNodePath
	{
		/*
		 * f = g + h
		 * 
		 * f -the total score
		 * g - the total transition cost of all tiles touched along a path up to this current tile
		 * h - the total estimated cost from the current tile to the destination
		 * 
		 * 
		 * my english translate:
		 * f = g+ h
		 * g = -start point for distance -terrain cost
		 * h = horizontally and vertically -end point distance
		 * 
		 */
		public var id:int = 0;
		 
		public var f:Number = 0;
		public var g:Number = 0;
		public var h:Number = 0;
		
		public var x:Number = 0;
		public var y:Number = 0;
		public var z:Number = 0;
		
		public var parent:PointNodePath;
		
		//shortest route 1=normal, 2-10 = water,100 = danger
		public var cost:Number = 1;
		public var distnace:Number = 0;
		
		public var bvisited:Boolean = false;
		public var bpath:Boolean = true;
		public var diagonal:Number = 1.414;
		
		public function PointNodePath() 
		{
			
		}
		
	}
}