package  
{
	//{
	import away3d.containers.View3D;
	import away3d.core.geom.Line2D;
	import away3d.core.math.Number3D;
	import away3d.events.MouseEvent3D;
	import away3d.materials.WireColorMaterial;
	import away3d.primitives.LineSegment;
	import away3d.primitives.Plane;
	import flash.display.Sprite;
	import flash.events.Event;
	import gearunits.away3d.entity.AStructureUnit;
	import gearunits.away3d.entity.AUnitClass;
	import gearunits.away3d.entity.building.ABuildingWall;
	import gearunits.away3d.entity.infantry.AUnitBlock;
	import gearunits.away3d.node.ANodePoint3D;
	//}
	
	/**
	 * ...
	 * @author Darknet
	 * 
	 * Information: This is a prefab build for AI path for game build test.
	 * This for basic collisin build and no terrain build detection yet.
	 * Path build is getting some error in infinite loop need to fix. Bit stable.
	 * This work for away3d, sandy3d, and papervision3d. I coded the same way.
	 * 
	 * Note: Papervision3d is partly fixed. That deal with plane slope will give infinite loop.
	 * 
	 */
	
	public class Away3DGearUnitPathBeta extends Sprite
	{
		//{
		public var view:View3D = new View3D( { x:320, y:240 } );
		public var plane3d:Plane = new Plane( { name:'plane', material:"white#black", width:512, height:512, alpha:1 } );
		
		public var unit:Vector.<AStructureUnit> = new Vector.<AStructureUnit>();
		
		public var path:Vector.<ANodePoint3D> = new Vector.<ANodePoint3D>();
		public var pathnode:Vector.<ANodePoint3D> = new Vector.<ANodePoint3D>();
		public var pointaway3d:Array = new Array();
		
		public var pointa:ANodePoint3D = new ANodePoint3D();
		public var pointb:ANodePoint3D = new ANodePoint3D();
		public var bfinishpath:Boolean = false;
		
		//this handle endless loop for path check
		public var pathcount:int = 0;
		public var pathcountmax:int = 100;
		public var linepath:Array = new Array();
		public var line:LineSegment = new LineSegment();
		
		public var unitbot:AStructureUnit = new AUnitBlock();
		//}
		
		public function Away3DGearUnitPathBeta() {
			addChild(view);
			
			view.camera.y = 600;
			view.camera.x = 0;
			view.camera.z = 0;
			view.camera.lookAt(new Number3D(0, 0, 0));
			view.camera.y = 800;
			//view.camera.x = -30;
			
			buildterrain();
			buildunits();
			addEventListener(Event.ENTER_FRAME, render);
		}
		
		public function buildunits():void {
			var unitbuilt:AStructureUnit;
			
			unitbot = new AUnitBlock();
			unitbot.x = 0;
			unitbot.y = 16;
			unitbot.z = 0;
			unitbot.mesh.ownCanvas = true;
			view.scene.addChild(unitbot.mesh);
			
			unitbuilt = new ABuildingWall();
			unitbuilt.x = 64;
			unitbuilt.y = 16;
			unitbuilt.z = 0;
			view.scene.addChild(unitbuilt.mesh);
			unit.push(unitbuilt);
			
			unitbuilt = new ABuildingWall();
			unitbuilt.x = 128;
			unitbuilt.y = 16;
			unitbuilt.z = 0;
			view.scene.addChild(unitbuilt.mesh);
			unit.push(unitbuilt);
			
			unitbuilt = new ABuildingWall();
			unitbuilt.x = -64;
			unitbuilt.y = 16;
			unitbuilt.z = 0;
			view.scene.addChild(unitbuilt.mesh);
			unit.push(unitbuilt);
			
			unitbuilt = new ABuildingWall();
			unitbuilt.x = 64;
			unitbuilt.y = 16;
			unitbuilt.z = 64;
			view.scene.addChild(unitbuilt.mesh);
			unit.push(unitbuilt);
			
			unitbuilt = new ABuildingWall();
			unitbuilt.x = 64;
			unitbuilt.y = 16;
			unitbuilt.z = -64;
			view.scene.addChild(unitbuilt.mesh);
			unit.push(unitbuilt);
			
			unitbuilt = new ABuildingWall();
			unitbuilt.x = 64;
			unitbuilt.y = 16;
			unitbuilt.z = -32;
			view.scene.addChild(unitbuilt.mesh);
			unit.push(unitbuilt);
		}
		
		public function buildterrain():void {
			var mat:WireColorMaterial = new WireColorMaterial();
			//mat.color = 0xff0000;
			//mat.wirecolor = 0x000000;
			plane3d.ownCanvas  = true;
			plane3d.material = mat;
			//plane3d.segmentsH = 16;
			//plane3d.segmentsW = 16;
			view.scene.addChild(plane3d);
			
			plane3d.addEventListener(MouseEvent3D.MOUSE_DOWN, onMouseDownOnObject);
		}
		
		public function onMouseDownOnObject(event:MouseEvent3D):void {
			path = new Vector.<ANodePoint3D>();
			pathcount = 0;
			bfinishpath = false;
			pointaway3d = new Array();
			//var object:Object3D = event.object;
			//trace('object x:' + object.x + ' y:' + object.y + ' z:' + object.z);
			//trace('screen x:' + event.screenX + ' y:' + event.screenY + ' z:' + event.screenZ);
			trace('scene x:' + event.sceneX + ' y:' + event.sceneY + ' z:' + event.sceneZ);
			pointb.convertgird(event.sceneX ,event.sceneY ,event.sceneZ );
			pointa.unitpointgrid(unitbot);
			trace(pointa + '[]' + pointb);
			startpoint(pointa);
		}
		
		public function startpoint(point:ANodePoint3D):void {
			pathcount++;
			var buildpath:Vector.<ANodePoint3D> = new Vector.<ANodePoint3D>();
			
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
				var buildpointpath:ANodePoint3D;
				
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
				
				/*
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
				*/
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
		public function createpoint(px:Number,py:Number,pz:Number,nodeparent:ANodePoint3D = null):ANodePoint3D {
			var node:ANodePoint3D = new ANodePoint3D(px, py, pz);
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
		public function patharray(node:ANodePoint3D):void {
			node.x = node.x * 32;
			node.z = node.z * 32;
			pointaway3d.push(node);
			if (node.parent) {
				patharray(node.parent);//add path to sandy array
			}else {//if there no more path then create line.
				//g.removeChildByName('line');
				if(pointaway3d.length > 1){
					//line = new Line3D('line', pointaway3d);
					//line.enableForcedDepth = true;
					//line.depth = -1;
					//g.addChild(line);
				}
			}
		}
		
		//RENDER
		public function render(event:Event):void {
			for (var i:int = 0; i < unit.length;i++ ) {
				unit[i].update();
			}
			
			unitbot.update();
			//unitbot.x++;
			if (pointaway3d.length) {
				//trace('found..'+pointsandy3d.length);
				//var points3d:Point3D = new Point3D(200,0,200);
				var pathindex:Number = pointaway3d.length - 1; //max value to go first
				if (unitbot.order == 'none') {
					pointaway3d.splice(pathindex, 1);
					pathindex -= 1;
				}
				if (pointaway3d.length) {
					var points3d:Number3D = new Number3D(
					pointaway3d[pathindex].x,
					pointaway3d[pathindex].y,
					pointaway3d[pathindex].z);
					//trace('->' + points3d);
					unitbot.order = 'move';
					unitbot.pointmove(points3d);
					//trace(unitbot.order);
				}
			}
			view.render();
		}
	}
	
}