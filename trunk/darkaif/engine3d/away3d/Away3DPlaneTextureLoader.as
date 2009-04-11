
package
{
    import away3d.containers.View3D;
	import away3d.materials.BitmapMaterial;
	import away3d.materials.ColorMaterial;
	import away3d.primitives.Plane;
    import away3d.primitives.Sphere;
	import flash.display.Bitmap;
	import flash.display.Loader;
    import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
    
    public class Away3DPlaneTextureLoader extends Sprite
    {
		// create a viewport
		public var view:View3D = new View3D( { x:200, y:200 } );
		
        public function Away3DPlaneTextureLoader()
        {
            addChild(view);
            
            // create a sphere and put it on the 3D stage
            var plane:Plane = new Plane();
			plane.rotationX = 90;
			
			var request:URLRequest = new URLRequest();
			request.url = "http://localhost/darkaif/data/images/color16x16.jpg";
			var loader:Loader = new Loader();
			loader.load(request);
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, imageloaded);
			
			function imageloaded(event:Event):void {
				var bitmap:Bitmap = event.target.content as Bitmap;
				var bitmaterial:BitmapMaterial = new BitmapMaterial(bitmap.bitmapData);
				bitmaterial.precision = 1;
				plane.material = bitmaterial;
			}
			
            view.scene.addChild(plane);
			
			this.addEventListener(Event.ENTER_FRAME, update);
        }
		
		public function update(e:Event):void {
			
			var objectmesh:Array = view.scene.children;
			for (var c:int = 0; c < objectmesh.length; c++) {
				//trace('object:' + objectmesh[c].name);
				//objectmesh[c].rotationY += 1;
				objectmesh[c].rotationZ += 0.5;
				//objectmesh[c].scale(10);
			}
			// render the view
			view.render();
		}
    }
}