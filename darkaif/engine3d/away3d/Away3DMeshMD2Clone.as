package  
{
	import away3d.containers.View3D;
	import away3d.core.base.Object3D;
	import away3d.events.LoaderEvent;
	import away3d.loaders.Md2;
	import away3d.loaders.Object3DLoader;
	import away3d.materials.ColorMaterial;
    import away3d.primitives.Sphere;
    import flash.display.Sprite;
	import flash.events.Event;
	import away3d.loaders.Obj;
	
	/**
	 * ...
	 * @author @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	* 
	* Working:away3d 2.3.0
	* working clone. You need the LoaderEvent to able to get the object loaded correctly
	* 
	*/
	[SWF(width="640", height="480", backgroundColor="#FFFFFF", frameRate="30")]
	public class Away3DMeshMD2Clone extends Sprite
	{
		// create a viewport
		public var view:View3D = new View3D( { x:200, y:200 } );
		// load an object and put it on the 3D stage
		public var objfile:Object3DLoader;
		
		public function Away3DMeshMD2Clone() 
		{
            addChild(view);
			var material:ColorMaterial = new ColorMaterial(0xFF0000);
			objfile = Md2.load("data/models/simple_monster_low2.md2", { material:material,autoLoadTextures:false } );
			//objfile.addOnSuccess(objOnSuccess);
			objfile.addEventListener(LoaderEvent.LOAD_SUCCESS, objOnSuccess);
			view.scene.addChild(objfile);
			
			function objOnSuccess(e:Event):void {
                trace("SUCCESS");
				var objectmesh:Object3D = objfile.handle.clone() as Object3D;
				objectmesh.x = -3;
				view.scene.addChild(objectmesh);
            }
			
			this.addEventListener(Event.ENTER_FRAME, update);
		}
		
		public function update(e:Event):void
		{
			var objectmesh:Array = view.scene.children;
			for (var c:int = 0; c < objectmesh.length; c++) {
				//trace('object:' + objectmesh[c].name);
				if(c == 1){
					objectmesh[c].rotationY += 1;
					objectmesh[c].rotationZ += 1;
					objectmesh[c].scale(0.01);
				}else {
					objectmesh[c].rotationY += 1;
					objectmesh[c].rotationZ -= 1;
					objectmesh[c].scale(0.01);
				}
			}
			// render the view
			view.render();
		}
		
		
	}
	
}