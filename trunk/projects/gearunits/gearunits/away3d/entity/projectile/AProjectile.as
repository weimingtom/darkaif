﻿package gearunits.away3d.entity.projectile 
{
	import away3d.containers.View3D;
	import away3d.core.base.Mesh;
	import away3d.core.base.Object3D;
	import away3d.core.base.VertexPosition;
	import away3d.core.math.Number3D;
	import gearunits.away3d.entity.AStructureUnit;
	import gearunits.core.GlobalUnit;
	
	/**
	 * ...
	 * @author Darknet
	 * 
	 * Information: This will build collision and spawn projetile.
	 * 
	 */
	public class AProjectile extends GlobalUnit
	{
		public static var ID:int = 0; 
		public var id:int = 0;
		public static const NAME:String = 'AProjectile';
		public var CLASS:String = 'AProjectile';
		public static var projectile:Vector.<AProjectile>; //global var class
		public static var units:Vector.<AStructureUnit>; //global var class
		public static var view:View3D; //global var class
		//{
		public var name:String = 'Projectile';
		public var ownerentity:String = '';
		public var startpoint:Number3D = new Number3D();
		public var endpoint:Number3D = new Number3D();
		public var targetpoint:Number3D = new Number3D();
		//public var targetpoint:Point3D = new Point3D();
		public var balive:Boolean = true;
		public var radiansToDegrees:Number = 180/Math.PI;
		
		public var damage:Number = 0;
		public var defence:Number = 0;
		public var materialtype:String = '';
		public var mesh:Mesh;
		
		public var velocity:Number3D = new Number3D();
		
		public var speed:Number = 1;
		
		public var distance:Number = 0;
		public var mindistance:Number = 0
		public var maxdistance:Number = 0;
		
		public var angle:Number = 0;//direction to point to face object
		public var degree:Number = 0;
		
		// FIRE CONTROLS
		public var firetype:String = 'none';
		
		
		//}
		
		public function AProjectile() 
		{
			ID++;
			id = ID;
		}
		
		//{
		
		public function update():void {
			//trace('updating...');
			if (mesh != null) {
				//trace('updating...');
				mesh.x = x;
				mesh.y = y;
				mesh.z = z;
			}
			if (balive == true) {
				velocity.x = speed * Math.sin(angle* Math.PI / 180);
				velocity.z = speed * Math.cos(angle* Math.PI / 180);
				
				x += velocity.x;
				y += velocity.y;
				z += velocity.z;
			}
			getdistance();
			
			//updatetragetpoint();
			
			if (Math.abs(distance) > maxdistance) {
				balive = false;
				//trace(distance);
				//trace('AProjectile OFF');
				if (view != null) {
					view.scene.removeChild(mesh);
				}
			}
		}
		
		//calculate distance
		//this will either clean up mesh when reach border line
		public function getdistance():void {
			//FIXED MATH
			distance = Math.abs(Math.sqrt(((startpoint.x - x)*(startpoint.x - x))+((startpoint.y - y)*(startpoint.y - y))+((startpoint.z - z) * (startpoint.z - z))));
			//trace(distance);
		}
		
		//not use
		public function directionangle(x:Number, y:Number, x2:Number, y2:Number):void {
			angle = Math.atan2(x-x2,y-y2);
		}
		
		//2d function //target a point
		public function anglepoint(point1:Number3D, point2:Number3D):Number {
			var facedirection:Number = 0;
			//facedirection = Math.atan2(x - point2.x, z - point2.z);
			facedirection = Math.atan2(z - point2.z, x - point2.x);
			facedirection = facedirection * 180 / Math.PI;
			
			//default    
			//270 to 360  |z| 00 to  090
			//-------x--top-view-x-------
			//270 to 180  |z| 90 to -180
			
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
			
			//trace('angle:' + facedirection);
			return facedirection;
		}
		
		public function targetangle(degree:Number):void {
			angle = degree;
		}
		
		//update target point
		public function updatetragetpoint():void {
			angle = anglepoint(startpoint, targetpoint);
			//trace('angle:'+angle);
			//trace('angle:'+angle+' start point:'+startpoint+'//'+ x+'/'+ y+'/'+ z + ' targetpoint:'+targetpoint);
		}
		
		//Set position for spawn and cleaning for life draw
		public function setposition(p3d:Number3D):void {
			x = p3d.x;
			y = p3d.y;
			z = p3d.z;
			
			startpoint.x = p3d.x;
			startpoint.y = p3d.y;
			startpoint.z = p3d.z;
			
			if (mesh != null) {
				mesh.x = p3d.x;
				mesh.y = p3d.y;
				mesh.z = p3d.z;
			}
			
			updatetragetpoint();
		}
		
		public function projectile(classname:String):AProjectile {
			var projectileclass:AProjectile;
			
			if (classname == AProjectileBullet.NAME) {
				projectileclass = new AProjectileBullet();
			}
			
			return projectileclass;
		}
		
		//}
		
		public function copyobject(object:AProjectile):void {
			ownerentity = object.ownerentity;
			damage = object.damage;
			angle = object.angle;
			speed = object.speed;
		}
		
	}
	
}