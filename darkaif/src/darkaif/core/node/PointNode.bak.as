/**
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package darkaif.core.node
{
	//faslh devolop
	import flash.geom.Point;
	import org.flashdevelop.utils.FlashConnect;
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	* 
	* Information: Build a path system base on star path code.
	* 
	* Need to clean build path and write a reuse code for path.
	* 
	*/
	public class PointNode {	
		
		//{variables
		
		//start and end goal
		//{
		public var bstart:Boolean = false;
		public var startx:Number = 0;
		public var starty:Number = 0;
		public var startz:Number = 0;
		
		public var bend:Boolean = false;
		public var endx:Number = 0;
		public var endy:Number = 0;
		public var endz:Number = 0;
		
		public var goalstart:PointNodePath = new PointNodePath();
		public var goalend:PointNodePath = new PointNodePath();
		//}
		
		//{
		public var gridsizex:Number = 32;
		public var gridsizey:Number = 32;
		public var gridsizez:Number = 32;
		//}
		
		public var bpathfinish:Boolean = false;
		public var bpathbuildarray:Boolean = false;
		public var pathcount:int = 0;
		
		public var nodepath:Array = new Array();
		
		public var blockmesh:Array = new Array();
		//public var closepath:Array = new Array();
		//public var openpath:Array = new Array();
		//public var visitedpath:Array = new Array();
		public var pathbuild:Array = new Array();
		
		public var time:Number = 0;
		public var timemax:Number = 1;
		
		//}
		
		public function PointNode() {
			
		}
		
		public function setstart(x:Number, y:Number ,z:Number):void {
			startx = x;
			starty = y;
			startz = z;
			goalstart.bvisited = true
			goalstart.x = Math.floor (x/gridsizex);
			goalstart.y = Math.floor (y/gridsizey);
			goalstart.z = Math.floor (z / gridsizez);
			
			//clean path
			nodepath = new Array();
			pathbuild = new Array();
			bpathfinish = false;
			bpathbuildarray = false;
			bstart = false;
		}
		
		public function setend(x:Number, y:Number ,z:Number):void {
			endx = x;
			endy = y;
			endz = z;
			goalend.x = Math.floor (x / gridsizex);
			goalend.y = Math.floor (y / gridsizey);
			goalend.z = Math.floor (z / gridsizez);
			bend = false;
			nodepath = new Array();
			pathbuild = new Array();
			bpathfinish = false;
			bpathbuildarray = false;
		}
		
		
		
		public function update():void {
			time++;
			if (time > timemax) {
				time = 0;
				if(!bpathfinish){
					//trace("[start: x:" + startx + " y:" + starty + " z:" + startz + "] [end: x:" + endx + " y:" + endy + " z:" + endz+"]")
					
					buildpath();
					//listnode();
				}
			}
		}
		
		public function buildpath():void {
			var startposition:PointNodePath =  new PointNodePath();
			startposition.x = Math.floor(startx / gridsizex);
			startposition.y = Math.floor(starty / gridsizey);
			startposition.z = Math.floor(startz / gridsizez);
			var endposition:PointNodePath =  new PointNodePath();
			endposition.x = Math.floor(endx / gridsizex);
			endposition.y = Math.floor(endy / gridsizey);
			endposition.z = Math.floor(endz / gridsizez);
			for (var nodeno:int = 0; nodeno < nodepath.length; nodeno++) {
				if ((nodepath[nodeno].x == startposition.x) && (nodepath[nodeno].y == startposition.y) && (nodepath[nodeno].z == startposition.z)) {
					bstart = true;
				}
				if ((nodepath[nodeno].x == endposition.x) && (nodepath[nodeno].y == endposition.y) && (nodepath[nodeno].z == endposition.z)) {
					bend = true;
				}
			}
			if (!bstart) {
				//trace('added start');
				nodepath.push(startposition);
				neighbour(startposition);
			}
			if (!bend) {
				//trace('added end');
				nodepath.push(endposition);
			}
			
			//trace (Math.floor(startx / gridsizex));
			//trace (starty / gridsizey);
			//trace (startz / gridsizez);
		}
		
		//list node
		public function listnode():void {
			for (var nodeno:int = 0; nodeno < nodepath.length ; nodeno++ ) {
				trace ("node id:" + nodeno + " x:" + nodepath[nodeno].x + " y:" + nodepath[nodeno].y + " z:" + nodepath[nodeno].z + " f:" + nodepath[nodeno].f + " h:" + nodepath[nodeno].h + " g:" + nodepath[nodeno].g);
			}
		}
		
		//add node
		public function neighbour(node:PointNodePath):void {
			
			if ((node.x == goalend.x ) && (node.y == goalend.y ) && (node.z == goalend.z )) {
				bpathfinish = true;
				//trace("nx:" + node.x +" gx:" + goalend.x  +" ny:" + node.y  +" gy:" +  goalend.y  +" nz:" + node.z  +" gz:" +  goalend.z);
				//trace("parent:"+ node.);
				//node.
				pathcount = 0;
				//start from end to start(going backward being parent id)
				var buildnode:PointNodePath = new PointNodePath();
				//trace("order path coutn:"+pathcount);
				buildnode.id = pathcount;
				buildnode.x = endx;
				buildnode.y = endy;
				buildnode.z = endz;
				//trace("LAST PATH:"+buildnode.x+":"+buildnode.y+":"+buildnode.z)
				pathbuild.push(buildnode);
				
				buildpathnode(node);
				//trace('finish!');
			}
			
			if(!bpathfinish){
			//{north
			var pointnodepath:PointNodePath = new PointNodePath();
			//trace("added north");
			pointnodepath.parent = node;
			pointnodepath.x = node.x;
			pointnodepath.z = node.z + 1;//grid 32*x
			
			pointnodepath.g = Math.abs(pointnodepath.x - goalstart.x) + Math.abs(pointnodepath.y - goalstart.y) + Math.abs(pointnodepath.z - goalstart.z);
			pointnodepath.h = Math.abs(pointnodepath.x - goalend.x) + Math.abs(pointnodepath.y - goalend.y) + Math.abs(pointnodepath.z - goalend.z);
			pointnodepath.f = pointnodepath.g + pointnodepath.h;
			//trace('f:'+pointnodepath.f + ' g:' + pointnodepath.g + ' h:' + pointnodepath.h);
			if (!checknode(pointnodepath.x, pointnodepath.y, pointnodepath.z)) {
				
				nodepath.push(pointnodepath);
			}
			//}
			
			//{east
			pointnodepath = new PointNodePath();
			//trace("added east");
			pointnodepath.parent = node;
			pointnodepath.x = node.x + 1;
			pointnodepath.z = node.z;
			
			pointnodepath.g = Math.abs(pointnodepath.x - goalstart.x) + Math.abs(pointnodepath.y - goalstart.y) + Math.abs(pointnodepath.z - goalstart.z);
			pointnodepath.h = Math.abs(pointnodepath.x - goalend.x) + Math.abs(pointnodepath.y - goalend.y) + Math.abs(pointnodepath.z - goalend.z);
			pointnodepath.f = pointnodepath.g + pointnodepath.h;
			//trace('f:'+pointnodepath.f + ' g:' + pointnodepath.g + ' h:' + pointnodepath.h);
			if (!checknode(pointnodepath.x, pointnodepath.y, pointnodepath.z)) {
				nodepath.push(pointnodepath);
			}
			//}
			
			//{south
			pointnodepath = new PointNodePath();
			//trace("added south");
			pointnodepath.parent = node;
			pointnodepath.x = node.x;
			pointnodepath.z = node.z - 1;
			
			pointnodepath.g = Math.abs(pointnodepath.x - goalstart.x) + Math.abs(pointnodepath.y - goalstart.y) + Math.abs(pointnodepath.z - goalstart.z);
			pointnodepath.h = Math.abs(pointnodepath.x - goalend.x) + Math.abs(pointnodepath.y - goalend.y) + Math.abs(pointnodepath.z - goalend.z);
			pointnodepath.f = pointnodepath.g + pointnodepath.h;
			//trace('f:'+pointnodepath.f + ' g:' + pointnodepath.g + ' h:' + pointnodepath.h);
			if (!checknode(pointnodepath.x, pointnodepath.y, pointnodepath.z)) {
				nodepath.push(pointnodepath);
			}
			//}
			
			//{west
			pointnodepath = new PointNodePath();
			//trace("added west");
			pointnodepath.parent = node;
			pointnodepath.x = node.x -1;
			pointnodepath.z = node.z;
			
			pointnodepath.g = Math.abs(pointnodepath.x - goalstart.x) + Math.abs(pointnodepath.y - goalstart.y) + Math.abs(pointnodepath.z - goalstart.z);
			pointnodepath.h = Math.abs(pointnodepath.x - goalend.x) + Math.abs(pointnodepath.y - goalend.y) + Math.abs(pointnodepath.z - goalend.z);
			pointnodepath.f = pointnodepath.g + pointnodepath.h;
			//trace('f:'+pointnodepath.f + ' g:' + pointnodepath.g + ' h:' + pointnodepath.h);
			if (!checknode(pointnodepath.x, pointnodepath.y, pointnodepath.z)) {
				nodepath.push(pointnodepath);
			}
			//}
			
			//{northeast
			pointnodepath = new PointNodePath();
			//trace("added northeast");
			pointnodepath.parent = node;
			pointnodepath.x = node.x +1;
			pointnodepath.z = node.z +1;
			
			pointnodepath.g = Math.abs(pointnodepath.x - goalstart.x) + Math.abs(pointnodepath.y - goalstart.y) + Math.abs(pointnodepath.z - goalstart.z);
			pointnodepath.h = Math.abs(pointnodepath.x - goalend.x) + Math.abs(pointnodepath.y - goalend.y) + Math.abs(pointnodepath.z - goalend.z);
			pointnodepath.f = pointnodepath.g + pointnodepath.h;
			//trace('f:'+pointnodepath.f + ' g:' + pointnodepath.g + ' h:' + pointnodepath.h);
			if (!checknode(pointnodepath.x, pointnodepath.y, pointnodepath.z)) {
				nodepath.push(pointnodepath);
			}
			//}
			
			//{souhteast
			pointnodepath = new PointNodePath();
			//trace("added southeast");
			pointnodepath.parent = node;
			pointnodepath.x = node.x +1;
			pointnodepath.z = node.z -1;
			
			pointnodepath.g = Math.abs(pointnodepath.x - goalstart.x) + Math.abs(pointnodepath.y - goalstart.y) + Math.abs(pointnodepath.z - goalstart.z);
			pointnodepath.h = Math.abs(pointnodepath.x - goalend.x) + Math.abs(pointnodepath.y - goalend.y) + Math.abs(pointnodepath.z - goalend.z);
			pointnodepath.f = pointnodepath.g + pointnodepath.h;
			//trace('f:'+pointnodepath.f + ' g:' + pointnodepath.g + ' h:' + pointnodepath.h);
			if (!checknode(pointnodepath.x, pointnodepath.y, pointnodepath.z)) {
				nodepath.push(pointnodepath);
			}
			//}
			
			//{southwest
			pointnodepath = new PointNodePath();
			//trace("added southwest");
			pointnodepath.parent = node;
			pointnodepath.x = node.x -1;
			pointnodepath.z = node.z -1;
			
			pointnodepath.g = Math.abs(pointnodepath.x - goalstart.x) + Math.abs(pointnodepath.y - goalstart.y) + Math.abs(pointnodepath.z - goalstart.z);
			pointnodepath.h = Math.abs(pointnodepath.x - goalend.x) + Math.abs(pointnodepath.y - goalend.y) + Math.abs(pointnodepath.z - goalend.z);
			pointnodepath.f = pointnodepath.g + pointnodepath.h;
			//trace('f:'+pointnodepath.f + ' g:' + pointnodepath.g + ' h:' + pointnodepath.h);
			if (!checknode(pointnodepath.x, pointnodepath.y, pointnodepath.z)) {
				nodepath.push(pointnodepath);
			}
			//}
			
			//{northwest
			pointnodepath = new PointNodePath();
			//trace("added northwest");
			pointnodepath.parent = node;
			pointnodepath.x = node.x -1;
			pointnodepath.z = node.z +1;
			
			pointnodepath.g = Math.abs(pointnodepath.x - goalstart.x) + Math.abs(pointnodepath.y - goalstart.y) + Math.abs(pointnodepath.z - goalstart.z);
			pointnodepath.h = Math.abs(pointnodepath.x - goalend.x) + Math.abs(pointnodepath.y - goalend.y) + Math.abs(pointnodepath.z - goalend.z);
			pointnodepath.f = pointnodepath.g + pointnodepath.h;
			//trace('f:'+pointnodepath.f + ' g:' + pointnodepath.g + ' h:' + pointnodepath.h);
			if (!checknode(pointnodepath.x, pointnodepath.y, pointnodepath.z)) {
				nodepath.push(pointnodepath);
			}
			//}
			
			//trace('--' + minvalue);
			//nodepath.sortOn("f", Array.NUMERIC);
			var arrrayvalue:Array = new Array();
			for (var nonodevalue:int = 0; nonodevalue < nodepath.length; nonodevalue++) {
				if (nodepath[nonodevalue].f != 0){
				arrrayvalue.push(nodepath[nonodevalue].f);
				}
			}
			
			var minValue:Number = Math.min.apply(null, arrrayvalue);
			//trace('--'+minValue);
			
			for (var nonode:int = 0; nonode < nodepath.length; nonode++) {
				if ((nodepath[nonode].f == minValue)&&(nodepath[nonode].bvisited == false)) {
					nodepath[nonode].bvisited = true;
					neighbour(nodepath[nonode]);
				}
			}
			}
			//listnode();
		}
		
		//check position if exist
		public function checknode(nx:Number , ny:Number, nz:Number):Boolean {
			var bmatches:Boolean = false;
			for (var nodeno:int = 0; nodeno < nodepath.length ; nodeno++ ) {
				if ((nodepath[nodeno].x == nx) && (nodepath[nodeno].y == ny) && (nodepath[nodeno].z == nz)) {
					bmatches = true;
					break;
				}
			}
			return bmatches;
		}
		
		public function buildpathnode(node:PointNodePath):void {
			
			//trace("[=====]");
			//trace("path: x:"+node.x + ":" + node.y +":"+node.z)
			//if ((node.x == startx)&& (node.y == starty)&&(node.z == startz)) {
				//trace("..PATH FINISH...");
			pathcount++;
			
			//trace("order path coutn:"+pathcount);
			//if(node != null){
			
			var buildnode:PointNodePath = new PointNodePath();
			
			buildnode.id = pathcount;
			buildnode.x = node.x * gridsizex;//32uni pixel
			buildnode.y = node.y * gridsizey;
			buildnode.z = node.z * gridsizez;
			//trace(buildnode.x+":"+buildnode.y+":"+buildnode.z)
			pathbuild.push(buildnode);
			
			//}else {
				if(node.parent != null){
					buildpathnode(node.parent);
				}else {
					bpathbuildarray = true;
					//trace("finish...?");
				}
				//pathbuild.push();
			///}
			///}
		}
		
		/*
		public function distance():void {
			
		}
		
		public function nodedistance():void {
			
		}
		*/
	}
}