package gearunits.away3d.entity.spacecraft 
{
	import gearunits.models.AMeshSpacecraftFedFighter;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class ASpaceshipFedFighter extends ASpaceshipFighter
	{
		
		public static const NAME:String = 'FedFighter';
		public static const TYPE:String = 'Spaceship';
		
		public function ASpaceshipFedFighter() 
		{
			name = 'FedFighter';
			mesh = new AMeshSpacecraftFedFighter();
			movespeed = 4;
			spawntime = 30;
		}
		
	}
	
}