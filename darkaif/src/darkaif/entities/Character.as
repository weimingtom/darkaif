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
	 * TODO:build a converter
	 */
	public class Character 
	{
		//{ variables
		public var charactername:String = "";
		public var modelid:String = "";
		public var playername:String = "";
		public var mesh:Shape3D = null;
		
		public var healthpoint:Number = 100;
		public var healthmaxpoint:Number = 100;
		
		//animation 
		public var battack:Boolean = false; //if player has init attacking control
		public var bstartattack:Boolean = false; //animation control for attacking 
		public var bstartdamage:Boolean = false; //start object damage incase of looping part
		
		public var banimationaction:Boolean = false;
		
		public var dirx:Number = 1;
		public var diry:Number = 1;
		public var dirz:Number = 1;
		
		//public var animmesh:MD2 = null; //code change different method
		public var animset:Array = new Array();
		public var bmeshset:Boolean = false;
		public var action:String = "walk"; //name of the animation mesh
		public var actionframe:String = "walk"; //name of the frame count index in xml
		public var count:int = 0;
		public var countmax:int = 100;
		
		public var attack:Number = 10;
		
		public var bcollision:Boolean = false;
		public var balive:Boolean = false;
		public var bdetectcollision:Boolean = false;
		
		public var bclosecombat:Boolean = false;
		public var branagecombat:Boolean = false;
		
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
		
		//} end variables
		
		public function Character(){
			var boxbound:CollisionBox = new CollisionBox();
			boxcollision.push(boxbound);
		}
		
		public function update():void {
			//trace("update");
			
			if ((battack == true) && (bstartattack == false)){
				bstartattack = true;
				battack = false;
				bstartdamage = true;
			}
			
			if (bstartattack) {
				actionframe = 'attack';
			}
			//trace(actionframe + ":"+bstartattack+":"+battack);
			
			for (var animno:int = 0; animno < animset.length; animno++ ) {	
				//animset[animno].animmesh.visible = false;
				if (animset[animno].actionname == action) {
					if(bstartattack){//start animation frame render when move
						animset[animno].animmesh.x += 0.000001;
						//trace("start animaiton attack");
						//animset[animno].animmesh.x -= 0.000000000000001;
					}
					animset[animno].animmesh.visible = true;
					animset[animno].animmesh.x = (posx - diffx);
					animset[animno].animmesh.y = (posy - diffy);
					animset[animno].animmesh.z = (posz - diffz);
					animset[animno].animmesh.frame += 0.2;
					animset[animno].animmesh.rotateX = rotx;
					animset[animno].animmesh.rotateY = roty;
					animset[animno].animmesh.rotateZ = rotz;
					//animset[animno].animmesh.moveForward(moveforward);
					//mesh.rotateX
					//mesh.moveForward(moveforward);
					var framemin:Number = 0;
					var framemax:Number = 0;
					for (var actionframeno:int = 0; actionframeno <  animset[animno].actionframe.length; actionframeno++ ){
						if (animset[animno].actionframe[actionframeno].actionname == actionframe) {
							//trace("There is action frame in here!");
							//use this frame
							framemin = animset[animno].actionframe[actionframeno].min;
							framemax = animset[animno].actionframe[actionframeno].max;
							break;
						}
					}
					//if frame limit is over start from index or default
					if (animset[animno].animmesh.frame > framemax) {
						animset[animno].animmesh.frame  = framemin
						bstartattack = false;
						battack = false;
					}
					
					//start frame from current index action or default
					if (animset[animno].animmesh.frame < framemin) {
						animset[animno].animmesh.frame  = framemin;
					}
				}
				else
				{
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