package gearunits.away3d.entity.building 
{
	import gearunits.away3d.entity.AStructureUnit;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class ABuilding extends AStructureUnit
	{
		public static const NAME:String = 'ABuilding';
		public static const TYPE:String = 'Building';
		
		public function ABuilding() 
		{
			type.push({name:'Building'});
		}
		/*
		override public function update():void {
			if (mesh != null) {
				mesh.x = x;
				mesh.y = y;
				mesh.z = z;
			}
		}
		*/
		
	}
	
}