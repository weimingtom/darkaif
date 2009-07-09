package gearunits.papervision3d.entity.infantry 
{
	import org.papervision3d.objects.primitives.Cube;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.materials.utils.MaterialsList;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class PUnitBlock extends PInfantry
	{
		
		public function PUnitBlock() 
		{
			var matlist:MaterialsList = new MaterialsList( { all:new ColorMaterial(0x00CC00) } );
			mesh = new Cube(matlist, 32, 32, 32);
			
			movespeed = 2;
		}
		
	}
	
}