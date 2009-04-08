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
	import darknet.core.display.DropBox3D;
	import darkaif.core.display.GraphicLoadingBar;
	import darknet.core.display.DropBoxList;
	import darkaif.core.display.Button;
	import sandy.primitive.Box;
	
	import flash.display.Sprite; 
	import flash.events.MouseEvent;
	import flash.events.Event
	import flash.display.BitmapData;
	import flash.display.Bitmap;
	
	import sandy.core.Scene3D;
	import sandy.core.scenegraph.Shape3D
	import sandy.core.scenegraph.Camera3D;
	import sandy.core.scenegraph.Group;
	import sandy.primitive.Plane3D;
	import sandy.materials.MovieMaterial;
	import sandy.materials.Appearance;
	
	//}
	
	public class SandyGUI_DropBoxList extends Sprite
	{
		
		//{variables
		private var scene:Scene3D;
		private var camera:Camera3D;
		public var count:Number = 0;
		public var countmax:Number = 100;
		public var loadingbar:GraphicLoadingBar = new GraphicLoadingBar();
		public var box:Shape3D = new Plane3D('back', 256, 250, 10, 10, Plane3D.XY_ALIGNED, 'quad');
		public var box2:Box = new Box('box',32,32,32);
		public var buttonclearmap:Button = new Button('Clear Map');
		public var g:Group = new Group();
		public var dropbox:DropBoxList = new DropBoxList();
		//}
		
		public function SandyGUI_DropBoxList(){
			dropbox.boxlist.push({name:"Male",id:'g1'});
			dropbox.boxlist.push({name:"Female",id:'g2'});
			dropbox.boxlist.push({name:"Boy",id:'g3'});
			dropbox.boxlist.push({name:"Girl",id:'g4'});
			dropbox.boxlist.push({name:"Kid",id:'g5'});
			dropbox.boxlist.push({name:"Teen",id:'g6'});
			dropbox.boxlist.push({name:"Adult",id:'g7'});
			dropbox.boxlist.push({name:"Lim test",id:'g8'});
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
			var objectmove:Array = g.children
			while(objectmove.length){
				for (var c:int = 0; c < objectmove.length; c++) {
					//trace('object:' + objectmove[c].name);
					if (objectmove[c].name != camera.name) {
						g.removeChildByName(objectmove[c].name);
					}
					if (objectmove.length == 1) {
						break;
					}
				}
			}
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
			g.addChild(box2);
			return g;
		}
		
		private function enterFrameHandler( event : Event ) : void {
			scene.render();
			box.roll += 0.1;
			box.changed = true;//this should be in frame render
		}
	}
}