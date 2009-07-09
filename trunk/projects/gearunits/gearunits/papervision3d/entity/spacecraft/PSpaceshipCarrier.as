package gearunits.papervision3d.entity.spacecraft 
{
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class PSpaceshipCarrier extends PSpaceship
	{
		public static const NAME:String = 'PSpaceshipCarrier';
		
		public function PSpaceshipCarrier() 
		{
			type.push( { name:'carrier' } );
			type.push( { name:'deployablespaceship', bdeploy:false } );
		}
		
	}
	
}