package gearunits.away3d.entity.spacecraft 
{
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class ASpacestation extends ASpacecraft
	{
		public static const NAME:String = 'ASpacestation';
		public static const TYPE:String = 'Spacestation';
		
		public function ASpacestation() 
		{
			type.push({name:'spacestation'});
		}
		
	}
	
}