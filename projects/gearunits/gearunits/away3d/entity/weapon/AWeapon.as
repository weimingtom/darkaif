package gearunits.away3d.entity.weapon 
{
	import gearunits.away3d.entity.projectile.AProjectile;
	import gearunits.core.GlobalUnit;
	
	/**
	 * ...
	 * @author Darknet
	 * 
	 * Information: MAIN TEMPLATE
	 * 
	 */
	public class AWeapon extends GlobalUnit
	{
		//INFORMATION
		public var name:String = 'AWeapon';
		public var time:Number = 0;
		public var timemax:Number = 0;
		public var damage:Number = 0;
		//PROJECTILE
		public var projectile:Vector.<AProjectile> = new Vector.<AProjectile>();
		//FLASH MUZZLE
		// [?]
		//WEAPON CONTROL
		public var PRESSFIRE:Boolean = false;
		public var BCONTROLFIRE:Boolean = false;
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
		public var offsetlengthfire:Number = 0; //2D spawn // current position and spacing and math of sin and cos base
		
		public function AWeapon() 
		{
			
		}
		
	}
	
}