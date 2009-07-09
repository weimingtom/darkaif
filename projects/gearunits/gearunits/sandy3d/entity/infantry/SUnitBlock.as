package gearunits.sandy3d.entity.infantry 
{
	import gearunits.sandy3d.entity.weapon.SWeaponAssaultRifle;
	import sandy.materials.Appearance;
	import sandy.materials.ColorMaterial;
	import sandy.materials.Material;
	import sandy.primitive.Box;
	/**
	 * ...
	 * @author Darknet
	 */
	public class SUnitBlock extends SInfantry
	{
		public static const NAME:String = 'SUnitBlock';
		public function SUnitBlock() 
		{
			name = 'Soldier';
			classtype = 'Soldier';
			movespeed = 1;
			spawntime = 100;
			
			var material:Material = new ColorMaterial(0xadff2f);
			var appearance:Appearance = new Appearance(material);
			mesh = new Box(null,32,32,32);
			mesh.appearance = appearance;
			mesh.enableForcedDepth = true;
			mesh.depth = 1;
			var weaponassaultrifle:SWeaponAssaultRifle = new SWeaponAssaultRifle();
			weapon.push(weaponassaultrifle);
		}
		
	}
	
}