package gearunits.display 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import gearunits.entity.building.Building;
	import gearunits.entity.StructureUnit;
	
	/**
	 * ...
	 * @author Darknet
	 */
	
	public class UnitIconButton extends Sprite
	{
		//[Embed(source = "../../system/icon/constructionyard_rts_icon.jpg")]
		//private var imagepic:Class;
		//public var buildingicon:Bitmap = new imagepic();
		public var buildingicon:Bitmap;
		
		public function UnitIconButton(bitmap:Bitmap) 
		{
			graphics.clear();
			graphics.beginFill(0x999999);
			graphics.drawRect(0, 0, 34, 34);
			graphics.endFill();
			
			buildingicon = bitmap;
			buildingicon.x = 1;
			buildingicon.y = 1;
			//buildingicon
			addEventListener(MouseEvent.MOUSE_OVER, overicon);
			addEventListener(MouseEvent.MOUSE_OUT, outicon);
			//buildingicon.alpha
			addChild(buildingicon);
		}
		
		private function overicon(event:Event):void {
			event.currentTarget.alpha = 0.5;
			//trace('over');
		}
		private function outicon(event:Event):void {
			event.currentTarget.alpha = 1;
			//trace('over');
		}
		
	}
	
}