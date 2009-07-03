package gearunits.entity.spacecraft 
{
	import gearunits.entity.StructureUnit;
	
	/**
	 * ...
	 * @author Darknet
	 * 
	 * information: this class is about check class ship to return value.
	 * 
	 */
	public class SpacecraftDesign 
	{
		
		public function SpacecraftDesign() 
		{
			
		}
		
		
		//class check function
		public function ShipName(_name:String):StructureUnit {
			var unit:StructureUnit;
			
			if (_name == 'FedFighter') {
				unit = new SpacecraftFedFighter();
			}else if (_name == 'FedCarrier') {
				unit = new SpacecraftFedCarrier();
			}else {
				
			}
			return unit;
		}
		
	}
	
}