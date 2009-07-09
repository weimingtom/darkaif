package gearunits.papervision3d.entity 
{
	import gearunits.papervision3d.entity.building.*;
	import gearunits.papervision3d.entity.infantry.*;
	import gearunits.papervision3d.entity.spacecraft.*;
	/**
	 * ...
	 * @author Darknet
	 */
	public class PUnitClass 
	{
		
		public function PUnitClass() 
		{
			
		}
		
		public function CheckName(name:String):PStructureUnit {
			trace('[--- CLASS UNIT CHECK ---]');
			var unit:PStructureUnit;
			
			//{ space craft
			if (name == PSpaceshipFedFighter.NAME ) {
				unit = new PSpaceshipFedFighter();
				trace('---'+PSpaceshipFedFighter.NAME);
			}
			if (name == PSpaceshipFedCarrier.NAME) {
				unit = new PSpaceshipFedCarrier();
				trace('---'+PSpaceshipFedCarrier.NAME);
			}
			if (name == PSpacestationFedShipyard.NAME) {
				unit = new PSpacestationFedShipyard();
				trace('---'+PSpacestationFedShipyard.NAME);
			}
			//}
			
			//{ BUILDINGS
			if (name == PBuildingBarrack.NAME) {
				unit = new PBuildingBarrack();
				trace('---'+PBuildingBarrack.NAME);
			}
			if (name == PBuildingConstructionYard.NAME) {
				unit = new PBuildingConstructionYard();
				trace('---'+PBuildingConstructionYard.NAME);
			}
			if (name == PBuildingMechFactory.NAME) {
				unit = new PBuildingMechFactory();
				trace('---'+PBuildingMechFactory.NAME);
			}
			if (name == PBuildingOreRefinery.NAME) {
				unit = new PBuildingOreRefinery();
				trace('---'+PBuildingOreRefinery.NAME);
			}
			if (name == PBuildingGasRefinery.NAME) {
				unit = new PBuildingGasRefinery();
				trace('---'+PBuildingGasRefinery.NAME);
			}
			if (name == PBuildingPowerPlant.NAME) {
				unit = new PBuildingPowerPlant();
				trace('---'+PBuildingPowerPlant.NAME);
			}
			//}
			
			//{ Infantry Class
			if (name == PInfantrySoldier.NAME) {
				unit = new PInfantrySoldier();
				trace('---'+PInfantrySoldier.NAME);
			}
			if (name == PInfantryEngineer.NAME) {
				unit = new PInfantryEngineer();
				trace('---'+PInfantryEngineer.NAME);
			}
			
			//}
			
			return unit;
		}
	}
	
}