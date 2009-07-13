package gearunits.away3d.entity 
{
	//{
	import away3d.containers.View3D;
	import away3d.core.base.Mesh;
	import away3d.core.base.Object3D;
	import away3d.sprites.MovieClipSprite;
	import gearunits.away3d.display.AUnitIconHUD;
	import gearunits.away3d.entity.building.ABuildingBarrack;
	import gearunits.away3d.entity.projectile.AProjectile;
	import gearunits.away3d.entity.weapon.AWeapon;
	import gearunits.away3d.node.ANodePoint3D;
	import away3d.core.math.Number3D;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import gearunits.away3d.technologytree.ATechnologyTree;
	import gearunits.core.GlobalUnit;
	import gearunits.core.GUPoint;
	//}
	
	/**
	 * ...
	 * @author Darknet
	 * 
	 * Information: This holds all objects in render
	 * 
	 */
	
	public class AStructureUnit extends GlobalUnit
	{
		protected static var disp:EventDispatcher; //listener function
		
		public var id:int;
		public static const NAME:String = 'AStructureUnit';
		public static const TYPE:String = 'Unit';
		public var name:String = 'AStructureUnit';
		
		//public var iconhud:AUnitIconHUD;
		public var iconhud:MovieClipSprite;
		
		public var mesh:Mesh;
		
		public var balive:Boolean = true;
		
		//GLOBAL VAR
		public static var _id:int = 0;
		public static var view:View3D; //global var class
		public static var units:Vector.<AStructureUnit>; //global var class
		public static var projectile:Vector.<AProjectile>; //global var class
		
		//VAR
		public var weapon:Vector.<AWeapon> = new Vector.<AWeapon>();
		public var type:Array = new Array();
		public var tech:Vector.<ATechnologyTree> = new Vector.<ATechnologyTree>();
		public var queryunit:Vector.<AStructureUnit> = new Vector.<AStructureUnit>();
		public var unit:Vector.<AStructureUnit> = new Vector.<AStructureUnit>();
		public var entityPoint:Vector.<AEntityPoint3D> = new Vector.<AEntityPoint3D>();
		
		//TIME
		public var time:Number = 0;
		public var spawntime:Number = 0;  //unit spawn time
		public var launchtime:Number = 0; //unit leaving building time
		public var indexpoint:Number = 0; //entity point counter
		
		//STATS
		public var health:Number = 100;
		public var healthmax:Number = 100;
		
		//HUD
		//public var iconoffset:GUPoint = new GUPoint();
		
		//SELECT
		public var ownerid:String = '';
		public var bselected:Boolean = false; //object selected
		public var bsingleselect:Boolean = false; //only single select object
		public var busercontrol:Boolean = false;
		
		//CONTROL
		public var movespeed:Number = 0;//unit movement
		//Spacecraft settings
		public var SpeedAirMin:Number = 0;
		public var SpeedAirMax:Number = 0;
		
		public var SpeedGroundMin:Number = 0;
		public var SpeedGroundMax:Number = 0;
		
		public var TurnSpeed:Number = 0;
		public var TurnSpeedMin:Number = 0;
		public var TurnSpeedMax:Number = 0;
		
		public var movementtype:String = 'stationary';//space //land //sea //sub //air
		public var order:String = 'none';
		public var angle:Number = 0;
		public var distance:Number = 0;
		public var velocity:Number3D = new Number3D();
		public var movepoint:Number3D = new Number3D();
		
		public var BWEAPONFIRE:Boolean = false;
		public var weaponaction:Array = new Array();
		
		public function AStructureUnit() {
			_id++;
			id = _id;
		}
		
		
		public function update():void {
			if (mesh != null) {
				mesh.x = x;
				mesh.y = y;
				mesh.z = z;
			}
			
			if (iconhud != null) {
				iconhud.x = x;
				iconhud.y = y;
				iconhud.z = z;
			}
			
			//trace('G_units:'+units.length);
			
			//for (var p:int = 0; p > projectile.length;p++ ) {
				
			///}
			
			
			
		}
		
		//this will move to point in angle
		public function pointmove(p3d:Number3D):void {
			//trace(p3d);
			order = 'move';
			movepoint = p3d;
			angle = rotationpoint(p3d);
		}
		
		//get distance point to go there in 3d space// MATH
		public function distancepoint():void {
			distance = Math.abs((((x - movepoint.x) * 2) + ((y - movepoint.y) * 2) + ((z - movepoint.z) * 2)) / 2);
			//trace(distance);
		}
		
		public function rotationpoint(p3d:Number3D):Number {
			var facedirection:Number = 0;
			facedirection = Math.atan2(z - p3d.z, x - p3d.x);
			facedirection = facedirection * 180 / Math.PI;
			
			//default    
			//270 to 360  |z| 00 to  090
			//-------x--top-view-x-------
			//270 to 180  |z| 90 to -180
			
			// as3 from Math.atan2(z,x)
			//0 to -90 || 91 to -180 (Fixed area)
			//----------------------
			//0 to 90  || 91 to -180
			
			if ((facedirection < -91)&&(facedirection > -180) ){
				//trace('angle:' + Math.abs(90 + facedirection));
				facedirection = Math.abs(90 + facedirection);
			}else {
				//trace('angle:' + (180 + (90 - facedirection)) + '[:]' + facedirection);
				facedirection = (180 + (90 - facedirection));
			}
			//trace('facedirection:'+facedirection);
			return facedirection;
		}
		
		//2D Move direction
		public function moveforward(o_speed:Number):void {
			velocity.x = o_speed * Math.sin(angle* Math.PI / 180);
			velocity.z = o_speed * Math.cos(angle * Math.PI / 180);	
			x += velocity.x;
			y += velocity.y;
			z += velocity.z;
		}
		
		
		// GLOBAL VIEW SCENE
		public function set gview(g_view:View3D):void {
			view = g_view;
		}
		//Global unit
		public function set gunit(g_unit:Vector.<AStructureUnit>):void {
			units = g_unit;
		}
		//global projectile(
		public function set gprojectile(g_projectile:Vector.<AProjectile>):void {
			projectile = g_projectile;
		}
		
		//DISPATCHER
		public function addEventListener(p_type:String, p_listener:Function, p_useCapture:Boolean = false, p_priority:int = 0, p_useWeakReference:Boolean = false):void {
			if (disp == null) { disp = new EventDispatcher(); }
			disp.addEventListener(p_type, p_listener, p_useCapture, p_priority, p_useWeakReference);
		}
		public function removeEventListener(p_type:String, p_listener:Function, p_useCapture:Boolean=false):void {
			if (disp == null) { return; }
			disp.removeEventListener(p_type, p_listener, p_useCapture);
		}
		public function dispatchEvent(p_event:Event):void {
			if (disp == null) { return; }
			disp.dispatchEvent(p_event);
		}

		public static function CLASS(classname:String):AStructureUnit {
			var structure:AStructureUnit;
			if (classname == ABuildingBarrack.NAME) {
				structure = new ABuildingBarrack();
			}
			
			return structure;
		}
	}
	
}