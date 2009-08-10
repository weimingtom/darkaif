package gearunits.papervision3d.shop 
{
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class PMeshBody 
	{
		// chest/leg/feet/hands/neck/head
		public var id:int = 0;
		public var x:Number = 0;
		public var y:Number = 0;
		public var z:Number = 0;
		
		public var clothing:Vector.<PClothing> = new Vector.<PClothing>();//deal with adding and removing clothing
		
		public function PMeshBody() 
		{
			init_clothingposition();
		}
		
		public function init_clothingposition():void {
			var chest:PClothing = new PClothing();
			chest.y = 32;
			chest.type = "chest";
			chest.weartype = "chest";
			clothing.push(chest);
			var leg:PClothing = new PClothing();
			leg.type = "legs";
			leg.weartype = "legs";
			leg.y = -32;
			clothing.push(leg);
		}
		
	}
	
}