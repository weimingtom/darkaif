package darknet.engine.sandy.entity 
{
	import flash.events.Event;
	/**
	 * ...
	 * @author Darknet
	 * 
	 * Information:
	 * 
	 */
	public class SCharacter extends SEntity
	{
		public var meshs:Vector.<SAnimationSet> = new Vector.<SAnimationSet>();
		
		public function SCharacter() {
		}
		
		public function update(event : Event =null ):void {
			for (var meshno:int = 0; meshno < meshs.length; meshno++) {
				meshs[meshno].mesh.x = x;
				meshs[meshno].mesh.y = y;
				meshs[meshno].mesh.z = z;
			}
		}
		
	}
	
}