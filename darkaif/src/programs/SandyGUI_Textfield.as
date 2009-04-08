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
	import flash.text.TextField;
	import sandy.core.Scene3D;
	import sandy.core.data.*;
	import sandy.core.scenegraph.*;
	import sandy.materials.*;
	import sandy.materials.attributes.*;
	import sandy.primitive.*;
	import darkaif.core.display.Button;
	import flash.text.TextFieldType;
	//}
	
	public class SandyGUI_Textfield extends Sprite
	{
		
		//{variables
		private var scene:Scene3D;
		private var camera:Camera3D;
		public var count:Number = 0;
		public var countmax:Number = 100;
		public var loadingbar:GraphicLoadingBar = new GraphicLoadingBar();
		public var box:Shape3D = new Plane3D('back', 256, 250, 10, 10, Plane3D.XY_ALIGNED, 'quad');
		public var bData:BitmapData;
		public var g:Group = new Group();
		public var textfield:TextField = new TextField();
		//}
		
		public function SandyGUI_Textfield() {
			
			camera = new Camera3D( 300, 300 );
			camera.z = -400;
			var root:Group = createScene();
			scene = new Scene3D( "scene", this, camera, root );
			addEventListener(Event.ENTER_FRAME, enterFrameHandler);
			
			textfield.text = 'Hello world';
			textfield.height = 20;
			textfield.border = true;
			textfield.type = TextFieldType.INPUT;
			//addChild(textfield);
		}
		
		private function createScene():Group {
			var planesprite:Sprite = new Sprite();
			planesprite.graphics.beginFill(0xF0FFFF);
			planesprite.graphics.drawRect(0, 0, 128, 128);
			planesprite.graphics.endFill();
			planesprite.addChild(textfield)
			
			var moviesprite:MovieMaterial = new MovieMaterial(planesprite, 40);
			var loadbarapp:Appearance = new Appearance (moviesprite);
			box.appearance = loadbarapp;
			box.enableInteractivity = true;
			g.addChild( box );
			return g;
		}
		
		private function enterFrameHandler( event : Event ) : void {
			scene.render();
			box.roll += 0.1;
			//box.tilt++;
			//box.changed = true;//this should be in frame render
		}
	}
}