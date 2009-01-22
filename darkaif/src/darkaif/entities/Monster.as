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
	
	/*
	 * Animation
	 * collision
	 * attack
	 */ 
	public class Monster
	{
		//{ variable
		public var charactername:String = "";
		public var modelid:String = "";
		public var playername:String = "";
		
		public var battack:Boolean = false;
		public var battackx:Boolean = false;
		public var battacky:Boolean = false;
		public var battackz:Boolean = false;
		
		public var btriggerattack:Boolean = false;
		
		public var bstartattack:Boolean = false;
		public var bstartdamage:Boolean = true;
		
		//{start mosnter status
		public var healthpoint:Number = 100;
		public var healthmaxpoint:Number = 100;
		
		//}end mosnter status
		
		public var attack:Number = 10;
		
		public var mesh:Shape3D = null;
		//public var animmesh:MD2 = null; //code change different method
		public var animset:Array = new Array();//md2 mesh
		public var bmeshset:Boolean = false;
		public var action:String = "walk"; //main mesh animation name
		public var actionframe:String = "stand"; //index frame list
		public var framespeed:Number = 0.1;
		//public var count:int = 0;
		//public var countmax:int = 100;
		
		public var spawntime:Number = 0;
		public var spawntimemax:Number = 100;
		
		public var bcollision:Boolean = false;
		public var balive:Boolean = false;
		public var bdetectcollision:Boolean = false;
		
		//collision
		public var boxcollision:Array = new Array();
		public var spherecollision:Array = new Array();
		
		//{ start position and rotation
		public var diffx:Number = 0;//it depend where it direction		
		public var diffy:Number = 0;//it depend where it direction
		public var diffz:Number = 0;//it depend where it direction
		
		public var dirx:Number = 0;
		public var diry:Number = 0;
		public var dirz:Number = 0;
		
		public var olddirx:Number = 0;
		public var olddiry:Number = 0;
		public var olddirz:Number = 0;
		
		//start where to spawn
		public var spawnposx:Number = 0;
		public var spawnposy:Number = 0;
		public var spawnposz:Number = 0;
		
		//current position
		public var posx:Number = 0;
		public var posy:Number = 0;
		public var posz:Number = 0;
		
		public var rotx:Number = 0;
		public var roty:Number = 0;
		public var rotz:Number = 0;
		
		//}end position and rotation
		
		public var detectrange:Number = 64;
		public var playerrange:Number = 32;
		
		//{ target player
		public var targetname:String = "player";
		public var targetx:Number = 0;
		public var targety:Number = 0;
		public var targetz:Number = 0;
		public var targetrange:Number = 0;
		//}
		public var moveforward:Number = 0;
		//}
		
		public function Monster(){
			var boxbound:CollisionBox = new CollisionBox();
			boxcollision.push(boxbound);
		}
		
		public function targetdistance():void {
			targetrange = Math.abs((((posx - targetx) * 2) +((posy - targety) * 2) +((posz - targetz)*2))/2);
			//trace(String(targetrange));
		}
		
		//{ start set position
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
		//} end set position
		
		public function update():void {
			//trace("update");
			//trace("x:"+targetx+" y:"+targety+" z:"+targetz);
			// x,z
			targetdistance();
			
			if (healthpoint <= 0) {
				balive = false;
				actionframe = 'stand';
			}
			
			if (balive == true) {
				if ( targetrange <  detectrange){
					if (posx <= targetx -20) {
						posx++;
						battackx = false;
						dirx = 1;
						//actionframe = "walk";
						roty = 0;
					}else if(posx >= targetx + 20){
						posx--;
						battackx = false;
						dirx = -1;
						//actionframe = "walk";
						roty = 180;
					}else {
						//attack object if condtion area meet
						//trace("attack");
						dirx = 0;
						battackx = true;
					}
				
					if (posz <= targetz -20) {
						posz++;
						battackz = false;
						dirz = 1;
						//actionframe = "walk";
						roty = 90;
					}else if(posz >= targetz + 20){
						posz--;
						battackz = false;
						dirz = -1;
						//actionframe = "walk";
						roty = -90;
					}else {
						//attack object if condtion area meet
						//trace("attack");
						dirz = 0;
						battackz = true;
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
				
				//check if monster is attacking with animation not over lapping
				if ((battack == true) && (bstartattack == false)) {
					bstartattack = true;
				}
				
				//trace("dir x:" + olddirx +" y:" + olddiry + " z:" + olddirz);
			}
			
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
			}
			
				for (var animno:int = 0; animno < animset.length; animno++ ) {	
					//animset[animno].animmesh.visible = false;
					
					if (animset[animno].actionname == action) {
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
						//set frame for current action frame index
						for (var actionframeno:int = 0; actionframeno <  animset[animno].actionframe.length; actionframeno++ ) {
							if (animset[animno].actionframe[actionframeno].actionname == actionframe) {
								//trace(animset[animno].actionframe[actionframeno].actionname+":"+  animset[animno].actionframe.length);
								//trace("There is action frame in here!");
								//use this frame
								framemin = animset[animno].actionframe[actionframeno].min;
								framemax = animset[animno].actionframe[actionframeno].max;
								framespeed = animset[animno].actionframe[actionframeno].speed;
								var frameranage:Number = framemax - framemin;
								trace(String(frameranage));
								break;
							}
						}
						
						animset[animno].animmesh.frame += framespeed; //0.2
						
						//if frame limit is over start from index or default
						if (animset[animno].animmesh.frame > framemax) {
							animset[animno].animmesh.frame  = framemin;
							if(bstartattack){
								bstartdamage = true;
								battack = false;
							}
						}
					
						//start frame from current index action or default
						if (animset[animno].animmesh.frame < framemin) {
							animset[animno].animmesh.frame  = framemin;
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
	}
}