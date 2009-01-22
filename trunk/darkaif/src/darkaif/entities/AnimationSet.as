package darkaif.entities 
{
	import sandy.primitive.MD2;
	
	/**
	 * ...
	 * @author Darknet
	 * Copy Rights (c) http://darkaif.googlecode.com
	 */
	public class AnimationSet
	{
		public var actionname:String = "";
		public var animmesh:MD2 = null;
		public var framemin:Number = 0;
		public var framemax:Number = 0;
		public var actionframe:Array = new Array();
		
		public function AnimationSet() 
		{
			
		}
		
	}
	
}