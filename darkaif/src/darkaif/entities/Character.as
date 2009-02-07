package darkaif.entities 
{
	//{ packages
	import sandy.core.scenegraph.Camera3D;
	import sandy.core.scenegraph.Shape3D;
	import sandy.primitive.MD2;
	import darkaif.core.collision.CollisionBox;
	//}
	
	/**
	 * ...
	 * @author Darknet
	 * Copy Rights (c) http://darkaif.googlecode.com
	 * 
	 * Information: rpg character stats base.
	 * TODO:build a converter from xml
	 */
	public class Character {
		//{ variables
		public var charactername:String = ""; //character name for portrait
		public var modelid:String = ""; //character mesh
		public var playername:String = ""; //player name and id
		public var mesh:Shape3D = null; //mesh
		
		//{ start status
		public var healthpoint:Number = 100;
		public var healthmaxpoint:Number = 100;
		
		//battle code
		public var attack:Number = 10;
		
		//} end status
		
		//animation 
		public var battack:Boolean = false; //if player has init attacking control
		public var bactionstart:Boolean = false; //start action doing something (attack or skill)
		public var bactionend:Boolean = false;  //end action when finish(attack or skill)
		public var btriggeraction:Boolean = false; //if there is other actions else default 'stand'
		public var bstartdamage:Boolean = false; //trigger attack to do damage
		
		public var banimationaction:Boolean = false; //unknown
		
		//public var animmesh:MD2 = null; //code change different method
		public var animset:Array = new Array(); //animation mesh
		public var bmeshset:Boolean = false; //check if it mesh or animation mesh
		public var action:String = "walk"; //name of the animation mesh
		public var actionframe:String = "walk"; //name of the frame count index in xml
		public var framespeed:Number = 0.1; //how fast the frame rate
		public var frameattackstart:Number = -1; //trigger what frame to action (attack) from the start
		public var frameattackend:Number = 0; // when trigger event end from the action frame
		//public var count:int = 0;
		//public var countmax:int = 100;
		
		public var bcollision:Boolean = false; //to be able collision
		public var balive:Boolean = false; //check what ever the object is alive or dead
		public var bdetectcollision:Boolean = false;
		
		public var bclosecombat:Boolean = false; //close combar
		public var branagecombat:Boolean = false; //long combat
		
		public var boxcollision:Array = new Array(); //box collision
		public var spherecollision:Array = new Array(); //sphere collision
		public var bcollisionx:Boolean = false;
		public var bcollisiony:Boolean = false;
		public var bcollisionz:Boolean = false;
		
		public var bup:Boolean = false;
		public var bdown:Boolean = false;
		public var bright:Boolean = false;
		public var bleft:Boolean = false;
		public var bforward:Boolean = false;
		public var bbackward:Boolean = false;
			
		//{ start direction
		public var gravityx:Number = 0;
		public var gravityy:Number = 0;
		public var gravityz:Number = 0;
		
		public var movespeed:Number = 5;
		
		public var diffx:Number = 0;//it depend where it direction		
		public var diffy:Number = 0;//it depend where it direction
		public var diffz:Number = 0;//it depend where it direction
		
		public var dirx:Number = 0; //direction
		public var diry:Number = 0; //direction
		public var dirz:Number = 0; //direction
		
		public var oldx:Number = 0;
		public var oldy:Number = 0;
		public var oldz:Number = 0;
		
		public var posx:Number = 0; //position
		public var posy:Number = 0; //position
		public var posz:Number = 0; //position
		
		public var rotx:Number = 0; //rotation
		public var roty:Number = 0; //rotation
		public var rotz:Number = 0; //rotation
		
		public var moveforward:Number = 0; //move object
		//} end direction
		
		//} end variables
		
		public function Character(){
			//var boxbound:CollisionBox = new CollisionBox();
			//boxcollision.push(boxbound);
		}
		
		public function update():void {
			//trace("x:"+bcollisionx+" z:"+bcollisionz);
			//trace("update");
			//trace("action frame:"+actionframe)
			
			if (healthpoint < 0) {
				healthpoint = 0;
			}
			
			objectpositionupdate();
			
			if ((battack == true) && (btriggeraction == false)){
				btriggeraction = true;// this will turn the animation action set to it.
				//battack = false;//bstartdamage = true;
			}
			
			//set the action name from preset index list
			if (btriggeraction) {
				actionframe = 'attack';
			}else {
				if ((diffx !=0)||(diffy !=0)||(diffz !=0)){
					actionframe = 'walk';
				}else {
					actionframe = 'stand';
				}
			}
			
			characteranimations();
		}
		
		//update position and collision boolean
		public function objectpositionupdate():void {
			oldx = posx;
			oldy = posy;
			oldz = posz;
			
			if (!bcollisionx){
				posx += dirx;
				posx += gravityx;
			}
			if (!bcollisiony){
				posy += diry;
				posy += gravityy;
				//trace("gravityy");
			}else {
				posy -= diry;
			}
			if (!bcollisionz){
				posz += dirz;
				posz += gravityz;
			}
			diffx = oldx - posx;
			diffy = oldy - posy;
			diffz = oldz - posz;
		}
		
		//character animation
		public function characteranimations():void {
			for (var animno:int = 0; animno < animset.length; animno++ ) {	
				//animset[animno].animmesh.visible = false;
				if (animset[animno].actionname == action) {
					animset[animno].animmesh.x += 0.001;
					//make the object show
					animset[animno].animmesh.visible = true;
					animset[animno].animmesh.x = posx;
					animset[animno].animmesh.y = posy;
					animset[animno].animmesh.z = posz;
					
					animset[animno].animmesh.rotateX = rotx;
					animset[animno].animmesh.rotateY = roty;
					animset[animno].animmesh.rotateZ = rotz;
					//animset[animno].animmesh.moveForward(moveforward);
					//mesh.rotateX
					//mesh.moveForward(moveforward);
					var framemin:Number = 0;
					var framemax:Number = 0;
					//trace("hello char:"+actionframe);
					for (var actionframeno:int = 0; actionframeno <  animset[animno].actionframe.length; actionframeno++ ){
						if (animset[animno].actionframe[actionframeno].actionname == actionframe) {
							//trace("There is action frame in here!");
							//use this frame
							framemin = animset[animno].actionframe[actionframeno].min;
							framemax = animset[animno].actionframe[actionframeno].max;
							framespeed = animset[animno].actionframe[actionframeno].speed;
							frameattackstart = animset[animno].actionframe[actionframeno].attackstart;
							break;
						}
					}
					//control frame speed
					animset[animno].animmesh.frame += framespeed;
					
					//this will trigger the atack during the animation frame to init damage
					if (btriggeraction) {
						//check if frame reaches the action index frame from xml data and make sure not to loop after it executed
						if (((framemin + frameattackstart) < animset[animno].animmesh.frame) && (bactionstart == false)) {
							bactionstart = true;
							//this where player will get damage
							bstartdamage = true;
							//trace("action frame with attack");
						}
					}
					
					//if frame limit is over start from index or default
					if (animset[animno].animmesh.frame > framemax) {
						animset[animno].animmesh.frame  = framemin
						//bstartattack = false;
						//make sure this is different action else default 'stand'
						if(btriggeraction){
							btriggeraction = false;
							bactionstart = false;
						}
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
						//posy -= diry;
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
		
		//monster collision
		public function monsterbox(objectmesh:Monster,mx:Number,my:Number,mz:Number):Boolean {
			var bcollision:Boolean = false;
			//trace("test class object");
			for (var boxno:int = 0; boxno < boxcollision.length; boxno++ ) {
				var minx:Number = boxcollision[boxno].minx + posx + mx+1;
				var miny:Number = boxcollision[boxno].miny + posy + my+1;
				var minz:Number = boxcollision[boxno].minz + posz + mz+1;
				
				var maxx:Number = boxcollision[boxno].maxx + posx + mx-1;
				var maxy:Number = boxcollision[boxno].maxy + posy + my-1;
				var maxz:Number = boxcollision[boxno].maxz + posz + mz-1;
				
				for (var objectboxno:Number = 0; objectboxno < objectmesh.boxcollision.length; objectboxno++) {
					var minx2:Number = objectmesh.boxcollision[objectboxno].minx + objectmesh.posx;
					var miny2:Number = objectmesh.boxcollision[objectboxno].miny + objectmesh.posy;
					var minz2:Number = objectmesh.boxcollision[objectboxno].minz + objectmesh.posz;
					
					var maxx2:Number = objectmesh.boxcollision[objectboxno].maxx + objectmesh.posx;
					var maxy2:Number = objectmesh.boxcollision[objectboxno].maxy + objectmesh.posy;
					var maxz2:Number = objectmesh.boxcollision[objectboxno].maxz + objectmesh.posz;
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