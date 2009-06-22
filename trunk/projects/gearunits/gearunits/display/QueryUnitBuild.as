package gearunits.display 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import gearunits.entity.StructureUnit;
	import gearunits.events.StructureUnitEvent;
	
	/**
	 * ...
	 * @author Darknet
	 */
	
	public class QueryUnitBuild extends Sprite
	{
		//[Embed(source = "../../system/icon/darkaif_soldier_rts.jpg")]
		//private var imagepic:Class;
		//public var buildingicon:Bitmap = new imagepic();
		
		protected var percent:Number = 0;
		public var Height:Number = 16;
		public var Width:Number = 128;
		public var image:Bitmap;
		public var textname:String = 'StructureUnit';//InterplanetaryMissiles
		public var unit:StructureUnit = new StructureUnit();
		public var labeltext:TextField = new TextField;
		public var bar:Sprite = new Sprite();
		
		public function QueryUnitBuild() {
			graphics.clear();
			graphics.beginFill(0x999999);
			graphics.drawRect(0, 0, Width, Height);
			graphics.endFill();
			bar.y = 12;
			addChild(bar);
			//labeltext.text = 'hello';
			addChild(labeltext);
		}
		
		public function unitquerybuild(unitb:StructureUnit):void {
			unit = unitb;
			settext(unit.name);
			//percentage = (unit.time / unit.timemax);
			unit.addEventListener(StructureUnitEvent.TIME,querybuildpercent);
			function querybuildpercent(event:StructureUnitEvent):void {
				percentage = (unit.time / unit.spawntime);
				if ((percent > 1) && (percent < 0)) {//error code
					percent = 0;
				}
			}
		}
		
		public function set percentage(per:Number):void {
			percent = per;
			drawbar();
		}
		
		public function get percentage():Number {
			return percent;
		}
		
		public function drawbar():void {
			bar.graphics.clear();
			bar.graphics.beginFill(0x0000ff);
			bar.graphics.drawRect(2, 0,(Width-4)*percent,2);
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