package  
{
	import away3d.containers.View3D;
	import away3d.loaders.Max3DS;
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
	* not working
	* 
	*/
	[SWF(width="640", height="480", backgroundColor="#FFFFFF", frameRate="30")]
	public class Away3DMesh3DS extends Sprite
	{
		// create a viewport
		public var view:View3D = new View3D( { x:200, y:200 } );
		// create a sphere and put it on the 3D stage
		public var sphere:Sphere = new Sphere();
		public var objfile:Object3DLoader;
		
		public function Away3DMesh3DS() 
		{
            addChild(view);
			var material:ColorMaterial = new ColorMaterial(0xFF0000);
			objfile = Max3DS.load("data/models/cubestar.3ds", { material:material, autoLoadTextures:false } );
			objfile.scale(50);
			//objfile.addOnSuccess(objOnSuccess);
			
			//function objOnSuccess(e:Event):void {
				view.scene.addChild(objfile);
                trace("SUCCESS");
            //}
			
            //view.scene.addChild(sphere);
			this.addEventListener(Event.ENTER_FRAME, update);
		}
		
		public function update(e:Event):void
		{
			objfile.rotationY += 1;
			sphere.rotationY += 1;
			// render the view
			view.render();
		}
		
		
	}
	
}