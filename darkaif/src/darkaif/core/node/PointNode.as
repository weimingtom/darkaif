﻿/**
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package darkaif.core.node
{
	
	//{
	import darkaif.core.math.Vertex3DPoint;
	import flash.geom.Point;
	import org.flashdevelop.utils.FlashConnect;
	//}
	
	/**
	* ..
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
		public var bstart:Boolean = false;
		public var bend:Boolean = false;
		public var start:PointNodePath = new PointNodePath();
		public var end:PointNodePath = new PointNodePath();
		public var goalstart:PointNodePath = new PointNodePath();
		public var goalend:PointNodePath = new PointNodePath();
		public var gridsize:Vertex3DPoint = new Vertex3DPoint(32,32,32);
		
		public var bpathfinish:Boolean = false;
		public var bpathbuildarray:Boolean = false;
		public var pathcount:int = 0;
		public var nodepath:Array = new Array();
		public var blockmesh:Array = new Array();
		public var pathbuild:Array = new Array();
		
		public var time:Number = 0;
		public var timemax:Number = 1;
		
		//}
		
		public function PointNode() {
			
		}
		
		public function setstart(x:Number, y:Number ,z:Number):void {
			start.x = x;
			start.y = y;
			start.z = z;
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
			end.x = x;
			end.y = y;
			end.z = z;
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
					//trace("[start.: x:" + start.x + " y:" + start.y + " z:" + start.z + "] [end.: x:" + end.x + " y:" + end.y + " z:" + end.z+"]")
					buildpath();
					//listnode();
				}
			}
		}
		
		public function buildpath():void {
			var startposition:PointNodePath =  new PointNodePath();
			startposition.x = Math.floor(start.x / gridsize.x);
			startposition.y = Math.floor(start.y / gridsize.y);
			startposition.z = Math.floor(start.z / gridsize.z);
			var endposition:PointNodePath =  new PointNodePath();
			endposition.x = Math.floor(end.x / gridsize.x);
			endposition.y = Math.floor(end.y / gridsize.y);
			endposition.z = Math.floor(end.z / gridsize.z);
			for (var nodeno:int = 0; nodeno < nodepath.length; nodeno++) {
				if ((nodepath[nodeno].x == startposition.x) && (nodepath[nodeno].y == startposition.y) && (nodepath[nodeno].z == startposition.z)) {
					bstart = true;
				}
				if ((nodepath[nodeno].x == endposition.x) && (nodepath[nodeno].y == endposition.y) && (nodepath[nodeno].z == endposition.z)) {
					bend = true;
				}
			}
			if (!bstart) {
				//trace('added start.');
				nodepath.push(startposition);
				neighbour(startposition);
			}
			if (!bend) {
				//trace('added end.');
				nodepath.push(endposition);
			}
			
			//trace (Math.floor(start.x / gridsize.x));
			//trace (start.y / gridsize.y);
			//trace (start.z / gridsize.z);
		}
		
		//list node
		public function listnode():void {
			for (var nodeno:int = 0; nodeno < nodepath.length ; nodeno++ ) {
				trace ("node id:" + nodeno + " x:" + nodepath[nodeno].x + " y:" + nodepath[nodeno].y + " z:" + nodepath[nodeno].z + " f:" + nodepath[nodeno].f + " h:" + nodepath[nodeno].h + " g:" + nodepath[nodeno].g);
			}
		}
		
		//check node
		public function neighbour(node:PointNodePath):void {
			
			if ((node.x == goalend.x ) && (node.y == goalend.y ) && (node.z == goalend.z )) {
				bpathfinish = true;
				//trace("nx:" + node.x +" gx:" + goalend.x  +" ny:" + node.y  +" gy:" +  goalend.y  +" nz:" + node.z  +" gz:" +  goalend.z);
				//trace("parent:"+ node.);
				//node.
				pathcount = 0;
				//start. from end. to start.(going backward being parent id)
				var buildnode:PointNodePath = new PointNodePath();
				//trace("order path coutn:"+pathcount);
				buildnode.id = pathcount;
				buildnode.x = end.x;
				buildnode.y = end.y;
				buildnode.z = end.z;
				//trace("LAST PATH:"+buildnode.x+":"+buildnode.y+":"+buildnode.z)
				pathbuild.push(buildnode);
				
				buildpathnode(node);
				//trace('finish!');
			}
			
			if(!bpathfinish){
				buildnodeneighbour(node);
			
			//trace('--' + minvalue);
			//nodepath.sortOn("f", Array.NUMERIC);
			var arrrayvalue:Array = new Array();
			for (var nonodevalue:int = 0; nonodevalue < nodepath.length; nonodevalue++) {
				//if ((nodepath[nonodevalue].f != 0) || (nodepath[nonodevalue].bblock == false)) {
				if ((nodepath[nonodevalue].f != 0)){
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
		
		//build node 8 paths
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
						trace("--path collision");	
						//bcollision = true;
						break;
					}
					
				}
			}
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
		}
		
	}
}