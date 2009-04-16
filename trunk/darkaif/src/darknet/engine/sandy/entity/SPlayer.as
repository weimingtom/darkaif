package darknet.engine.sandy.entity 
{
	import darknet.core.collision.CollisionBox;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class SPlayer extends SCharacter
	{
		//public var meshs:ve
		public var characteridhash:String = '';
		public var charactername:String = '';
		
		public function SPlayer() 
		{
			//
			var box:CollisionBox = new CollisionBox();
			box.height = 32;
			box.length = 32;
			box.width = 32;
			collison.box.push(box);
		}
		
	}
	
}