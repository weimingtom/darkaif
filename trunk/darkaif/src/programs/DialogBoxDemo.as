package  programs
{
	import darknet.core.display.Button;
	import darknet.core.display.DialogBox;
	import darknet.core.display.NumericUpDown;
	import darknet.core.event.NumericUpDownEvent;
	import darknet.core.event.PanelEvent;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Darknet
	 * 
	 * Information: basic dialog box
	 * working
	 * 
	 */
	public class DialogBoxDemo extends Sprite
	{
		public var dialogbox:DialogBox = new DialogBox();
		public var button:Button = new Button('button');
		
		public function DialogBoxDemo() 
		{
			button.addEventListener(MouseEvent.MOUSE_DOWN,adddialogbox);
			addChild(button);
		}
		
		public function adddialogbox(event:Event):void {
			var panel:Sprite = new Sprite();
			var numcontrol:NumericUpDown = new NumericUpDown();
			numcontrol.addEventListener(NumericUpDownEvent.VALUE, controlpress);
			numcontrol.addEventListener(NumericUpDownEvent.ENTER, controlenter);
			
			function controlpress(event:NumericUpDownEvent):void {
				trace(event.number);
			}
			
			function controlenter(event:NumericUpDownEvent):void {
				trace(event.number);
			}
			
			panel.addChild(numcontrol);
			dialogbox.content(panel);
			dialogbox.addEventListener(PanelEvent.CLOSE, closeeventpanel);
			addChild(dialogbox);
		}
		
		public function closeeventpanel(event:Event):void {
			//trace('close');
			removedialogbox();
		}
		
		public function removedialogbox(event:Event = null):void {
			dialogbox.removeEventListener(PanelEvent.CLOSE,closeeventpanel);
			removeChild(dialogbox);
		}
		
		
		
	}
	
}