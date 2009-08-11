package gearunits.sandy3d.shop 
{
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class SMeshBody 
	{
		// chest/leg/feet/hands/neck/head
		public var id:int = 0;
		public var x:Number = 0;
		public var y:Number = 0;
		public var z:Number = 0;
		
		public var clothing:Vector.<SClothing> = new Vector.<SClothing>();//deal with adding and removing clothing
		
		public function SMeshBody() 
		{
			init_clothingposition();
		}
		
		public function init_clothingposition():void {
			var chest:SClothing = new SClothing();
			chest.y = 32;
			chest.type = "chest";
			chest.weartype = "chest";
			clothing.push(chest);
			var leg:SClothing = new SClothing();
			leg.type = "legs";
			leg.weartype = "legs";
			leg.y = -32;
			clothing.push(leg);
		}
		
	}
	
}