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