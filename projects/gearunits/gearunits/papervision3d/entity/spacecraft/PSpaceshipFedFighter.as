package gearunits.papervision3d.entity.spacecraft 
{
	import gearunits.models.PMeshSpacecraftFedFighter;
	import org.papervision3d.materials.ColorMaterial;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class PSpaceshipFedFighter extends PSpaceshipFighter
	{
		
		public function PSpaceshipFedFighter() 
		{
			mesh = new PMeshSpacecraftFedFighter(new ColorMaterial(0x0FFFF00));
		}
		
	}
	
}