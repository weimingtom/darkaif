package darkaif.entities 
{
	//{
	import darkaif.core.entity.GameObject;
	import darkaif.core.display.GraphicLoadingBar;
	import sandy.core.scenegraph.Camera3D;
	import sandy.core.scenegraph.Shape3D;
	import sandy.core.scenegraph.Sprite2D;
	import sandy.primitive.MD2;
	import darkaif.core.collision.CollisionBox;
	//}
	
	/**
	 * ...
	 * @author Darknet
	 * Copy Rights (c) http://darkaif.googlecode.com
	 * 
	 * TODO:build a converter
	 * Animation
	 * collision
	 * attack
	 */ 
	public class Monster extends SandyGameObject
	{
		//{ variable
		public var modelid:String = "";
		public var healthprogressbar:GraphicLoadingBar = new GraphicLoadingBar();
		public var healthbarimage:Sprite2D = new Sprite2D('healthbar', healthprogressbar, 0.3);;
		public var battack:Boolean = false; //this will make the mosnter attak if condtion meet
		public var battackx:Boolean = false; // move or attack when stop moving
		public var battacky:Boolean = false; // move or attack when stop moving
		public var battackz:Boolean = false; // move or attack when stop moving
		public var btriggeraction:Boolean = false; //frame name for attack index from xml monster
		public var bactionstart:Boolean = false; //action frame 
		public var healthpoint:Number = 100;
		public var healthmaxpoint:Number = 100;
		public var attack:Number = 10;
		public var bmeshset:Boolean = false; //mesh or animation mesh
		public var frameattack:Number = 0; // mosnter action frame index xml data 
		public var spawntime:Number = 0; // start time to respawn for the monster in frame count
		public var spawntimemax:Number = 100; // max frame count to trigger spawn or create or show the monster
		public var detectrange:Number = 32;//128; //64;
		public var movespeed:Number = 1;
		public var targetname:String = "player"; //target object name
		public var targetx:Number = 0; //target object x
		public var targety:Number = 0; //target object y
		public var targetz:Number = 0; //target object z
		public var targetrange:Number = 0; //target object distance
		public var moveforward:Number = 0;
		
		//}
		
		public function Monster() {
			//default for now
			//var boxbound:CollisionBox = new CollisionBox();
			//boxcollision.push(boxbound);
		}
		
		//target object distance
		public function targetdistance():void {
			targetrange = Math.abs((((posx - targetx) * 2) +((posy - targety) * 2) +((posz - targetz)*2))/2);
			//trace(String(targetrange));
		}
		
		//{ start set position
		/*
		public function set setx(px:Number):void {
			spawnposx = px;
			posx = px;
		}
		
		public function set sety(py:Number):void {
			spawnposy = py;
			posy = py;
		}
		
		public function set setz(pz:Number):void {
			spawnposz = pz;
			posz = pz;
		}
		
		public function set(px:Number, py:Number, pz:Number):void {
			spawnposx = px;
			posx = px;
			spawnposy = py;
			posy = py;
			spawnposz = pz;
			posz = pz;
		}
		*/
		//} end set position
		
		//update object
		public override function update():void {
			super.update();
			//trace("update");
			//trace("x:"+targetx+" y:"+targety+" z:"+targetz);
			// x,z
			targetdistance();
			//posx++;
			healthbarimage.y = posy + 64;
			healthbarimage.x = posx;
			healthbarimage.z = posz;
			
			healthprogressbar.precent = ((healthpoint/healthmaxpoint)*100)
			//if monster health is gone, do not render
			if (healthpoint <= 0) {
				balive = false;
				actionframe = 'stand';
			}
			
			//if mosnter is alive start thinking
			if (balive == true) {
				healthbarimage.visible = true;
				//trace('update');
				//trace('bcollision');
				//trace(String(bcollisiony));
				if (!bgroundcollision) {
					
					//posy += diry;
					posy += gravityy;
				//trace("gravityy");
				}else {
					//trace('collision');
					//trace('collision');
					posy -= gravityy;
					//posy -= diry;
				}
				//trace("p x: " + posx + " z:" + posz);
				//trace("t x: "+ targetx+" z:"+targetz);
				//monster detect player ranage
				if ( targetrange <  detectrange){
					if ((posx < targetx)) {
						dirx = movespeed;
						//roty = 0;
					}else if ((posx > targetx)) {
						dirx = -movespeed;
						//roty = 180;
					}else {
						dirx = 0;
					}
					
					if ((posz < targetz)) {
						dirz = movespeed;
						//roty = 90;
					}else if ((posz > targetz)) {
						dirz = -movespeed;
						//roty = -90;
					}else {
						dirz = 0;
					}
					
					monsterdirectionrotation();
					
					if (!bcollisionx) {
						posx += dirx;
					}else {
						//posx -= dirx;
					}
					if(!bcollisiony){
						posy += diry;
					}else {
						//posy -= diry;
					}
					if(!bcollisionz){
						posz += dirz;
					}else {
						//posz -= dirz;
					}
					
					if ((dirx != 0) || (diry != 0) || (dirz != 0)) {
						olddirx = dirx;
						olddiry = diry;
						olddirz = dirz;
					}
					
					actionframe = "walk";
				}else {
					actionframe = "stand";
				}
				
				//if monster move do not attack else attack when not moving
				if ((battackx == true)&&(battackz == true)) {
					battack = true;
					//trace("attack mode");
					actionframe = "attack";
				}else {
					battack = false;
					//actionframe = "walk";
				}
				
				//if monster collision player attack
				if ((bcollisionx == true) || (bcollisiony == true) || (bcollisionz == true)) {
					//trace('collision mosnter');
					actionframe = "attack";
					battack = true;
				}
				
				//check if monster is attacking with animation not over lapping
				if ((battack == true) && (btriggeraction == false)) {
					btriggeraction = true;
					//bactionstart = true;
					//trace("attack");
				}
				
				//trace("dir x:" + olddirx +" y:" + olddiry + " z:" + olddirz);
			}
			
			//if monster is dead start respawn timer by frame speed
			if (balive == false) {
				spawntime++;
				if (spawntime > spawntimemax) {
					spawntime = 0;
					healthpoint = healthmaxpoint;
					posx = spawnposx;
					posy = spawnposy;
					posz = spawnposz;
					balive = true;
				}
				healthbarimage.visible = false;
			}
				
				for (var animno:int = 0; animno < animset.length; animno++ ) {	
					//animset[animno].animmesh.visible = false;
					
					if (animset[animno].actionname == action) {
						//make monster show render
						animset[animno].animmesh.visible = true;
						//trace("hello animation monster");
						//make animation run
						animset[animno].animmesh.x += 0.001;
						
						animset[animno].animmesh.x = posx;
						animset[animno].animmesh.y = posy;
						animset[animno].animmesh.z = posz;
						animset[animno].animmesh.rotateX = rotx;
						animset[animno].animmesh.rotateY = roty;
						animset[animno].animmesh.rotateZ = rotz;
						
						var framemin:Number = 0;
						var framemax:Number = 0;
						//set frame for current action frame index to match the frame name
						for (var actionframeno:int = 0; actionframeno <  animset[animno].actionframe.length; actionframeno++ ) {
							if (animset[animno].actionframe[actionframeno].actionname == actionframe) {
								//trace(animset[animno].actionframe[actionframeno].actionname+":"+  animset[animno].actionframe.length);
								//trace("There is action frame in here!");
								//use this frame
								framemin = animset[animno].actionframe[actionframeno].min;
								framemax = animset[animno].actionframe[actionframeno].max;
								framespeed = animset[animno].actionframe[actionframeno].speed;
								frameattack =  animset[animno].actionframe[actionframeno].attackstart;
								break;
							}
						}
						
						//this will trigger the atack during the animation frame to init damage
						if (btriggeraction) {
							//trace("checking...");
							//frame index for action to trigger the event to start it
							if (((framemin + frameattack) < animset[animno].animmesh.frame) && (bactionstart == false)) {
								bactionstart = true;
								bstartdamage = true;
								//trace("action frame with attack");
							}
						}
						
						//frame speed from loaded file xml
						animset[animno].animmesh.frame += framespeed; //0.2
						
						//if frame limit is over start from index or default
						if (animset[animno].animmesh.frame > framemax) {
							animset[animno].animmesh.frame  = framemin;
							if(btriggeraction){
								//battack = false;
								btriggeraction = false;
								bactionstart = false;
							}
						}
						
						//start frame from current index action or default
						if (animset[animno].animmesh.frame < framemin) {
							//frame name index xml data monster
							animset[animno].animmesh.frame = framemin;
						}
						
					}
					else 
					{
						//if mesh animation does not match do not render it
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
					
					//this make sure mesh is not render
					if (balive == false) {
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
		
		// Monster rotation
		public function monsterdirectionrotation():void {
			if ((dirz > 0) && (dirx == 0)) {//north
				roty = 90;
			}else if((dirz > 0) && (dirx > 0)){//northeast
				roty = 45;
			}else if((dirz == 0) && (dirx > 0)){//east
				roty = 0;
			}else if((dirz < 0) && (dirx > 0)){//southeast
				roty = -45;
			}else if((dirz < 0) && (dirx == 0)){//south
				roty = -90;
			}else if((dirz < 0) && (dirx <= 0)){//southwest
				roty = -135;
			}else if((dirz == 0) && (dirx < 0)){//west
				roty = 180;
			}else if((dirz > 0) && (dirx < 0)){//northwest
				roty = 135;
			}
		}
		
		/*
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
		*/
		//player collision
		public function playerbox(objectmesh:Character,mx:Number,my:Number,mz:Number):Boolean {
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
					var minx2:Number = objectmesh.boxcollision[objectboxno].minx + objectmesh.posx;
					var miny2:Number = objectmesh.boxcollision[objectboxno].miny + objectmesh.posy;
					var minz2:Number = objectmesh.boxcollision[objectboxno].minz + objectmesh.posz;
					
					var maxx2:Number = objectmesh.boxcollision[objectboxno].maxx + objectmesh.posx;
					var maxy2:Number = objectmesh.boxcollision[objectboxno].maxy + objectmesh.posy;
					var maxz2:Number = objectmesh.boxcollision[objectboxno].maxz + objectmesh.posz;
					if ((maxz > minz2) &&(minz < maxz2) &&
						(maxy > miny2) &&(miny < maxy2) &&
						(maxx > minx2) && (minx < maxx2)){
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