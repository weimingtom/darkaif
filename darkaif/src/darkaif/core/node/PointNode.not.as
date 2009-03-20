/**
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package darkaif.core.node
{
	//faslh devolop
	import darkaif.core.math.Vertex3DPoint;
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
		public var gridsize:Vertex3DPoint = new Vertex3DPoint(16,16,16);
		
		//}
		
		public var bpathfinish:Boolean = false;
		public var bpathbuildarray:Boolean = false;
		public var pathcount:int = 0;
		public var blockmesh:Array = new Array();
		public var nodepath:Array = new Array();
		public var pathbuild:Array = new Array();
		public var openpath:Array = new Array();
		
		public var nodepoint:PointNodePath = new PointNodePath();
		
		public var time:Number = 0;
		public var timemax:Number = 1;
		
		//}
		
		//main class
		public function PointNode() {
			
		}
		
		public function setblockpath(_x:Number, _y:Number, _z:Number):void {
			//convert position
			var blockpoint:PointNodePath = new PointNodePath();
			blockpoint.x = Math.floor (_x / gridsize.x);
			blockpoint.y = Math.floor (_y / gridsize.y);
			blockpoint.z = Math.floor (_z / gridsize.z);
			blockpoint.bvisited = true;
		}
		
		public function setstart(x:Number, y:Number ,z:Number):void {
			startx = x;
			starty = y;
			startz = z;
			goalstart.bvisited = true
			goalstart.x = Math.floor (x/gridsize.x);
			goalstart.y = Math.floor (y/gridsize.y);
			goalstart.z = Math.floor (z/gridsize.z);
			
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
			goalend.x = Math.floor (x / gridsize.x);
			goalend.y = Math.floor (y / gridsize.y);
			goalend.z = Math.floor (z / gridsize.z);
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
			startposition.x = Math.floor(startx / gridsize.x);
			startposition.y = Math.floor(starty / gridsize.y);
			startposition.z = Math.floor(startz / gridsize.z);
			var endposition:PointNodePath =  new PointNodePath();
			endposition.x = Math.floor(endx / gridsize.x);
			endposition.y = Math.floor(endy / gridsize.y);
			endposition.z = Math.floor(endz / gridsize.z);
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
		}
		
		//list node
		public function listnode():void {
			for (var nodeno:int = 0; nodeno < nodepath.length ; nodeno++ ) {
				trace ("node id:" + nodeno + " x:" + nodepath[nodeno].x + " y:" + nodepath[nodeno].y + " z:" + nodepath[nodeno].z + " f:" + nodepath[nodeno].f + " h:" + nodepath[nodeno].h + " g:" + nodepath[nodeno].g);
			}
		}
		
		//add node
		public function neighbour(node:PointNodePath):void {
			//if found exit exit the loop
			if ((node.x == goalend.x ) && (node.y == goalend.y ) && (node.z == goalend.z )) {
				bpathfinish = true;
				//trace("nx:" + node.x +" gx:" + goalend.x  +" ny:" + node.y  +" gy:" +  goalend.y  +" nz:" + node.z  +" gz:" +  goalend.z);
				//trace("parent:"+ node.);
				//node.
				pathcount = 0;
				//start from end to start(going backward being parent id)
				var buildnode:PointNodePath = new PointNodePath();
				
				buildnode.id = pathcount;
				buildnode.x = endx;
				buildnode.y = endy;
				buildnode.z = endz;
				
				//pathbuild.push(buildnode); //start from the end first
				buildpathnode(node);
				//trace("order path count:"+pathcount);
				//trace("LAST PATH:"+buildnode.x+":"+buildnode.y+":"+buildnode.z)
				trace('finish! node');
			}
			
			if (nodepath.length > 200) {
				bpathfinish = true;
				for (var nodelist:int = 0; nodelist < nodepath.length ;nodelist++ ) {
					//trace("x: " + nodepath[nodelist].x +" y:" + nodepath[nodelist].y + " :z" + nodepath[nodelist].z);
					if ((nodepath[nodelist].x == goalend.x ) && (nodepath[nodelist].y == goalend.y ) && (nodepath[nodelist].z == goalend.z )) {
						trace("MATCHES...........");
					}
				}
				trace("--------------------------------------------------------");
				trace("start x: " + goalstart.x +" y:" + goalstart.y + " :z" + goalstart.z);
				trace("end x: " + goalend.x +" y:" + goalend.y + " :z" + goalend.z);
			}
			
			//{ //PATH NODE BUILD
			if (!bpathfinish) {
				openpath = new Array();
				openpath = buildnodeneighbour(node);
				
				var arrrayvalue:Array = new Array();
				for (var nonodevalue:int = 0; nonodevalue < openpath.length; nonodevalue++) {
					//if ((openpath[nonodevalue].f != 0)&&(openpath[nonodevalue].bblock == false)){
					if ((openpath[nonodevalue].f != 0)){
						arrrayvalue.push(openpath[nonodevalue].f);
						//trace('add node f');
					}else {
						//trace('didnt add node f');
					}
				}
				arrrayvalue.sortOn("f", Array.NUMERIC);
				var minValue:Number = arrrayvalue[0];
				
				for (var nonode:int = 0; nonode < nodepath.length; nonode++) {
					//if ((nodepath[nonode].f == minValue) && (nodepath[nonode].bvisited == false) && (nodepath[nonode].bblock == false)) {
					if ((nodepath[nonode].f == minValue) && (nodepath[nonode].bvisited == false)) {
						nodepath[nonode].bvisited = true;
						trace( "ID:"+ nodepath[nonode].id + "F:found: " + nodepath[nonode].f + " x:" + nodepath[nonode].x + " z:" + nodepath[nonode].z);
						neighbour(nodepath[nonode]);
						//break;
					}else {
						
					}
				}
			}
			//listnode();
		}
		
		public function buildnodeneighbour(node:PointNodePath):Array {
			var path8:Array = new Array();
			path8.push(buildnodepoint(node,0,0,1));
			//{north
			/*
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
				checkcollision(buildnode);
				nodepath.push(pointnodepath);
			}
			*/
			//}
			
			path8.push(buildnodepoint(node, 1, 0, 1));
			//{northeast
			/*
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
				checkcollision(buildnode);
				nodepath.push(pointnodepath);
			}
			*/
			//}
			
			path8.push(buildnodepoint(node,1,0,0));
			//{east
			/*
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
				checkcollision(buildnode);
				nodepath.push(pointnodepath);
			}
			*/
			//}
			
			path8.push(buildnodepoint(node,1,0,-1));
			//{souhteast
			/*
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
				checkcollision(buildnode);
				nodepath.push(pointnodepath);
			}
			*/
			//}
			
			path8.push(buildnodepoint(node,0,0,-1));
			//{south
			/*
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
				checkcollision(buildnode);
				nodepath.push(pointnodepath);
			}
			*/
			//}
			
			path8.push(buildnodepoint(node,-1,0,0));
			//{west
			/*
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
				checkcollision(buildnode);
				nodepath.push(pointnodepath);
			}
			*/
			//}
			
			path8.push(buildnodepoint(node,-1,0,-1));
			//{southwest
			/*
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
				checkcollision(buildnode);
				nodepath.push(pointnodepath);
			}
			*/
			//}
			
			path8.push(buildnodepoint(node,-1,0,1));
			//{northwest
			/*
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
				checkcollision(buildnode);
				nodepath.push(pointnodepath);
			}
			*/
			//}
			
			return path8;
		}
		
		//build var node point and push nodepath array
		public function buildnodepoint(node:PointNodePath, nx:Number = 0, ny:Number = 0 , nz:Number = 0 ):PointNodePath {
			//buildnode.id = pathcount;
			pathcount++;
			var pointnodepath:PointNodePath = new PointNodePath();
			//trace("added northwest");
			pointnodepath.id = pathcount;
			pointnodepath.parent = node;
			pointnodepath.x = node.x + nx;
			pointnodepath.y = node.y + ny;
			pointnodepath.z = node.z + nz;
			
			pointnodepath.g = Math.abs(pointnodepath.x - goalstart.x) + Math.abs(pointnodepath.y - goalstart.y) + Math.abs(pointnodepath.z - goalstart.z);
			pointnodepath.h = Math.abs(pointnodepath.x - goalend.x) + Math.abs(pointnodepath.y - goalend.y) + Math.abs(pointnodepath.z - goalend.z);
			pointnodepath.f = pointnodepath.g + pointnodepath.h;
			//trace('f:'+pointnodepath.f + ' g:' + pointnodepath.g + ' h:' + pointnodepath.h);
			if ((node.x == goalend.x ) && (node.y == goalend.y ) && (node.z == goalend.z )) {
				bpathfinish = true;
				trace('finish');
				//trace('finish');
				//buildpathnode(node);
			}
			
			if (!checknode(pointnodepath.x, pointnodepath.y, pointnodepath.z)) {
				checkcollision(pointnodepath);
				//trace("block:"+pointnodepath.bblock);
				nodepath.push(pointnodepath);
				return pointnodepath;
			}else {
				//trace('node exist');
				return new PointNodePath;
			}
			
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
		
		//build path from backward order for path to follow
		public function buildpathnode(node:PointNodePath):void {
			pathcount++;
			var buildnode:PointNodePath = new PointNodePath();
			
			buildnode.id = pathcount;
			buildnode.x = node.x * gridsize.x;//32uni pixel
			buildnode.y = node.y * gridsize.y;
			buildnode.z = node.z * gridsize.z;
			//trace(buildnode.x+":"+buildnode.y+":"+buildnode.z);
			pathbuild.push(buildnode);
			//trace("block:" + node.bblock);
			
			if(node.parent != null){
				buildpathnode(node.parent);
			}else {
				bpathbuildarray = true;
				//trace("finish...?");
			}
			
			//trace("[=====]");
			//trace("path: x:"+node.x + ":" + node.y +":"+node.z)
			//if ((node.x == startx)&& (node.y == starty)&&(node.z == startz)) {
				//trace("..PATH FINISH...");
			//trace("order path coutn:"+pathcount);
			//if(node != null){
			///}else {
				
				//pathbuild.push();
			///}
			///}
		}
		
		//check collision for mesh object values
		public function checkcollision(node:PointNodePath):void {
			//trace('collision mesh for node');
			//blockmesh
			var minx:Number = (node.x * gridsize.x) - (gridsize.x / 2);
			var miny:Number = (node.y * gridsize.y) - (gridsize.y / 2);
			var minz:Number = (node.z * gridsize.z) - (gridsize.z / 2);
			
			var maxx:Number = (node.x * gridsize.x) + (gridsize.x / 2);
			var maxy:Number = (node.y * gridsize.y) + (gridsize.y / 2);
			var maxz:Number = (node.z * gridsize.z) + (gridsize.z / 2);
			//trace('path collision');
			for (var meshno:int = 0; meshno < blockmesh.length; meshno++) {
				for (var boxno:int = 0; boxno < blockmesh[meshno].boxcollision.length; boxno++) {
					var minx2:Number = blockmesh[meshno].boxcollision[boxno].minx+ blockmesh[meshno].model.x;
					var miny2:Number = blockmesh[meshno].boxcollision[boxno].miny+ blockmesh[meshno].model.y;
					var minz2:Number = blockmesh[meshno].boxcollision[boxno].minz + blockmesh[meshno].model.z;
					
					var maxx2:Number = blockmesh[meshno].boxcollision[boxno].maxx+ blockmesh[meshno].model.x;
					var maxy2:Number = blockmesh[meshno].boxcollision[boxno].maxy+ blockmesh[meshno].model.y;
					var maxz2:Number = blockmesh[meshno].boxcollision[boxno].maxz + blockmesh[meshno].model.z;
					
					if ((maxz >= minz2) &&(minz <= maxz2) &&
						(maxy >= miny2) &&(miny <= maxy2) &&
						(maxx >= minx2) && (minx <= maxx2)){
						node.bblock = true;
						//trace("--path collision");	
						//bcollision = true;
						break;
					}
					
				}
			}
		}
		
	}
}