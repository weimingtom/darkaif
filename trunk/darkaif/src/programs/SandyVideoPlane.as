package  programs
{
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	* 
	* Informtion: there are two method in this script. This is plane 3D. Like a billboard show sign.
	* 
	*/ 
	
	//{
	import darkaif.core.display.GraphicLoadingBar;
	import darkaif.core.display.VideoPlayerPanel;
	import flash.display.Sprite; 
	import flash.events.*;
	import flash.display.BitmapData;
	import flash.display.Bitmap;
	import sandy.core.Scene3D;
	import sandy.core.data.*;
	import sandy.core.scenegraph.*;
	import sandy.materials.*;
	import sandy.materials.attributes.*;
	import sandy.primitive.*;
	import darkaif.core.display.Button;
	//}
	
	public class SandyVideoPlane extends Sprite
	{
		private var scene:Scene3D;
		private var camera:Camera3D;
		public var count:Number = 0;
		public var countmax:Number = 100;
		public var loadingbar:GraphicLoadingBar = new GraphicLoadingBar();
		public var box:Shape3D = new Plane3D('back', 320, 320, 10, 10, Plane3D.XY_ALIGNED, 'quad');
		public var bData:BitmapData;
		public var buttonclearmap:Button = new Button('Clear Map');
		public var g:Group = new Group();
		public var videobuild:VideoPlayerPanel = new VideoPlayerPanel();
		
		public function SandyVideoPlane() 
		{
			camera = new Camera3D( 300, 300 );
			camera.z = -400;
			var root:Group = createScene();
			scene = new Scene3D( "scene", this, camera, root );
			addEventListener( Event.ENTER_FRAME, enterFrameHandler );
			
			buttonclearmap.x = 80;
			buttonclearmap.addEventListener(MouseEvent.CLICK, clickclearmap);
		}
		
		public function clickclearmap(event:MouseEvent):void {
			trace('button');
			
			/*
			var objectmove:Array = g.children
			for (var c:int = 0; c < objectmove.length; c++) {
				//trace('object:' + objectmove[c].name);
				if (objectmove[c].name != '1') {//default there should be a camera (It should be number one (1) and not a letter l ='L')
					//trace('object remove-:' + objectmove[c].name);
					g.removeChildByName(objectmove[c].name);
				}
			}
			*/
		}
		
		private function createScene():Group {
			var moviesprite:MovieMaterial = new MovieMaterial(videobuild, 40);
			var loadbarapp:Appearance = new Appearance (moviesprite);
			box.appearance = loadbarapp;
			box.enableInteractivity = true;
			g.addChild( box );
			return g;
		}
		
		private function enterFrameHandler( event : Event ) : void {
			scene.render();
			//box.roll = 10;
			//box.rotateY = 10;
			box.changed = true;//this should be in frame render
		}
	}
}