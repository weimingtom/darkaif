﻿package gearunits.papervision3d.entity.weapon 
{
	import gearunits.papervision3d.entity.projectile.PProjectile;
	import org.papervision3d.core.math.Number3D;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class PWeapon 
	{
		public static const NAME:String = 'PWeapon';
		
		public var x:Number = 0;
		public var y:Number = 0;
		public var z:Number = 0;
		
		//INFORMATION
		public var name:String = 'Weapon';
		public var time:Number = 0;
		public var timemax:Number = 0;
		public var damage:Number = 0;
		//PROJECTILE
		public var projectile:Vector.<PProjectile> = new Vector.<PProjectile>();
		//FLASH MUZZLE
		// [?]
		//WEAPON CONTROL
		public var BFIRE:Boolean = false;
		public var BALTFIRE:Boolean = false;
		public var binfiniteammo:Boolean = false;
		public var PRESSFIRE:Boolean = false;
		//WEAPON AMMO
		public var ammoclip:Number = 0;
		public var ammo:Number = 0;
		//WEAPON OTHER SETTINGS
		public var firerate:Number = 0;
		public var heattime:Number = 0;
		public var cooltime:Number = 0;
		
		public var firepoint:Number3D = new Number3D();
		public var offsetlengthfire:Number = 0;
		
		public function PWeapon() 
		{
			
		}
		
	}
	
}