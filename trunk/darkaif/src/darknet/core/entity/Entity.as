package darknet.core.entity 
{
	import darknet.core.collision.Collision;
	import darknet.core.geometry.Rotation;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class Entity {
		
		public var name:String = 'Entity';
		public var balive:Boolean = true;
		public var bcollision:Boolean = true;
		public var bpolygoncollision:Boolean = false;
		
		public var collison:Collision = new Collision();
		
		public var x:Number = 0;
		public var y:Number = 0;
		public var z:Number = 0;
		
		public var rotate:Rotation = new Rotation;
		public var rotation:Rotation = new Rotation;
		
		public function Entity(){
			
		}
		
	}
	
}