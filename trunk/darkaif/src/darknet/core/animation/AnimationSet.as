package darknet.core.animation 
{
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class AnimationSet 
	{
		public var actionname:String = "";
		public var meshid:String = '';
		public var framemin:Number = 0;
		public var framemax:Number = 0;
		public var actionframe:Vector.<ActionFrame> = new Vector.<ActionFrame>();
		
		public function AnimationSet() 
		{
			
		}
		
	}
	
}