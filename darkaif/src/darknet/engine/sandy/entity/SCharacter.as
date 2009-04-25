package darknet.engine.sandy.entity 
{
	import darknet.core.collision.Collision;
	import flash.events.Event;
	import sandy.primitive.MD2;
	/**
	 * ...
	 * @author Darknet
	 * 
	 * Information:
	 * 
	 */
	public class SCharacter extends SEntity
	{
		public var frame:Number = 0;
		public var framespeed:Number = 0.1;
		public var framemin:Number = 0;
		public var framemax:Number = 50;
		public var animmesh:MD2;
		
		public var meshs:Vector.<SAnimationSet> = new Vector.<SAnimationSet>();
		public var actionname:String = 'default'; //main mesh for animation name
		public var framename:String = 'stand'; //sub action frame into parts
		public var bgravity:Boolean = false;
		public var gravityx:Number  = 0;
		public var gravityy:Number  = 1;
		public var gravityz:Number  = 0;
		
		public var walkspeed:Number = 1;
		
		public function SCharacter() {
			
		}
		
		public function charactersetsavexml():XML {
			//var objectxml:XML = <character/>;
			
			//var objectname:XML = <name/>;
			//objectname.appendChild(name);
			//objectxml.appendChild(objectname);
			
			//var objectidhash:XML = <idhash/>;
			//objectidhash.appendChild(idhash);
			//objectxml.appendChild(objectidhash);
			
			var objectanimationset:XML = <animationset/>;
			for (var objanimsetno:int = 0; objanimsetno < meshs.length;objanimsetno++ ) {
				objectanimationset.appendChild(meshs[objanimsetno].saveanimationsetid());
			}
			//objectxml.appendChild(objectanimationset);
			//return objectxml;
			return objectanimationset;
		}
		
		public function update(event:Event = null):void {
			objectfacedirection();
			x += dirx;
			y -= gravityx;
			y += diry;
			y -= gravityy;
			z += dirz;
			z -= gravityz;
			
			for (var meshno:int = 0; meshno < meshs.length; meshno++) {
				meshs[meshno].mesh.x = x;
				meshs[meshno].mesh.y = y;
				meshs[meshno].mesh.z = z;
				
				meshs[meshno].mesh.rotateX = rotation.x; 
				meshs[meshno].mesh.rotateY = rotation.y;
				meshs[meshno].mesh.rotateZ = rotation.z;
				
				//trace('frame name:..' + meshs[meshno].actionframe.length);
				
				
				for (var actionframeno:int = 0; actionframeno < meshs[meshno].actionframe.length; actionframeno++) {
					if (meshs[meshno].actionframe[actionframeno].framename == framename) {
						meshs[meshno].mesh.frame += meshs[meshno].actionframe[actionframeno].speed;
						framemin = meshs[meshno].actionframe[actionframeno].min;
						framemax = meshs[meshno].actionframe[actionframeno].max;
					}
				}
				
				//meshs[meshno].actionframe.length
				
				if (meshs[meshno].mesh.frame > framemax) {
					meshs[meshno].mesh.frame = framemin;
				}
				if (meshs[meshno].mesh.frame < framemin) {
					meshs[meshno].mesh.frame = framemin;
				}
			}
		}
		
		public function objectfacedirection():void {
			if ((dirz > 0) && (dirx == 0)) {//north
				rotation.y = 90;
			}else if((dirz > 0) && (dirx > 0)){//northeast
				rotation.y = 45;
			}else if((dirz == 0) && (dirx > 0)){//east
				rotation.y = 0;
			}else if((dirz < 0) && (dirx > 0)){//southeast
				rotation.y = -45;
			}else if((dirz < 0) && (dirx == 0)){//south
				rotation.y = -90;
			}else if((dirz < 0) && (dirx <= 0)){//southwest
				rotation.y = -135;
			}else if((dirz == 0) && (dirx < 0)){//west
				rotation.y = 180;
			}else if((dirz > 0) && (dirx < 0)){//northwest
				rotation.y = 135;
			}
		}
		
		public function set movedirx(num:Number):void {
			if (num < 0) {
				dirx = -walkspeed;
			}else if (num > 0) {
				dirx = walkspeed;
			}else {
				dirx = 0;
			}
		}
		public function set movediry(num:Number):void {
			if (num < 0) {
				diry = -walkspeed;
			}else if (num > 0) {
				diry = walkspeed;
			}else {
				diry = 0;
			}
		}
		public function set movedirz(num:Number):void {
			if (num < 0) {
				dirz = -walkspeed;
			}else if (num > 0) {
				dirz = walkspeed;
			}else {
				dirz = 0;
			}
		}
		
		
		/**
		 * 
		 * @param	smesh This will return bool collision from array store (default box)
		 * @return 
		 */
		public function intersetmesh(smesh:SMesh):Boolean {
			var collision2:Collision = smesh.collison;
			//box collision
			var bcollision:Boolean = false;
			for (var boxAno:int = 0; boxAno < collison.box.length ; boxAno++ ) {
				var bcollision2:Boolean = false;
				var minx:Number = x + collison.box[boxAno].x + collison.box[boxAno].minx;
				var maxx:Number = x + collison.box[boxAno].x + collison.box[boxAno].maxx;
				var miny:Number = y + collison.box[boxAno].y + collison.box[boxAno].miny;
				var maxy:Number = y + collison.box[boxAno].y + collison.box[boxAno].maxy;
				var minz:Number = z + collison.box[boxAno].z + collison.box[boxAno].minz;
				var maxz:Number = z + collison.box[boxAno].z + collison.box[boxAno].maxz;
				
				for (var boxBno:int = 0; boxBno < collision2.box.length; boxBno++ ) {
					var minx2:Number = smesh.x + collision2.box[boxBno].x + collision2.box[boxBno].minx;
					var maxx2:Number = smesh.x + collision2.box[boxBno].x + collision2.box[boxBno].maxx;
					var miny2:Number = smesh.y + collision2.box[boxBno].y + collision2.box[boxBno].miny;
					var maxy2:Number = smesh.y + collision2.box[boxBno].y + collision2.box[boxBno].maxy;
					var minz2:Number = smesh.z + collision2.box[boxBno].z + collision2.box[boxBno].minz;
					var maxz2:Number = smesh.z + collision2.box[boxBno].z + collision2.box[boxBno].maxz;
					if ((maxz >= minz2) &&(minz <= maxz2) &&
						(maxy >= miny2) &&(miny <= maxy2) &&
						(maxx >= minx2) && (minx <= maxx2)) {
						bcollision2 = true;
						//trace('intersetmesh collision......' + smesh._x + ":" + smesh._y + ":" + smesh._z);
						//trace('intersetmesh collision.mesh.' + smesh.mesh.x+ ":" + smesh.mesh.y + ":" + smesh.z);
						//trace('...' + collision2.box[boxBno].minx + ":" + collision2.box[boxBno].miny + ":" + collision2.box[boxBno].minz);
						//trace('...' + collision2.box[boxBno].maxx + ":" + collision2.box[boxBno].maxy + ":" + collision2.box[boxBno].maxz);
						break;
					}
				}
				
				if (bcollision2) {
					bcollision = true;
					//trace('intersetmesh collision......');
					break;
				}else {
					//trace('');
				}
			}
			return bcollision;
		}
		
		/**
		 * 
		 * @param	smesh This will dect and return in other direction
		 * @return 
		 */
		//not ground collision
		public function intersetbox(smesh:SMesh):void {
			var collision2:Collision = smesh.collison;
			//box collision
			var bcollision:Boolean = false;
			var fdrix:Number = 0;
			var fdriz:Number = 0;
			var fdriy:Number = 0;
			
			if (dirx > 0) {
				fdrix = 1;
			}else if (dirx < 0) {
				fdrix = -1;
			}else {
				fdrix = 0;
			}
			
			if (diry > 0) {
				fdriy = 1;
			}else if (diry < 0) {
				fdriy = -1;
			}else {
				fdriy = 0;
			}
			
			if (dirz > 0) {
				fdriz = 1;
			}else if (dirz < 0) {
				fdriz = -1;
			}else {
				fdriz = 0;
			}
			
			
			for (var boxAno:int = 0; boxAno < collison.box.length ; boxAno++ ) {
				var bcollision2:Boolean = false;
				/*
				var minx:Number = x + (fdrix * (collison.box[boxAno].length/2)) + collison.box[boxAno].x + collison.box[boxAno].minx;
				var maxx:Number = x + (fdrix * (collison.box[boxAno].length/2)) + collison.box[boxAno].x + collison.box[boxAno].maxx;
				var miny:Number = y + (fdriy * (collison.box[boxAno].height/2)) + collison.box[boxAno].y + collison.box[boxAno].miny;
				var maxy:Number = y + (fdriy * (collison.box[boxAno].height/2)) + collison.box[boxAno].y + collison.box[boxAno].maxy;
				var minz:Number = z + (fdriz * (collison.box[boxAno].width/2)) + collison.box[boxAno].z + collison.box[boxAno].minz;
				var maxz:Number = z + (fdriz * (collison.box[boxAno].width / 2)) + collison.box[boxAno].z + collison.box[boxAno].maxz;
				*/
				var minx:Number = x + collison.box[boxAno].x + collison.box[boxAno].minx + (fdrix * (collison.box[boxAno].width/2)) ;
				var maxx:Number = x + collison.box[boxAno].x + collison.box[boxAno].maxx + (fdrix * (collison.box[boxAno].width/2)) ;
				var miny:Number = y + collison.box[boxAno].y + collison.box[boxAno].miny + (fdriy * (collison.box[boxAno].height/2))+32;
				var maxy:Number = y + collison.box[boxAno].y + collison.box[boxAno].maxy + (fdriy * (collison.box[boxAno].height/2)) ;
				var minz:Number = z + collison.box[boxAno].z + collison.box[boxAno].minz + (fdriz * (collison.box[boxAno].length/2)) ;
				var maxz:Number = z + collison.box[boxAno].z + collison.box[boxAno].maxz + (fdriz * (collison.box[boxAno].length/2)) ;
				
				for (var boxBno:int = 0; boxBno < collision2.box.length; boxBno++ ) {
					var bcollidex:Boolean = true;
					var bcollidey:Boolean = true;
					var bcollidez:Boolean = true;
					var minx2:Number = smesh.x + collision2.box[boxBno].x + collision2.box[boxBno].minx;
					var maxx2:Number = smesh.x + collision2.box[boxBno].x + collision2.box[boxBno].maxx;
					var miny2:Number = smesh.y + collision2.box[boxBno].y + collision2.box[boxBno].miny;
					var maxy2:Number = smesh.y + collision2.box[boxBno].y + collision2.box[boxBno].maxy;
					var minz2:Number = smesh.z + collision2.box[boxBno].z + collision2.box[boxBno].minz;
					var maxz2:Number = smesh.z + collision2.box[boxBno].z + collision2.box[boxBno].maxz;
					/*
					if ((maxz >= minz2) &&(minz <= maxz2) &&
						(maxy >= miny2) &&(miny <= maxy2) &&
						(maxx >= minx2) && (minx <= maxx2)) {
						bcollision2 = true;
						break;
					}
					*/
					
					if ((x > smesh.x + collision2.box[boxBno].maxx) && (maxz >= minz2) &&(minz <= maxz2) && (maxy >= miny2) &&(miny <= maxy2) && (maxx >= minx2) && (minx <= maxx2)){
						//x = smesh.x + collision2.box[boxBno].maxx - collison.box[boxAno].minx;
						x -= dirx;// -5;
						//trace('+x');
					}else if ((x < smesh.x + collision2.box[boxBno].minx) && (maxz >= minz2) &&(minz <= maxz2) && (maxy >= miny2) &&(miny <= maxy2) && (maxx >= minx2) && (minx <= maxx2)){
						//x = smesh.x + collision2.box[boxBno].minx - collison.box[boxAno].maxx;
						x -= dirx;// +5;
						//trace('-x');
					}else {
						bcollidex = false;
					}
					
					if((z > smesh.z + collision2.box[boxBno].maxz) && (maxz >= minz2) &&(minz <= maxz2) && (maxy >= miny2) &&(miny <= maxy2) && (maxx >= minx2) && (minx <= maxx2)){
						//z = smesh.z + collision2.box[boxBno].maxz - collison.box[boxAno].minz;
						z -= dirz;// -5;
						//trace('+z');
						trace(smesh.name);
					}else if ((z < smesh.z + collision2.box[boxBno].minz) && (maxz >= minz2) &&(minz <= maxz2) && (maxy >= miny2) &&(miny <= maxy2) && (maxx >= minx2) && (minx <= maxx2)){
						//z = smesh.z + collision2.box[boxBno].minz - collison.box[boxAno].maxz;
						z -= dirz;// +; 5;
						//trace('-z');
						trace(smesh.name);
					}else {
						bcollidez = false;
					}
					
					if ((bcollidex == true)||(bcollidez == true)) {
						bcollision2 = true;
						//trace('collisionxz');
						break;
					}
				}
				
				if (bcollision2) {
					bcollision = true;
					//trace('intersetmesh collision......');
					break;
				}
			}
			//return bcollision;
		}
		
		//ground collision incase walk is in conflict with space
		public function groundcollisionmesh(smesh:SMesh):void {
			var collision2:Collision = smesh.collison;
			//box collision
			var bcollision:Boolean = false;
			var fdrix:Number = 0;
			var fdriz:Number = 0;
			var fdriy:Number = 0;
			
			if (dirx > 0) {
				fdrix = 1;
			}else if (dirx < 0) {
				fdrix = -1;
			}else {
				fdrix = 0;
			}
			
			if (diry > 0) {
				fdriy = 1;
			}else if (diry < 0) {
				fdriy = -1;
			}else {
				fdriy = 0;
			}
			
			if (dirz > 0) {
				fdriz = 1;
			}else if (dirz < 0) {
				fdriz = -1;
			}else {
				fdriz = 0;
			}
			
			
			//for (var boxAno:int = 0; boxAno < collison.box.length ; boxAno++ ) {
				var bcollision2:Boolean = false;
				
				//var minx:Number = x + collison.box[boxAno].x + collison.box[boxAno].minx;
				//var maxx:Number = x + collison.box[boxAno].x + collison.box[boxAno].maxx;
				//var miny:Number = y + collison.box[boxAno].y + collison.box[boxAno].miny;
				//var maxy:Number = y + collison.box[boxAno].y + collison.box[boxAno].maxy;
				//var minz:Number = z + collison.box[boxAno].z + collison.box[boxAno].minz;
				//var maxz:Number = z + collison.box[boxAno].z + collison.box[boxAno].maxz;
				
				var minx:Number = x - 8;
				var maxx:Number = x + 8;
				var miny:Number = y - 8 -16;
				var maxy:Number = y + 8 -16;
				var minz:Number = z - 8;
				var maxz:Number = z + 8;
				
				for (var boxBno:int = 0; boxBno < collision2.box.length; boxBno++ ) {
					var bcollidex:Boolean = true;
					var bcollidey:Boolean = true;
					var bcollidez:Boolean = true;
					var minx2:Number = smesh.x + collision2.box[boxBno].x + collision2.box[boxBno].minx;
					var maxx2:Number = smesh.x + collision2.box[boxBno].x + collision2.box[boxBno].maxx;
					var miny2:Number = smesh.y + collision2.box[boxBno].y + collision2.box[boxBno].miny;
					var maxy2:Number = smesh.y + collision2.box[boxBno].y + collision2.box[boxBno].maxy;
					var minz2:Number = smesh.z + collision2.box[boxBno].z + collision2.box[boxBno].minz;
					var maxz2:Number = smesh.z + collision2.box[boxBno].z + collision2.box[boxBno].maxz;
					
					if ((y < smesh.y + collision2.box[boxBno].maxy) && (maxz >= minz2) &&(minz <= maxz2) && (maxy >= miny2) &&(miny <= maxy2) && (maxx >= minx2) && (minx <= maxx2)){
						//y = smesh.y + collision2.box[boxBno].maxy - collison.box[boxAno].miny;
						//y += diry;// -5;
						y += gravityy;// -5;
						//trace('+x');
						//trace('collision ground');
					}else{
						bcollidey = false;
					}
					
					if ((bcollidey == true)) {
						bcollision2 = true;
						//trace('collisionxz');
						break;
					}
				}
				
				if (bcollision2) {
					bcollision = true;
					//trace('intersetmesh collision......');
					//break;
				}
			///}
			//return bcollision;
			
		}
		
		
	}
	
}