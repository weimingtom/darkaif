package gearunits.entity.infantry 
{
	import gearunits.entity.StructureUnit;
	import gearunits.entity.weapon.WeaponAssaultRifle;
	import sandy.materials.Appearance;
	import sandy.materials.ColorMaterial;
	import sandy.materials.Material;
	import sandy.primitive.Box;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class Solider extends Infantry
	{
		
		public function Solider() 
		{
			var material:Material = new ColorMaterial(0xadff2f);
			var appearance:Appearance = new Appearance(material);
			mesh = new Box();
			mesh.appearance = appearance;
			classtype = 'Solider';
			
			var weaponassaultrifle:WeaponAssaultRifle = new WeaponAssaultRifle();
			weapon.push(weaponassaultrifle);
		}
		
	}
	
}