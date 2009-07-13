package 
{
	//{
	import flash.events.Event;
	import gearunits.papervision3d.entity.building.PBuildingWall;
	import gearunits.papervision3d.entity.infantry.PUnitBlock;
	import gearunits.papervision3d.entity.PStructureUnit;
	import gearunits.papervision3d.node.PNodePoint3D;
	import org.papervision3d.core.math.Number3D;
	import org.papervision3d.core.utils.Mouse3D;
	import org.papervision3d.events.InteractiveScene3DEvent;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.materials.special.CompositeMaterial;
	import org.papervision3d.materials.utils.MaterialsList;
	import org.papervision3d.materials.WireframeMaterial;
	import org.papervision3d.objects.DisplayObject3D;
	import org.papervision3d.objects.primitives.Cube;
	import org.papervision3d.objects.primitives.Plane;
	import org.papervision3d.view.BasicView;
	//}
	
	public class Papervision3DGearUnitsPath extends BasicView
	{
		//{
		private var mouse3D:Mouse3D;
		private var pivotPoint:DisplayObject3D = new DisplayObject3D();
		public var plane:Plane = new Plane(null, 512, 512,16,16);
		
		public var unit:Vector.<PStructureUnit> = new Vector.<PStructureUnit>();
		
		public var path:Vector.<PNodePoint3D> = new Vector.<PNodePoint3D>();
		public var pathnode:Vector.<PNodePoint3D> = new Vector.<PNodePoint3D>();
		public var pointpapervision3d:Array = new Array();
		
		public var pointa:PNodePoint3D = new PNodePoint3D();
		public var pointb:PNodePoint3D = new PNodePoint3D();
		public var bfinishpath:Boolean = false;
		
		//this handle endless loop for path check
		public var pathcount:int = 0;
		public var pathcountmax:int = 100;
		public var linepath:Array = new Array();
		//}
		
		public var unitbot:PStructureUnit = new PUnitBlock();
		
		public function Papervision3DGearUnitsPath() {
			Mouse3D.enabled = true;
			viewport.interactive = true;
			mouse3D = viewport.interactiveSceneManager.mouse3D;
			camera.z = -200;
			camera.y = 200;
			//camera.far = 1000;
			//camera.near = 1;
			var center:DisplayObject3D = new DisplayObject3D();
			camera.lookAt(center);
			
			buildunit();
			buildterrain();
			startRendering();
		}
		
		public function buildterrain():void {
			var matcolor:ColorMaterial = new ColorMaterial(0x555500);
			var matwire:WireframeMaterial = new WireframeMaterial(0x000000);
			var compost:CompositeMaterial = new CompositeMaterial();
			compost.addMaterial(matcolor);
			compost.addMaterial(matwire);
			compost.interactive = true;
			plane.material = compost;
			plane.rotationX = 90;
			plane.rotationY = 0;
			plane.rotationZ = 0;
			plane.y = 0;
			plane.culled = true;
			plane.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS, pointmove);
			scene.addChild(plane);
		}
		
		public function pointmove(event:InteractiveScene3DEvent):void {
			//trace('[' + event.renderHitData.x + ':' + event.renderHitData.y + ':' + event.renderHitData.z + ']');
			
			path = new Vector.<PNodePoint3D>();
			pathcount = 0;
			bfinishpath = false;
			pointpapervision3d = new Array();
			
			//pointb.convertgrid(new Number3D(mouse3D.x ,mouse3D.y ,mouse3D.z ));
			pointb.convertgrid(new Number3D(mouse3D.x ,0 ,mouse3D.z ));
			pointa.unitpointgrid(unitbot);
			trace(pointa + '[]'+ pointb);
			startpoint(pointa);
		}
		
		public function buildunit():void {
			var buildunit:PStructureUnit;
			
			scene.addChild(unitbot.mesh);
			//unit.push(buildunit);
			
			buildunit = new PBuildingWall();
			buildunit.x = 64;
			buildunit.y = 16;
			buildunit.z = 64;
			scene.addChild(buildunit.mesh);
			unit.push(buildunit);
			
			buildunit = new PBuildingWall();
			buildunit.x = -64;
			buildunit.y = 16;
			buildunit.z = 64;
			scene.addChild(buildunit.mesh);
			unit.push(buildunit);
			
			buildunit = new PBuildingWall();
			buildunit.x = 64;
			buildunit.y = 16;
			buildunit.z = -64;
			scene.addChild(buildunit.mesh);
			unit.push(buildunit);
			
			buildunit = new PBuildingWall();
			buildunit.x = -64;
			buildunit.y = 16;
			buildunit.z = -64;
			scene.addChild(buildunit.mesh);
			unit.push(buildunit);
			
		}
		
		public function startpoint(point:PNodePoint3D):void {
			pathcount++;
			var buildpath:Vector.<PNodePoint3D> = new Vector.<PNodePoint3D>();
			
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
				var buildpointpath:PNodePoint3D;
				
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
						//trace(buildpath[fno].f);
						fpath.push(buildpath[fno].f);
					}
				}
			
				var minValue:Number = Math.min.apply(null, fpath);
				//trace('lowest number:'+minValue);
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
		public function createpoint(px:Number,py:Number,pz:Number,nodeparent:PNodePoint3D = null):PNodePoint3D {
			var node:PNodePoint3D = new PNodePoint3D(px, py, pz);
			node.parent = nodeparent;
			node.distcost(pointa,pointb);
			//simple collision box
			for (var collisioncheckno:int = 0; collisioncheckno < unit.length ;collisioncheckno++ ) {
				if ((Math.floor(unit[collisioncheckno].x / 32) == node.x) && (Math.floor(unit[collisioncheckno].y / 32) == node.y) && (Math.floor(unit[collisioncheckno].z / 32) == node.z)) {
					//trace('collision------');
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
		public function patharray(node:PNodePoint3D):void {
			node.x = node.x * 32;
			node.z = node.z * 32;
			pointpapervision3d.push(node);
			if (node.parent) {
				patharray(node.parent);//add path to sandy array
			}else {//if there no more path then create line.
				//g.removeChildByName('line');
				if(pointpapervision3d.length > 1){
					//line = new Line3D('line', pointaway3d);
					//line.enableForcedDepth = true;
					//line.depth = -1;
					//g.addChild(line);
				}
			}
		}
		
		override protected function onRenderTick(event:Event=null):void{
			for (var i:int = 0; i < unit.length;i++ ) {
				unit[i].update();
			}
			unitbot.update();
			unitbot.update();
			//unitbot.x++;
			if (pointpapervision3d.length) {
				//trace('found..'+pointsandy3d.length);
				//var points3d:Point3D = new Point3D(200,0,200);
				var pathindex:Number = pointpapervision3d.length - 1; //max value to go first
				if (unitbot.order == 'none') {
					pointpapervision3d.splice(pathindex, 1);
					pathindex -= 1;
				}
				if (pointpapervision3d.length) {
					var points3d:Number3D = new Number3D(
					pointpapervision3d[pathindex].x,
					32, //pointpapervision3d[pathindex].y,
					pointpapervision3d[pathindex].z);
					//trace('->' + points3d);
					unitbot.order = 'move';
					unitbot.pointmove(points3d);
					//trace(unitbot.order);
				}
			}
			super.onRenderTick(event);
		}
		
	}
	
}