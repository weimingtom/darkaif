package darkaif.entities 
{
	import darkaif.core.entity.GameObject;
	import sandy.core.scenegraph.Shape3D;
	
	/**
	 * ...
	 * @author @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	 */
	public class SandyGameObject extends GameObject
	{
		public var mesh:Shape3D = null;
		public var animset:Array = new Array();
		
		public var action:String = "walk"; //name of the animation mesh
		public var actionframe:String = "stand"; //name of the frame count index in xml
		public var framespeed:Number = 0.1; //how fast the frame rate
		public var frameattackstart:Number = -1; //trigger what frame to action (attack) from the start
		public var frameattackend:Number = 0; // when trigger event end from the action frame
		
		public function SandyGameObject() 
		{
			
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
					//trace("attack");
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