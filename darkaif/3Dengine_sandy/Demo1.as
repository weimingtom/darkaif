package
{
	import flash.display.Sprite;
	import sandy.core.scenegraph.Camera3D;
	import sandy.core.scenegraph.Group;
	import sandy.core.scenegraph.Shape3D;
	import sandy.core.World3D;
	import sandy.materials.Appearance;
	import sandy.materials.WireFrameMaterial;
	import sandy.primitive.Plane3D;

	public class Demo1 extends Sprite
	{
		[Embed(source = '../data/library/grille.jpg')]
		private var gradient:Class;

		private var world:World3D;

		public function Demo1()
		{
			this.addChild (new gradient ());

			world = World3D.getInstance ();
			world.container = this;

			world.camera = new Camera3D (this.width, this.height);

			var scene:Group = new Group ('scene');
			var shape:Shape3D = new Plane3D ('plane', 100, 100, 10, 10);
			shape.appearance = new Appearance (new WireFrameMaterial ());

			scene.addChild (shape);
			scene.addChild (world.camera);
			world.root = scene;

			world.camera.setPosition ( -100, -100, -100);
			world.camera.lookAt (0, 0, 0);
			world.render ();
		}
	}
}