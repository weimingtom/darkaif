package gearunits.papervision3d.entity.building 
{
	import org.papervision3d.materials.special.CompositeMaterial;
	import org.papervision3d.materials.WireframeMaterial;
	import org.papervision3d.objects.primitives.Cube;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.materials.utils.MaterialsList;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class PBuildingWall extends PBuilding
	{
		public static const NAME:String = 'PBuildingWall';
		
		public function PBuildingWall() 
		{
			var matcolor:ColorMaterial =  new ColorMaterial(0x999999);
			var matwirecolor:WireframeMaterial = new WireframeMaterial(0x000000);
			var compMat:CompositeMaterial = new CompositeMaterial();
			compMat.addMaterial(matcolor);
			compMat.addMaterial(matwirecolor);
			compMat.interactive = true;
			var matlist:MaterialsList = new MaterialsList( { all:compMat } );
			mesh = new Cube(matlist, 32, 32, 32);
		}
		
	}
	
}