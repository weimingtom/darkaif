package gearunits.away3d.entity.weapon 
{
	import gearunits.away3d.entity.projectile.AProjectile;
	import gearunits.away3d.entity.projectile.AProjectileBullet;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class AWeaponSpaceshipGun extends AWeapon
	{
		
		public function AWeaponSpaceshipGun() 
		{
			name = 'AWeaponSpaceshipGun';
			timemax = 10;
			
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