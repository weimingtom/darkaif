package  
{
	//{
	import flash.display.Sprite;
	import gearunits.entity.building.BuildingWall;
	import gearunits.entity.infantry.UnitBlock;
	import gearunits.entity.StructureUnit;
	import gearunits.nodepath.NodePoint3D;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import sandy.core.Scene3D;
	import sandy.core.data.*;
	import sandy.core.scenegraph.*;
	import sandy.materials.*;
	import sandy.materials.attributes.*;
	import sandy.primitive.*;
	import sandy.parser.*;
	import sandy.util.*;
	import sandy.events.*;
	import sandy.view.*;
	//}
	
	/**
	 * ...
	 * @author Darknet
	 * 
	 * Information: This is a prefab build for AI path for game build test.
	 * This for basic collisin build and no terrain detection yet.
	 * 
	 * Path build:
	 * This is 32 unit space.
	 * 1 | 2 | 3
	 * 8 | 0 | 4
	 * 7 | 6 | 5
	 * 
	 * To do list:
	 * need to work on flow path
	 * need to do the cost to get there
	 * 
	 */
	
	public class GearUnitPath3D02 extends Sprite
	{
		//{
		//sandy engine
		public var scene:Scene3D; // just one scene or the world
		public var camera:Camera3D; //basic one cam
		public var g:Group = new Group("myGroup");
		public var terrainplane:Shape3D = new Plane3D('terrainplane', 512, 512, 16, 16, Plane3D.ZX_ALIGNED, 'quad');
		
		public var unit:Vector.<StructureUnit> = new Vector.<StructureUnit>();
		
		public var path:Vector.<NodePoint3D> = new Vector.<NodePoint3D>();
		public var pathnode:Vector.<NodePoint3D> = new Vector.<NodePoint3D>();
		//public var opennode:Vector.<NodePoint3D> = new Vector.<NodePoint3D>();
		//public var closenode:Vector.<NodePoint3D> = new Vector.<NodePoint3D>();
		public var pointsandy3d:Array = new Array();
		
		public var pointa:NodePoint3D = new NodePoint3D();
		public var pointb:NodePoint3D = new NodePoint3D();
		public var bfinishpath:Boolean = false;
		
		//this handle endless loop for path check
		public var pathcount:int = 0;
		public var pathcountmax:int = 32;
		public var line:Line3D;
		public var linepath:Array = new Array();
		public var unitbot:StructureUnit = new UnitBlock();
		//}
		
		public function GearUnitPath3D02() {
			//{ Scene world
			camera = new Camera3D(320, 240);
			camera.far = 1000;
			camera.near = 0;
			camera.y = 300;
			camera.lookAt(0, 0, 0);
			camera.x = -90;
			camera.z = -170;
			// We create the "group" that is the tree of all the visible objects
			var root:Group = g;
			// We create a Scene and we add the camera and the objects tree 
			scene = new Scene3D( "scene", this, camera, root );
			addEventListener( Event.ENTER_FRAME, enterFrameHandler );
			//}
			var materialAttr:MaterialAttributes = new MaterialAttributes(new LineAttributes( 0.5, 0x2111BB, 0.4 ), new LightAttributes( true, 0.1));
			var material:Material = new ColorMaterial( 0xFFCC33, 1, materialAttr );
			//material.lightingEnable = true;
			var app:Appearance = new Appearance( material );
			terrainplane.appearance  = app;
			
			//trace('grid:' + NodePoint3D.gridsize);
			//NodePoint3D.gridsize = 16;
			//trace('grid:'+NodePoint3D.gridsize);
			
			buildterrain();
			buildunits();
		}
		
		public function buildterrain():void {
			terrainplane.enableClipping = true;
			terrainplane.enableNearClipping = true;
			terrainplane.enableEvents = true;
			terrainplane.enableInteractivity = true;
			terrainplane.addEventListener(MouseEvent.CLICK, positionpoint);
			terrainplane.useSingleContainer = false;
			terrainplane.enableBackFaceCulling = true;
			g.addChild(terrainplane);
		}
		
		public function buildunits():void {
			var createunit:StructureUnit;
			//bot or player
			//createunit = new UnitBlock();
			g.addChild(unitbot.mesh);
			//unit.push(createunit);
			//wall
			createunit = new BuildingWall();
			createunit.z = -64;
			g.addChild(createunit.mesh);
			unit.push(createunit);
			
			createunit = new BuildingWall();
			createunit.z = -128;
			g.addChild(createunit.mesh);
			unit.push(createunit);
			
			createunit = new BuildingWall();
			createunit.x = -64;
			createunit.z = -64;
			g.addChild(createunit.mesh);
			unit.push(createunit);
			
			createunit = new BuildingWall();
			createunit.x = -128;
			createunit.z = -128;
			g.addChild(createunit.mesh);
			unit.push(createunit);
		}
		
		public function positionpoint(event:Shape3DEvent):void {
			//event.point
			path = new Vector.<NodePoint3D>();
			pathcount = 0;
			bfinishpath = false;
			pointsandy3d = new Array();
			
			//trace('point');
			//position pointer (end point)
			//var gridpoint1:NodePoint3D = new NodePoint3D(Math.floor(event.point.x / 32), Math.floor(event.point.y / 32), Math.floor(event.point.z / 32));
			var gridpoint1:NodePoint3D = new NodePoint3D();
			gridpoint1.sandypointgrid(event.point);
			//current position bot
			//var gridpoint2:NodePoint3D = new NodePoint3D(Math.floor(unitbot.x / 32), Math.floor(unitbot.y / 32), Math.floor(unitbot.z / 32));
			var gridpoint2:NodePoint3D = new NodePoint3D();
			gridpoint2.unitpointgrid(unitbot);
			
			//start point
			pointa.x = gridpoint2.x;
			pointa.y = gridpoint2.y;
			pointa.z = gridpoint2.z;
			//end point
			pointb.x = gridpoint1.x;
			pointb.y = gridpoint1.y;
			pointb.z = gridpoint1.z;
			
			trace(gridpoint2 + '=>' + gridpoint1);
			
			//start point
			createpoint(pointa.x, pointa.y, pointa.z);
			
			startpoint(pointa);
		}
		
		public function startpoint(point:NodePoint3D):void {
			pathcount++;
			var buildpath:Vector.<NodePoint3D> = new Vector.<NodePoint3D>();
			
			if ((pointb.x == point.x)&&(pointb.y == point.y)&&(pointb.z == point.z)) {
				bfinishpath = true;
				trace('finish...');
				patharray(point);
			}else if (pathcount > pathcountmax) {
				bfinishpath = true;
				trace('break infi loop... number of path:'+path.length);
				patharray(point);
			}else {
				
			}
			
			if(bfinishpath == false){
				var buildpointpath:NodePoint3D;
				
				//{ Build Path node point
				//NORTH POINT
				buildpointpath = createpoint(point.x, point.y, point.z + 1,point);
				buildpath.push(buildpointpath);
				
				//EAST
				buildpointpath = createpoint(point.x + 1, point.y, point.z,point);
				buildpath.push(buildpointpath);
				
				//SOUTH
				buildpointpath = createpoint(point.x, point.y, point.z - 1,point);
				buildpath.push(buildpointpath);
				
				//WEST
				buildpointpath = createpoint(point.x - 1, point.y, point.z,point);
				buildpath.push(buildpointpath);
				
				//SOUTH EAST
				buildpointpath = createpoint(point.x + 1, point.y, point.z - 1,point);
				buildpath.push(buildpointpath);
				//SOUTH WEST
				buildpointpath = createpoint(point.x - 1, point.y, point.z - 1,point);
				buildpath.push(buildpointpath);
				//NORTH EAST
				buildpointpath = createpoint(point.x + 1, point.y, point.z + 1,point);
				buildpath.push(buildpointpath);
				//NORTHWEST
				buildpointpath = createpoint(point.x - 1, point.y, point.z + 1,point);
				buildpath.push(buildpointpath);
				
				//}
				//trace(path.length);
				//find the lowest number to start and end point
				var fpath:Array = new Array();
				for (var fno:int = 0; fno < buildpath.length; fno ++) {
					//check if path is walkable
					if ((buildpath[fno].walkable == true) && (buildpath[fno].bvisited == false)) {
						trace(buildpath[fno].f);
						fpath.push(buildpath[fno].f);
					}
				}
			
				var minValue:Number = Math.min.apply(null, fpath);
				trace('lowest number:'+minValue);
				//buildpath.concat();
				
				for (var buildpathno:int = 0; buildpathno < buildpath.length; buildpathno++ ) {
					//trace('..' + buildpath[buildpathno].f);
					if ((buildpath[buildpathno].f == minValue)&&(buildpath[buildpathno].walkable == true)&&(buildpath[buildpathno].bvisited == false)) {
						startpoint(buildpath[buildpathno]);
						//trace('found..['+buildpath[buildpathno].x+'::'+buildpath[buildpathno].y+':'+buildpath[buildpathno].z+']');
						break;
					}
				}
			}
		}
		
		//code check for collision
		public function createpoint(px:Number,py:Number,pz:Number,nodeparent:NodePoint3D = null):NodePoint3D {
			var node:NodePoint3D = new NodePoint3D(px, py, pz);
			node.parent = nodeparent;
			node.distcost(pointa,pointb);
			//simple collision box
			for (var collisioncheckno:int = 0; collisioncheckno < unit.length ;collisioncheckno++ ) {
				if ((Math.floor(unit[collisioncheckno].x / 32) == node.x) && (Math.floor(unit[collisioncheckno].y / 32) == node.y) && (Math.floor(unit[collisioncheckno].z / 32) == node.z)) {
					trace('collision------');
					node.walkable = false;
					break;
				}
			}
			//node check point
			var nodefound:Boolean = false;
			for (var pathno:Number = 0; pathno < path.length; pathno++ ) {
				if ((path[pathno].x == px)&& (path[pathno].y == py) && (path[pathno].z == pz)) {
					nodefound = true;
					node.bvisited = true;
					//trace('found path array...'+path[pathno]);
					break;
				}
			}
			//if node exist in path add in else not over lap it
			if (nodefound == false) {
				path.push(node);
			}
			return node;
		}
		
		//this will set the path build and draw line path
		public function patharray(node:NodePoint3D):void {
			node.x = node.x * 32;
			node.z = node.z * 32;
			pointsandy3d.push(node);
			if (node.parent) {
				patharray(node.parent);//add path to sandy array
			}else {//if there no more path then create line.
				g.removeChildByName('line');
				if(pointsandy3d.length > 1){
					line = new Line3D('line', pointsandy3d);
					line.enableForcedDepth = true;
					line.depth = -1;
					g.addChild(line);
				}
			}
		}
		
		// This update the code and the function when every frame count is pass
		public function enterFrameHandler( event : Event ) : void {
			//update unit position
			for each(var unitclass:StructureUnit in unit ) {
				unitclass.update();
			}
			scene.render();
		}
		
	}
	
}