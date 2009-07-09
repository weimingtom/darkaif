package gearunits.sandy3d.entity.weapon 
{
	import sandy.primitive.Box;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class SProjectileBullet extends SProjectile
	{
		
		public function SProjectileBullet() 
		{
			name = 'Bullet';
			mesh = new Box();
			damage = 1;
			maxdistance = 100;
		}
		
	}
	
}