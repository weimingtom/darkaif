﻿package gearunits.papervision3d.entity.spacecraft 
{
	import gearunits.models.PMeshSpacestationFedShipYard;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.materials.special.CompositeMaterial;
	import org.papervision3d.materials.WireframeMaterial;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class PSpacestationFedShipyard extends PSpacestationShipyard
	{
		public static const NAME:String = 'PSpacestationFedShipyard';
		
		public function PSpacestationFedShipyard() 
		{
			name = 'PSpacestationFedShipyard';
			var matcolor:ColorMaterial =  new ColorMaterial(0x0FFFF00);
			var matwirecolor:WireframeMaterial = new WireframeMaterial(0x000000);
			var compMat:CompositeMaterial = new CompositeMaterial();
			compMat.addMaterial(matcolor);
			compMat.addMaterial(matwirecolor);
			compMat.interactive = true;
			
			mesh = new PMeshSpacestationFedShipYard(compMat);
		}
		
	}
	
}