package
{
	import flash.events.Event;
	import org.papervision3d.events.FileLoadEvent;
	import org.papervision3d.objects.parsers.DAE;
	import org.papervision3d.core.geom.TriangleMesh3D;
	import org.papervision3d.core.geom.renderables.Triangle3D;
	import org.papervision3d.core.geom.renderables.Vertex3D;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.view.BasicView;
	
	/*
	 * Clone not 
	 * papervision3d 2.0
	 */
 
	[SWF(width="640", height="480", backgroundColor="#000000", frameRate="60")]
	public class Papervision3DMeshDAEClone extends BasicView
	{
		public var triangleMesh3d:DAE = new DAE(false, "mesh", false);
		
		public function Papervision3DMeshDAEClone()
		{	
			triangleMesh3d.load("data/models/cubeobj.dae");
			triangleMesh3d.scale = 100;
			triangleMesh3d.addEventListener(FileLoadEvent.LOAD_COMPLETE, fileloaded);
			scene.addChild(triangleMesh3d);
			
			function fileloaded(event:FileLoadEvent):void {
				trace('loaded...');
				var triangleMesh3d2:DAE = triangleMesh3d.clone() as TriangleMesh3D;
				//triangleMesh3d2.scale = 1;
				scene.addChild(triangleMesh3d2);
			}
			
			startRendering();
		}
 
		override protected function onRenderTick(event:Event=null):void
		{
			triangleMesh3d.rotationY = -viewport.containerSprite.mouseX / 2;
			super.onRenderTick(event);
		}
	}
}