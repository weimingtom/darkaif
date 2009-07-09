package gearunits.papervision3d.entity.weapon 
{
	import gearunits.papervision3d.entity.projectile.PProjectile;
	import gearunits.papervision3d.entity.projectile.PProjectileBullet;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class PWeaponAssaultRifle extends PWeapon
	{
		public static const NAME:String = 'PWeaponAssaultRifle';
		
		public function PWeaponAssaultRifle() 
		{
			name = 'AssaultRifle';
			timemax = 100;
			
			var projetileammo:PProjectile;
			projetileammo = new PProjectileBullet();
			projetileammo.damage = 10;
			projectile.push(projetileammo);
		}
		
	}
	
}