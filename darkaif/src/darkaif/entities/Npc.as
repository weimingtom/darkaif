package darkaif.entities 
{
	//} packages
	import darkaif.core.entity.GameObject;
	import sandy.core.scenegraph.Camera3D;
	import sandy.core.scenegraph.Shape3D;
	import sandy.primitive.MD2;
	import darkaif.core.collision.CollisionBox;
	//}
	
	/**
	 * ...
	 * @author Darknet
	 * Copy Rights (c) http://darkaif.googlecode.com
	 */
	
	public class Npc extends EntitlyCharacter
	{
		//{variables
		
		public var moveforward:Number = 0;
		//}
		public function Npc(){
			var boxbound:CollisionBox = new CollisionBox();
			boxcollision.push(boxbound);
		}
			
		public override function update():void{
			super.update();
			//trace("update");
			//posx++;
			
			if (balive) {
				if (bgroundcollision) {
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
		
	}
}