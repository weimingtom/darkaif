package gearunits.away3d.entity.weapon 
{
	import away3d.containers.View3D;
	import away3d.core.math.Number3D;
	import flash.geom.Matrix3D;
	import flash.geom.Vector3D;
	import gearunits.away3d.entity.AStructureUnit;
	import gearunits.away3d.entity.projectile.AProjectile;
	import gearunits.core.GlobalUnit;
	
	/**
	 * ...
	 * @author Darknet
	 * 
	 * Information: MAIN TEMPLATE
	 * 
	 */
	public class AWeapon extends GlobalUnit
	{
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
		public var PRESSFIRE:Boolean = false;
		public var BCONTROLFIRE:Boolean = false;
		public var BFIRE:Boolean = false;
		public var BALTFIRE:Boolean = false;
		public var binfiniteammo:Boolean = false;
		
		public var bturret:Boolean = false;
		public var bautoturret:Boolean = false;
		
		//WEAPON AMMO
		public var ammoclip:Number = 0;
		public var ammo:Number = 0;
		//WEAPON OTHER SETTINGS
		public var firerate:Number = 0;
		public var heattime:Number = 0;
		public var cooltime:Number = 0;
		public var offsetlengthfire:Number = 0; //2D spawn // current position and spacing and math of sin and cos base
		public var firepoint:Number3D = new Number3D();//where spawn projectiles
		
		public function AWeapon() 
		{
			
		}
		
		public function update():void {
			var m:Matrix3D = new Matrix3D();
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
			
			if (mesh != null) {
				m.position = new Vector3D(x, y, z);
				m.appendRotation(_objectangle.y, new Vector3D(0, 1, 0));
				
				mesh.x = _objectpoint.x + m.position.x;
				mesh.y = _objectpoint.y + m.position.y;
				mesh.z = _objectpoint.z+  m.position.z;
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
						
						projectileclass.angle = _objectangle.y;
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
		
	}
	
}