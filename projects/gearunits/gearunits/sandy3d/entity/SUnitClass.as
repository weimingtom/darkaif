package gearunits.sandy3d.entity 
{
	import gearunits.sandy3d.entity.infantry.*
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class SUnitClass 
	{
		
		public function SUnitClass() 
		{
			
		}
		
		public function unitload(classtype:String):SStructureUnit {
			var classunit0:SStructureUnit = new SSoldier;
			var classunit1:SStructureUnit = new SEngineer();
			
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