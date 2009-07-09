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
		
	}
	
}