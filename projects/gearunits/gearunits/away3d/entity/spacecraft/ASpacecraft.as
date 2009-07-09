package gearunits.away3d.entity.spacecraft 
{
	import gearunits.away3d.entity.AStructureUnit;
	
	/**
	 * ...
	 * @author Darknet
	 * 
	 * Information: Need to work on some code to deal with basic lag reduce some how.
	 * 
	 */
	public class ASpacecraft extends AStructureUnit
	{
		public static const NAME:String = 'ASpacecraft';
		public static const TYPE:String = 'Spacecraft';
		
		public function ASpacecraft() 
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
			
			//AI BUILD TEST
			if (order == 'move') {
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
									queryunit[0].y = x + entityPoint[i].y;
									queryunit[0].z = x + entityPoint[i].z;
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
								for (var ii:int = 0; ii < entityPoint.length;ii++ ) {
									unit[0].x = x + entityPoint[ii].x;
									unit[0].y = y + entityPoint[ii].y;
									unit[0].z = x + entityPoint[ii].z;
								}
								if(view != null){
									//unitfun(unit[li].unit[0]);//build function
									trace('spawn...');
									view.scene.addChild(unit[0].mesh);
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