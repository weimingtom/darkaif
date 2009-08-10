package gearunits.away3d.shop 
{
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class AMeshBody 
	{
		// chest/leg/feet/hands/neck/head
		public var id:int = 0;
		public var x:Number = 0;
		public var y:Number = 0;
		public var z:Number = 0;
		
		public var clothing:Vector.<AClothing> = new Vector.<AClothing>();//deal with adding and removing clothing
		
		public function AMeshBody() 
		{
			init_clothingposition();
		}
		
		public function init_clothingposition():void {
			var chest:AClothing = new AClothing();
			chest.y = 32;
			chest.type = "chest";
			chest.weartype = "chest";
			clothing.push(chest);
			var leg:AClothing = new AClothing();
			leg.type = "legs";
			leg.weartype = "legs";
			leg.y = -32;
			clothing.push(leg);
		}
		
	}
	
}