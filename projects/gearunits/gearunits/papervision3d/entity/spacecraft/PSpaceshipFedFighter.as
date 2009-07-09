﻿package gearunits.papervision3d.entity.spacecraft 
{
	import gearunits.models.PMeshSpacecraftFedFighter;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.materials.special.CompositeMaterial;
	import org.papervision3d.materials.WireframeMaterial;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class PSpaceshipFedFighter extends PSpaceshipFighter
	{
		public static const NAME:String = 'PSpaceshipFedFighter';
		
		public function PSpaceshipFedFighter() 
		{
			name = 'PSpaceshipFedFighter';
			var matcolor:ColorMaterial =  new ColorMaterial(0x0FFFF00);
			var matwirecolor:WireframeMaterial = new WireframeMaterial(0x000000);
			var compMat:CompositeMaterial = new CompositeMaterial();
			compMat.addMaterial(matcolor);
			compMat.addMaterial(matwirecolor);
			compMat.interactive = true;
			
			
			mesh = new PMeshSpacecraftFedFighter(compMat);
			movespeed = 2;
			spawntime = 10;
		}
		
	}
	
}