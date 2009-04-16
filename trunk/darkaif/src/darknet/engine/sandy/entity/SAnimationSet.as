package darknet.engine.sandy.entity 
{
	import darknet.core.animation.AnimationSet;
	import sandy.primitive.MD2;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class SAnimationSet extends AnimationSet
	{
		public var actionframe:Vector.<SActionFrame> = new Vector.<SActionFrame>();
		public var mesh:MD2 = null;
		
		public function SAnimationSet() 
		{
			
		}
		
		public function savexmldata():XML {
			var actionxml:XML = < actionset/>;
			for (var actionframeno:int = 0; actionframeno < actionframe.length ; actionframeno++ ) {
				trace(actionframe[actionframeno].savexmldata);
				var actionlist:XML = actionframe[actionframeno].savexmldata();
				actionxml.appendChild(actionlist);
			}
			return actionxml;
		}
		
		
		//This is for id and name build
		public function saveanimationsetid():XML {
			var objectxml:XML = <mesh/>;
			var objectname:XML = <name/>;
			objectname.appendChild(name);
			objectxml.appendChild(objectname);
			var objectid:XML = <idhash/>;
			objectid.appendChild(idhash);
			objectxml.appendChild(objectid);
			return objectxml;
		}
		
	}
	
}