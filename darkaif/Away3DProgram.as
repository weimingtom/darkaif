package  
{
	
	//{
	import away3d.containers.View3D;
	import away3d.core.base.Object3D;
	import away3d.loaders.Object3DLoader;
	import away3d.materials.ColorMaterial;
    import away3d.primitives.Sphere;
	import away3d.loaders.Ase;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import darknet.engine.away3d.entity.A3DMesh;
	//}
	
	/**
	* ...
	* 
	*/
	
	[SWF(width="640", height="480", backgroundColor="#FFFFFF", frameRate="30")]
	public class Away3DProgram extends Sprite
	{
		
		//{ //variables
		// create a viewport
		public var view:View3D = new View3D( { x:200, y:200 } );
		//public var sphere:Sphere = new Sphere();
		public var objfile:Object3DLoader;
		
		public var urlobjectlist:String = '';
		public var mapname:String = 'data/maps/mapdata00.xml';
		public var mapxml:XML = new XML();
		
		public var objectmesh:Vector.<A3DMesh> = new Vector.<A3DMesh>();
		public var count:Number = 0;
		//}
		
		public function Away3DProgram() {
			//view.camera.z = -900;
			view.z = 1000;
            addChild(view);
			var material:ColorMaterial = new ColorMaterial(0xFF0000);
			//objfile = Ase.load("data/models/cubeobj.ase", { material:material } );
			objfile = Ase.load("data/models/cubeobj.ase");
			objfile.addOnSuccess(objOnSuccess);
			view.scene.addChild(objfile);
			
			function objOnSuccess(e:Event):void {
                trace("SUCCESS");
            }
			
            //view.scene.addChild(sphere);
			this.addEventListener(Event.ENTER_FRAME, update);
			
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
		
		public function loadmapmesh():void {
			//mapxml
			for (var meshlistno:int = 0; meshlistno < mapxml.objectlist.mesh.length(); meshlistno++ ) {
				trace(mapxml.objectlist.mesh[meshlistno].name);
				trace(mapxml.objectlist.mesh[meshlistno].localdir);
				var material:ColorMaterial = new ColorMaterial(0xFF0000);
				var mesh:A3DMesh = new A3DMesh();
				var objectname:String = mapxml.objectlist.mesh[meshlistno].name;
				mesh.mesh = Ase.load(String(mapxml.objectlist.mesh[meshlistno].localdir), { name:objectname, material:material } );
				mesh.name = objectname;
				//mesh.mesh.cloneAll();
				//mesh.x = 16 * meshlistno;
				//view.scene.addChild(mesh.mesh);
				objectmesh.push(mesh);
			}
			buildmeshmap();
		}
		
		public function buildmeshmap():void {
			trace('building mesh');
			for (var objectlistno:int = 0; objectlistno < mapxml.objects.mesh.length()  ; objectlistno++ ) {
				trace(mapxml.objects.mesh[objectlistno].name);
				trace(mapxml.objects.mesh[objectlistno].position.x+"]:["+mapxml.objects.mesh[objectlistno].position.y+"]:["+mapxml.objects.mesh[objectlistno].position.z);
				for (var meshno:int = 0; meshno < objectmesh.length ;meshno++ ) {
					trace("name" + objectmesh[meshno].name);
					if (mapxml.objects.mesh[objectlistno].name == objectmesh[meshno].name) {
						var mesh:A3DMesh = new A3DMesh();
						//mesh.mesh.cloneAll(objectmesh[meshno].mesh);
						mesh.model = objectmesh[meshno].mesh.cloneAll() as Object3D;
						//mesh.model.clone(objectmesh[meshno].mesh);
						mesh.model.x = mapxml.objects.mesh[objectlistno].position.x;
						mesh.model.y = mapxml.objects.mesh[objectlistno].position.y;
						mesh.model.z = mapxml.objects.mesh[objectlistno].position.z;
						mesh.model.updateObject();
						view.scene.addChild(mesh.model);
						
						break;
					}
				}
			}
		}
		
		public function update(e:Event):void {
			var objectmesh:Array = view.scene.children;
			
			for (var c:int = 0; c < objectmesh.length; c++) {
				//trace('object:' + objectmesh[c].name);
				objectmesh[c].rotationY += 1;
				//objectmesh[c].rotationZ += 1;
				//objectmesh[c].scale(0.01);
				//objectmesh[c].x = 16 * c;
			}
			count--;
			if (count < -800) {
				count = -100;
			}
			//view.z = count;
			
			// render the view
			view.render();
		}
		
	}
}