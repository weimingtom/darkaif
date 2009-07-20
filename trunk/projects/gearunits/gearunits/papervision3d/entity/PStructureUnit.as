package gearunits.papervision3d.entity 
{
	import gearunits.papervision3d.entity.projectile.PProjectile;
	import gearunits.papervision3d.entity.weapon.PWeapon;
	import gearunits.papervision3d.technologytree.PTechnologyTree;
	import org.papervision3d.core.geom.TriangleMesh3D;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import org.papervision3d.core.math.Number3D;
	import org.papervision3d.scenes.Scene3D;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class PStructureUnit 
	{
		protected static var disp:EventDispatcher; //listener function
		public var name:String = 'PStructureUnit';
		public var mesh:TriangleMesh3D;
		
		public static const NAME:String = 'AStructureUnit';
		public static const TYPE:String = 'Unit';
		
		public var balive:Boolean = true;
		public static var scene:Scene3D; //global var class
		public static var units:Vector.<PStructureUnit>; //global var class
		public static var projectile:Vector.<PProjectile>; //global var class
		
		public var weapon:Vector.<PWeapon> = new Vector.<PWeapon>();
		public var type:Array = new Array();
		public var tech:Vector.<PTechnologyTree> = new Vector.<PTechnologyTree>();
		public var queryunit:Vector.<PStructureUnit> = new Vector.<PStructureUnit>();
		public var unit:Vector.<PStructureUnit> = new Vector.<PStructureUnit>();
		public var entityPoint:Vector.<PEntityPoint3D> = new Vector.<PEntityPoint3D>();
		
		public var time:Number = 0;
		public var spawntime:Number = 0;
		public var launchtime:Number = 0;
		public var indexpoint:Number = 0;
		
		public static var _id:int = 0;
		public var id:int;
		
		public var x:Number = 0;
		public var y:Number = 0;
		public var z:Number = 0;
		
		public var bhit:Boolean = false;
		
		
		public var min:Number3D = new Number3D();
		public var max:Number3D = new Number3D();
		
		public var ownerid:String = '';
		public var bselected:Boolean = false;
		public var bsingleselect:Boolean = false;
		public var busercontrol:Boolean = false;
		
		public var angle:Number = 0;
		public var movespeed:Number = 0;
		public var order:String = 'none';
		
		public var distance:Number = 0;
		public var velocity:Number3D = new Number3D();
		public var movepoint:Number3D = new Number3D();
		
		public var TurnSpeed:Number = 0;
		
		public var BWEAPONFIRE:Boolean = false;
		
		public function PStructureUnit() 
		{
			_id++;
			id = _id;
		}
		
		public function update():void {
			if (mesh != null) {
				mesh.x = x;
				mesh.y = y;
				mesh.z = z;
			}
		}
		
		//2D Move direction
		public function moveforward(o_speed:Number):void {
			if(bhit){
				velocity.x =  (o_speed/50) * Math.sin(angle* Math.PI / 180);
				velocity.z =  (o_speed/50) * Math.cos(angle * Math.PI / 180);	
			}else {
				velocity.x = o_speed * Math.sin(angle* Math.PI / 180);
				velocity.z = o_speed * Math.cos(angle * Math.PI / 180);	
			}
			x += velocity.x;
			y += velocity.y;
			z += velocity.z;
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
		
		// GLOBAL VIEW SCENE
		/*
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
		*/
		
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
		
	}
	
}