package {
	import flash.display.Sprite;
	import flash.events.Event;
	
	import sandy.core.Scene3D;
	import sandy.core.scenegraph.Camera3D;
	import sandy.core.scenegraph.Group;
	import sandy.core.scenegraph.Shape3D;
	import sandy.materials.Appearance;
	import sandy.materials.BitmapMaterial;		

	public class Main extends Sprite
	{
		private var scene : Scene3D;
		private var torus : Shape3D;

		public function Main()
		{
			var camera : Camera3D = new Camera3D( 300, 300 );
 			camera.x = 0;
			camera.y = 0;
			camera.z = -55;
			//camera.lookAt( 0, 0, 0 );

			scene = new Scene3D( "scene", this, camera, new Group( "rootGroup" ) );
			
			torus = new cubeflash();
			//torus.appearance = new Appearance(new BitmapMaterial(new TorusTexture(1024,1024)));

			scene.root.addChild( torus );
			addEventListener( Event.ENTER_FRAME, animate );
		}
		
		private function animate( event:Event ):void {
			torus.rotateZ++;
			torus.rotateY++;

			scene.render();
		}

	}
}