package
{
	import darknet.core.display.Button;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import org.papervision3d.materials.MovieMaterial;
	import org.papervision3d.objects.primitives.Plane;
 
	import org.papervision3d.core.geom.TriangleMesh3D;
	import org.papervision3d.core.geom.renderables.Triangle3D;
	import org.papervision3d.core.geom.renderables.Vertex3D;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.view.BasicView;
	
	/*
	 * Information: Button not working Papervision3D
	 */ 
 
	[SWF(width="640", height="480", backgroundColor="#000000", frameRate="60")]
	public class Papervision3DPlaneSpriteButton extends BasicView
	{
		private var triangleMesh3d:TriangleMesh3D;
 
		public function Papervision3DPlaneSpriteButton()
		{
			var spriteimage:Sprite = new Sprite();
			spriteimage.graphics.beginFill(0x999999);
			spriteimage.graphics.drawRect(0, 0, 100, 100);
			spriteimage.graphics.endFill();
			var buttontest:Button = new Button('Test');
			buttontest.x = 14;
			buttontest.y = 14;
			buttontest.addEventListener(MouseEvent.CLICK, testclick);
			function testclick(event:Event):void {
				trace('click');
			}
			spriteimage.addChild(buttontest);
			var material:MovieMaterial = new MovieMaterial(spriteimage);
			material.doubleSided = true;
			material.precise = true;
			material.animated = true;
			material.interactive = true;
			//material.hasEventListener(Event.ACTIVATE);
			
			triangleMesh3d = new Plane(material, 1000, 1000);
			
			scene.addChild(triangleMesh3d);
			startRendering();
		}
 
		override protected function onRenderTick(event:Event=null):void
		{
			//triangleMesh3d.rotationY = -viewport.containerSprite.mouseX / 2;
			super.onRenderTick(event);
		}
	}
}