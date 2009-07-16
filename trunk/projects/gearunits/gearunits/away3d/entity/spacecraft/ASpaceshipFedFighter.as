package gearunits.away3d.entity.spacecraft 
{
	import gearunits.away3d.entity.weapon.AWeapon;
	import gearunits.away3d.entity.weapon.AWeaponSpaceshipGun;
	import gearunits.models.AMeshSpacecraftFedFighter;
	import gearunits.models.AMeshSpacecraftFedFighter_Box;
	
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
			collisionmesh = new AMeshSpacecraftFedFighter_Box();
			mesh.debugBoundingBox;
			movespeed = 4;
			TurnSpeed = 5;
			spawntime = 30;
			
			//mesh.debugbb = true;
			
			//trace(mesh.debugBoundingBox);
			
			setbox(32, 32, 32);
			/*
			min.x = -16;
			min.y = -16;
			min.z = -16;
			
			max.x = 16;
			max.y = 16;
			max.z = 16;
			*/
			
			var weap:AWeapon;
			weap = new AWeaponSpaceshipGun();
			//weap.z = 16;
			weap.offsetlengthfire = 16;
			weapon.push(weap);
		}
		
	}
	
}