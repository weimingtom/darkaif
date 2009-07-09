package gearunits.away3d.entity.infantry 
{
	import away3d.primitives.Cube;
	import gearunits.away3d.entity.weapon.AWeapon;
	import gearunits.away3d.entity.weapon.AWeaponAssaultRifle;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class AInfantrySoldier extends AInfantry
	{
		public static const NAME:String = 'AInfantrySoldier';
		public static const TYPE:String = 'Infantry';
		
		public function AInfantrySoldier() 
		{
			name = 'Engineer';
			mesh = new Cube( { height:16, width:16, depth:16 } );
			spawntime = 10;
			movespeed = 2;
			
			var weap:AWeapon;
			weap = new AWeaponAssaultRifle();
			weapon.push(weap);
			
		}
	}
}