/*
 * Author:  Andre Stubbe, http://www.andrestubbe.com
 */

package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import org.papervision3d.cameras.Camera3D;
	import org.papervision3d.objects.Plane;
	import org.papervision3d.scenes.MovieScene3D;
	import org.papervision3d.materials.WireframeMaterial;

	[SWF(width='400',height='400',backgroundColor='0x000000',frameRate='30')]
	
	public class ExamplePlanePrimitive extends Sprite
	{
		private var container :Sprite;
		private var scene :MovieScene3D;
		private var camera :Camera3D;

		public function ExamplePlanePrimitive()
		{
			// create a container
			container = new Sprite;
			container.x = 200;
			container.y = 200;
			addChild( container );
			
			// create a scene
			scene = new MovieScene3D( container );
			
			// create a camera
			camera = new Camera3D();
			camera.z = -500;
			camera.zoom = 5;

			// create a material
			var material:WireframeMaterial = new WireframeMaterial(0xFF0000);

			// create a plane				
			var plane:Plane = new Plane( material, 128, 128, 1, 1);

			// register plane
			scene.addChild( plane );

			// render the scene once
			scene.renderCamera( camera );

		}

	}
	
}

