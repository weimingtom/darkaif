package darkaif.entities 
{
	import sandy.core.scenegraph.Camera3D;
	import sandy.core.scenegraph.Shape3D;
	import sandy.primitive.MD2;
	import darkaif.core.collision.CollisionBox;
	
	/**
	 * ...
	 * @author Darknet
	 * Copy Rights (c) http://darkaif.googlecode.com
	 */
	public class Npc
	{
		//{variables
		public var charactername:String = "";
		public var modelid:String = "";
		public var playername:String = "";
		public var mesh:Shape3D = null;
		//public var animmesh:MD2 = null; //code change different method
		public var animset:Array = new Array();
		public var bmeshset:Boolean = false;
		public var action:String = "walk";
		public var count:int = 0;
		public var countmax:int = 100;
		
		public var bcollision:Boolean = false;
		public var balive:Boolean = true;
		public var bdetectcollision:Boolean = false;
		
		public var boxcollision:Array = new Array();
		public var spherecollision:Array = new Array();
		
		public var diffx:Number = 0;//it depend where it direction		
		public var diffy:Number = 0;//it depend where it direction
		public var diffz:Number = 0;//it depend where it direction
		
		public var posx:Number = 0;
		public var posy:Number = 0;
		public var posz:Number = 0;
		
		public var rotx:Number = 0;
		public var roty:Number = 0;
		public var rotz:Number = 0;
		
		public var moveforward:Number = 0;
		//}
		public function Npc(){
			var boxbound:CollisionBox = new CollisionBox();
			boxcollision.push(boxbound);
		}
			
		public function update():void {
			//trace("update");
			//posx++;
			for (var animno:int = 0; animno < animset.length; animno++ ) {	
				//animset[animno].animmesh.visible = false;
				if (animset[animno].actionname == action) {
					animset[animno].animmesh.visible = true;
					animset[animno].animmesh.x = posx;
					animset[animno].animmesh.y = posy;
					animset[animno].animmesh.z = posz;
					animset[animno].animmesh.frame += 0.2;
					animset[animno].animmesh.rotateX = rotx;
					animset[animno].animmesh.rotateY = roty;
					animset[animno].animmesh.rotateZ = rotz;
					//animset[animno].animmesh.moveForward(moveforward);
					//mesh.rotateX
					//mesh.moveForward(moveforward);
					
				}else {
					//It is requried to set those to zero to not show up in the scene render
					//error in x show other models.
					animset[animno].animmesh.frame = 0;
					animset[animno].animmesh.x = 0;
					animset[animno].animmesh.y = 0;
					animset[animno].animmesh.z = 0;
					animset[animno].animmesh.rotateX  = 0;
					animset[animno].animmesh.rotateY  = 0;
					animset[animno].animmesh.rotateZ  = 0;
					animset[animno].animmesh.visible = false;
				}
			}
		}
	}
}