package gearunits.sandy3d.entity.weapon 
{
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class SWeapon 
	{
		public var name:String = 'Weapon';
		public var time:Number = 0;
		public var timemax:Number = 0;
		public var damage:Number = 0;
		public var BFIRE:Boolean = false;
		public var projectilefire:SProjectile;
		public var projectilealtfire:SProjectile;
		public var BALTFIRE:Boolean = false;
		
		public var binfiniteammo:Boolean = false;
		
		public var ammoclip:Number = 0;
		public var ammo:Number = 0;
		
		public var firerate:Number = 0;
		public var heattime:Number = 0;
		public var cooltime:Number = 0;
		
		public function update():void {
			time++;
			if (time > timemax) {
				time = 0;
				BFIRE = true;
			}
			
		}
		
		
		public function SWeapon() 
		{
			
		}
		
	}
	
}