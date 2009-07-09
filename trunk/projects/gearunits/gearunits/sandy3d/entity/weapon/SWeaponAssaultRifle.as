package gearunits.sandy3d.entity.weapon 
{
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class SWeaponAssaultRifle extends SWeapon
	{
		
		public function SWeaponAssaultRifle() 
		{
			name = 'AssaultRifle';
			projectilefire = new SProjectileBullet();
			projectilealtfire = new SProjectileBullet();
			timemax = 100;
		}
		
	}
	
}