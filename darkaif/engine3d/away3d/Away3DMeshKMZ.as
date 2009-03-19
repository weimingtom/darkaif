﻿package  
{
	import away3d.containers.View3D;
	import away3d.loaders.Kmz;
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
	* working.
	* 
	 */
	[SWF(width="640", height="480", backgroundColor="#FFFFFF", frameRate="30")]
	public class Away3DMeshKMZ extends Sprite
	{
		// create a viewport
		public var view:View3D = new View3D( { x:200, y:200 } );
		// create a sphere and put it on the 3D stage
		public var sphere:Sphere = new Sphere();
		public var objfile:Object3DLoader;
		
		public function Away3DMeshKMZ() 
		{
            addChild(view);
			var material:ColorMaterial = new ColorMaterial(0xFF0000);
			objfile = Kmz.load("data/models/test.kmz", { material:material } );
			objfile.scale(0.5);
			objfile.addOnSuccess(objOnSuccess);
			
			function objOnSuccess(e:Event):void {
				view.scene.addChild(objfile);
                trace("SUCCESS");
            }
			
            //view.scene.addChild(sphere);
			this.addEventListener(Event.ENTER_FRAME, update);
		}
		
		public function update(e:Event):void
		{
			objfile.y = -50;
			objfile.rotationY += 1;
			objfile.rotationX += 1;
			sphere.rotationY += 1;
			// render the view
			view.render();
		}
		
		
	}
	
}