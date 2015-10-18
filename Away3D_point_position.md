Information: This is about the surface polygon given point of the mouse given position in the 3D world.

```

package
{
    import away3d.containers.View3D;
	import away3d.core.base.Object3D;
	import away3d.events.MouseEvent3D;
	import away3d.events.Object3DEvent;
	import away3d.materials.ColorMaterial;
	import away3d.materials.MovieMaterial;
	import away3d.primitives.Cube;
	import away3d.primitives.Plane;
    import away3d.primitives.Sphere;
    import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
    
    public class Away3DPlane extends Sprite
    {
		public var plane:Plane = new Plane();
		// create a viewport
		public var view:View3D = new View3D( { x:200, y:200 } );
		public var cube:Cube = new Cube({width:75, height:75, depth:75});
		
        public function Away3DPlane()
        {
			cube.addEventListener(MouseEvent3D.MOUSE_DOWN, onMouseDownOnObject);
			cube.addEventListener(MouseEvent3D.MOUSE_OVER, onMouseOverOnObject);
			cube.addEventListener(MouseEvent3D.MOUSE_MOVE, onMouseMoveOnObject);
			//cube.addOnMouseDown(onMouseDownOnObject);
            addChild(view);
			
			view.scene.addChild(cube);
			addEventListener(Event.ENTER_FRAME, render);
            
        }
		
		public function onMouseDownOnObject(event:MouseEvent3D):void {
			var object:Object3D = event.object;
			trace('object x:'+object.x+' y:'+object.y+' z:'+object.z);
		}
		
		public function onMouseOverOnObject(event:MouseEvent3D):void {
			//var object:Object3D = event.object;
			//trace('object x:' + object.x + ' y:' + object.y + ' z:' + object.z);
			trace('screen x:' + event.screenX + ' y:' + event.screenY + ' z:' + event.screenZ);
		}
		
		public function onMouseMoveOnObject(event:MouseEvent3D):void {
			//var object:Object3D = event.object;
			//trace('object x:' + object.x + ' y:' + object.y + ' z:' + object.z);
			//trace('screen x:' + event.screenX + ' y:' + event.screenY + ' z:' + event.screenZ);
			trace('scene x:' + event.sceneX + ' y:' + event.sceneY + ' z:' + event.sceneZ);
		}
		
		public function render(event:Event):void {
			view.render();
		}
		
    }
}
```