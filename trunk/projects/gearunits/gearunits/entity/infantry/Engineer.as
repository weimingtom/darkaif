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
	public class Engineer extends Infantry
	{
		
		public function Engineer() 
		{
			name = 'Engineer';
			classtype = 'Engineer';
			movespeed = 1;
			
			var material:Material = new ColorMaterial(0xadff2f);
			var appearance:Appearance = new Appearance(material);
			mesh = new Box();
			mesh.appearance = appearance;
			var weaponassaultrifle:WeaponAssaultRifle = new WeaponAssaultRifle();
			weapon.push(weaponassaultrifle);
			
		}
		
	}
	
}