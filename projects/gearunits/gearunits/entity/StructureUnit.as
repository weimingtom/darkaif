﻿package gearunits.entity 
{
	import gearunits.entity.weapon.Weapon;
	import sandy.core.data.Point3D;
	import sandy.core.scenegraph.Shape3D;
	
	/**
	 * ...
	 * @author Darknet
	 * this is for the vehicle unit and Infantry unit
	 * 
	 * The code will be divide up into function and var for gourps
	 * 
	 * This wil be convert into sandy engine later other ones.
	 * 
	 * cost to build
	 * spawn time
	 * 
	 * 
	 */
	public class StructureUnit
	{
		//{
		public var faction:String = 'none';
		public var ownerid:String = '';
		public var classtype:String = 'StructureUnit';
		public var name:String = 'StructureUnit';
		public var teamcolor:uint;
		
		public var weapon:Vector.<Weapon> = new Vector.<Weapon>();
		
		public var mesh:Shape3D;
		
		public var x:Number = 0;
		public var y:Number = 0;
		public var z:Number = 0;
		
		public var dirx:Number = 0;
		public var diry:Number = 0;
		public var dirz:Number = 0;
		
		public var movespeed:Number = 0;
		
		public var bselected:Boolean = false;
		public var order:String = 'none';
		public var aiorder:String = 'autoattack'; //attack, autoattack, returnfire, gaurd, defence, retreat, patrol
		public var query:Array = new Array();
		
		public var time:Number = 0;
		public var timemax:Number = 0;
		public var spawntime:Number = 0;
		public var range:Number = 0;
		public var maxrange:Number = 0;
		public var minrange:Number = 0;
		public var detectrange:Number = 0;
		public var angle:Number = 0;
		public var targetangle:Number = 0;
		
		public var distance:Number = 0;
		public var targetdistance:Number = 0;
		public var maxdistance:Number = 0;
		public var mindistance:Number = 0;
		
		public var velocity:Point3D = new Point3D();
		
		public var movepoint:Point3D = new Point3D();
		public var minpoint:Point3D = new Point3D();
		public var maxpoint:Point3D = new Point3D();
		//}
		public function StructureUnit() 
		{
			
		}
		
		public function update():void {
			if (mesh != null) {
				mesh.x = x;
				mesh.y = y;
				mesh.z = z;
			}
			followpoint();
		}
		
		public function gettarget():void {
			
		}
		
		public function followpoint():void {
			if (order == 'move') {
				//trace('move check....');
				/*
				if (movepoint.z < z) {
					z --;
				}else if(movepoint.z > z){
					z++;
				}else {}
				
				if (movepoint.x < x) {
					x --;
				}else if(movepoint.x > x){
					x++;
				}else { }
				*/
				
				velocity.x = movespeed * Math.sin(angle* Math.PI / 180);
				velocity.z = movespeed * Math.cos(angle* Math.PI / 180);
				
				x += velocity.x;
				y += velocity.y;
				z += velocity.z;
				distancepoint();
				//fixed follow when finish move point
				
				if ((x > movepoint.x-3) && (x < movepoint.x+3)&&(z > movepoint.z-3) && (z < movepoint.z+3) &&(distance < 2)) {
					order = 'none';
					//trace('finish move point');
				}else {
					//angle = rotationpoint(movepoint);
				}
				
				/*
				if (distance < 2) {
					order = 'none';
				}else {
					//trace(distance);
				}
				*/
			}
		}
		
		//basic collision
		public function interset(unit:StructureUnit):void {
			
		}
		
		public function resouce():void {
			
		}
		
		public function point():Point3D {
			var point:Point3D = new Point3D();
			point.x = x;
			point.y = y;
			point.z = z;
			
			return point;
		}
		
		public function setpoint(point:Point3D):void {
			x = point.x;
			y = point.y;
			z = point.z;
		}
		
		//target point object
		public function targetpoint(p3d:Point3D):void {
			movepoint = p3d;
			targetangle = rotationpoint(p3d);
		}
		
		//this will move to point in angle
		public function pointmove(p3d:Point3D):void {
			trace(p3d);
			movepoint = p3d;
			angle = rotationpoint(p3d);
		}
		
		//get point of angle //MATH
		public function rotationpoint(p3d:Point3D):Number {
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
		
		//get distance point to go there in 3d space// MATH
		public function distancepoint():void {
			distance = Math.abs((((x - movepoint.x) * 2) + ((y - movepoint.y) * 2) + ((z - movepoint.z) * 2)) / 2);
			//trace(distance);
		}
		
	}
	
}