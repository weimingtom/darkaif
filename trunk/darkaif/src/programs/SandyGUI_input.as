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
	
	//{
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
	import flash.text.TextFormat;
	import flash.text.TextFieldType;
	//}

	public class SandyGUI_input extends Sprite
	{
		//{var
		private var scene:Scene3D;
		private var camera:Camera3D;
		public var count:Number = 0;
		public var countmax:Number = 100;
		public var loadingbar:GraphicLoadingBar = new GraphicLoadingBar();
		public var box:Shape3D = new Plane3D('back', 100, 250, 10, 10, Plane3D.XY_ALIGNED, 'quad');
		public var bData:BitmapData;
		public var buttonclearmap:Button = new Button('Clear Map');
		public var g:Group = new Group();
		public var textfield_input:TextField;
		//}
		
		public function SandyGUI_input() 
		{
			textfield_input = createinput();
			//textfield_input.type = TextFieldType.INPUT; 
			textfield_input.text = 'test';
			//addChild(textfield_input);
			
			//addChild(loadingbar);
			camera = new Camera3D( 300, 300 );
			camera.z = -400;
			var root:Group = createScene();
			scene = new Scene3D( "scene", this, camera, root );
			addEventListener( Event.ENTER_FRAME, enterFrameHandler );
			
			buttonclearmap.x = 50;
			buttonclearmap.addEventListener(MouseEvent.CLICK, clickclearmap);
		}
		
		public function clickclearmap(event:MouseEvent):void {
			
		}
		
		private function createScene():Group {
			//loadingbar.addChild(buttonclearmap);
			loadingbar.addChild(textfield_input);
			var moviesprite:MovieMaterial = new MovieMaterial(loadingbar, 40);
			var loadbarapp:Appearance = new Appearance (moviesprite);
			box.appearance = loadbarapp;
			box.enableInteractivity = true;
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
			//box.roll++;
			//box.tilt++;
			box.changed = true;//this should be in frame render
			//box.tilt++;
		}
		
		public function createinput():TextField {
			var label_txt:TextField = new TextField();
			label_txt.border = true;
			label_txt.background = true;
			label_txt.type = TextFieldType.INPUT; 
			label_txt.height = 18;
			var format:TextFormat = label_txt.getTextFormat();
			return label_txt;
		}
	}
}