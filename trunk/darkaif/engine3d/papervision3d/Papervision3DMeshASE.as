package
{
	import darkaif.core.display.Button;
	import flash.events.Event;
	import org.papervision3d.objects.parsers.Ase;
	import org.papervision3d.core.geom.TriangleMesh3D;
	import org.papervision3d.core.geom.renderables.Triangle3D;
	import org.papervision3d.core.geom.renderables.Vertex3D;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.view.BasicView;
	
	/*
	 * Works
	 * papervision3d 2.0
	 */
 
	[SWF(width="640", height="480", backgroundColor="#000000", frameRate="60")]
	public class Papervision3DMeshASE extends BasicView
	{
		public var triangleMesh3d:TriangleMesh3D;
		
		
		public function Papervision3DMeshASE()
		{
			var material:ColorMaterial = new ColorMaterial(0xcc0000);
			material.doubleSided = true;
			triangleMesh3d = new Ase(null, "data/models/cubeobj.ase", 0.5);
			scene.addChild(triangleMesh3d);
			startRendering();
		}
 
		override protected function onRenderTick(event:Event=null):void
		{
			triangleMesh3d.rotationY = -viewport.containerSprite.mouseX / 2;
			super.onRenderTick(event);
		}
	}
}