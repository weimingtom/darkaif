package  
{
	//{
	import darknet.engine.papervision3d.entity.PV3DMonster;
	import darknet.engine.papervision3d.entity.PV3DNPC;
	import darknet.engine.papervision3d.entity.PV3DMesh;
	import darknet.engine.papervision3d.entity.PV3DPlayer;
	import org.papervision3d.core.proto.MaterialObject3D;
	import org.papervision3d.objects.DisplayObject3D;
	
	import org.papervision3d.objects.parsers.Ase;
	import org.papervision3d.core.geom.TriangleMesh3D;
	import org.papervision3d.core.geom.renderables.Triangle3D;
	import org.papervision3d.core.geom.renderables.Vertex3D;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.objects.parsers.Max3DS;
	import org.papervision3d.view.BasicView;
	
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	//}
	
	/**
	 * ...
	 * @author Darknet
	 * 
	 * required:
	 * -Flash 10
	 * --vector
	 * -Papervision 2.0
	 * 
	 * Support:
	 * 
	 */
	
	//[SWF(width = "640", height = "480", backgroundColor = "#FFFFFF", frameRate = "60")]
	[SWF(width = "640", height = "480", backgroundColor = "#000000", frameRate = "60")]
	
	public class Papervision3DProgram extends BasicView
	{
		
		//{variables
		public var triangleMesh3d:TriangleMesh3D;
		public var triangleMesh:TriangleMesh3D;
		public var user:Vector.<PV3DPlayer> = new Vector.<PV3DPlayer>();
		public var username:String = 'player';
		
		public var mapname:String = 'data/maps/mapdata00.xml';
		public var mapxml:XML = new XML();
		
		//public var objectmesh:Array = new Array();
		public var objectmesh:Vector.<PV3DMesh> = new Vector.<PV3DMesh>();
		//public var objectmodel:Vector.<PV3DMesh> = new Vector.<PV3DMesh>();
		
		//}
		
		//{ // PV3DEntity
		public var mesh:Vector.<PV3DMesh> = new Vector.<PV3DMesh>(); //store data
		public var meshmodel:Vector.<PV3DMesh> = new Vector.<PV3DMesh>();//map data build
		
		public var playermesh:Vector.<PV3DPlayer> = new Vector.<PV3DPlayer>();
		public var playermodel:Vector.<PV3DPlayer> = new Vector.<PV3DPlayer>();
		
		public var monstermesh:Vector.<PV3DMonster> = new Vector.<PV3DMonster>();
		public var monstermodel:Vector.<PV3DMonster> = new Vector.<PV3DMonster>();
		
		public var npcmesh:Vector.<PV3DNPC> = new Vector.<PV3DNPC>();
		public var npcmodel:Vector.<PV3DNPC> = new Vector.<PV3DNPC>();
		//}
		
		/*
		var wadusList:Vector.<Wadus>;
		for each(var w:Wadus in wadusList){
		// do something with w
		}
		*/
		
		public function Papervision3DProgram() {
			camera.y = 5000;
			camera.z = 10000;
			
			startRendering();
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, addKey, false, 0, true);
			stage.addEventListener(KeyboardEvent.KEY_UP, removeKey, false, 0, true);
			
			mapdataurl(mapname);
		}
		
		//map data xml
		public function mapdataurl(mapname:String):void {
			var request:URLRequest = new URLRequest(mapname);
			var load:URLLoader = new URLLoader();
			load.load(request);
			load.addEventListener(Event.COMPLETE, loaddata);
			function loaddata(event:Event):void {
				//trace(event.target.data);
				mapxml = new XML(event.target.data);
				loadmapmesh();
			}	
		}
		
		//need work on for file load for map build
		public function loadmapmesh():void {
			//mapxml
			trace('building...');
			for (var meshlistno:int = 0; meshlistno < mapxml.objectlist.mesh.length(); meshlistno++ ) {
				trace(mapxml.objectlist.mesh[meshlistno].name);
				trace(mapxml.objectlist.mesh[meshlistno].localdir);
				//var material:ColorMaterial = new ColorMaterial(0xFF0000);
				var mesh:PV3DMesh = new PV3DMesh();
				var objectname:String = mapxml.objectlist.mesh[meshlistno].name;
				var material:ColorMaterial = new ColorMaterial(0xcc0000);
				var triangleMesh3d:TriangleMesh3D;
				//triangleMesh3d = new Ase(material, String(mapxml.objectlist.mesh[meshlistno].localdir), 0.1);
				//mesh.model = new Ase(material, String(mapxml.objectlist.mesh[meshlistno].localdir),1);
				mesh.model = new Ase(material, String(mapxml.objectlist.mesh[meshlistno].localdir),0.1);
				mesh.model.name = objectname;
				mesh.name = objectname;
				//scene.addChild(mesh.model);
				objectmesh.push(mesh);
			}
			buildmeshmap();
		}
		
		//build map
		public function buildmeshmap():void {
			trace('building mesh');
			for (var objectlistno:int = 0; objectlistno < mapxml.objects.mesh.length()  ; objectlistno++ ) {
				//trace(mapxml.objects.mesh[objectlistno].name);
				//trace(mapxml.objects.mesh[objectlistno].position.x+"]:["+mapxml.objects.mesh[objectlistno].position.y+"]:["+mapxml.objects.mesh[objectlistno].position.z);
				for (var meshno:int = 0; meshno < objectmesh.length ;meshno++ ) {
					//trace("name" + objectmesh[meshno].name);
					//scene.addChild(objectmesh[meshno].model);
					if (mapxml.objects.mesh[objectlistno].name == objectmesh[meshno].name) {
						//trace('clone...');
						//scene.addChild(objectmesh[meshno].model.clone());
						var mesh:PV3DMesh = new PV3DMesh();
						//var triangleMesh3d:TriangleMesh3D = objectmesh[meshno].model.clone() as TriangleMesh3D;
						var triangleMesh3d:TriangleMesh3D = objectmesh[meshno].model;
						//triangleMesh3d = 
						//var triangleMesh3d:TriangleMesh3D;
						//triangleMesh3d = objectmesh[meshno].model.clone() as TriangleMesh3D;
						triangleMesh3d.x = mapxml.objects.mesh[objectlistno].position.x;
						triangleMesh3d.y = mapxml.objects.mesh[objectlistno].position.y;
						triangleMesh3d.z = mapxml.objects.mesh[objectlistno].position.z;
						scene.addChild(triangleMesh3d);
						
						//mesh.model = objectmesh[meshno].model.clone() as TriangleMesh3D;
						//mesh.model.x = mapxml.objects.mesh[objectlistno].position.x;
						//mesh.model.y = mapxml.objects.mesh[objectlistno].position.y;
						//mesh.model.z = mapxml.objects.mesh[objectlistno].position.z;
						//scene.addChild(mesh.model);
						break;
					}
				}
			}
		}
		
		override protected function onRenderTick(event:Event = null):void {
			var objectmesh:Array = scene.objects;
			//trace('[]-[]'+objectmove.length);
			for (var c:int = 0; c < objectmesh.length; c++) {
				objectmesh[c].rotationY += 1;
				//trace('[object]:Count:'+c +":"+ objectmesh[c].rotationX);
			}
			//triangleMesh3d.rotationY = -viewport.containerSprite.mouseX / 2;
			super.onRenderTick(event);
		}
		
		public function usercontrolkeyboardmove():void {
			
		}
		
		public function addKey(e:KeyboardEvent):void {
			
			for (var objectno:int = 0; objectno < mesh.length ; objectno++ ) {
				//trace('no:'+objectno);
				scene.addChild(mesh[objectno].modelase);
				if(mesh[objectno].name == 'player'){
					if (e.keyCode == 38) {//up
						mesh[objectno].modelase.z += 1;
					}
					if (e.keyCode == 40) {//down
						mesh[objectno].modelase.z -= 1;
					}
					if (e.keyCode == 39) {//right
						mesh[objectno].modelase.x += 1;
					}
					if (e.keyCode == 37) {//left
						mesh[objectno].modelase.x -= 1;
					}
				}
			}
			/*
			if (e.keyCode == 38) {//up
				triangleMesh3d.z += 1;
			}
			if (e.keyCode == 40) {//down
				triangleMesh3d.z -= 1;
			}
			if (e.keyCode == 39) {//right
				triangleMesh3d.x += 1;
			}
			if (e.keyCode == 37) {//left
				triangleMesh3d.x -= 1;
			}
			*/
		}
		
		public function removeKey(e:KeyboardEvent):void {
			/*
			if (e.keyCode == Keyuparrow) {
				Uparrow = false;
			}
			*/
		}
	}
	
}