﻿package gearunits.sandy3d.entity 
{
	//{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import gearunits.core.GlobalUnit;
	import gearunits.sandy3d.entity.weapon.SWeapon;
	import gearunits.sandy3d.events.SStructureUnitEvent;
	import gearunits.sandy3d.events.SUnitEvent;
	import gearunits.sandy3d.events.SUnitQueryBuildEvent;
	import gearunits.sandy3d.technologytree.STechnologyTree;
	import sandy.core.data.Point3D;
	import sandy.core.scenegraph.Shape3D;
	//}
	
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
	 */
	
	public class SStructureUnit extends GlobalUnit
	{
		//{
		
		public static const NAME:String = 'SStructureUnit';
		protected static var disp:EventDispatcher; //listener function
		
		public var faction:String = 'none';
		public var ownerid:String = '';
		public var classtype:String = 'StructureUnit';
		public var name:String = 'StructureUnit';
		public var teamcolor:uint;
		public var bbot:Boolean = false;
		
		//units functions
		public var unittype:Array = new Array();
		public var bselected:Boolean = false;
		public var bsingleselected:Boolean = false;//this deal with building and cap ships
		public var order:String = 'none';
		public var aiorder:String = 'autoattack'; //attack, autoattack, returnfire, gaurd, defence, retreat, patrol
		public var query:Array = new Array();
		public var options:Array = new Array();//actions //buildings //ships
		public var tech:Vector.<STechnologyTree> = new Vector.<STechnologyTree>();
		public var bmovable:Boolean = false;
		public var bdeploy:Boolean = false;
		public var bdocked:Boolean = false;
		
		//public var b
		
		public var unit:Vector.<SStructureUnit> = new Vector.<SStructureUnit>();
		public var spawnpoint:Vector.<Point3D> = new Vector.<Point3D>();//not use
		public var queryunit:Vector.<SStructureUnit> = new Vector.<SStructureUnit>();
		public var entitypoint:Vector.<SEntityPoint3D> = new Vector.<SEntityPoint3D>();
		public var weapon:Vector.<SWeapon> = new Vector.<SWeapon>();
		
		public var healthpoint:Number = 100;
		public var healthpointmax:Number = 100;
		
		//{point system
		public var credits:Number = 0;
		public var money:Number = 0;
		public var cost:Number = 0;
		public var fuel:Number = 0;
		public var metal:Number = 0;
		public var crystal:Number = 0;
		public var gas:Number = 0;
		public var ore:Number = 0;
		public var commandpoint:Number = 0;
		public var commandpointmax:Number = 10;
		public var powerlevel:Number = 0;
		public var poweruse:Number = 0;
		public var powertotal:Number = 0;
		//}
		
		public var mesh:Shape3D;
		//public var x:Number = 0;
		//public var y:Number = 0;
		//public var z:Number = 0;
		
		public var dirx:Number = 0;
		public var diry:Number = 0;
		public var dirz:Number = 0;
		
		public var movespeed:Number = 0;
		
		public var time:Number = 0;
		public var timemax:Number = 0;
		public var spawntime:Number = 0;
		public var launchtime:Number = 0;
		public var launchtimemax:Number = 0;
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
		public function SStructureUnit() 
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
				//trace('point:'+ ' x:'+x+' y:' +y +' z:'+z + movepoint + '[DIS]' + distance);
				if ((x > movepoint.x-6) && (x < movepoint.x+6)&&(z > movepoint.z-6) && (z < movepoint.z+6) &&(distance < 15)) {
					order = 'none';
					//trace('finish move point');
				}else if ((x == movepoint.x)&&(y == movepoint.y)&&(z == movepoint.z)){
					order = 'none';
					//trace('hellloooo');
				}else{
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
		public function interset(unit:SStructureUnit):void {
			
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
			//trace(p3d);
			order = 'move';
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
		
		public function set timer(timecount:Number):void {
			time = timecount;
			//trace(time);
			//dispatchEvent(new StructureUnitEvent(StructureUnitEvent.TIME, time));
			dispatchEvent(new SUnitQueryBuildEvent(SUnitQueryBuildEvent.TIME,time));
		}
		
		public function get timer():Number {
			return time;
		}
		
		//get distance point to go there in 3d space// MATH
		public function distancepoint():void {
			distance = Math.abs((((x - movepoint.x) * 2) + ((y - movepoint.y) * 2) + ((z - movepoint.z) * 2)) / 2);
			//trace(distance);
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
		
	}
	
}