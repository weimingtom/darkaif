package gearunits.away3d.entity.spacecraft 
{
	import away3d.core.math.Number3D;
	import away3d.sprites.MovieClipSprite;
	import flash.geom.Matrix3D;
	import flash.geom.Vector3D;
	import gearunits.away3d.display.AUnitIconHUD;
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
		public var uniticon:AUnitIconHUD = new AUnitIconHUD();
		
		public function ASpaceshipFighter() 
		{
			type.push( { name:'fighter' } );
			//TurnSpeed = 5;
			name = 'ASpaceshipFighter';
			uniticon.text = name;
			uniticon.setbar(6, 32);
			iconhud = new MovieClipSprite(uniticon);
		}
		
		override public function update():void {
			super.update();
			
			//update position and health
			if (iconhud != null) {
				uniticon.percent = health / healthmax;
				iconhud.y = y - 32;
			}
			
			
			//trace('fire--');
			//IF key is press to fire weapon Multi 
			for (var i:int = 0; i < weapon.length; i++ ) {
				if (BWEAPONFIRE == true) {
					weapon[i].PRESSFIRE = true;
				}else {
					weapon[i].PRESSFIRE = false;
				}
			}
			
			//WEAPON SYSTEM
			//if (BWEAPONFIRE == true) { //check if bot ai for firing at the target
				//trace('FIRE'); //FIRE WEAPON
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
								/*
								 * Need to build a reuse projectile 
								 */ 
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
			///}
		}
	}
	
}