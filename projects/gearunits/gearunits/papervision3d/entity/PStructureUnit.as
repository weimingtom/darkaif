package gearunits.papervision3d.entity 
{
	import flash.display.BitmapData;
	import flash.geom.Matrix3D;
	import flash.geom.Point;
	import flash.geom.Vector3D;
	import gearunits.core.GlobalUnit;
	import gearunits.papervision3d.entity.projectile.PProjectile;
	import gearunits.papervision3d.entity.weapon.PWeapon;
	import gearunits.papervision3d.technologytree.PTechnologyTree;
	import org.papervision3d.core.geom.TriangleMesh3D;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import org.papervision3d.core.math.Number3D;
	import org.papervision3d.events.InteractiveScene3DEvent;
	import org.papervision3d.materials.BitmapMaterial;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.materials.special.CompositeMaterial;
	import org.papervision3d.scenes.Scene3D;
	import sandy.math.IntersectionMath;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class PStructureUnit extends GlobalUnit
	{
		protected static var disp:EventDispatcher; //listener function
		public var name:String = 'PStructureUnit';
		public var mesh:TriangleMesh3D; //
		public var collisionmesh:TriangleMesh3D;//3D/2D Collision It has to be basic
		
		public static const NAME:String = 'AStructureUnit';
		public static const TYPE:String = 'Unit';
		
		public var balive:Boolean = true;
		public var bjustspawn:Boolean = false;
		public var justspawntime:Number = 0;
		public var justspawntimemax:Number = 0;
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
		
		//public var x:Number = 0;
		//public var y:Number = 0;
		//public var z:Number = 0;
		
		public var bhit:Boolean = false;
		
		
		//public var min:Number3D = new Number3D();
		//public var max:Number3D = new Number3D();
		
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
		public var _rotation:Number3D = new Number3D();
		
		public var TurnSpeed:Number = 0;
		
		public var BWEAPONFIRE:Boolean = false;
		public var bdetectother:Boolean = false;
		public var detectrange:Number = 0;//radius for emeny
		
		//public var BitTextOver:BitmapData = new BitmapData(10, 10, false, 0xFFFFFF);
		public var BitTextOut:BitmapData = new BitmapData(10, 10, false, 0xadff2f);
		//public var BitTextSelected:BitmapData = new BitmapData(10, 10, false, 0xFFFFFF);
		//public var MatTextOver:BitmapMaterial = new BitmapMaterial(BitTextOver);
		public var MatTextOut:BitmapMaterial = new BitmapMaterial(BitTextOut);
		//public var MatTextOut:BitmapMaterial = new BitmapMaterial(BitTextSkin.bitmapData, { alpha:1} );
		//public var MatTextSelected:BitmapMaterial = new BitmapMaterial(BitTextSelected);
		public var MatTextOver:ColorMaterial = new ColorMaterial(0xFFFFFF,0.5);
		public var MatTextSelected:ColorMaterial = new ColorMaterial(0xFFFFFF,0.2);
		public var TexCom:CompositeMaterial = new CompositeMaterial();
		
		public function PStructureUnit(){
			_id++;
			id = _id;
			TexCom.interactive = true;
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
				velocity.x =  (o_speed/50) * Math.sin(_rotation.y* Math.PI / 180);
				velocity.z =  (o_speed/50) * Math.cos(_rotation.y * Math.PI / 180);	
			}else {
				velocity.x = o_speed * Math.sin(_rotation.y* Math.PI / 180);
				velocity.z = o_speed * Math.cos(_rotation.y * Math.PI / 180);	
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
			_rotation.y = rotationpoint(p3d);
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
		
		
		//MESH COLLISION AGAINIST MESH COLLISION
		public function ismeshintersect(object:PStructureUnit):Boolean {
			var bhitobject:Boolean = false;
			for (var i:int = 0; i < collisionmesh.geometry.vertices.length; i++ ) {
				var m:Matrix3D = new Matrix3D();
				m.position = new Vector3D(collisionmesh.geometry.vertices[i].x, collisionmesh.geometry.vertices[i].y, collisionmesh.geometry.vertices[i].z);
				m.appendRotation(rotation.y, new Vector3D(0, 1, 0));
				var point:Point = new Point(x + m.position.x,z + m.position.z);
				//trace(object.collisionmesh.geometry.faces.length );
				for (var ii:int = 0; ii < object.collisionmesh.geometry.faces.length; ii++ ) {
					var m1:Matrix3D = new Matrix3D();
					m1.position = new Vector3D(object.collisionmesh.geometry.faces[ii].vertices[0].x, object.collisionmesh.geometry.faces[ii].vertices[0].y, object.collisionmesh.geometry.faces[ii].vertices[0].z);
					m1.appendRotation(object.rotation.y, new Vector3D(0, 1, 0));
					var point1:Point = new Point(object.x + m1.position.x, object.z + m1.position.z);
					//trace(m1.position);
					m1.position = new Vector3D(object.collisionmesh.geometry.faces[ii].vertices[1].x, object.collisionmesh.geometry.faces[ii].vertices[1].y, object.collisionmesh.geometry.faces[ii].vertices[1].z);
					m1.appendRotation(object.rotation.y, new Vector3D(0, 1, 0));
					var point2:Point = new Point(object.x + m1.position.x, object.z + m1.position.z);
					
					m1.position = new Vector3D(object.collisionmesh.geometry.faces[ii].vertices[2].x, object.collisionmesh.geometry.faces[ii].vertices[2].y, object.collisionmesh.geometry.faces[ii].vertices[2].z);
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
		public function ismeshintersectentitypoint(object:PStructureUnit):Boolean {
			var bhitobject:Boolean = false;
			for (var i:int = 0; i < collisionmesh.geometry.vertices.length; i++ ) {
				var m:Matrix3D = new Matrix3D();
				m.position = new Vector3D(collisionmesh.geometry.vertices[i].x, collisionmesh.geometry.vertices[i].y, collisionmesh.geometry.vertices[i].z);
				m.appendRotation(rotation.y, new Vector3D(0, 1, 0));
				var point:Point = new Point(x + m.position.x, z + m.position.z);
				for (var sp:int = 0; sp < object.entityPoint.length;sp++ ) {//enter and exit point
					for (var ie:int = 0; ie < object.entityPoint[sp].meshbox.faces.length; ie++ ) {//mesh face
						//trace ('face');
						m.position = new Vector3D(object.entityPoint[sp].x + object.entityPoint[sp].meshbox.geometry.faces[ie].vertices[0].x,
												  object.entityPoint[sp].y + object.entityPoint[sp].meshbox.geometry.faces[ie].vertices[0].y,
												  object.entityPoint[sp].z + object.entityPoint[sp].meshbox.geometry.faces[ie].vertices[0].z
												);
						m.appendRotation(object.rotation.y, new Vector3D(0, 1, 0));
						var point1:Point = new Point(object.x + m.position.x, object.z + m.position.z);//current point in the world
						
						m.position = new Vector3D(object.entityPoint[sp].x + object.entityPoint[sp].meshbox.geometry.faces[ie].vertices[1].x,
												  object.entityPoint[sp].y + object.entityPoint[sp].meshbox.geometry.faces[ie].vertices[1].y,
												  object.entityPoint[sp].z + object.entityPoint[sp].meshbox.geometry.faces[ie].vertices[1].z
												);
						m.appendRotation(object.rotation.y, new Vector3D(0, 1, 0));
						var point2:Point = new Point(object.x + m.position.x, object.z + m.position.z);//current point in the world
						
						m.position = new Vector3D(object.entityPoint[sp].x + object.entityPoint[sp].meshbox.geometry.faces[ie].vertices[2].x,
												  object.entityPoint[sp].y + object.entityPoint[sp].meshbox.geometry.faces[ie].vertices[2].y,
												  object.entityPoint[sp].z + object.entityPoint[sp].meshbox.geometry.faces[ie].vertices[2].z
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
			for (var i:int = 0; i < collisionmesh.geometry.vertices.length; i++ ) {
				var point:Point = new Point(object.x,object.z);
				for (var ii:int = 0; ii < collisionmesh.geometry.faces.length; ii++ ) {
					var m1:Matrix3D = new Matrix3D();
					m1.position = new Vector3D(collisionmesh.geometry.faces[ii].vertices[0].x, collisionmesh.geometry.faces[ii].vertices[0].y, collisionmesh.geometry.faces[ii].vertices[0].z);
					m1.appendRotation(rotation.y, new Vector3D(0, 1, 0));
					var point1:Point = new Point(x + m1.position.x,z + m1.position.z);
					
					m1.position = new Vector3D(collisionmesh.geometry.faces[ii].vertices[1].x, collisionmesh.geometry.faces[ii].vertices[1].y, collisionmesh.geometry.faces[ii].vertices[1].z);
					m1.appendRotation(rotation.y, new Vector3D(0, 1, 0));
					var point2:Point = new Point(x + m1.position.x, z + m1.position.z);
					
					m1.position = new Vector3D(collisionmesh.geometry.faces[ii].vertices[2].x, collisionmesh.geometry.faces[ii].vertices[2].y, collisionmesh.geometry.faces[ii].vertices[2].z);
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
		
		
		//POSITION AND ROTATION
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
		
		
		//SELECT OBJECT / HIGH LIGHT
		public function UnitObject_Over(event:InteractiveScene3DEvent):void {
			//MatTextOver.fillAlpha = 0.5;
			TexCom.addMaterial(MatTextOver);
			TexCom.addMaterial(MatTextOut);
			TexCom.removeMaterial(MatTextSelected);
			//TexCom.interactive = true;
			//mesh.material = TexCom;
			//trace('over...');
		}
		public function UnitObject_Out(event:InteractiveScene3DEvent = null):void {
			//TexCom.removeMaterial(MatTextOver);
			if (bselected == false) {
				TexCom.removeMaterial(MatTextSelected);
				TexCom.removeMaterial(MatTextOver);
				TexCom.addMaterial(MatTextOut);
				//TexCom.interactive = true;
				//mesh.material = MatTextOut;
			}else {
				UnitObject_Selected();
				
			}
		}
		public function UnitObject_Selected(event:InteractiveScene3DEvent = null):void {
			TexCom.removeMaterial(MatTextOver);
			TexCom.addMaterial(MatTextOut);
			TexCom.addMaterial(MatTextSelected);
			//TexCom.interactive = true;
			//mesh.material = MatTextOut;
		}
		
	}
	
}