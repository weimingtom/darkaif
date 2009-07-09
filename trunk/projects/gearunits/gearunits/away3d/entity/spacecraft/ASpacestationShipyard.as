package gearunits.away3d.entity.spacecraft 
{
	/**
	 * ...
	 * @author Darknet
	 */
	public class ASpacestationShipyard extends ASpacestation
	{
		public static const NAME:String = 'ASpacestationShipyard';
		public static const TYPE:String = 'Spacestation';
		
		public function ASpacestationShipyard() 
		{
			type.push( { name:'shipyard' } );
			
		}
		
		override public function update():void {
			super.update();
			/* //miss some listener event added for select unit stuff
			if (queryunit.length) {
				trace('there ships in query...');
				queryunit[0].time++;
				if (queryunit[0].time > queryunit[0].spawntime) {
					queryunit[0].time = 0;
					
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
			*/
		}
	}
	
}