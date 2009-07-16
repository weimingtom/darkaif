
package
{
	//{
	import darknet.core.display.DropBoxList;
	import darknet.core.display.NumericUpDown;
	import darknet.core.event.DropBoxEvent;
	import darknet.core.event.NumericUpDownEvent;
    import away3d.containers.View3D;
	import away3d.core.base.Object3D;
	import away3d.core.math.Number3D;
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
    //}
	
	[SWF(width="320", height="240", backgroundColor="#FFFFFF", frameRate="30")]
    public class Away3DMeshBoneVertex extends Sprite
    {
		public var plane:Plane = new Plane();
		// create a viewport
		public var view:View3D = new View3D( { x:200, y:200 } );
		public var cube:Cube = new Cube( { width:75, height:75, depth:75 } );
		public var bonetest:Away3DBoneVertexTest = new Away3DBoneVertexTest();
		
		public var bonelistpanel:DropBoxList = new DropBoxList();
		public var bonename:String = '';
		
		public var buttonrotx:NumericUpDown = new NumericUpDown();
		public var buttonroty:NumericUpDown = new NumericUpDown();
		public var buttonrotz:NumericUpDown = new NumericUpDown();
		
        public function Away3DMeshBoneVertex()
        {
			cube.addEventListener(MouseEvent3D.MOUSE_DOWN, onMouseDownOnObject);
			cube.addEventListener(MouseEvent3D.MOUSE_OVER, onMouseOverOnObject);
			cube.addEventListener(MouseEvent3D.MOUSE_MOVE, onMouseMoveOnObject);
			//cube.addOnMouseDown(onMouseDownOnObject);
            addChild(view);
			view.camera.y = 10;
			view.camera.z = 10;
			
			view.camera.lookAt(new Number3D(0, 0, 0));
			//view.camera.y = 600;
			//view.camera.x = -250;
			
			//view.scene.addChild(cube);
			view.scene.addChild(bonetest);
			bonemenu();
			
			addEventListener(Event.ENTER_FRAME, render);
        }
		
		public function bonemenu():void {
			bonelistpanel.addlist({name:'bone1',id:'bone1'});
			bonelistpanel.addlist( { name:'bone2', id:'bone2' } );
			
			bonelistpanel.addEventListener(DropBoxEvent.SELECT, selectbone);
			
			function selectbone(event:DropBoxEvent):void {
				bonename = event.selectname;
				
				var rpoint:Number3D = bonetest.bonerotation(bonename);
				//set rotation
				buttonrotx.valuenumber = rpoint.x;
				buttonroty.valuenumber = rpoint.y;
				buttonrotz.valuenumber = rpoint.z;
				trace(bonename);
			}
			
			buttonrotx.x = 0;
			buttonrotx.y = 14;
			buttonrotx.addEventListener(NumericUpDownEvent.VALUE, rotx);
			buttonrotx.addEventListener(NumericUpDownEvent.ENTER, rotx);
			function rotx(event:NumericUpDownEvent):void {
				//trace('rotx'+event.numberchange);
				bonetest._bone( { name:bonename,rotx:event.numberchange} );
			}
			
			buttonroty.x = 0;
			buttonroty.y = 14*2;
			buttonroty.addEventListener(NumericUpDownEvent.VALUE, roty);
			buttonroty.addEventListener(NumericUpDownEvent.ENTER, roty);
			function roty(event:NumericUpDownEvent):void {
				//trace('roty'+event.numberchange);
				bonetest._bone( { name:bonename,roty:event.numberchange} );
			}
			
			buttonrotz.x = 0;
			buttonrotz.y = 14*3;
			buttonrotz.addEventListener(NumericUpDownEvent.VALUE, rotz);
			buttonrotz.addEventListener(NumericUpDownEvent.ENTER, rotz);
			function rotz(event:NumericUpDownEvent):void {
				//trace('rotz'+event.numberchange);
				bonetest._bone( { name:bonename,rotz:event.numberchange} );
			}
			
			addChild(buttonrotx);
			addChild(buttonroty);
			addChild(buttonrotz);
			addChild(bonelistpanel);
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
			//bonetest.Bone();
			//bonevertex.rotationY ++;
			view.render();
		}
		
    }
}