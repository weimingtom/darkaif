package darkaif.entities 
{
	//{ packages
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
	 * 
	 * Information: rpg character stats base.
	 * TODO:build a converter from xml
	 */
	public class Character extends EntitlyCharacter {
		
		//{ variables
		
		public var modelid:String = ""; //character mesh
		public var mapzoneid:Number = -1;
		public var healthpoint:Number = 100;
		public var healthmaxpoint:Number = 100;
		public var attack:Number = 10;
		public var battack:Boolean = false; //if player has init attacking control
		public var bactionstart:Boolean = false; //start action doing something (attack or skill)
		public var bactionend:Boolean = false;  //end action when finish(attack or skill)
		public var btriggeraction:Boolean = false; //if there is other actions else default 'stand'
		public var movespeed:Number = 5;
		
		//} end variables
		
		public function Character() {
			gravityy = -3;
			//var boxbound:CollisionBox = new CollisionBox();
			//boxcollision.push(boxbound);
		}
		
		public override function update():void{
			super.update();
			//trace("x:"+bcollisionx+" z:"+bcollisionz);
			//trace("update");
			//trace("action frame:"+actionframe)
			
			if (healthpoint < 0) {
				healthpoint = 0;
			}
			
			
			objectpositionupdate();
			
			if ((battack == true) && (btriggeraction == false)){
				btriggeraction = true;// this will turn the animation action set to it.
				//battack = false;
				//bstartdamage = true;
				battackstart = true;
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
			olddirx = posx;
			olddiry = posy;
			olddirz = posz;
			
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
			
			diffx = olddirx - posx;
			diffy = olddiry - posy;
			diffz = olddirz - posz;
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
							//bstartdamage = true;
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
		/*
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
		*/
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
		
		//check collision map zone portal
		public function checkzonemap(box:MapZone):Boolean {
			//trace('--');
			var bcollision:Boolean = false;
			//trace("test class object");
			for (var boxno:int = 0; boxno < boxcollision.length; boxno++ ) {
				var minx:Number = boxcollision[boxno].minx + posx;
				var miny:Number = boxcollision[boxno].miny + posy;
				var minz:Number = boxcollision[boxno].minz + posz;
				
				var maxx:Number = boxcollision[boxno].maxx + posx;
				var maxy:Number = boxcollision[boxno].maxy + posy;
				var maxz:Number = boxcollision[boxno].maxz + posz;
				
				//for (var objectboxno:Number = 0; objectboxno < objectmesh.boxcollision.length; objectboxno++) {
					var minx2:Number = box.box.minx + box.posx;
					var miny2:Number = box.box.miny + box.posy;
					var minz2:Number = box.box.minz + box.posz;
					
					var maxx2:Number = box.box.maxx + box.posx;
					var maxy2:Number = box.box.maxy + box.posy;
					var maxz2:Number = box.box.maxz + box.posz;
					if ((maxz >= minz2) &&(minz <= maxz2) &&
						(maxy >= miny2) &&(miny <= maxy2) &&
						(maxx >= minx2) && (minx <= maxx2)){
						//trace("mesh collision");	
						bcollision = true;
						break;
					}
				///}
			}
			if (bcollision) {
				return true;
			}else {
				return false;
			}
		}
	}
}