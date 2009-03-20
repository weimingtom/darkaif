package darkaif.core.entity 
{
	/*
	 * This will hold the objects for position and collision effect on the objects.
	 * Turn on damage objects
	 * 
	 * add objects to the game space area
	 * 
	 * 
	*/
	
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	*/
	public class Entity 
	{
		public var balive:Boolean = true; //check what ever the object is alive or dead
		
		public var bboxcollision:Boolean = true;
		public var boxcollision:Array = new Array();
		public var bspherecollision:Boolean = false;
		public var spherecollision:Array = new Array();
		public var bcylindercollision:Boolean = false;
		public var cylindercollision:Array = new Array();
		public var bpolygoncollison:Boolean = false;
		
		public var posx:Number = 0; //position
		public var posy:Number = 0; //position
		public var posz:Number = 0; //position
		
		public var rotx:Number = 0; //rotation
		public var roty:Number = 0; //rotation
		public var rotz:Number = 0; //rotation
		
		public var gravityx:Number = 0;
		public var gravityy:Number = -1;
		public var gravityz:Number = 0;
		
		public var velocityx:Number = 0;
		public var velocityy:Number = 0;
		public var velocityz:Number = 0;
		
		public function Entity() 
		{
			
		}
		
		public function update():void {
			
		}
		
	}
	
}