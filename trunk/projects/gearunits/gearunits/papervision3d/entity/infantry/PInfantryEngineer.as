package gearunits.papervision3d.entity.infantry 
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
	public class PInfantryEngineer extends PInfantry
	{
		public static const NAME:String = 'PInfantryEngineer';
		
		public function PInfantryEngineer() 
		{
			var matcolor:ColorMaterial =  new ColorMaterial(0x0FFFF00);
			var matwirecolor:WireframeMaterial = new WireframeMaterial(0x000000);
			var compMat:CompositeMaterial = new CompositeMaterial();
			compMat.addMaterial(matcolor);
			compMat.addMaterial(matwirecolor);
			compMat.interactive = true;
			
			var matlist:MaterialsList = new MaterialsList( { all:compMat } );
			mesh = new Cube(matlist, 16, 16, 16);
			movespeed = 2;
			spawntime = 10;
		}
		
	}
	
}