package darkaif.entities 
{
	//{ pacakges
	import darkaif.core.entity.GameObject;
	import sandy.core.scenegraph.Shape3D;
	//}
	
	/**
	 * ...
	 * @author @author Darknet
	 * Copy Rights (c) http://darkaif.googlecode.com
	 */
	
	public class SandyGameObject extends GameObject
	{
		
		//{ variables
		public var mesh:Shape3D = null;
		public var animset:Array = new Array();
		
		public var action:String = "walk"; //name of the animation mesh
		public var actionframe:String = "stand"; //name of the frame count index in xml
		public var framespeed:Number = 0.1; //how fast the frame rate
		public var frameattackstart:Number = -1; //trigger what frame to action (attack) from the start
		public var frameattackend:Number = 0; // when trigger event end from the action frame
		//}
		
		public function SandyGameObject() {
			
		}
		
		public override function update():void {
			super.update();
			
			//start attack
			if (battackstart) {
				attacktime++;
				if (attacktime > attacktimemax) {
					attacktime = 0;
					bstartdamage = true;
					battackend = true;
					battackstart = false;
					//trace("player attack...");
				}
			}
			
			//delay when attack is finish
			if (battackend) {
				attackdelaytime++;
				if (attackdelaytime > attackdelaytimemax) {
					attackdelaytime = 0;
					battackend = false;
					//trace("delay");
				}
			}
			
		}
		
		//object mesh collision
		public function objectbox(objectmesh:Objectmesh, mx:Number=0, my:Number=0, mz:Number=0):Boolean {
			var bcollision:Boolean = false;
			//trace("test class object");
			for (var boxno:int = 0; boxno < boxcollision.length; boxno++ ) {
				//trace("number of main:"+boxno);
				var minx:Number = boxcollision[boxno].minx + posx + mx;
				//trace(boxcollision[boxno].minx);
				var miny:Number = boxcollision[boxno].miny + posy + my;
				var minz:Number = boxcollision[boxno].minz + posz + mz;
				
				var maxx:Number = boxcollision[boxno].maxx + posx + mx;
				var maxy:Number = boxcollision[boxno].maxy + posy + my;
				var maxz:Number = boxcollision[boxno].maxz + posz + mz;
				
				//objectmesh.po
				
				for (var objectboxno:Number = 0; objectboxno < objectmesh.boxcollision.length; objectboxno++) {
					var minx2:Number = objectmesh.boxcollision[objectboxno].minx + objectmesh.model.x;
					var miny2:Number = objectmesh.boxcollision[objectboxno].miny + objectmesh.model.y;
					var minz2:Number = objectmesh.boxcollision[objectboxno].minz + objectmesh.model.z;
					
					var maxx2:Number = objectmesh.boxcollision[objectboxno].maxx + objectmesh.model.x;
					var maxy2:Number = objectmesh.boxcollision[objectboxno].maxy + objectmesh.model.y;
					var maxz2:Number = objectmesh.boxcollision[objectboxno].maxz + objectmesh.model.z;
					//trace(objectmesh.boxcollision[objectboxno].maxz);
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
		
		//working collision and remove ground that will conlfict
		public function hitbox(objectmesh:Objectmesh):Boolean {
			var bcollision:Boolean = false;
			var offsetmin:Number = 0;
			var offsetmax:Number = 0;
			var offsetmin2:Number = 0;
			var offsetmax2:Number = 0;
			//four point from min and max value
			
			//trace("test class object");
			//trace('dir x:'+dirx+ " :y"+diry+" :z"+ dirz);
			
			for (var boxno:int = 0; boxno < boxcollision.length; boxno++ ) {
				//trace("number of main:"+boxno);//trace(boxcollision[boxno].minx);
				var minx:Number = boxcollision[boxno].minx + posx + offsetmin;// + boxcollision[boxno].minx*dx;
				var miny:Number = boxcollision[boxno].miny + posy + offsetmin +12; //ground code
				var minz:Number = boxcollision[boxno].minz + posz + offsetmin;// + boxcollision[boxno].minz * dz;
				
				var maxx:Number = boxcollision[boxno].maxx + posx + offsetmax;// + boxcollision[boxno].maxy * dx ;
				var maxy:Number = boxcollision[boxno].maxy + posy + offsetmax;
				var maxz:Number = boxcollision[boxno].maxz + posz + offsetmax;// + boxcollision[boxno].maxz*dz;
				
				//objectmesh.po
				
				for (var objectboxno:Number = 0; objectboxno < objectmesh.boxcollision.length; objectboxno++) {
					var minx2:Number = (objectmesh.boxcollision[objectboxno].minx + objectmesh.model.x) + offsetmin2;
					var miny2:Number = (objectmesh.boxcollision[objectboxno].miny + objectmesh.model.y) + offsetmin2;
					var minz2:Number = (objectmesh.boxcollision[objectboxno].minz + objectmesh.model.z) + offsetmin2;
					
					var maxx2:Number = (objectmesh.boxcollision[objectboxno].maxx + objectmesh.model.x) + offsetmax2;
					var maxy2:Number = (objectmesh.boxcollision[objectboxno].maxy + objectmesh.model.y) + offsetmax2;
					var maxz2:Number = (objectmesh.boxcollision[objectboxno].maxz + objectmesh.model.z) + offsetmax2;
					//trace(objectmesh.boxcollision[objectboxno].maxz);
					//condtions point of four point from min and max value
					if ( (posx > objectmesh.model.x + objectmesh.boxcollision[objectboxno].maxx) &&
						(maxz >= minz2) &&(minz <= maxz2) &&
						(maxy >= miny2) &&(miny <= maxy2) &&
						(maxx >= minx2) && (minx <= maxx2)){
						//trace("mesh collision");
						//posx -= dirx;
						posx = objectmesh.model.x + objectmesh.boxcollision[objectboxno].maxx - boxcollision[boxno].minx;
						//trace("-collision");
						bcollision = true;
						//break;
					}else if ( (posx < objectmesh.model.x + objectmesh.boxcollision[objectboxno].minx) &&
						(maxz >= minz2) &&(minz <= maxz2) &&
						(maxy >= miny2) &&(miny <= maxy2) &&
						(maxx >= minx2) && (minx <= maxx2)){
						//posx -= dirx;
						posx = objectmesh.model.x + objectmesh.boxcollision[objectboxno].minx - boxcollision[boxno].maxx;
						bcollision = true;
					}else {
						bcollision = false;
					}
					
					if ( (posz > objectmesh.model.z + objectmesh.boxcollision[objectboxno].maxz) &&
						(maxz >= minz2) &&(minz <= maxz2) &&
						(maxy >= miny2) &&(miny <= maxy2) &&
						(maxx >= minx2) && (minx <= maxx2)){
						//posz -= dirz;
						posz = objectmesh.model.z + objectmesh.boxcollision[objectboxno].maxz - boxcollision[boxno].minz;
						
						bcollision = true;
					}else if ( (posz < objectmesh.model.z + objectmesh.boxcollision[objectboxno].minz) &&
						(maxz >= minz2) &&(minz <= maxz2) &&
						(maxy >= miny2) &&(miny <= maxy2) &&
						(maxx >= minx2) && (minx <= maxx2)){
						//posz -= dirz;
						posz = objectmesh.model.z + objectmesh.boxcollision[objectboxno].minz - boxcollision[boxno].maxz ;
						bcollision = true;
					}else {
						bcollision = false;
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
		
		public function intersetbox(objectmesh:Objectmesh, mx:Number=0, my:Number=0, mz:Number=0):Boolean {
			var bcollision:Boolean = false;
			var offsetmin:Number = 0;
			var offsetmax:Number = 0;
			var offsetmin2:Number = 0;
			var offsetmax2:Number = 0;
			//trace("test class object");
			for (var boxno:int = 0; boxno < boxcollision.length; boxno++ ) {
				//trace("number of main:"+boxno);//trace(boxcollision[boxno].minx);
				var minx:Number = boxcollision[boxno].minx + posx + mx + offsetmin;
				var miny:Number = boxcollision[boxno].miny + posy + my + offsetmin -16; //offset for just ground detect
				var minz:Number = boxcollision[boxno].minz + posz + mz + offsetmin;
				
				var maxx:Number = boxcollision[boxno].maxx + posx + mx + offsetmax;
				var maxy:Number = boxcollision[boxno].maxy + posy + my + offsetmax -16;//offset for just ground detect
				var maxz:Number = boxcollision[boxno].maxz + posz + mz + offsetmax;
				
				//objectmesh.po
				
				for (var objectboxno:Number = 0; objectboxno < objectmesh.boxcollision.length; objectboxno++) {
					var minx2:Number = (objectmesh.boxcollision[objectboxno].minx + objectmesh.model.x) + offsetmin2;
					var miny2:Number = (objectmesh.boxcollision[objectboxno].miny + objectmesh.model.y) + offsetmin2;
					var minz2:Number = (objectmesh.boxcollision[objectboxno].minz + objectmesh.model.z) + offsetmin2;
					
					var maxx2:Number = (objectmesh.boxcollision[objectboxno].maxx + objectmesh.model.x) + offsetmax2;
					var maxy2:Number = (objectmesh.boxcollision[objectboxno].maxy + objectmesh.model.y) + offsetmax2;
					var maxz2:Number = (objectmesh.boxcollision[objectboxno].maxz + objectmesh.model.z) + offsetmax2;
					//trace(objectmesh.boxcollision[objectboxno].maxz);
					if ((maxz >= minz2) &&(minz <= maxz2) &&
						(maxy >= miny2) &&(miny <= maxy2) &&
						(maxx >= minx2) && (minx <= maxx2)){
						//trace("mesh collision");
						if ((posy+ boxcollision[boxno].miny  < objectmesh.model.y + objectmesh.boxcollision[objectboxno].maxy)){
							//posy = maxy2 - boxcollision[boxno].miny;
							posy = (objectmesh.model.y + objectmesh.boxcollision[objectboxno].maxy)-boxcollision[boxno].miny;
						}
						
						//trace('collision y');
						bcollision = true;
						//break;
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
		
		public function classcollision(objectmesh:SandyGameObject, mx:Number, my:Number, mz:Number):Boolean {
			var bcollision:Boolean = false;
			//trace("test class object");
			for (var boxno:int = 0; boxno < boxcollision.length; boxno++ ) {
				var minx:Number = boxcollision[boxno].minx + posx + mx;
				var miny:Number = boxcollision[boxno].miny + posy + my;
				var minz:Number = boxcollision[boxno].minz + posz + mz;
				
				var maxx:Number = boxcollision[boxno].maxx + posx + mx;
				var maxy:Number = boxcollision[boxno].maxy + posy + my;
				var maxz:Number = boxcollision[boxno].maxz + posz + mz;
				
				//objectmesh.po
				
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