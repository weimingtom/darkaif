package gearunits.away3d.entity 
{
	//{
	import away3d.containers.View3D;
	import away3d.core.base.Mesh;
	import away3d.core.base.Object3D;
	import away3d.sprites.MovieClipSprite;
	import flash.geom.Matrix3D;
	import flash.geom.Point;
	import flash.geom.Vector3D;
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
	import sandy.core.data.Point3D;
	import sandy.math.IntersectionMath;
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
		//{
		protected static var disp:EventDispatcher; //listener function
		public var id:int;
		public static const NAME:String = 'AStructureUnit';
		public static const TYPE:String = 'Unit';
		public var name:String = 'AStructureUnit';
		public var iconhud:MovieClipSprite; //DISPLAY INFORMATION
		
		public var mesh:Mesh;
		public var collisionmesh:Mesh;//3D/2D Collision It has to be basic
		
		public var balive:Boolean = true;//boolean ship alive?
		
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
		public var bjustspawn:Boolean = false;
		public var justspawntime:Number = 0;
		public var justspawntimemax:Number = 30;
		public var time:Number = 0;
		public var spawntime:Number = 0;  //unit spawn time
		public var launchtime:Number = 0; //unit leaving building time
		public var indexpoint:Number = 0; //entity point counter
		
		//STATS
		public var bselfdamage:Boolean = false;
		public var bhit:Boolean = false;
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
		public var bbot:Boolean = false;
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
		public var _rotation:Number3D = new Number3D();
		public var movepoint:Number3D = new Number3D();
		
		public var BWEAPONFIRE:Boolean = false;
		public var weaponaction:Array = new Array();
		
		//other objects
		public var targetid:String = '';
		public var targettype:String = '';
		public var targetposition:Number3D = new Number3D();
		public var targetangle:Number3D = new Number3D();
		//detect
		public var bdetectother:Boolean = false;
		public var detectrange:Number = 0;//radius for emeny
		
		
		
		//}
		public function AStructureUnit() {
			_id++;
			id = _id;
		}
		
		//UPDATE
		public function update():void {
			
			if (collisionmesh != null) {
				collisionmesh.x = x;
				collisionmesh.y = y;
				collisionmesh.z = z;
			}
			
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
			
		}
		
		//this will move to point in angle
		public function pointmove(p3d:Number3D):void {
			//trace(p3d);
			order = 'move';
			movepoint = p3d;
			//angle = rotationpoint(p3d);
			rotation.y = rotationpoint(p3d);
		}
		
		//get distance point to go there in 3d space// MATH
		public function distancepoint():void {
			//distance = Math.abs((((x - movepoint.x) * 2) + ((y - movepoint.y) * 2) + ((z - movepoint.z) * 2)) / 2);
			distance = Math.abs(Math.sqrt(((x - movepoint.x)*(x - movepoint.x))+((y - movepoint.y)*(y - movepoint.y))+((z - movepoint.z) * (z - movepoint.z))));
			//trace(distance);
		}
		
		public function caldistance(a_point:Number3D,b_point:Number3D):Number {
			//return Math.abs((((a_point.x - b_point.x) * 2) + ((a_point.y - b_point.y) * 2) + ((a_point.z - b_point.z) * 2)) / 2);
			return Math.abs(Math.sqrt(((a_point.x - b_point.x)*(a_point.x - b_point.x))+((a_point.y - b_point.y)*(a_point.y - b_point.y))+((a_point.z - b_point.z) * (a_point.z - b_point.z))));
		}
		
		//ROTATE DIRE
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
			if(bhit){
				velocity.x =  (o_speed/50) * Math.sin(rotation.y* Math.PI / 180);
				velocity.z =  (o_speed/50) * Math.cos(rotation.y * Math.PI / 180);	
			}else {
				velocity.x = o_speed * Math.sin(rotation.y* Math.PI / 180);
				velocity.z = o_speed * Math.cos(rotation.y * Math.PI / 180);	
			}
			x += velocity.x;
			y += velocity.y;
			z += velocity.z;
		}
		
		//MESH COLLISION AGAINIST MESH COLLISION
		public function ismeshintersect(object:AStructureUnit):Boolean {
			var bhitobject:Boolean = false;
			for (var i:int = 0; i < collisionmesh.vertices.length; i++ ) {
				var m:Matrix3D = new Matrix3D();
				m.position = new Vector3D(collisionmesh.vertices[i].x, collisionmesh.vertices[i].y, collisionmesh.vertices[i].z);
				m.appendRotation(rotation.y, new Vector3D(0, 1, 0));
				var point:Point = new Point(x + m.position.x,z + m.position.z);
				
				for (var ii:int = 0; ii < object.collisionmesh.faces.length; ii++ ) {
					var m1:Matrix3D = new Matrix3D();
					m1.position = new Vector3D(object.collisionmesh.faces[ii].vertices[0].x, object.collisionmesh.faces[ii].vertices[0].y, object.collisionmesh.faces[ii].vertices[0].z);
					m1.appendRotation(object.rotation.y, new Vector3D(0, 1, 0));
					var point1:Point = new Point(object.x + m1.position.x, object.z + m1.position.z);
					
					m1.position = new Vector3D(object.collisionmesh.faces[ii].vertices[1].x, object.collisionmesh.faces[ii].vertices[1].y, object.collisionmesh.faces[ii].vertices[1].z);
					m1.appendRotation(object.rotation.y, new Vector3D(0, 1, 0));
					var point2:Point = new Point(object.x + m1.position.x, object.z + m1.position.z);
					
					m1.position = new Vector3D(object.collisionmesh.faces[ii].vertices[2].x, object.collisionmesh.faces[ii].vertices[2].y, object.collisionmesh.faces[ii].vertices[2].z);
					m1.appendRotation(object.rotation.y, new Vector3D(0, 1, 0));
					var point3:Point = new Point(object.x + m1.position.x, object.z + m1.position.z);
					
					bhitobject = IntersectionMath.isPointInTriangle2D(point, point1, point2, point3);
					if (bhitobject) {
						break;
					}
				}
				if (bhitobject) {
					break;
				}
			}
			return bhitobject;
		}
		
		//small ship > detect entity point from carrier
		public function ismeshintersectentitypoint(object:AStructureUnit):Boolean {
			var bhitobject:Boolean = false;
			for (var i:int = 0; i < collisionmesh.vertices.length; i++ ) {
				var m:Matrix3D = new Matrix3D();
				m.position = new Vector3D(collisionmesh.vertices[i].x, collisionmesh.vertices[i].y, collisionmesh.vertices[i].z);
				m.appendRotation(rotation.y, new Vector3D(0, 1, 0));
				var point:Point = new Point(x + m.position.x, z + m.position.z);
				for (var sp:int = 0; sp < object.entityPoint.length;sp++ ) {//enter and exit point
					for (var ie:int = 0; ie < object.entityPoint[sp].meshbox.faces.length; ie++ ) {//mesh face
						//trace ('face');
						m.position = new Vector3D(object.entityPoint[sp].x + object.entityPoint[sp].meshbox.faces[ie].vertices[0].x,
												  object.entityPoint[sp].y + object.entityPoint[sp].meshbox.faces[ie].vertices[0].y,
												  object.entityPoint[sp].z + object.entityPoint[sp].meshbox.faces[ie].vertices[0].z
												);
						m.appendRotation(object.rotation.y, new Vector3D(0, 1, 0));
						var point1:Point = new Point(object.x + m.position.x, object.z + m.position.z);//current point in the world
						
						m.position = new Vector3D(object.entityPoint[sp].x + object.entityPoint[sp].meshbox.faces[ie].vertices[1].x,
												  object.entityPoint[sp].y + object.entityPoint[sp].meshbox.faces[ie].vertices[1].y,
												  object.entityPoint[sp].z + object.entityPoint[sp].meshbox.faces[ie].vertices[1].z
												);
						m.appendRotation(object.rotation.y, new Vector3D(0, 1, 0));
						var point2:Point = new Point(object.x + m.position.x, object.z + m.position.z);//current point in the world
						
						m.position = new Vector3D(object.entityPoint[sp].x + object.entityPoint[sp].meshbox.faces[ie].vertices[2].x,
												  object.entityPoint[sp].y + object.entityPoint[sp].meshbox.faces[ie].vertices[2].y,
												  object.entityPoint[sp].z + object.entityPoint[sp].meshbox.faces[ie].vertices[2].z
												);
						m.appendRotation(object.rotation.y, new Vector3D(0, 1, 0));
						var point3:Point = new Point(object.x + m.position.x, object.z + m.position.z);//current point in the world
						
						bhitobject = IntersectionMath.isPointInTriangle2D(point, point1, point2, point3);
						if (bhitobject) {
							//trace('hit enter');
							break;
						}
					}
					if (bhitobject) {
						break;
					}
				}
				if (bhitobject) {
					break;
				}
			}
			return bhitobject;
		}
		
		/**
		 * 
		 * @param	object
		 * @return boolean true or false collision
		 * point intersect mesh tri point 2d
		 */
		public function ispointintersectmesh(object:Number3D):Boolean {
			var bhitobject:Boolean = false;
			for (var i:int = 0; i < collisionmesh.vertices.length; i++ ) {
				var point:Point = new Point(object.x,object.z);
				for (var ii:int = 0; ii < collisionmesh.faces.length; ii++ ) {
					var m1:Matrix3D = new Matrix3D();
					m1.position = new Vector3D(collisionmesh.faces[ii].vertices[0].x, collisionmesh.faces[ii].vertices[0].y, collisionmesh.faces[ii].vertices[0].z);
					m1.appendRotation(rotation.y, new Vector3D(0, 1, 0));
					var point1:Point = new Point(x + m1.position.x,z + m1.position.z);
					
					m1.position = new Vector3D(collisionmesh.faces[ii].vertices[1].x, collisionmesh.faces[ii].vertices[1].y, collisionmesh.faces[ii].vertices[1].z);
					m1.appendRotation(rotation.y, new Vector3D(0, 1, 0));
					var point2:Point = new Point(x + m1.position.x, z + m1.position.z);
					
					m1.position = new Vector3D(collisionmesh.faces[ii].vertices[2].x, collisionmesh.faces[ii].vertices[2].y, collisionmesh.faces[ii].vertices[2].z);
					m1.appendRotation(rotation.y, new Vector3D(0, 1, 0));
					var point3:Point = new Point(x + m1.position.x, z + m1.position.z);
					
					bhitobject = IntersectionMath.isPointInTriangle2D(point, point1, point2, point3);
					if (bhitobject) {
						break;
					}
				}
				if (bhitobject) {
					break;
				}
			}
			return bhitobject;
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
		
		
		//position
		
		public function set point(p_point:Number3D):void {
			x = p_point.x;
			y = p_point.y;
			z = p_point.z;
		}
		
		public function get point():Number3D {
			return new Number3D(x,y,z);
		}
		
		
		public function set rotation(p_point:Number3D):void {
			_rotation.x = p_point.x % 360;
			_rotation.y = p_point.y % 360;
			_rotation.z = p_point.z % 360;
		}
		
		public function get rotation():Number3D {
			//return new Number3D(x,angle,z);
			return _rotation;
		}
		
		
		
		
	}
	
}