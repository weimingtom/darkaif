﻿package gearunits.papervision3d.entity.building 
{
	import gearunits.models.PMeshBuildingOreRefinery;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.materials.special.CompositeMaterial;
	import org.papervision3d.materials.WireframeMaterial;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class PBuildingOreRefinery extends PBuilding
	{
		public static const NAME:String = 'PBuildingOreRefinery';
		
		public function PBuildingOreRefinery() 
		{
			var matcolor:ColorMaterial =  new ColorMaterial(0x00CC00);
			var matwirecolor:WireframeMaterial = new WireframeMaterial(0x000000);
			var compMat:CompositeMaterial = new CompositeMaterial();
			compMat.addMaterial(matcolor);
			compMat.addMaterial(matwirecolor);
			compMat.interactive = true;
			
			mesh = new PMeshBuildingOreRefinery(new ColorMaterial(0x00CC00));
		}
		
	}
	
}