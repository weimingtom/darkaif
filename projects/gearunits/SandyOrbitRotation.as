package  
{
	import flash.display.Sprite;
	import flash.events.*;
	import flash.display.*; 
	import flash.events.*;
	import flash.utils.Timer;
	import flash.utils.getTimer; 
	
	import sandy.core.Scene3D;
	import sandy.core.scenegraph.*;
	import sandy.materials.*;
	import sandy.materials.attributes.*;
	import sandy.primitive.*;
	import sandy.view.*;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class SandyOrbitRotation extends Sprite{
		
		//sandy engine
		public var scene:Scene3D; // just one scene or the world
		public var camera:Camera3D; //basic one cam
		public var g:Group = new Group("myGroup");
		public var box:Box = new Box('box', 32, 32, 32);
		public var orbit:Box = new Box('Orbit', 32, 32, 32);
		public var distance:Number = 64;
		public var time:Number = 0;
		
		public function SandyOrbitRotation(){
			//{ Scene world
			// camera
			camera = new Camera3D(300,300);
			//camera.z = -50;
			camera.far = 1000;
			camera.near = 0;
			//camera.
			camera.y = 90;
			camera.lookAt(0, 0, 0);
			// We create the "group" that is the tree of all the visible objects
			var root:Group = createScene();
			// We create a Scene and we add the camera and the objects tree 
			scene = new Scene3D( "scene", this, camera, root );
			
			addEventListener( Event.ENTER_FRAME, enterFrameHandler );
			
			//}
			var materialAttr:MaterialAttributes = new MaterialAttributes( 
                     new LineAttributes( 0.5, 0x2111BB, 0.4 ),
                     new LightAttributes( true, 0.1)
                  );
				
			var material:Material = new ColorMaterial( 0xFFCC33, 1, materialAttr );
			//material.lightingEnable = true;
			var app:Appearance = new Appearance( material );
			box.appearance  = app;
			box.useSingleContainer = false;
			box.enableBackFaceCulling = false;
			orbit.appearance = app;
			orbit.enableBackFaceCulling = false;
			orbit.useSingleContainer = false;
		}
		
		// This update the code and the function when every frame count is pass
		private function enterFrameHandler( event : Event ) : void {
			
			//var ticker:Number = getTimer() / 400;
			var ticker:Number = getTimer()%360;
			//trace(ticker);
			
			time++;
			if (time > 360) {
				time = 0;
			}
			
			if (time < 0) {
				time = 0;
			}
			
			ticker = time;
			orbit.x = Math.sin(ticker * Math.PI / 180) * distance;
			orbit.z =  Math.cos(ticker * Math.PI / 180) * distance;
			scene.render();
			
			//facedirection = Math.atan2(x - point2.x, y - point2.y);
			
			var calangle:Number;
			////0-90
			//calangle = Math.atan2(box.z - orbit.z, box.x - orbit.x);
			//calangle = calangle * 180 / Math.PI;
			//trace('angle:' + ticker + ':' + (90 + calangle));
			
			//91-360
			calangle = Math.atan2(box.z - orbit.z, box.x - orbit.x);
			calangle = calangle * 180 / Math.PI;
			//trace('angle:' + ticker + ':' + (180 + (90 - calangle)) + '[:]' + calangle);
			
			var rotateangel:Number;
			rotateangel = Math.atan2(box.z - orbit.z, box.x - orbit.x);
			rotateangel = rotateangel * 180 / Math.PI;
			//trace(rotateangel);
			if ((rotateangel < -91)&&(rotateangel > -180) ){
				trace('angle:' + ticker + ':' + Math.abs(90+ calangle));
			}else {
				trace('angle:' + ticker + ':' + (180 + (90 - calangle)) + '[:]' + calangle);
			}
			
			
			
		}
		
		private function createScene():Group {
			g.addChild(box);
			g.addChild(orbit);
			return g;
		}
	}
	
}