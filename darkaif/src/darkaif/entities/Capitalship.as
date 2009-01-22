package darkaif.entities 
{
	
	import darkaif.core.collision.CollisionBox;
	//import darkaif.core.math.Vector3D;
	import flash.display.Sprite;
	import flash.net.URLLoader;
	import sandy.core.scenegraph.Group;
	import sandy.core.scenegraph.Shape3D;
	import flash.utils.setTimeout;
	
	/**
	 * ...
	 * @author DefaultUser (Tools -> Custom Arguments...)
	 */
	public class Capitalship extends Sprite
	{
		/*
		 * This scetion will hold the ship data
		 * 
		 * DOTO: raw code need to clean up later
		 *
		 */
		
		public var objecttype:String = "spaceship"; //spaceship, capitalship, spacestation
		public var modeltype:String = "ase"; //ase, dae, 3ds, md2 //this will check if error loop
		public var balive:Boolean = false;
		public var playername:String = "";
		public var shipname:String = "";
		public var shipid:String = "";
		
		public var spawnpoint:Array = new Array();
		
		//public var name:String = ""; //station name
		
		public var healthpoint:Number = 100;
		public var healthmaxpoint:Number = 100;
		public var armorpoint:Number = 100;
		public var armormaxpoint:Number = 100;
		public var shieldpoint:Number = 100;
		public var shieldmaxpoint:Number = 100;
		
		//control stuff
		public var bmove:Boolean = false;
		public var bbot:Boolean = false;
		public var bcontrol:Boolean = false;
		
		public var boxcollision:Array = new Array();
		public var spherecollision:Array = new Array();
		
		public var model:Shape3D = null;
		public var load:URLLoader;
		public var position:int;
		
		public var firerate:Number = 0;
		public var fireratemax:Number = 30;
		public var bulletfire:Boolean = false;
		public var primaryfire:Boolean = false;
		public var secondaryfire:Boolean = false;
		
		public var targetobject:String = "";
		public var targetplayername:String = "";
		public var targetposx:Number;
		public var targetposy:Number;
		public var targetposz:Number;
		
		public var rotationspeed:Number = 10;
		public var rotationmaxspeed:Number = 10;
		public var rotationminspeed:Number = -10;
		public var rotationdelay:Number = 200;
		
		public var targetrange:Number = 0;
		
		public var angle:Number;
		public var dx:Number;
		public var dy:Number;
		//public var matrix:Array = Array([1, 0, 0, 0],[0, 1, 0, 0],[0, 0, 1, 0],[0, 0, 0, 0]);
		
		
		public function Capitalship() 
		{
			var boxbound:CollisionBox = new CollisionBox();
			boxcollision.push(boxbound);
		}
		
		public function Update():void {
			//check if health is below zero, make it not visible 
			if (healthpoint <= 0) {
				//model.visible = false;
			}
			
			firerate++;
			if (firerate > fireratemax) {
				firerate = 0;
				bulletfire = false;
			}
			if (bbot) {//if bot is turn on
				setTimeout (model.lookAt, rotationdelay, targetposx, targetposy, targetposz);
				
				targetdistance();
				if (Math.abs(targetrange) > 30) {//need to fixed collision for this
					//model.moveForward(+2);
				}
				
				//primaryfire = true;
				//if ()
				//trace(String(model.pan));
				//model.pan += 5;
				//model.pan += 0.01;
				//model.tilt += 0.01;
				//model.roll += 0.01;
				//trace(model.rotateX);
				//model.tilt
				
				//DO NOT REMOVE BASIC 2D
				//directionangle(model.x, model.z, targetposx, targetposz);
				//trace((angle * 180 / Math.PI));
				//model.pan = (angle * 180 / Math.PI);
				//look at target to apply rotation.
				//model.lookAt(targetposx,targetposy,targetposz);
			}
		}
		
		//{ other not working yet
		public function targetdistance():void {
			targetrange = ((((model.x - targetposx) * 2) +((model.y - targetposy) * 2) +((model.z - targetposz)*2))/2);
			//trace(String(ranage));
		}
		
		public function updatetargetobject():void {
			
		}
		
		public function addgroup(group:Group):Group {
			return group;
		}
		
		public function removegroup(group:Group):Group {
			return group;
		}
		
		//player , bot
		public function directionangle(x:Number, y:Number, x2:Number, y2:Number):void {
			angle = Math.atan2(x-x2,y-y2);
		}
		
		public function direction():void {
			//(angle)
			dx = Math.sin(angle);
			dy = Math.cos(angle);
		}
		//}
	}
	
}