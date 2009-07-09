package gearunits.away3d.entity 
{
	import gearunits.away3d.entity.building.*;
	import gearunits.away3d.entity.infantry.*;
	import gearunits.away3d.entity.spacecraft.*;
	
	/**
	 * ...
	 * @author Darknet
	 * 
	 * Information: This is retun class unit type to add into the game.
	 * 
	 */
	public class AUnitClass 
	{
		
		public function AUnitClass() {}
		
		public function CheckName(name:String):AStructureUnit {
			trace('[--- CLASS UNIT CHECK ---]');
			var unit:AStructureUnit;
			
			//{ space craft
			if (name == ASpaceshipFedFighter.NAME ) {
				unit = new ASpaceshipFedFighter();
				trace('---'+ASpaceshipFedFighter.NAME);
			}
			if (name == ASpaceshipFedCarrier.NAME) {
				unit = new ASpaceshipFedCarrier();
				trace('---'+ASpaceshipFedCarrier.NAME);
			}
			if (name == ASpacestationFedShipyard.NAME) {
				unit = new ASpacestationFedShipyard();
				trace('---'+ASpaceshipFedCarrier.NAME);
			}
			//}
			
			//{ BUILDINGS
			if (name == ABuildingBarrack.NAME) {
				unit = new ABuildingBarrack();
				trace('---'+ABuildingBarrack.NAME);
			}
			if (name == ABuildingConstructionYard.NAME) {
				unit = new ABuildingConstructionYard();
				trace('---'+ABuildingConstructionYard.NAME);
			}
			if (name == ABuildingMechFactory.NAME) {
				unit = new ABuildingMechFactory();
				trace('---'+ABuildingMechFactory.NAME);
			}
			if (name == ABuildingOreRefinery.NAME) {
				unit = new ABuildingOreRefinery();
				trace('---'+ABuildingOreRefinery.NAME);
			}
			if (name == ABuildingGasRefinery.NAME) {
				unit = new ABuildingGasRefinery();
				trace('---'+ABuildingGasRefinery.NAME);
			}
			if (name == ABuildingPowerPlant.NAME) {
				unit = new ABuildingPowerPlant();
				trace('---'+ABuildingPowerPlant.NAME);
			}
			//}
			
			//{ Infantry Class
			if (name == AInfantrySoldier.NAME) {
				unit = new AInfantrySoldier();
				trace('---'+AInfantrySoldier.NAME);
			}
			if (name == AInfantryEngineer.NAME) {
				unit = new AInfantryEngineer();
				trace('---'+AInfantryEngineer.NAME);
			}
			
			//}
			
			return unit;
		}
		
	}
	
}