package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import gearunits.models.SMeshStoreshop;
	import sandy.core.Scene3D;
	import sandy.core.scenegraph.Camera3D;
	import sandy.core.scenegraph.Group;
	import sandy.materials.Appearance;
	import sandy.materials.ColorMaterial;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class Sandy3DStoreShop extends Sprite
	{
		public var scene:Scene3D;
		public var camera:Camera3D;
		public var g:Group = new Group('group');
		
		public function Sandy3DStoreShop() 
		{
			camera = new Camera3D(800, 600);
			camera.lookAt(0, 0, 0);
			camera.z = -200;
			camera.y = 200;
			camera.lookAt(0, 0, 0);
			camera.y = 500;
			
			scene = new Scene3D( "scene", this, camera, g );
			addEventListener(Event.ENTER_FRAME, enterFrameHandler);
			init_scene();
		}
		
		//UPDATE FRAME
		private function enterFrameHandler(event:Event) : void {
			scene.render();
		}
		
		public function init_scene():void {
			var colormat:ColorMaterial = new ColorMaterial(0x999999);
			colormat.lightingEnable = true;
			var app:Appearance = new Appearance(colormat);
			var building:SMeshStoreshop = new SMeshStoreshop();
			//building.appearance = app;
			scene.root.addChild(building)
		}
	}
	
}