package gearunits.entity.infantry 
{
	import gearunits.entity.weapon.WeaponAssaultRifle;
	import sandy.materials.Appearance;
	import sandy.materials.ColorMaterial;
	import sandy.materials.Material;
	import sandy.primitive.Box;
	/**
	 * ...
	 * @author Darknet
	 */
	public class UnitBlock extends Infantry
	{
		
		public function UnitBlock() 
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
			var weaponassaultrifle:WeaponAssaultRifle = new WeaponAssaultRifle();
			weapon.push(weaponassaultrifle);
		}
		
	}
	
}