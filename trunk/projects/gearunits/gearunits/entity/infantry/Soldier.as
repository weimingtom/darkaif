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
	 * 
	 * Information: Beware the code need to be all in there. Any missing information it will cause an event error.
	 * 
	 */
	public class Soldier extends Infantry
	{
		
		public function Soldier() 
		{
			name = 'Soldier';
			classtype = 'Soldier';
			movespeed = 1;
			spawntime = 100;
			
			var material:Material = new ColorMaterial(0xadff2f);
			var appearance:Appearance = new Appearance(material);
			mesh = new Box();
			mesh.appearance = appearance;
			var weaponassaultrifle:WeaponAssaultRifle = new WeaponAssaultRifle();
			weapon.push(weaponassaultrifle);
		}
		
	}
	
}