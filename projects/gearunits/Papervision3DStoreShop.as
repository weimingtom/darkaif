package  
{
	import gearunits.models.PMeshStoreshop;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.materials.special.CompositeMaterial;
	import org.papervision3d.materials.WireframeMaterial;
	import org.papervision3d.view.BasicView;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class Papervision3DStoreShop extends BasicView
	{
		
		public function Papervision3DStoreShop(){
			camera.z = -200;
			camera.y = 200;
			
			init_scene();
			startRendering();
		}
		
		
		public function init_scene():void {
			var wiremat:WireframeMaterial  = new WireframeMaterial();
			var colormat:ColorMaterial = new ColorMaterial(0x999900);
			var compatmat:CompositeMaterial = new CompositeMaterial();
			compatmat.addMaterial(colormat);
			compatmat.addMaterial(wiremat);
			
			var building:PMeshStoreshop = new PMeshStoreshop(compatmat);
			//building.appearance = app;
			scene.addChild(building)
		}
		
	}
	
}