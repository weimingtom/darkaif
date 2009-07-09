package gearunits.papervision3d.entity.building 
{
	import gearunits.papervision3d.entity.PStructureUnit;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class PBuilding extends PStructureUnit
	{
		public static const NAME:String = 'PBuilding';
		
		public function PBuilding() 
		{
			type.push({name:'Building'});
		}
		
		override public function update():void {
			super.update();
			for (var i:int = 0; i < type.length; i++ ) {
				if (type[i].name == 'Infantry') {
					if (queryunit.length) {
						queryunit[0].time++;
						if (queryunit[0].time > queryunit[0].spawntime) {
							queryunit[0].time = 0;
							if (scene != null) {
								trace('EXIT POINT:'+entityPoint.length);
								for (var e:int = 0; e < entityPoint.length;e++ ) {
									queryunit[0].x = x + entityPoint[e].x;
									queryunit[0].y = y + entityPoint[e].y;
									queryunit[0].z = z + entityPoint[e].z;
								}
								scene.addChild(queryunit[0].mesh);
								units.push(queryunit[0]);
								queryunit.splice(0, 1);
							}
						}
					}
				}
			}
		}
	}
	
}