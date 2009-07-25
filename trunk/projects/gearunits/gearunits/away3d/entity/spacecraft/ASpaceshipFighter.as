package gearunits.away3d.entity.spacecraft 
{
	import away3d.core.math.Number3D;
	import flash.geom.Matrix3D;
	import flash.geom.Vector3D;
	import gearunits.away3d.entity.projectile.AProjectile;
	import gearunits.away3d.entity.weapon.AWeapon;
	import gearunits.away3d.entity.weapon.AWeaponAssaultRifle;
	
	/**
	 * ...
	 * @author Darknet
	 */
	
	public class ASpaceshipFighter extends ASpaceship
	{
		public static const NAME:String = 'ASpaceshipFighter';
		public static const TYPE:String = 'Spaceship';
		
		public function ASpaceshipFighter() {
			type.push( { name:'fighter' } );
			//TurnSpeed = 5;
			name = 'ASpaceshipFighter';
		}
		
		override public function update():void {
			super.update();
			
			if (units != null ){
				for (var uid:int = 0; uid < units.length; uid++ ) {
					if (id != units[uid].id) {//this make sure it doesn't loop slef
						if(bbot == true){
						if (caldistance(point,units[uid].point) < detectrange ) {//check if ship in range
							//trace(name+ ' > bot: '+bbot+ ' detect ship...' + detectrange + ':' + caldistance(point, units[uid].point));
							targetangle.y = rotationpoint(units[uid].point);
							//trace(targetangle.y);
							//_rotation.y = targetangle.y;
							//trace(rotation.y + ':'+targetangle.y);
							//change direction to follow target
								if ((_rotation.y < 360 )&&(_rotation.y < targetangle.y-TurnSpeed)) {
									//_rotation.y -= TurnSpeed;
									//trace(rotation.y + ':'+targetangle.y);
									_rotation.y += TurnSpeed;
								}else if ((_rotation.y > 0 )&&(_rotation.y > targetangle.y+TurnSpeed)) {
									_rotation.y -= TurnSpeed;
								}else {
									BWEAPONFIRE = true;
								}
						}else {
							BWEAPONFIRE = false;
						}
						}
					}
				}
			}
			
			
			
			//trace('fire--');
			//IF key is press to fire weapon Multi 
			for (var i:int = 0; i < weapon.length; i++ ) {
				if (BWEAPONFIRE == true) {
					weapon[i].PRESSFIRE = true;
				}else {
					weapon[i].PRESSFIRE = false;
				}
				weapon[i].objectid = String(id);
				weapon[i].objectangle  = rotation;
				weapon[i].objectpoint = point;
				weapon[i].update();
			}
			
			/*
			//WEAPON SYSTEM
			//
				for (var w:int = 0; w < weapon.length; w++ ) {
					
					if ((weapon[w].BFIRE == false)&&(weapon[w].PRESSFIRE == true)) {
						weapon[w].BFIRE = true;
						weapon[w].PRESSFIRE = false;
					}
					
					if(weapon[w].BFIRE){
						weapon[w].time++;
						if (weapon[w].time > weapon[w].timemax) {
							weapon[w].time = 0;
							weapon[w].BFIRE = false
						}else if(weapon[w].time == 1){
							for (var p:int = 0; p < weapon[w].projectile.length; p++ ) {
								//
								// Need to build a reuse projectile 
								// 
								//projectile
								
								var projectileclass:AProjectile;
								var bempty:Boolean = false;
								
								BWEAPONFIRE = false;
								//trace('FIRE....');
								//check if there is use class projectile
								for (var tp:int = 0; tp < projectile.length; tp++ ) {
									if (projectile[tp].CLASS == weapon[w].projectile[p].CLASS) {//class must match
										if (projectile[tp].balive == false) {
											projectileclass = projectile[tp];
											bempty = true;
											break;
										}
									}
								}
								
								//if there no use class create one
								if (bempty == false) {
									projectileclass = new AProjectile().projectile(weapon[w].projectile[p].CLASS);
								}
								projectileclass.balive = true;
								projectileclass.copyobject(weapon[w].projectile[p]);
								
								var m:Matrix3D = new Matrix3D();
								m.position = new Vector3D(weapon[w].firepoint.x,weapon[w].firepoint.y,weapon[w].firepoint.z);
								m.appendRotation(angle, new Vector3D(0, 1, 0));
								projectileclass.setposition(new Number3D(x + m.position.x, y + m.position.y, z + m.position.z));
								m = null;
								
								projectileclass.angle = angle;
								projectileclass.balive = true;
								projectileclass.ownerentity = String(id);
								//trace(mesh.name);
								//check if there is view scene
								if(view != null){
									view.scene.addChild(projectileclass.mesh);
									projectileclass.mesh.visible = true;
									var bprojetfound:Boolean = false;
									//this deal with same object class loop
									for (var ip:int = 0; ip < projectile.length; ip++ ) {
										if (projectile[ip] == projectileclass) {
											bprojetfound = true;
											break;
										}
									}
									//if new project then add
									if(!bprojetfound){
										projectile.push(projectileclass);
									}
									trace('projectile:'+projectile.length);
								}
							}
						}
					}
				}
			*/
		}
	}
	
}