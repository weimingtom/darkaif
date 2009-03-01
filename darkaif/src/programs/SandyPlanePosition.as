package programs
{
	//{ pacakges
	import flash.display.Sprite; 
	import flash.events.*;
	import flash.ui.*;
	import sandy.core.Scene3D;
	import sandy.core.data.*;
	import sandy.core.scenegraph.*;
	import sandy.materials.*;
	import sandy.materials.attributes.*;
	import sandy.primitive.*;
	import sandy.events.Shape3DEvent;
	//}
	
	public class SandyPlanePosition extends Sprite 
	{
		//{variables
		private var scene:Scene3D;
		private var camera:Camera3D;
		private var tg:TransformGroup;
		public var g:Group = new Group();
		public var box:Box = new Box("boxshape", 16, 16, 16);
		public var movex:Number = 0;
		public var movey:Number = 0;
		public var movez:Number = 0;
		//}
		
		public function SandyPlanePosition() { 
			
			// We create the camera
			camera = new Camera3D( 300, 300 );
			camera.z = -400;
			camera.y = 500;
			camera.lookAt(0,0,0);
		 
			// We create the "group" that is the tree of all the visible objects
			var root:Group = createScene();
		 
			// We create a Scene and we add the camera and the objects tree 
			scene = new Scene3D( "scene", this, camera, root );
			
			// Listen to the heart beat and render the scene
			addEventListener( Event.ENTER_FRAME, enterFrameHandler );
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyPressed);
		 
		}
		
		// Create the scene graph based on the root Group of the scene
		private function createScene():Group{
			// We need to create a transformGroup
			tg = new TransformGroup('myGroup');
		 
			var bottom:Shape3D = new Plane3D('bottom', 300, 300, 10, 10,Plane3D.ZX_ALIGNED,'quad');
			//bottom.moveForward(50);
			//bottom.moveUpwards(-50);
		 
			var materialAttr:MaterialAttributes = new MaterialAttributes( 
				new LineAttributes( 0.5, 0x2111BB, 0.4 ),
				new LightAttributes( true, 0.1)
			);
			
			var material01:Material = new ColorMaterial( 0xFFCC33, 1, materialAttr );
			material01.lightingEnable = false;
			var app01:Appearance = new Appearance( material01 );
			bottom.enableBackFaceCulling = false;
			bottom.appearance = app01;
	     
			bottom.useSingleContainer = false;
			box.useSingleContainer = false;
			box.enableBackFaceCulling = false;
			g.addChild(box);
		 
			// let's enable events
			bottom.enableEvents = true;
			bottom.addEventListener( MouseEvent.CLICK, onClickOne );
			//bottom.roll = -5;
			//bottom.tilt = -5;
			//bottom.pan = 5;
			
			tg.addChild(bottom);
			// we now add all the object to the root group:
			g.addChild(tg);
			
			return g;
		}
		
		//update position of the box
		public function objectbox():void {
			if (box.x < Math.floor(movex)) {
				box.x ++;
			}else if (box.x > Math.floor(movex)) {
				box.x --;
			}else {
				
			}
			
			if (box.y < Math.floor(movey)){
				box.y ++;
			}else if (box.y > Math.floor(movey)) {
				box.y --;
			}else {
				//trace("hello y");
			}
			
			if (box.z < Math.floor(movez)) {
				box.z ++;
			}else if (box.z > Math.floor(movez)) {
				box.z --;
			}else {
				//trace("hello z");
			}
			//trace("z" + box.z + ":" + movez);
		}
	  
		// CallBack function fot the cube
		private function onClickOne( p_eEvent:Shape3DEvent ):void{
            var v:Point3D = p_eEvent.point;
			//var top:Point3D = p_eEvent.polygon.normal.getPoint3D().clone();
			//top.scale( 20 );
            //top.add( v );
			//trace(v.x + "-" + v.y + "-" + v.z);
			movex = v.x;
			movey = v.y;
			movez = v.z;
            //var m_oLine3D:Line3D = new Line3D("normal", v, top );          
        }
		
		// The Event.ENTER_FRAME event handler tells the world to render
		private function enterFrameHandler( event : Event ) : void{
			scene.render();
			objectbox();
		}
		
		// controls basic
		private function keyPressed(event:KeyboardEvent):void {
            switch(event.keyCode) {
				case Keyboard.UP:
					tg.tilt +=2;
					break;
				case Keyboard.DOWN:
					tg.tilt -=2;
					break;
				case Keyboard.RIGHT:
					tg.pan +=2;
					break;
				case Keyboard.LEFT:
					tg.pan -=2;
					break;
			}
        }
	}
}
