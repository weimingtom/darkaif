package gearunits.sandy3d.entity.infantry 
{
	import gearunits.sandy3d.entity.SStructureUnit;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class SInfantryClass extends SStructureUnit
	{
		
		public function SInfantryClass() {
		}
		
		public function checkclass(classtypcaptchaimage:String):SStructureUnit {
			var classunit:SStructureUnit;
			
			classunit = new SSolider();
			if (classtype == classunit.classtype) {
				return classunit;
			}else {
				return classunit;
			}
		}
	}
	
}