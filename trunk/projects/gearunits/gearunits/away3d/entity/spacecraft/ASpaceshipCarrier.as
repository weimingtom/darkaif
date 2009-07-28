package gearunits.away3d.entity.spacecraft 
{
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class ASpaceshipCarrier extends ASpaceship
	{
		public static const NAME:String = 'ASpaceshipCarrier';
		public static const TYPE:String = 'Spaceship';
		
		public function ASpaceshipCarrier() 
		{
			type.push( { name:'carrier' } );
			type.push( { name:'deployablespaceship', bdeploy:false } );
		}
		
		override public function update():void {
			super.update();
			/*
			for (var i:int = 0; i < weapon.length; i++ ) {
				if (BWEAPONFIRE == true) {
					weapon[i].PRESSFIRE = true;
				}else {
					weapon[i].PRESSFIRE = false;
				}
				weapon[i].objectid = String(id);
				weapon[i].objectangle  = rotation; //current ship rotation
				weapon[i].objectpoint = point;//current ship rotation
				weapon[i].update();
			}
			*/
		}
		
	}
	
}