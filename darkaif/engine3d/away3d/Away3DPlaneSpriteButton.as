
package
{
    import away3d.containers.View3D;
	import away3d.materials.BitmapMaterial;
	import away3d.materials.ColorMaterial;
	import away3d.materials.MovieMaterial;
	import away3d.primitives.Plane;
    import away3d.primitives.Sphere;
	import darknet.core.display.Button;
	import flash.display.Bitmap;
	import flash.display.Loader;
    import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
    
    public class Away3DPlaneSpriteButton extends Sprite
    {
		// create a viewport
		public var view:View3D = new View3D( { x:200, y:200 } );
		
        public function Away3DPlaneSpriteButton()
        {
            addChild(view);
            
            // create a sphere and put it on the 3D stage
            var plane:Plane = new Plane({height:250,width:250});
			plane.rotationX = 90;
			//plane.
			var spriteimage:Sprite = new Sprite();
			spriteimage.graphics.beginFill(0x999999);
			spriteimage.graphics.drawRect(0, 0, 100, 100);
			spriteimage.graphics.endFill();
			
			var buttontest:Button = new Button('Test');
			buttontest.x = 14;
			buttontest.y = 14;
			buttontest.addEventListener(MouseEvent.CLICK, testclick);
			function testclick(event:Event):void {
				trace('click');
			}
			spriteimage.addChild(buttontest);
			var material:MovieMaterial = new MovieMaterial(spriteimage);
			material.interactive = true;
			
			plane.material = material;
			
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