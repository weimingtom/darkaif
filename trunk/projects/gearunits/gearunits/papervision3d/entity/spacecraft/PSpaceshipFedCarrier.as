package gearunits.papervision3d.entity.spacecraft 
{
	import gearunits.models.PMeshSpacecraftFedCarrier;
	import gearunits.papervision3d.entity.PEntityPoint3D;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.materials.special.CompositeMaterial;
	import org.papervision3d.materials.WireframeMaterial;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class PSpaceshipFedCarrier extends PSpaceshipCarrier
	{
		public static const NAME:String = 'PSpaceshipFedCarrier';
		
		public function PSpaceshipFedCarrier() 
		{
			var matcolor:ColorMaterial =  new ColorMaterial(0x0FFFF00);
			var matwirecolor:WireframeMaterial = new WireframeMaterial(0x000000);
			var compMat:CompositeMaterial = new CompositeMaterial();
			compMat.addMaterial(matcolor);
			compMat.addMaterial(matwirecolor);
			compMat.interactive = true;
			mesh = new PMeshSpacecraftFedCarrier(compMat);
			movespeed = 2;
			spawntime = 10;
			
			var pointentity:PEntityPoint3D;
			pointentity = new PEntityPoint3D();
			pointentity.bexit = true;
			pointentity.z = 160;
			entityPoint.push(pointentity);
		}
		
	}
	
}