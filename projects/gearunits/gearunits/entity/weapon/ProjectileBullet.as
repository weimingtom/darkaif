package gearunits.entity.weapon 
{
	import sandy.primitive.Box;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class ProjectileBullet extends Projectile
	{
		
		public function ProjectileBullet() 
		{
			name = 'Bullet';
			mesh = new Box();
			damage = 1;
		}
		
	}
	
}