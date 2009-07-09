package gearunits.papervision3d.entity.building 
{
	import gearunits.models.PMeshBuildingBarrack;
	import gearunits.papervision3d.entity.PEntityPoint3D;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.materials.special.CompositeMaterial;
	import org.papervision3d.materials.WireframeMaterial;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class PBuildingBarrack extends PBuilding
	{
		public static const NAME:String = 'PBuildingBarrack';
		
		public function PBuildingBarrack() 
		{
			var matcolor:ColorMaterial =  new ColorMaterial(0x00CC00);
			var matwirecolor:WireframeMaterial = new WireframeMaterial(0x000000);
			var compMat:CompositeMaterial = new CompositeMaterial();
			compMat.addMaterial(matcolor);
			compMat.addMaterial(matwirecolor);
			compMat.interactive = true;
			
			mesh = new PMeshBuildingBarrack(compMat);
			
			type.push({name:'Infantry'});
			
			var entpoint:PEntityPoint3D;
			entpoint = new PEntityPoint3D();
			entpoint.x = 0;
			entpoint.y = 0;
			entpoint.z = 32;
			entpoint.bexit = true;
			entityPoint.push(entpoint);
		}
		
	}
	
}