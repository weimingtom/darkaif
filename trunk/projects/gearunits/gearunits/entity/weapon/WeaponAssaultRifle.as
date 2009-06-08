package gearunits.entity.weapon 
{
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class WeaponAssaultRifle extends Weapon
	{
		
		public function WeaponAssaultRifle() 
		{
			name = 'AssaultRifle';
			projectilefire = new ProjectileBullet();
			projectilealtfire = new ProjectileBullet();
			timemax = 100;
		}
		
	}
	
}