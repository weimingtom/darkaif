package gearunits.papervision3d.entity.building 
{
	import gearunits.models.PMeshBuildingMechFactory;
	import gearunits.papervision3d.entity.PEntityPoint3D;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.materials.special.CompositeMaterial;
	import org.papervision3d.materials.WireframeMaterial;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class PBuildingMechFactory extends PBuilding
	{
		public static const NAME:String = 'PBuildingMechFactory';
		
		public function PBuildingMechFactory() 
		{
			var matcolor:ColorMaterial =  new ColorMaterial(0x00CC00);
			var matwirecolor:WireframeMaterial = new WireframeMaterial(0x000000);
			var compMat:CompositeMaterial = new CompositeMaterial();
			compMat.addMaterial(matcolor);
			compMat.addMaterial(matwirecolor);
			compMat.interactive = true;
			
			mesh = new PMeshBuildingMechFactory(new ColorMaterial(0x00CC00));
			
			var entpoint:PEntityPoint3D;
			entpoint = new PEntityPoint3D();
			entpoint.x = 0;
			entpoint.y = 0;
			entpoint.z = -32;
			entpoint.bexit = true;
			entityPoint.push(entpoint);
		}
		
	}
	
}