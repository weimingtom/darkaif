package gearunits.entity.infantry 
{
	import gearunits.entity.StructureUnit;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class InfantryClass extends StructureUnit
	{
		
		public function InfantryClass() {
		}
		
		public function checkclass(classtypcaptchaimage:String):StructureUnit {
			var classunit:StructureUnit;
			
			classunit = new Solider();
			if (classtype == classunit.classtype) {
				return classunit;
			}else {
				return classunit;
			}
		}
	}
	
}