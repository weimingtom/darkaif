package gearunits.away3d.entity.weapon 
{
	import gearunits.away3d.entity.projectile.AProjectile;
	
	/**
	 * ...
	 * @author Darknet
	 * 
	 * Information: MAIN TEMPLATE
	 * 
	 */
	public class AWeapon 
	{
		public var x:Number = 0;
		public var y:Number = 0;
		public var z:Number = 0;
		
		//INFORMATION
		public var name:String = 'Weapon';
		public var time:Number = 0;
		public var timemax:Number = 0;
		public var damage:Number = 0;
		//PROJECTILE
		public var projectile:Vector.<AProjectile> = new Vector.<AProjectile>();
		//FLASH MUZZLE
		// [?]
		//WEAPON CONTROL
		public var BFIRE:Boolean = false;
		public var BALTFIRE:Boolean = false;
		public var binfiniteammo:Boolean = false;
		//WEAPON AMMO
		public var ammoclip:Number = 0;
		public var ammo:Number = 0;
		//WEAPON OTHER SETTINGS
		public var firerate:Number = 0;
		public var heattime:Number = 0;
		public var cooltime:Number = 0;
		
		public function AWeapon() 
		{
			
		}
		
	}
	
}