package shop 
{
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class MeshBody 
	{
		// chest/leg/feet/hands/neck/head
		public var id:int = 0;
		public var x:Number = 0;
		public var y:Number = 0;
		public var z:Number = 0;
		public var chest:Clothing = new Clothing();
		public var leg:Clothing = new Clothing();
		
		public var clothing:Vector.<Clothing> = new Vector.<Clothing>();//deal with adding and removing clothing
		
		public function MeshBody() 
		{
			init_clothingposition();
		}
		
		public function init_clothingposition():void {
			chest.y = 32;
			leg.y = -32;
		}
		
	}
	
}