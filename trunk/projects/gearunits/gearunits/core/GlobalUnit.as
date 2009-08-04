package gearunits.core 
{
	
	/**
	 * x...
	 * @author Darknet
	 * 
	 * Information: 
	 * 	This deal some basic collision box that will be build for this class. If there is collision then
	 * it will do the next loop. This will reduce looping a bit. If there tons of collision.
	 * 
	 * Note: There will be global variables. This can access all class support the main class that has it.
	 * But you have to setup it up for the game to able to start up. Working on class loop.
	 */
	public class GlobalUnit
	{
		
		public static var GLOBALDEBUG:Boolean = false;//debug on
		public var debug:Boolean = false;//debug single unit
		public var x:Number = 0;
		public var y:Number = 0;
		public var z:Number = 0;
		
		public var min:GUPoint = new GUPoint();
		public var max:GUPoint = new GUPoint();
		public var offset:GUPoint = new GUPoint();
		
		public var onlineid:String = '';
		
		public function GlobalUnit() 
		{
			
		}
		
		//fixed cube space collision box
		public function interset3d(gunit:GlobalUnit):Boolean {
			//trace('--');
			if ((x+ max.z >= gunit.z+ gunit.min.z) && (z+min.z <= gunit.z + gunit.max.z) &&
			//(y+max.y >= gunit.y+ gunit.min.y) && (y+min.y <= gunit.y+gunit.max.y) && 
			(x+max.x >= gunit.x+ gunit.min.x) && (x+min.x <= gunit.x+gunit.max.x)) {
				return true;
				//trace('collision');
			}else {
				return false;
			}
		}
		
		/**
		 * height = y, width = x,depth =z
		 */
		public function setbox(height:Number = 0, width:Number = 0, depth:Number = 0 ):void {
			min.x = -(width / 2);
			max.x = width / 2;
			
			min.y = -(height / 2);
			max.y = height / 2;
			
			min.z = -(depth / 2);
			max.z = depth / 2;
		}
		
		//just 2D game side scroll //depend on the model export settings //top view
		public function interset2d_xz(gunit:GlobalUnit):Boolean { //this y up world
			if ((x+ max.z >= gunit.z+ gunit.min.z) && (z+min.z <= gunit.z + gunit.max.z) &&
			(x+max.x >= gunit.x+ gunit.min.x) && (x+min.x <= gunit.x+gunit.max.x)) {
				return true;
			}else {
				return false;
			}
		}
		
	}
	
}