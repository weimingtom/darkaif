package gearunits.away3d.entity.weapon 
{
	//{
	import away3d.containers.View3D;
	import away3d.core.math.Number3D;
	import flash.geom.Matrix3D;
	import flash.geom.Vector3D;
	import gearunits.away3d.entity.AStructureUnit;
	import gearunits.away3d.entity.projectile.AProjectile;
	import gearunits.core.GlobalUnit;
	//}
	
	/**
	 * ...
	 * @author Darknet
	 * 
	 * Information: MAIN TEMPLATE
	 * -this code check for projectiles to be reused
	 * 
	 */
	public class AWeapon extends GlobalUnit
	{
		//{
		//INFORMATION
		public var name:String = 'AWeapon';
		public var time:Number = 0;
		public var timemax:Number = 0;
		public var damage:Number = 0;
		public var mesh:*;
		public var _objectid:String = '';
		public var _objectpoint:Number3D = new Number3D();//this deal with object current attach to it.
		public var _objectangle:Number3D = new Number3D();//this deal with object current attach to it.
		//PROJECTILE
		public static var projectiles:Vector.<AProjectile>; //global var class
		public var projectile:Vector.<AProjectile> = new Vector.<AProjectile>(); //global var class
		public static var units:Vector.<AStructureUnit>; //global var class
		public static var view:View3D; //global var class
		//FLASH MUZZLE
		// [?]
		//WEAPON CONTROL
		public var BWEAPONFIRE:Boolean = false;
		public var PRESSFIRE:Boolean = false;
		public var BCONTROLFIRE:Boolean = false;
		public var BFIRE:Boolean = false;
		public var BALTFIRE:Boolean = false;
		public var binfiniteammo:Boolean = false;
		
		public var bbot:Boolean = false;//deal with bot or player control but if player is used or not, set some condtions
		public var bturret:Boolean = false;//this will deal with turret control or from a point fire
		public var bautoturret:Boolean = false;
		
		//WEAPON AMMO
		public var ammoclip:Number = 0;
		public var ammo:Number = 0;
		public var buseammo:Boolean = false;//this deal with ammo build
		//WEAPON OTHER SETTINGS
		public var firerate:Number = 0;
		public var heattime:Number = 0;
		public var cooltime:Number = 0;
		public var offsetlengthfire:Number = 0; //2D spawn // current position and spacing and math of sin and cos base
		public var firepoint:Number3D = new Number3D();//where spawn projectiles
		public var _rotation:Number3D = new Number3D();
		public var TurnSpeed:Number = 0;
		
		public var detectrange:Number = 0;
		
		public var targetid:String = '';
		public var targetpoint:Number3D = new Number3D();
		public var targetangle:Number3D = new Number3D();
		//}
		
		public function AWeapon() {
			
		}
		
		public function update():void {
			var m:Matrix3D = new Matrix3D();
			
			if (mesh != null) {
				m.position = new Vector3D(x, y, z);
				m.appendRotation(_objectangle.y, new Vector3D(0, 1, 0));
				
				mesh.x = _objectpoint.x + m.position.x;
				mesh.y = _objectpoint.y + m.position.y;
				mesh.z = _objectpoint.z+  m.position.z;
			}
			
			//trace('fire--');
			//IF key is press to fire weapon Multi 
			/*
			for (var i:int = 0; i < weapon.length; i++ ) {
				if (BWEAPONFIRE == true) {
					weapon[i].PRESSFIRE = true;
				}else {
					weapon[i].PRESSFIRE = false;
				}
			}
			*/
			
			if(bbot == true){//bot to be on for turret
			if (units != null ){
				for (var uid:int = 0; uid < units.length; uid++ ) {
					if (_objectid != String(units[uid].id)) {//this make sure it doesn't loop slef
						if (caldistance(currentpoint,units[uid].point) < detectrange ) {//check if ship in range
							//trace(name+ ' > bot: '+bbot+ ' detect ship...' + detectrange + ':' + caldistance(point, units[uid].point));
							targetangle.y = rotationpoint(units[uid].point);
							BWEAPONFIRE = true;
						}else {
							BWEAPONFIRE = false;
						}
						break;
					}
				}
			}
			}
			
			//if bot over ride control for bot to fire
			if (bbot == true) {
				if (BWEAPONFIRE == true) {
					PRESSFIRE = true;
				}else {
					PRESSFIRE = false;
				}
			}
			
			if ((BFIRE == false)&&(PRESSFIRE == true)) {
				BFIRE = true;
				PRESSFIRE = false;
			}
			
			if(BFIRE){
				time++;
				if (time > timemax) {
					time = 0;
					BFIRE = false
				}else if(time == 1){
					for (var p:int = 0; p < projectile.length; p++ ) {
						//
						// Need to build a reuse projectile 
						// 
						//projectile
						
						var projectileclass:AProjectile;
						var bempty:Boolean = false;
						
						//BWEAPONFIRE = false;
						//trace('FIRE....');
						//check if there is use class projectile
						
						for (var tp:int = 0; tp < projectiles.length; tp++ ) {
							if (projectiles[tp].CLASS == projectile[p].CLASS) {//class must match
								if (projectiles[tp].balive == false) {
									projectileclass = projectiles[tp];
									bempty = true;
									break;
								}
							}
						}
						
						//if there no use class create one
						if (bempty == false) {
							projectileclass = new AProjectile().projectile(projectile[p].CLASS);
						}
						projectileclass.balive = true;
						projectileclass.copyobject(projectile[p]);
						
						m.position = new Vector3D(firepoint.x,firepoint.y,firepoint.z);
						m.appendRotation(_objectangle.y, new Vector3D(0, 1, 0));
						
						var m2:Matrix3D = new Matrix3D();
						m2.position = new Vector3D(x, y, z);
						m2.appendRotation(_objectangle.y, new Vector3D(0, 1, 0));
						
						projectileclass.setposition(new Number3D(_objectpoint.x + m.position.x + m2.position.x,
																 _objectpoint.y + m.position.y + m2.position.y,
																 _objectpoint.z + m.position.z + m2.position.z));
						m = null;
						
						//check what do deal with turret control settings
						if ((bbot == true)&&(bturret == true)) {//if bot control is on 
							projectileclass.angle = targetangle.y;
							//projectileclass.angle = 270;
						}else if ((bturret == true)) {//user control to shot
							projectileclass.angle = targetangle.y;
						} else {//deal with no turret control
							projectileclass.angle = _objectangle.y + _rotation.y;
						}
						
						projectileclass.balive = true;
						projectileclass.ownerentity = _objectid;
						//trace(mesh.name);
						//check if there is view scene
						if(view != null){
							view.scene.addChild(projectileclass.mesh);
							projectileclass.mesh.visible = true;
							var bprojetfound:Boolean = false;
							//this deal with same object class loop
							
							for (var ip:int = 0; ip < projectiles.length; ip++ ) {
								if (projectiles[ip] == projectileclass) {
									bprojetfound = true;
									break;
								}
							}
							
							//if new project then add
							if(!bprojetfound){
								projectiles.push(projectileclass);
							}
							trace('projectile:'+projectiles.length);
						}
					}
				}
			}
		}
		
		public function position():Number3D {
			return new Number3D(x,y,z);
		}
		
		public function caldistance(a_point:Number3D,b_point:Number3D):Number {
			//return Math.abs((((a_point.x - b_point.x) * 2) + ((a_point.y - b_point.y) * 2) + ((a_point.z - b_point.z) * 2)) / 2);
			return Math.abs(Math.sqrt(((a_point.x - b_point.x)*(a_point.x - b_point.x))+((a_point.y - b_point.y)*(a_point.y - b_point.y))+((a_point.z - b_point.z) * (a_point.z - b_point.z))));
		}
		
		//ROTATE DIRE
		public function rotationpoint(p3d:Number3D):Number {
			var facedirection:Number = 0;
			facedirection = Math.atan2(currentpoint.z - p3d.z, currentpoint.x - p3d.x);
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
		
		//=======================================
		//current object attach position
		//=======================================
		
		public function set objectpoint(p_point:Number3D):void {
			_objectpoint = p_point;
		}
		
		public function get objectpoint():Number3D {
			return _objectpoint;
		}
		
		public function set objectangle(p_point:Number3D):void {
			_objectangle = p_point;
		}
		
		public function get objectangle():Number3D {
			return _objectangle;
		}
		
		public function set objectid(p_id:String):void {
			_objectid = p_id;
		}
		
		public function get objectid():String {
			return _objectid;
		}
		
		public function set point(p_point:Number3D):void {
			x = p_point.x;
			y = p_point.y;
			z = p_point.z;
		}
		
		public function get point():Number3D {
			return new Number3D(x,y,z);
		}
		
		public function get currentpoint():Number3D {//add the current position of global
			return new Number3D(x+_objectpoint.x,_objectpoint.y + y,_objectpoint.z+z);
		}
		
		public function set rotation(p_rotation:Number3D):void {
			_rotation = p_rotation;
		}
		
		public function get rotation():Number3D {
			return _rotation;
		}
		
	}
	
}