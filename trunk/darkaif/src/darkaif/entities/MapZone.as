package darkaif.entities 
{
	import darkaif.core.collision.CollisionBox;
	import sandy.core.scenegraph.Shape3D;
	
	/**
	 * ...
	 * @author Darknet
	 * Copy Rights (c) http://darkaif.googlecode.com
	 */
	public class MapZone 
	{
		//position of the entrance
		public var box:CollisionBox = new CollisionBox();
		public var mesh:Shape3D = null;
		public var mapname:String = '';
		public var mapurl:String = '';
		public var mapzoneid:Number = 0;//zone map spawn list
		
		public var posx:Number = 0;
		public var posy:Number = 0;
		public var posz:Number = 0;
		
		public var exitposx:Number = 0;
		public var exitposy:Number = 0;
		public var exitposz:Number = 0;
		
		public var tag:String = 'None';
		public var event:String = 'None';
		
		public var benable:Boolean = true;
		public var btrigger:Boolean = true;
		public var counter:Number = 0;
		public var countmax:Number = 0;
		
		public var boxcollision:Array = new Array();
		public var spherecollision:Array = new Array();
		
		public function MapZone() 
		{
			
		}
		
	}
	
}