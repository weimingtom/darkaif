package gearunits.away3d.entity.weapon 
{
	import gearunits.away3d.entity.projectile.AProjectile;
	import gearunits.away3d.entity.projectile.AProjectileBullet;
	
	/**
	 * ...
	 * @author Darknet
	 * 
	 * information: base sub MAIN TEMPLATE
	 * 
	 */
	public class AWeaponAssaultRifle extends AWeapon
	{
		
		public function AWeaponAssaultRifle() 
		{
			name = 'AssaultRifle';
			timemax = 100;
			
			var projetileammo:AProjectile;
			projetileammo = new AProjectileBullet();
			projetileammo.damage = 10;
			projectile.push(projetileammo);
		}
		
	}
	
}