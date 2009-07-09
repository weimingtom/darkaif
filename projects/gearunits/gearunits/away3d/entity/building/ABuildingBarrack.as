package gearunits.away3d.entity.building 
{
	import gearunits.away3d.entity.AEntityPoint3D;
	import gearunits.models.AMeshBuildingBarrack;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class ABuildingBarrack extends ABuilding
	{
		public static const NAME:String = 'ABuildingBarrack';
		public static const TYPE:String = 'Building';
		
		public function ABuildingBarrack() 
		{
			name = 'Barracks';
			mesh = new AMeshBuildingBarrack();
			type.push({name:'Infantry'});
			
			var entpoint:AEntityPoint3D;
			entpoint = new AEntityPoint3D();
			entpoint.x = 0;
			entpoint.y = 0;
			entpoint.z = 32;
			entpoint.bexit = true;
			entityPoint.push(entpoint);
			
		}
		
		override public function update():void {
			super.update();
			for (var i:int = 0; i < type.length; i++ ) {
				if (type[i].name == 'Infantry') {
					if (queryunit.length) {
						queryunit[0].time++;
						if (queryunit[0].time > queryunit[0].spawntime) {
							queryunit[0].time = 0;
							if (view != null) {
								trace('EXIT POINT:'+entityPoint.length);
								for (var e:int = 0; e < entityPoint.length;e++ ) {
									queryunit[0].x = x + entityPoint[e].x;
									queryunit[0].y = y + entityPoint[e].y;
									queryunit[0].z = z + entityPoint[e].z;
								}
								view.scene.addChild(queryunit[0].mesh);
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