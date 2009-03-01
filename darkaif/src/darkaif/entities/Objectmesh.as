package darkaif.entities 
{
	import sandy.core.scenegraph.Shape3D;
	import darkaif.core.collision.CollisionBox;
	
	/**
	 * ...
	 * @author Darknet
	 * Copy Rights (c) http://darkaif.googlecode.com
	 */
	public class Objectmesh extends SandyGameObject
	{
		public var model:Shape3D = null;
		public var meshname:String = "";
		public var meshid:String = "";
		//public var boxcollision:Array = new Array();
		
		public function Objectmesh() 
		{
			//var boxbound:CollisionBox = new CollisionBox();
			//boxcollision.push(boxbound);
		}
		
		public override function update():void {
			super.update();
			model.x = posx;
			model.y = posy;
			model.z = posz;
		}
		
	}
	
}