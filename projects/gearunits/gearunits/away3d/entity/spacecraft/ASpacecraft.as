package gearunits.away3d.entity.spacecraft 
{
	import flash.geom.Matrix3D;
	import flash.geom.Vector3D;
	import gearunits.away3d.entity.AStructureUnit;
	
	/**
	 * ...
	 * @author Darknet
	 * 
	 * Information: Need to work on some code to deal with basic lag reduce some how.
	 * 
	 * Notes:
	 * Error in remove object if looop with null error.
	 * 
	 */
	public class ASpacecraft extends AStructureUnit
	{
		public static const NAME:String = 'ASpacecraft';
		public static const TYPE:String = 'Spacecraft';
		
		public function ASpacecraft() {
			
			type.push({name:'spacecraft'});
		}
		
		override public function update():void {
			super.update();
			
			if (units != null) {
				var collisionpoint:Boolean = false;
				var bobjectcollision:Boolean = false;
				for (var c:int = 0; c < units.length; c++ ) {
					if (( id != units[c].id) && (units[c].collisionmesh != null) ) {
						if (ismeshintersect(units[c])) {
							trace('collision other objects...');
							bobjectcollision = true;
						}
						//check if the object just spawn from the entery point and do not let is load into the unit(ship)
						if ((ismeshintersectentitypoint(units[c]) == true) && (balive == true) && (bjustspawn == true)) {
							collisionpoint = true;
						}
						//loop object with entity points
						if ((ismeshintersectentitypoint(units[c]) == true)&&(balive == true)&&(bjustspawn == false)) {
							//trace('entity collision...');
							balive = false;
							if(mesh != null){
								view.scene.removeChildByName(mesh.name);
							}
							if(iconhud != null){
								view.scene.removeChildByName(iconhud.name);
							}
							units[c].unit.push(this); //push into the units that carry it
							for (var ui:int = 0; ui < units.length;ui++ ) {//remove from main unit
								if (units[ui] == this) {//if object is matches this class then remove it from unit
									units.splice(ui, 1);
									break;
								}
							}
							//units.splice(c, 1);
						}
						
					}
				}
				if (bobjectcollision) {
					bhit = true;
				}else {
					bhit = false;
				}
				
				//trace('collision point:'+collisionpoint);
				//this make sure the spawn will not over lap the spawn and loading
				//when player leave the entery point the is a timer will set the spawn to false
				if ((bjustspawn == true) && (collisionpoint != true)&&(balive == true)) {
					//trace('----' + collisionpoint);
					justspawntime++;
					if (justspawntime > justspawntimemax) {
						justspawntime = 0;
						bjustspawn = false;
					}
				}
			}
			
			//AI BUILD TEST
			if (order == 'move') {
				velocity.x = movespeed * Math.sin(_rotation.y* Math.PI / 180);
				velocity.z = movespeed * Math.cos(_rotation.y * Math.PI / 180);
				
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
			
			/*
			//WEAPON SYSTEM
			//if () { //check if bot ai for firing at the target
				//FIRE WEAPON
				for (var w:int = 0; w < weapon.length; w++ ) {
					weapon[w].time++;
					if (weapon[w].time > weapon[w].timemax) {
						weapon[w].time = 0;
						for (var p:int = 0; p < weapon[w].projectile.length;p++ ) {
							//projectile
							trace('FIRE....');
							weapon[w].projectile[p].x = x;
							weapon[w].projectile[p].y = y;
							weapon[w].projectile[p].z = z;
							//need to set it for render iusses
							weapon[w].projectile[p].mesh.x = x;
							weapon[w].projectile[p].mesh.y = y;
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
			*/
			
			//TYPE COMMAND
			for (var t:int = 0; t < type.length; t++ ) {
				//spawn ship
				if (type[t].name == 'shipyard') {
					if (queryunit.length) {
						trace('there ships in query...');
						queryunit[0].time++;
						if (queryunit[0].time > queryunit[0].spawntime) {
							queryunit[0].time = 0;
							//check if global view is there
							if (view != null) {
								//check point to exit
								for (var i:int = 0; i < entityPoint.length;i++ ) {
									queryunit[0].x = x + entityPoint[i].x;
									queryunit[0].y = y + entityPoint[i].y;
									queryunit[0].z = z + entityPoint[i].z;
								}
								
								view.scene.addChild(queryunit[0].mesh);
								units.push(queryunit[0]);
								queryunit.splice(0,1);
							}
						}
					}
				}
				
				if (type[t].name == 'deployablespaceship') {
					if(type[t].bdeploy == true){
						if (unit.length) {
							unit[0].time++;
							
							if (unit[0].time > unit[0].launchtime) {
								unit[0].time = 0;
								//check point to exit
								
								for (var ep:int = 0; ep < entityPoint.length; ep++ ) {
									var m:Matrix3D = new Matrix3D();
									m.position = new Vector3D(entityPoint[ep].x, entityPoint[ep].y,entityPoint[ep].z)
									m.appendRotation(_rotation.y, new Vector3D(0, 1, 0));
									unit[0].x =x+ m.position.x;
									unit[0].y =y+ m.position.y;
									unit[0].z =z+ m.position.z;
								}
								
								if(view != null){
									//unitfun(unit[li].unit[0]);//build function
									//trace('spawn spaceship...');
									unit[0].rotation.y = _rotation.y;//need to work on direction spawn
									unit[0].balive = true;
									unit[0].bjustspawn = true;
									view.scene.addChild(unit[0].mesh);
									if (unit[0].iconhud != null) {
										view.scene.addChild(unit[0].iconhud);
									}
									
									units.push(unit[0]);
									unit.splice(0, 1);
								}	
							}
						}else{
							type[t].bdeploy = false;
						}
					}
				}
				
				
			}	
		}
	}
	
}