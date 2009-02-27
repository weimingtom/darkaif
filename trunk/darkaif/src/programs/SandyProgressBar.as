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
	import darkaif.frame.Button;

	public class SandyProgressBar extends Sprite
	{
		private var scene:Scene3D;
		private var camera:Camera3D;
		public var count:Number = 0;
		public var countmax:Number = 100;
		public var loadingbar:GraphicLoadingBar = new GraphicLoadingBar();
		public var box:Shape3D = new Plane3D('back', 100, 250, 1, 1,Plane3D.XY_ALIGNED, 'quad');
		public var bData:BitmapData;
		public var buttonclearmap:Button = new Button('Clear Map');
		public var g:Group = new Group();
		public var panelsprite:Sprite = new Sprite();
		
		public function SandyProgressBar(){
			addChild(loadingbar);
			camera = new Camera3D( 300, 300 );
			camera.z = -400;
			var root:Group = createScene();
			scene = new Scene3D( "scene", this, camera, root );
			addEventListener( Event.ENTER_FRAME, enterFrameHandler );
			
			//buttonclearmap.x = 0;
			buttonclearmap.addEventListener(MouseEvent.CLICK, clickclearmap);
			addChild(buttonclearmap);
		}
		
		public function clickclearmap(event:MouseEvent):void {
			//g = new Group("myGroup");
			var objectmove:Array = g.children
			for (var c:int = 0; c < objectmove.length; c++) {
				//trace('object:' + objectmove[c].name);
				if (objectmove[c].name != '1') {//default there should be a camera (It should be number one (1) and not a letter l ='L')
					//trace('object remove-:' + objectmove[c].name);
					g.removeChildByName(objectmove[c].name);
				}
			}
		}
		
		private function createScene():Group {
			//buttonclearmap.x = 0;
			//buttonclearmap.y = 0;
			loadingbar.addChild(buttonclearmap);
			panelsprite.graphics.beginFill(0xadd8e6);
			panelsprite.graphics.drawRect(0,0,200,100); 
			panelsprite.addChild(loadingbar);
			//panelsprite.addChild(buttonclearmap);
			
			var moviesprite:MovieMaterial = new MovieMaterial(panelsprite, 40);
			var loadbarapp:Appearance = new Appearance (moviesprite);
			box.appearance = loadbarapp;
			g.addChild(box);
			return g;
		}
		
		private function enterFrameHandler( event : Event ) : void {
			scene.render();
			count++;
			if (count > countmax) {
				count = 0;
			}
			
			loadingbar.precent = count;
			box.changed = true;
			box.roll++;
			box.tilt++;
			
			/* //this one update image when converted
			bData = new BitmapData(loadingbar.width, loadingbar.height, true);
			bData.draw(loadingbar);
			var loadbarbitapp:Appearance = new Appearance (new BitmapMaterial(bData));
			box.appearance = loadbarbitapp;
			*/
		}
	}
}