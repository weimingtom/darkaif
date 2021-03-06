﻿package gearunits.away3d.entity.projectile 
{
	import away3d.primitives.Plane;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class AProjectileBullet extends AProjectile
	{
		public static const NAME:String = 'AProjectileBullet';
		public static const TYPE:String = 'Projectile';
		
		
		public function AProjectileBullet() 
		{
			CLASS = 'AProjectileBullet';
			name = 'Bullet';
			mesh = new Plane( { name:'Bullet', width:8, height:8 } );
			speed = 5;
			maxdistance = 100;
			setbox(8,8,8);
		}
		
	}
	
}