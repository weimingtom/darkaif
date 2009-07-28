package gearunits.away3d.entity.weapon 
{
	import gearunits.away3d.entity.projectile.AProjectile;
	import gearunits.away3d.entity.projectile.AProjectileBullet;
	import gearunits.models.AMeshBaseLauncher;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class AWeaponBaseRocket extends AWeaponBaseLauncher
	{
		
		public function AWeaponBaseRocket() 
		{
			mesh = new AMeshBaseLauncher();
			
			name = 'AWeaponBaseRocket';
			timemax = 10;
			detectrange = 128;
			//TurnSpeed = 5;
			
			var projetileammo:AProjectile;
			projetileammo = new AProjectileBullet();
			projetileammo.damage = 10;
			projetileammo.speed = 3;
			
			//firepoint.z = 18;
			offsetlengthfire = 32;
			projectile.push(projetileammo);
		}
		
	}
	
}