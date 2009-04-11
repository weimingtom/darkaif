package
{
	import flash.events.Event;
	import org.papervision3d.events.FileLoadEvent;
	import org.papervision3d.objects.parsers.KMZ;
	import org.papervision3d.objects.parsers.MD2;
	import org.papervision3d.core.geom.TriangleMesh3D;
	import org.papervision3d.core.geom.renderables.Triangle3D;
	import org.papervision3d.core.geom.renderables.Vertex3D;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.objects.parsers.Sketchup;
	import org.papervision3d.view.BasicView;
	
	/*
	 * Clone not working.
	 * papervision3d 2.0
	 */
 
	[SWF(width="640", height="480", backgroundColor="#0F0F0F", frameRate="60")]
	public class Papervision3DMeshKMZClone extends BasicView {
		
		public var triangleMesh3d:KMZ;
		
		public function Papervision3DMeshKMZClone(){
			triangleMesh3d = new KMZ();
			triangleMesh3d.load("data/models/test.kmz");
			triangleMesh3d.scale = 10;
			triangleMesh3d.addEventListener(FileLoadEvent.LOAD_COMPLETE, fileloaded);
			scene.addChild(triangleMesh3d);
			
			function fileloaded(event:FileLoadEvent):void {
				trace('loaded...');
				var triangleMesh3d2:TriangleMesh3D = triangleMesh3d.clone() as TriangleMesh3D;
				triangleMesh3d2.y = 64;
				triangleMesh3d2.scale = 10;
				scene.addChild(triangleMesh3d2);
			}
			
			startRendering();
		}
		
		override protected function onRenderTick(event:Event = null):void {
			triangleMesh3d.rotationY = -viewport.containerSprite.mouseX / 2;
			super.onRenderTick(event);
		}
	}
}