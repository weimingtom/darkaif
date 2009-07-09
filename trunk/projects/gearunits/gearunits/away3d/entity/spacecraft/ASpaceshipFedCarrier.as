package gearunits.away3d.entity.spacecraft 
{
	import gearunits.away3d.entity.AEntityPoint3D;
	import gearunits.models.AMeshSpacecraftFedCarrier;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class ASpaceshipFedCarrier extends ASpaceshipCarrier
	{
		public static const NAME:String = 'FedCarrier';
		public static const TYPE:String = 'Spaceship';
		
		public function ASpaceshipFedCarrier() 
		{
			name = 'FedCarrier';
			mesh = new AMeshSpacecraftFedCarrier();
			movespeed = 5;
			spawntime = 60;
			
			var pointentity:AEntityPoint3D;
			pointentity = new AEntityPoint3D();
			pointentity.bexit = true;
			pointentity.z = 160;
			entityPoint.push(pointentity);
		}
		
	}
	
}