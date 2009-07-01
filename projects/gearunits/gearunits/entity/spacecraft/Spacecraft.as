package gearunits.entity.spacecraft 
{
	import gearunits.entity.StructureUnit;
	
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
	public class Spacecraft extends StructureUnit
	{
		//deal with build
		//public var unit:Vector.<StructureUnit> = new Vector.<StructureUnit>();
		//public var queryunit:Vector.<StructureUnit> = new Vector.<StructureUnit>();
		
		public function Spacecraft() 
		{
			classtype = 'Spacecraft';
			//unittype
			unittype.push({name:'Spacecraft'});
		}
		
	}
	
}