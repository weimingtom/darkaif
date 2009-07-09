package gearunits.sandy3d.entity.spacecraft 
{
	import gearunits.sandy3d.entity.SStructureUnit;
	
	/**
	 * ...
	 * @author Darknet
	 * 
	 * information: this class is about check class ship to return value.
	 * 
	 */
	public class SSpacecraftDesign 
	{
		
		public function SSpacecraftDesign() 
		{
			
		}
		
		//class check function
		public function ShipName(_name:String):SStructureUnit {
			var unit:SStructureUnit;
			
			if (_name == 'FedFighter') {
				unit = new SSpacecraftFedFighter();
			}else if (_name == 'FedCarrier') {
				unit = new SSpacecraftFedCarrier();
			}else {
				
			}
			return unit;
		}
		
	}
	
}