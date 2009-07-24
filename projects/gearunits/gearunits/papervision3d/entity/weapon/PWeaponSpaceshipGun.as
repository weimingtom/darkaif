package gearunits.papervision3d.entity.weapon 
{
	import gearunits.papervision3d.entity.projectile.PProjectile;
	import gearunits.papervision3d.entity.projectile.PProjectileBullet;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class PWeaponSpaceshipGun extends PWeapon
	{
		
		public function PWeaponSpaceshipGun() 
		{
			name = 'AWeaponSpaceshipGun';
			timemax = 10;
			
			var projetileammo:PProjectile;
			projetileammo = new PProjectileBullet();
			projetileammo.damage = 10;
			projetileammo.speed = 3;
			
			firepoint.z = 18;
			offsetlengthfire = 32;
			projectile.push(projetileammo);
		}
		
	}
	
}