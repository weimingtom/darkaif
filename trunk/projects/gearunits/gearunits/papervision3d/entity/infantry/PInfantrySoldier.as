package gearunits.papervision3d.entity.infantry 
{
	import gearunits.papervision3d.entity.weapon.PWeapon;
	import gearunits.papervision3d.entity.weapon.PWeaponAssaultRifle;
	import org.papervision3d.materials.special.CompositeMaterial;
	import org.papervision3d.materials.WireframeMaterial;
	import org.papervision3d.objects.primitives.Cube;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.materials.utils.MaterialsList;
	/**
	 * ...
	 * @author Darknet
	 */
	public class PInfantrySoldier extends PInfantry
	{
		public static const NAME:String = 'PInfantrySoldier';
		
		public function PInfantrySoldier() 
		{
			var matcolor:ColorMaterial =  new ColorMaterial(0x00CC00);
			var matwirecolor:WireframeMaterial = new WireframeMaterial(0x000000);
			var compMat:CompositeMaterial = new CompositeMaterial();
			compMat.addMaterial(matcolor);
			compMat.addMaterial(matwirecolor);
			compMat.interactive = true;
			
			var matlist:MaterialsList = new MaterialsList( { all:compMat } );
			mesh = new Cube(matlist, 16, 16, 16);
			movespeed = 2;
			spawntime = 10;
			
			var weap:PWeapon;
			weap = new PWeaponAssaultRifle();
			weapon.push(weap);
		}
		
	}
	
}