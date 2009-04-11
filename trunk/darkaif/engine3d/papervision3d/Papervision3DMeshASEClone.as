package
{
	import flash.events.Event;
	import org.papervision3d.events.FileLoadEvent;
	import org.papervision3d.materials.BitmapFileMaterial;
	import org.papervision3d.objects.parsers.Ase;
	import org.papervision3d.core.geom.TriangleMesh3D;
	import org.papervision3d.core.geom.renderables.Triangle3D;
	import org.papervision3d.core.geom.renderables.Vertex3D;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.view.BasicView;
	
	/*
	 * Clone working
	 */
	
	[SWF(width="640", height="480", backgroundColor="#000000", frameRate="60")]
	public class Papervision3DMeshASEClone extends BasicView
	{
		public var triangleMesh3d:TriangleMesh3D;
		
		public function Papervision3DMeshASEClone()
		{
			var material:BitmapFileMaterial = new BitmapFileMaterial('data/images/color16x16.jpg');
			triangleMesh3d = new Ase(material, "data/models/cubeobj.ase", 1);
			scene.addChild(triangleMesh3d);
			
			triangleMesh3d.addEventListener(FileLoadEvent.LOAD_COMPLETE, fileloaded);
			
			function fileloaded(event:FileLoadEvent):void {
				var triangleMesh3d2:TriangleMesh3D = triangleMesh3d.clone() as TriangleMesh3D;
				triangleMesh3d2.x = 64;
				triangleMesh3d2.scale = 1;
				triangleMesh3d2.material = material;
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