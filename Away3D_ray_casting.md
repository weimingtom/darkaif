
```
package
{
	//{
    import away3d.containers.View3D;
	import away3d.core.base.Object3D;
	import away3d.core.geom.Plane3D;
	import away3d.core.math.Number3D;
	import away3d.primitives.Cube;
	import away3d.primitives.Plane;
    import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	//}
    [SWF(width="800", height="600", backgroundColor="#FFFFFF", frameRate="30")]
    public class Away3DRayCasting01 extends Sprite {
		
		/**
		 * 
		 * Information: Fixed code. Bit stable.
		 * 
		 * Credit by:
		 * Link: http://blog.zupko.info/?p=143
		 * 
		 * Away3d version 3.3.3 flash 10
		 *
		 */ 
		
		public var plane:Plane = new Plane();
		// create a viewport
		public var view:View3D = new View3D( { x:320, y:240 } );
		public var cube:Cube = new Cube( { width:32, height:32, depth:32 } );
		public var box:Cube = new Cube( { width:32, height:32, depth:32 } );
		public var HEIGHT:Number = 240; //Screen Size
		public var WIDTH:Number = 320; //Screen Size
		
        public function Away3DRayCasting01()
        {
            addChild(view);
			view.camera.y = 500;
			view.camera.x = 0;
			var center:Number3D = new Number3D(0, 0, 0);
			view.camera.lookAt(center);
			view.camera.y = 600;
			view.camera.x = -250;
			view.scene.addChild(cube);
			view.scene.addChild(box);
			addEventListener(Event.ENTER_FRAME, render);
			stage.addEventListener(MouseEvent.MOUSE_MOVE,pointposition );
        }
		
		public function pointposition(event:Event):void {
			//get the ray shooting from the camera through the mouse position
			var ray:Number3D = view.camera.unproject(view.mouseX, view.mouseY);
			//make our camera position accessible
			var cameraPosition:Number3D = new Number3D(view.camera.x, view.camera.y, view.camera.z);
			//get the world position of our ray
			ray.add(ray, cameraPosition);
			//create a plane3D object
			var p:Plane3D = new Plane3D();
			//define the plane by a normal and a point.  In this case, we want the plane to be going through (0, 0, 0) - with its normal going (0, 1, 0).  This will make the plane an XZ plane, facing upwards.
			p.fromNormalAndPoint(new Number3D(0, 1, 0),new Number3D(0, 0, 0));
			//find where the plane intersects.  this function takes 2 points to define a line - we will define it with our ray and camera.
			var intersect:Number3D = p.getIntersectionLineNumbers(cameraPosition, ray);
			//set object position based on results
			trace(intersect);
			box.x = intersect.x;
			box.z = intersect.y;
			box.z = intersect.z;
		}
		
		public function keypressdown(key:KeyboardEvent):void {
			if (key.keyCode == 37) {//left
				view.camera.x -= 10;
			}
			if (key.keyCode == 39) {//right
				view.camera.x += 10;
			}
			if (key.keyCode == 40) {//down
				view.camera.z -= 10;
			}
			if (key.keyCode == 38) {//up
				view.camera.z += 10;
				//camera.lookAt(0, 0, 0);
			}
		}
		
		public function render(event:Event):void {
			view.render();
		}
		
    }
}
```