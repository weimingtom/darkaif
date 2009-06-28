package gearunits.entity 
{
	import gearunits.entity.infantry.Engineer;
	import gearunits.entity.infantry.Soldier;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class UnitClass 
	{
		
		public function UnitClass() 
		{
			
		}
		
		public function unitload(classtype:String):StructureUnit {
			var classunit0:StructureUnit = new Soldier();
			var classunit1:StructureUnit = new Engineer();
			
			if (classtype == classunit0.classtype) {
				return classunit0;
			}else if (classtype == classunit1.classtype) {
				return classunit1;
			}else{
				return classunit0;
			}
		}
		
		
	}
	
}