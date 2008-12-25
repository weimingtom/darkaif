package darkaif.entities 
{
	import darkaif.core.collision.CollisionBox;
	import sandy.core.scenegraph.Shape3D;
	import sandy.core.scenegraph.Group;
	
	/**
	 * ...
	 * @author Darknet
	 * Copy Rights (c) http://darkaif.googlecode.com
	 */
	public class Projectile 
	{
		public var model:Shape3D;
		public var weaponname:String = "projectile";
		public var alive:Boolean = false;
		public var team:int = 0;
		public var playername:String = "";
		public var bulletfire:Boolean = false;
		public var boxcollision:Array = new Array();
		public var healthpoint:Number = 1;
		public var healthmaxpoint:Number = 1;
		public var damage:Number = 10;
		public var attackpoint:Number = 10;
		public var targetobject:String = "none";
		public var lastposx:Number;
		public var lastposy:Number;
		public var lastposz:Number;
		public var maxranage:Number = 1000;
		public var ranage:Number;
		
		
		public function Projectile(){
			var defaultcollision:CollisionBox = new CollisionBox();
			
			defaultcollision.maxx = 10;
			defaultcollision.maxy = 10;
			defaultcollision.maxz = 10;
			defaultcollision.minx = -10;
			defaultcollision.miny = -10;
			defaultcollision.minz = -10;
			
			boxcollision.push(defaultcollision);
		}
		
		//this will handle the how far when it start life
		public function setposition(x:Number, y:Number , z:Number):void {
			model.x = x;
			model.y = y;
			model.z = z;
			lastposx = x;
			lastposy = y;
			lastposz = z;
		}
		
		
		
		//update veclotry
		//It will update other stuff for moving around
		public function Update():void {
			//trace("Hello");
			fromdistance();
			if ((ranage > -maxranage)&&(ranage < maxranage) ){
				model.moveForward( +5);
			}else {
				model.visible = false;
			}
			
		}
		
		//This will check the distance from the know spawn this is for clean up stuff
		public function fromdistance():void {
			ranage = ((((model.x - lastposx) * 2) +((model.y - lastposy) * 2) +((model.z - lastposz)*2))/2);
			//trace(String(ranage));
		}
	}
	
}