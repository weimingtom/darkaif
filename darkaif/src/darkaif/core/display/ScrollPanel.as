package darkaif.core.display
{
	//{
	import away3d.animators.data.CurveSegment;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	//}
	
	/**
	 * ...
	 * @author @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	 */
	public class ScrollPanel extends Sprite
	{
		//{ variables
		public var buttonheightmin:Number = 3;
		public var buttonheightmax:Number = 14;
		public var buttonheight:Number = 14;
		public var buttonwidth:Number = 14;
		public var buttonwidthmin:Number = 3;
		public var buttonwidthmax:Number = 14;
		
		public var pheight:Number = 100;
		public var pwidth:Number = 14;
		
		public var marker:Sprite = new Sprite();
		public var markerheight:Number = 20;
		public var markerheightmin:Number = 3;
		public var markerheightmax:Number = 20;
		public var markerpositionx:Number = 0;
		public var markerpercent:Number = 0;
		
		public var buttonup:Sprite = new Sprite();
		public var buttondown:Sprite = new Sprite();
		public var percentage:Number = 0;
		//public var percent:Number = 0;
		//}
		
		public function ScrollPanel(){
			drawscrollbar();
			createelements();
		}
		
		public function createelements():void {
			addChild(buttonup);
			marker.addEventListener(MouseEvent.MOUSE_DOWN, startdragmarker);
			marker.addEventListener(MouseEvent.MOUSE_MOVE, scalecheck);
			marker.addEventListener(MouseEvent.MOUSE_UP, stopdragmarker);
			addChild(marker);
			addChild(buttondown);
		}
		
		//move bar
		public function startdragmarker(e:Event):void {
			e.target.startDrag(false, new Rectangle(0, buttonheight, 0, pheight - (buttonheight * 2) - markerheight));
		}
		
		//stop bar
		public function stopdragmarker(e:Event):void {
			e.target.stopDrag();
			markerposition();
			//trace("marker posx:"+marker.y);
		}
		
		//set marker position
		public function markerposition():void {
			var barheight:Number = pheight - (buttonheight * 2) - marker.height;
			var currentmarkerheight:Number = marker.y - buttonheight;
			markerpercent = currentmarkerheight / barheight;
			
		}
		
		//percent scroll when move
		public function scalecheck(e:Event = null):void {
			var barheight:Number = pheight - (buttonheight * 2) - marker.height;
			var currentmarkerheight:Number = marker.y - buttonheight;
			percentage = currentmarkerheight / barheight;
			//trace(percent);
		}
		
		//update marker positoin
		public function checkmarkerposition():void {
			var barheight:Number = pheight - (buttonheight * 2) - markerheight;
			marker.y = (barheight * markerpercent) + buttonheight;
		}
		
		//draw scroll bar 
		public function drawscrollbar():void {
			graphics.clear();
			graphics.beginFill(0x00FF00);
			graphics.drawRect(0, 0, pwidth, pheight);
			graphics.endFill();
			
			//buttonup.x = -14;
			if (pheight <= (buttonheight*2)+ markerheight) {
				buttonheight = buttonheightmin;
				markerheight = markerheightmin;
				//trace("min");
			}else {
				buttonheight = buttonheightmax;
				markerheight = markerheightmax;
				//trace("max");
			}
			//buttonup.x = 16;
			buttonup.graphics.clear()
			buttonup.graphics.beginFill(0x00FFF0);
			buttonup.graphics.drawRect(0, 0, buttonwidth, buttonheight);
			buttonup.graphics.endFill();
			
			marker.y = buttonheight;
			marker.graphics.clear()
			marker.graphics.beginFill(0x000FFF);
			marker.graphics.drawRect(0, 0, buttonwidth, markerheight);
			marker.graphics.endFill();
			
			buttondown.y = pheight - buttonheight;
			buttondown.graphics.clear()
			buttondown.graphics.beginFill(0x00FFF0);
			buttondown.graphics.drawRect(0, 0, buttonwidth, buttonheight);
			buttondown.graphics.endFill();
		}
		
		public function set _pheight(_height:Number):void {
			pheight = _height;
			//setbarpercent();
			drawscrollbar();
			checkmarkerposition(); //this will update marker position
		}
		
	}
	
}