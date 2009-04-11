package
{
	import flash.events.Event;
	import org.papervision3d.events.FileLoadEvent;
	import org.papervision3d.objects.parsers.MD2;
	import org.papervision3d.core.geom.TriangleMesh3D;
	import org.papervision3d.core.geom.renderables.Triangle3D;
	import org.papervision3d.core.geom.renderables.Vertex3D;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.view.BasicView;
	
	/*
	 * Clone works
	 * papervision3d 2.0
	 */
 
	[SWF(width="640", height="480", backgroundColor="#000000", frameRate="60")]
	public class Papervision3DMeshMD2Clone extends BasicView {
		
		public var triangleMesh3d:MD2 = new MD2(true);//play animation bool
		public var triangleMesh3d2:TriangleMesh3D;
		
		public function Papervision3DMeshMD2Clone(){
			var material:ColorMaterial = new ColorMaterial(0xcc0000);
			material.doubleSided = true;
			
			triangleMesh3d.load("data/models/simple_monster_low2.md2",material);
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
			triangleMesh3d.rotationY = +viewport.containerSprite.mouseX / 2;
			triangleMesh3d.rotationY = -viewport.containerSprite.mouseX / 2;
			super.onRenderTick(event);
		}
	}
}