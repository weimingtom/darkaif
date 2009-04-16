package  programs
{
	import darknet.core.display.NumericUpDown;
	import darknet.core.event.NumericUpDownEvent;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class DemoNumericUpDown extends Sprite
	{
		public var numericupdown:NumericUpDown = new NumericUpDown();
		
		public function DemoNumericUpDown() 
		{
			
			numericupdown.addEventListener(NumericUpDownEvent.VALUE, valuechange);
			numericupdown.addEventListener(NumericUpDownEvent.ENTER, valuesetchange);
			
			function valuechange(event:NumericUpDownEvent):void {
				trace(event.number);
			}
			
			function valuesetchange(event:NumericUpDownEvent):void {
				trace(event.number);
			}
			
			
			addChild(numericupdown);
		}
		
	}
	
}