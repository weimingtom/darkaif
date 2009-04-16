package  
{
	import flash.display.Sprite;
	import sandy.core.Scene3D;
	import sandy.core.scenegraph.Camera3D;
	import sandy.core.scenegraph.Group;
	import sandy.primitive.Box;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Darknet
	 */
	[SWF(width="640", height="480", backgroundColor="#FFFFFF", frameRate="30")]
	public class SandyView2 extends Sprite
	{
		
		//{
		public var scene:Scene3D;
		public var scene2:Scene3D;
		public var camera:Camera3D;
		public var camera2:Camera3D;
		public var g:Group = new Group("mygroup");
		public var g2:Group = new Group("mygroup2");
		public var spritescene:Sprite = new Sprite();
		public var spritescene2:Sprite = new Sprite();
		public var box:Box = new Box('box');
		//}
		
		public function SandyView2() {
			
			spritescene.graphics.clear();
			spritescene.graphics.beginFill(0x999999);
			spritescene.graphics.drawRect(0, 0, 300, 300);
			spritescene.graphics.endFill();
			
			spritescene2.graphics.clear();
			spritescene2.graphics.beginFill(0x999900);
			spritescene2.graphics.drawRect(0, 0, 300, 300);
			spritescene2.graphics.endFill();
			
			camera = new Camera3D(300, 300);
			camera2 = new Camera3D(300, 300);
			
			var root:Group = g;
			var root2:Group = g2;
			
			scene = new Scene3D( "scene1", spritescene, camera, root );
			scene2 = new Scene3D( "scene2", spritescene2, camera2, root );
			
			//box.rotateY ++;
			
			g.addChild(box);
			//g2.addChild(box);
			
			addEventListener( Event.ENTER_FRAME, enterFrameHandler );
			addChild(spritescene);
			spritescene2.x = 300;
			addChild(spritescene2);
		}
		
		// This update the code and the function when every frame count is pass
		private function enterFrameHandler( event : Event ) : void {
			var objects:Array = g.children;
			//trace("["+camera2.name+"]:["+camera.name+"]");
			/*
			for (var objectsno:int = 0; objectsno < objects.length; objectsno++ ) {
				
				if((objects[objectsno].name == 'box')){
					objects[objectsno].rotateY ++;
				}
				
			}
			
			var objects2:Array = g2.children;
			
			for (var objectsno2:int = 0; objectsno2 < objects2.length; objectsno2++ ) {
				
				if((objects2[objectsno].name == 'box')){
					objects2[objectsno].rotateY ++;
				}
				
			}
			*/
			scene.render();
			scene2.render();
		}
		
	}
	
}