﻿package darknet.engine.sandy.entity 
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
			x += dirx;
			y += diry;
			z += dirz;
			
			for (var meshno:int = 0; meshno < meshs.length; meshno++) {
				meshs[meshno].mesh.x = x;
				meshs[meshno].mesh.y = y;
				meshs[meshno].mesh.z = z;
				meshs[meshno].mesh.frame += framespeed;
				
				//meshs[meshno].actionframe.length
				
				if (meshs[meshno].mesh.frame > framemax) {
					meshs[meshno].mesh.frame = framemin;
				}
				if (meshs[meshno].mesh.frame < framemin) {
					meshs[meshno].mesh.frame = framemin;
				}
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
		 * @param	smesh This will return bool collision from array store (default box)
		 * @return 
		 */
		public function intersetbox(smesh:SMesh):void {
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
	}
	
}