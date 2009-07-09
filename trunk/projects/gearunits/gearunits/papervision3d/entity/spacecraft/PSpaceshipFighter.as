package gearunits.papervision3d.entity.spacecraft 
{
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class PSpaceshipFighter extends PSpaceship
	{
		public static const NAME:String = 'PSpaceshipFighter';
		
		public function PSpaceshipFighter() 
		{
			name = 'PSpaceshipFighter';
			type.push({name:'fighter'});
		}
		
	}
	
}