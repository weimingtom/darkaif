package gearunits.away3d.entity.spacecraft 
{
	import gearunits.away3d.entity.weapon.AWeapon;
	import gearunits.away3d.entity.weapon.AWeaponSpaceshipGun;
	import gearunits.models.AMeshSpacecraftFedFighter;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class ASpaceshipFedFighter extends ASpaceshipFighter
	{
		
		public static const NAME:String = 'FedFighter';
		public static const TYPE:String = 'Spaceship';
		
		public function ASpaceshipFedFighter() 
		{
			name = 'FedFighter';
			mesh = new AMeshSpacecraftFedFighter();
			movespeed = 4;
			TurnSpeed = 5;
			spawntime = 30;
			
			var weap:AWeapon;
			weap = new AWeaponSpaceshipGun();
			//weap.z = 16;
			weap.offsetlengthfire = 16;
			weapon.push(weap);
		}
		
	}
	
}