package gearunits.papervision3d.entity.spacecraft 
{
	import gearunits.models.PMeshSpacestationFedShipYard;
	import org.papervision3d.materials.ColorMaterial;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class PSpacestationFedShipyard extends PSpacestation
	{
		
		public function PSpacestationFedShipyard() 
		{
			mesh = new PMeshSpacestationFedShipYard(new ColorMaterial(0x0FFFF00));
		}
		
	}
	
}