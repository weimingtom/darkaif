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
	
	//{ pacakge
	import darkaif.core.display.DropBox;
	import darkaif.core.display.GraphicLoadingBar;
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
	
	public class SandyGUI_dropbox extends Sprite
	{
		
		//{variables
		private var scene:Scene3D;
		private var camera:Camera3D;
		public var count:Number = 0;
		public var countmax:Number = 100;
		public var loadingbar:GraphicLoadingBar = new GraphicLoadingBar();
		public var box:Shape3D = new Plane3D('back', 256, 250, 10, 10, Plane3D.XY_ALIGNED, 'quad');
		public var bData:BitmapData;
		public var buttonclearmap:Button = new Button('Clear Map');
		public var g:Group = new Group();
		public var dropbox:DropBox = new DropBox();
		//}
		
		public function SandyGUI_dropbox(){
			dropbox.boxlist.push("Male");
			dropbox.boxlist.push("Female");
			dropbox.boxlist.push("Boy");
			dropbox.boxlist.push("Girl");
			dropbox.boxlist.push("Kid");
			dropbox.boxlist.push("Teen");
			dropbox.boxlist.push("Adult");
			dropbox.boxlist.push("Lim test");
			addChild(dropbox);
			//addChild(loadingbar);
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
			//g = new Group("myGroup");
			
			//trace('button');
			
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
			var planesprite:Sprite = new Sprite();
			planesprite.graphics.beginFill(0xF0FFFF);
			planesprite.graphics.drawRect(0, 0, 128, 128);
			planesprite.graphics.endFill();
			planesprite.addChild(dropbox)
			var moviesprite:MovieMaterial = new MovieMaterial(planesprite, 40);
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