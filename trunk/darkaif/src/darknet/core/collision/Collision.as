package darknet.core.collision 
{
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class Collision {
		public var bcollision:Boolean = true;
		
		public var box:Vector.<CollisionBox> = new Vector.<CollisionBox>();
		public var sphere:Vector.<CollisionSphere> = new Vector.<CollisionSphere>();
		
		public function Collision() {
			
		}
		
	}
	
}