﻿package gearunits.sandy3d.display 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import gearunits.sandy3d.entity.building.SBuilding;
	import gearunits.sandy3d.entity.SStructureUnit;
	import gearunits.sandy3d.events.SStructureUnitEvent;
	import gearunits.sandy3d.events.SUnitEvent;
	
	/**
	 * ...
	 * @author Darknet
	 */
	
	public class SUnitIconButton extends Sprite
	{
		//[Embed(source = "../../system/icon/constructionyard_rts_icon.jpg")]
		//private var imagepic:Class;
		//public var buildingicon:Bitmap = new imagepic();
		public var buildingicon:Bitmap;
		public var unitid:String = '';
		public var unitclass:String = '';
		
		public function SUnitIconButton(bitmap:Bitmap) 
		{
			graphics.clear();
			graphics.beginFill(0x999999);
			graphics.drawRect(0, 0, 34, 34);
			graphics.endFill();
			
			buildingicon = bitmap;
			buildingicon.x = 1;
			buildingicon.y = 1;
			//buildingicon
			//addEventListener(MouseEvent.CLICK, clickicon);
			addEventListener(MouseEvent.MOUSE_UP, clickicon);
			addEventListener(MouseEvent.MOUSE_OVER, overicon);
			addEventListener(MouseEvent.MOUSE_OUT, outicon);
			//buildingicon.alpha
			addChild(buildingicon);
		}
		private function downicon(event:Event):void {
			event.currentTarget.alpha = 0.8;
			//trace('over');
		}
		private function clickicon(event:Event):void {
			event.currentTarget.alpha = 0.9;
			dispatchEvent(new SUnitEvent(SUnitEvent.CHECK,{unitid:unitid,unitclass:unitclass}));
			trace('click');
			//trace('over');
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