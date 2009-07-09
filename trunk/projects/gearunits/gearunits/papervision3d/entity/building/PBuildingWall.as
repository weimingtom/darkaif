package gearunits.papervision3d.entity.building 
{
	import org.papervision3d.objects.primitives.Cube;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.materials.utils.MaterialsList;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class PBuildingWall extends PBuilding
	{
		
		public function PBuildingWall() 
		{
			var matlist:MaterialsList = new MaterialsList( { all:new ColorMaterial(0x999999) } );
			mesh = new Cube(matlist, 32, 32, 32);
		}
		
	}
	
}