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
	 * 
	 * Information: Beware the code need to be all in there. Any missing information it will cause an event error.
	 */
	public class SEngineer extends SInfantry
	{
		public static const NAME:String = 'SEngineer';
		public function SEngineer() 
		{
			name = 'Engineer';
			classtype = 'Engineer';
			movespeed = 1;
			spawntime = 100;
			
			var material:Material = new ColorMaterial(0xadff2f);
			var appearance:Appearance = new Appearance(material);
			mesh = new Box();
			mesh.appearance = appearance;
			var weaponassaultrifle:SWeaponAssaultRifle = new SWeaponAssaultRifle();
			weapon.push(weaponassaultrifle);
			
		}
		
	}
	
}