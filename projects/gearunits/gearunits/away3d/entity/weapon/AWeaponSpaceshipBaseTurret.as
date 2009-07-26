package gearunits.away3d.entity.weapon 
{
	import gearunits.away3d.entity.projectile.AProjectile;
	import gearunits.away3d.entity.projectile.AProjectileBullet;
	import gearunits.models.AMeshBaseTurret;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class AWeaponSpaceshipBaseTurret extends AWeaponTurret
	{
		
		public function AWeaponSpaceshipBaseTurret() 
		{
			mesh = new AMeshBaseTurret();
			//var mesh:AMeshBaseTurret = new AMeshBaseTurret();
			//trace(mesh.vertices.length);
			
			
			name = 'AWeaponSpaceshipGun';
			timemax = 10;
			detectrange = 164;
			TurnSpeed = 5;
			
			var projetileammo:AProjectile;
			projetileammo = new AProjectileBullet();
			projetileammo.damage = 10;
			projetileammo.speed = 3;
			
			firepoint.z = 18;
			offsetlengthfire = 32;
			projectile.push(projetileammo);
		}
		
	}
	
}