package gearunits.papervision3d.entity.spacecraft 
{
	import gearunits.models.PMeshSpacecraftFedCarrier;
	import org.papervision3d.materials.ColorMaterial;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class PSpaceshipFedCarrier extends PSpaceshipCarrier
	{
		
		public function PSpaceshipFedCarrier() 
		{
			mesh = new PMeshSpacecraftFedCarrier(new ColorMaterial(0x0FFFF00));
		}
		
	}
	
}