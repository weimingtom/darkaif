package darkaif.objects {
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	*/
	public class Character {
		public var id:Number = 0;
		public var Name:String = 'Character';
		public var Job:String = 'novice';
		public var Type:String = 'none';
		
		public var Map:String = 'None';
		public var BCollision:Boolean = true;
		public var BoneRoot:String = 'root';
		
		public var x:Number;
		public var y:Number;
		public var z:Number;
		
		public function Character() {
			id++;	
		}
		
		public function getid():Number{
			return id;
		}
		
	}
	
}
