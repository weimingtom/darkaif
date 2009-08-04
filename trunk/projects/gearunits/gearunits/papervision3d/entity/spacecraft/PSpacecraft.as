package gearunits.papervision3d.entity.spacecraft 
{
	import gearunits.papervision3d.entity.PStructureUnit;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class PSpacecraft extends PStructureUnit
	{
		public static const NAME:String = 'PSpacecraft';
		
		public function PSpacecraft() 
		{
			type.push({name:'spacecraft'});
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
			
			if (units != null) {
				var collisionpoint:Boolean = false;
				var bobjectcollision:Boolean = false;
				for (var c:int = 0; c < units.length; c++ ) {
					//trace('check sollision...' + units[c].id);
					if (( id != units[c].id) && (units[c].collisionmesh != null) ) {
						if (ismeshintersect(units[c])) {
							//trace('collision other objects...'+units[c].id);
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
								scene.removeChildByName(mesh.name);
							}
							/*
							if(iconhud != null){
								scene.removeChildByName(iconhud.name);
							}
							*/
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
			
			for (var t:int = 0; t < type.length; t++ ) {
				//spawn ship
				if (type[t].name == 'shipyard') {
					if (queryunit.length) {
						trace('there ships in query...');
						queryunit[0].time++;
						if (queryunit[0].time > queryunit[0].spawntime) {
							queryunit[0].time = 0;
							//check if global view is there
							if (scene != null) {
								//check point to exit
								for (var i:int = 0; i < entityPoint.length;i++ ) {
									queryunit[0].x = x + entityPoint[i].x;
									queryunit[0].y = x + entityPoint[i].y;
									queryunit[0].z = x + entityPoint[i].z;
								}
								scene.addChild(queryunit[0].mesh);
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
								for (var ii:int = 0; ii < entityPoint.length;ii++ ) {
									unit[0].x = x + entityPoint[ii].x;
									unit[0].y = y + entityPoint[ii].y;
									unit[0].z = x + entityPoint[ii].z;
								}
								if(scene != null){
									//unitfun(unit[li].unit[0]);//build function
									trace('spawn...');
									scene.addChild(unit[0].mesh);
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