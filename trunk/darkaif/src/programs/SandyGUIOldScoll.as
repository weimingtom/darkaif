package programs 
{
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	* 
	* Informtion: there are two method in this script. This is plane 3D. Like a billboard show sign.
	* 
	*/ 
	import darkaif.core.display.GraphicLoadingBar;
	import darkaif.core.display.Scrollbar;
	import darkaif.core.display.ScrollContent;
	import flash.display.Sprite; 
	import flash.events.*;
	import flash.display.BitmapData;
	import flash.display.Bitmap;
	import flash.geom.Rectangle;
	import sandy.core.Scene3D;
	import sandy.core.data.*;
	import sandy.core.scenegraph.*;
	import sandy.materials.*;
	import sandy.materials.attributes.*;
	import sandy.primitive.*;
	import darkaif.core.display.Button;

	public class SandyGUIOldScoll extends Sprite
	{
		private var scene:Scene3D;
		private var camera:Camera3D;
		public var count:Number = 0;
		public var countmax:Number = 100;
		public var loadingbar:GraphicLoadingBar = new GraphicLoadingBar();
		public var box:Shape3D = new Plane3D('back', 256, 256, 10, 10, Plane3D.XY_ALIGNED, 'quad');
		public var bData:BitmapData;
		public var buttonclearmap:Button = new Button('Clear Map');
		public var g:Group = new Group();
		
		public function SandyGUIOldScoll() 
		{
			
			addChild(loadingbar);
			camera = new Camera3D( 300, 300 );
			camera.z = -400;
			var root:Group = createScene();
			scene = new Scene3D( "scene", this, camera, root );
			addEventListener( Event.ENTER_FRAME, enterFrameHandler );
			
			buttonclearmap.x = 50;
			buttonclearmap.addEventListener(MouseEvent.CLICK, clickclearmap);
			//addChild(buttonclearmap);
		}
		
		public function clickclearmap(event:MouseEvent):void {
		
		}
		
		private function createScene():Group {
			
			var content:Sprite = new Sprite();
            var scrollbar:Scrollbar = new Scrollbar();
            var rect:Rectangle = new Rectangle( 0, 0, 500, 50 );
		   
            content.graphics.beginFill( 0xFF0000, 1 );
            content.graphics.drawRect( 0, 0, 100, 50 );
            content.graphics.beginFill( 0x00FF00, 1 );
            content.graphics.drawRect( 0, 50, 100, 50 );
            content.graphics.beginFill( 0x0000FF, 1 );
            content.graphics.drawRect( 0, 100, 100, 50 );
            content.graphics.endFill();
           
            var sc:ScrollContent = new ScrollContent( content, scrollbar, rect );
           
            scrollbar.x = content.width;
			scrollbar.Content_height = rect.height;
			
			
			
			
			
			loadingbar.addChild(buttonclearmap);
			loadingbar.addChild(content);
			loadingbar.addChild(scrollbar);
			
			
			
			var moviesprite:MovieMaterial = new MovieMaterial(loadingbar, 40);
			var loadbarapp:Appearance = new Appearance (moviesprite);
			box.appearance = loadbarapp;
			//box.changed = true;
			box.enableInteractivity = true;
			//box.
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
			box.roll += 0.1;
			//box.tilt++;
			box.changed = true;//this should be in frame render
			//box.tilt++;
		}
	}
}