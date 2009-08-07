package  
{
	import away3d.containers.View3D;
	import away3d.core.math.Number3D;
	import flash.display.Sprite;
	import flash.events.Event;
	import gearunits.models.AMeshStoreshop;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class Away3DStoreShop extends Sprite
	{
		public var view:View3D = new View3D( { x:320, y:240 } );
		
		public function Away3DStoreShop() 
		{
			addChild(view);
			view.camera.y = 200;
			view.camera.z = -200;
			view.camera.lookAt(new Number3D(0,0,0))
			view.camera.y = 300;
			addEventListener(Event.ENTER_FRAME, render);
			
			init_scene();
		}
		
		public function render(event:Event):void {
			view.render();
		}
		
		public function init_scene():void {
			var building:AMeshStoreshop =  new AMeshStoreshop();
			
			view.scene.addChild(building)
		}
		
	}
	
}