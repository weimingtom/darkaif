package gearunits.sandy3d.display 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import gearunits.sandy3d.entity.SStructureUnit;
	import gearunits.sandy3d.events.SStructureUnitEvent;
	import gearunits.sandy3d.events.SUnitEvent;
	import gearunits.sandy3d.events.SUnitQueryBuildEvent;
	
	/**
	 * ...
	 * @author Darknet
	 */
	
	public class SQueryUnitBuild extends Sprite
	{
		//[Embed(source = "../../system/icon/darkaif_soldier_rts.jpg")]
		//private var imagepic:Class;
		//public var buildingicon:Bitmap = new imagepic();
		
		protected var percent:Number = 0;
		public var Height:Number = 16;
		public var Width:Number = 128;
		public var image:Bitmap;
		public var textname:String = 'StructureUnit';//InterplanetaryMissiles
		public var unit:SStructureUnit = new SStructureUnit();
		public var labeltext:TextField = new TextField;
		public var bar:Sprite = new Sprite();
		
		public function SQueryUnitBuild() {
			graphics.clear();
			graphics.beginFill(0x999999);
			graphics.drawRect(0, 0, Width, Height);
			graphics.endFill();
			bar.y = 12;
			addChild(bar);
			//labeltext.text = 'hello';
			addChild(labeltext);
		}
		
		public function unitquerybuild(unitb:SStructureUnit):void {
			unit = unitb;
			settext(unit.name);
			//percentage = (unit.time / unit.timemax);
			unit.addEventListener(SUnitQueryBuildEvent.TIME,querybuildtime);
			function querybuildtime(event:SUnitQueryBuildEvent):void {
				percentage = (unit.time / unit.spawntime);
				if ((percent > 1) && (percent < 0)) {//error code
					percent = 0;
				}
			}
		}
		
		public function set percentage(per:Number):void {
			percent = per;
			if ((percent > 1) && (percent < 0)) {//error code
				percent = 0;
			}
			drawbar();
		}
		
		public function get percentage():Number {
			return percent;
		}
		
		public function drawbar():void {
			bar.graphics.clear();
			bar.graphics.beginFill(0x0000ff);
			var scale:Number = (Width - 4) * percent;
			if (scale < 0) {
				scale = 0;
			}
			bar.graphics.drawRect(2, 0,scale,2);
			bar.graphics.endFill();
		}
		
		public function settext(name:String):void {
			var format:TextFormat = new TextFormat();
			format.size = 10;
			format.font = "OCR A Extended";
			format.color = 0xF5F5F5;
			
			labeltext.autoSize = TextFieldAutoSize.LEFT;
			labeltext.selectable = false;
			labeltext.alwaysShowSelection = false;
			labeltext.text = String(name);
			labeltext.setTextFormat(format);
			labeltext.y = -2;
		}
		
		public function remove():void {
			removeChild(this);
		}
		
	}
	
}