package gearunits.away3d.entity.infantry 
{
	import gearunits.away3d.entity.AStructureUnit;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class AInfantry extends AStructureUnit
	{
		public static const NAME:String = 'AInfantry';
		public static const TYPE:String = 'Infantry';
		
		public function AInfantry() 
		{
			setbox(16,16,16)
		}
		
		override public function update():void {
			super.update();
			//trace(order+':'+x);
			/*
			//this make sure if the mesh doesn't give error
			if (mesh != null) {
				mesh.rotationY = angle;
			}
			*/
			
			//AI BUILD TEST
			if (order == 'move') {
				//trace('angle'+angle);
				velocity.x = movespeed * Math.sin(angle* Math.PI / 180);
				velocity.z = movespeed * Math.cos(angle * Math.PI / 180);
				
				x += velocity.x;
				y += velocity.y;
				z += velocity.z;
				
				if ((x > movepoint.x-6) && (x < movepoint.x+6)&&(z > movepoint.z-6) && (z < movepoint.z+6) &&(distance < 15)) {
					order = 'none';
					//trace('finish move point');
				}else if ((x == movepoint.x)&&(y == movepoint.y)&&(z == movepoint.z)){
					order = 'none';
					//trace('hellloooo');
				}else{
					//angle = rotationpoint(movepoint);
				}
			}
			
			//if () { //check if bot ai for firing at the target
				//FIRE WEAPON
				for (var w:int = 0; w < weapon.length; w++ ) {
					weapon[w].time++;
					if (weapon[w].time > weapon[w].timemax) {
						weapon[w].time = 0;
						for (var p:int = 0; p < weapon[w].projectile.length;p++ ) {
							//projectile
							trace('FIRE....');
							weapon[w].projectile[p].x = x+16;
							weapon[w].projectile[p].y = y+4;
							weapon[w].projectile[p].z = z;
							//need to set it for render iusses
							weapon[w].projectile[p].mesh.x = x+16;
							weapon[w].projectile[p].mesh.y = y+4;
							weapon[w].projectile[p].mesh.z = z;
							
							weapon[w].projectile[p].angle = angle;
							weapon[w].projectile[p].balive = true;
							weapon[w].projectile[p].ownerentity = mesh.name;
							//weapon[w].projectile[p].
							
							if(view != null){
								view.scene.addChild(weapon[w].projectile[p].mesh);
								weapon[w].projectile[p].mesh.visible = true;
								var bprojetfound:Boolean = false;
								//this deal with same object class loop
								for (var ip:int = 0; ip < projectile.length; ip++ ) {
									if (projectile[ip] == weapon[w].projectile[p]) {
										bprojetfound = true;
										break;
									}
								}
								
								if(!bprojetfound){
									projectile.push(weapon[w].projectile[p]);
								}
								trace('projectile:'+projectile.length);
							}
						}
					}
				}
			///}
			
		}
	}
	
}