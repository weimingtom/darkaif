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
		public var bgoundcollision:Boolean = false;
		public var boxcollision:Array = new Array();
		public var spherecollision:Array = new Array();
		
		public var gravityx:Number = 0;
		public var gravityy:Number = -1;
		public var gravityz:Number = 0;
		
		public var dirx:Number = 0; //direction set follow
		public var diry:Number = 0; //direction set follow
		public var dirz:Number = 0; //direction set follow
		
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
			
			if (balive) {
				if (bgoundcollision) {
					//posy -= gravityy;
				}else {
					posy += gravityy;
				}
			}
			
			
			
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
	
		//object mesh collision
		public function objectbox(objectmesh:Objectmesh, mx:Number, my:Number, mz:Number):Boolean {
			var bcollision:Boolean = false;
			//trace("test class object");
			for (var boxno:int = 0; boxno < boxcollision.length; boxno++ ) {
				var minx:Number = boxcollision[boxno].minx + posx + mx;
				var miny:Number = boxcollision[boxno].miny + posy + my;
				var minz:Number = boxcollision[boxno].minz + posz + mz;
				
				var maxx:Number = boxcollision[boxno].maxx + posx + mx;
				var maxy:Number = boxcollision[boxno].maxy + posy + my;
				var maxz:Number = boxcollision[boxno].maxz + posz + mz;
				
				for (var objectboxno:Number = 0; objectboxno < objectmesh.boxcollision.length; objectboxno++) {
					var minx2:Number = objectmesh.boxcollision[objectboxno].minx + objectmesh.model.x;
					var miny2:Number = objectmesh.boxcollision[objectboxno].miny + objectmesh.model.y;
					var minz2:Number = objectmesh.boxcollision[objectboxno].minz + objectmesh.model.z;
					
					var maxx2:Number = objectmesh.boxcollision[objectboxno].maxx + objectmesh.model.x;
					var maxy2:Number = objectmesh.boxcollision[objectboxno].maxy + objectmesh.model.y;
					var maxz2:Number = objectmesh.boxcollision[objectboxno].maxz + objectmesh.model.z;
					if ((maxz >= minz2) &&(minz <= maxz2) &&
						(maxy >= miny2) &&(miny <= maxy2) &&
						(maxx >= minx2) && (minx <= maxx2)){
						//trace("mesh collision");	
						bcollision = true;
						break;
					}
				}
			}
			if (bcollision) {
				return true;
			}else {
				return false;
			}
			//return false;
		}
		
	}
}