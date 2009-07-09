package gearunits.sandy3d.entity.spacecraft 
{
	import gearunits.sandy3d.entity.SStructureUnit;
	
	/**
	 * ...
	 * @author Darknet
	 * 
	 * -crew
	 * -ship
	 * -cargo
	 * -queryship
	 * 
	 * -carrier
	 * --unit //current ship in the cargo bay
	 * 
	 * -shipyard
	 * --unit //buy ships
	 * --query build ships
	 * 
	 */
	public class SSpacecraft extends SStructureUnit
	{
		//deal with build
		//public var unit:Vector.<StructureUnit> = new Vector.<StructureUnit>();
		//public var queryunit:Vector.<StructureUnit> = new Vector.<StructureUnit>();
		
		public function SSpacecraft() 
		{
			classtype = 'Spacecraft';
			//unittype
			unittype.push({name:'spacecraft'});
		}
		
	}
	
}