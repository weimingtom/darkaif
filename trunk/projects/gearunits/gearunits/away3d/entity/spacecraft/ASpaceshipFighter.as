package gearunits.away3d.entity.spacecraft 
{
	import away3d.core.math.Number3D;
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
		
		public function ASpaceshipFighter() 
		{
			type.push( { name:'fighter' } );
			//TurnSpeed = 5;
		}
		
		override public function update():void {
			super.update();
			
			
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
								projectileclass.setposition(new Number3D(x + (weapon[w].offsetlengthfire * Math.sin(angle * Math.PI / 180)),
																				y,
																				z + (weapon[w].offsetlengthfire * Math.cos(angle * Math.PI / 180))));
								
								projectileclass.angle = angle;
								projectileclass.balive = true;
								projectileclass.ownerentity = mesh.name;
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