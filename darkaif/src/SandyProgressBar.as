package  
{
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	* 
	* Informtion: there are two method in this script. This is plane 3D. Like a billboard show sign.
	* 
	*/ 
	import darkaif.frame.GraphicLoadingBar;
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

	public class SandyProgressBar extends Sprite
	{
		private var scene:Scene3D;
		private var camera:Camera3D;
		public var count:Number = 0;
		public var countmax:Number = 100;
		public var loadingbar:GraphicLoadingBar = new GraphicLoadingBar();
		public var box:Shape3D = new Plane3D('back', 100, 250, 10, 10, 
						Plane3D.XY_ALIGNED, 'quad');
		public var bData:BitmapData;
		
		public function SandyProgressBar() 
		{
			
			addChild(loadingbar);
			camera = new Camera3D( 300, 300 );
			camera.z = -400;
			var root:Group = createScene();
			scene = new Scene3D( "scene", this, camera, root );
			addEventListener( Event.ENTER_FRAME, enterFrameHandler );
		}
		
		private function createScene():Group {
			var g:Group = new Group();
			
			var moviesprite:MovieMaterial = new MovieMaterial(loadingbar, 40);
			var loadbarapp:Appearance = new Appearance (moviesprite);
			box.appearance = loadbarapp;
			g.addChild( box );
			return g;
		}
		
		private function enterFrameHandler( event : Event ) : void {
			scene.render();
			count++;
			if (count > countmax) {
				count = 0;
			}
			loadingbar.precent = count;
			box.roll++;
			//box.tilt++;
			
			/* //this one update image when converted
			bData = new BitmapData(loadingbar.width, loadingbar.height, true);
			bData.draw(loadingbar);
			var loadbarbitapp:Appearance = new Appearance (new BitmapMaterial(bData));
			box.appearance = loadbarbitapp;
			*/
		}
	}
}