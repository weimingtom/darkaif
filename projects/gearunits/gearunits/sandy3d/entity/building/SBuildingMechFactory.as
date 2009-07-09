package gearunits.sandy3d.entity.building 
{
	import gearunits.models.SMeshBuildingMechFactory;
	import gearunits.sandy3d.entity.vehicle.SVehicleCar;
	import gearunits.sandy3d.entity.SStructureUnit;
	import sandy.materials.Appearance;
	import sandy.materials.attributes.LightAttributes;
	import sandy.materials.attributes.LineAttributes;
	import sandy.materials.attributes.MaterialAttributes;
	import sandy.materials.ColorMaterial;
	import sandy.materials.Material;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class SBuildingMechFactory extends SBuilding
	{
		//[Embed(source = "../../../system/icon/mechfactory_rts_icon32.jpg")]
		//private var buildingimage:Class;
		
		public function SBuildingMechFactory() 
		{
			//buildingicon = new buildingimage();
			name = 'Mech Factory';
			//objecttype = '';
			mesh = new SMeshBuildingMechFactory();
			
			var materialAttr:MaterialAttributes = new MaterialAttributes( 
				new LineAttributes( 0.5, 0x2111BB, 0.4 ),
				new LightAttributes( true, 0.1)
			);
			var material:Material = new ColorMaterial(0x999999,1,materialAttr);
			var appearance:Appearance = new Appearance(material);
			mesh.appearance = appearance;
			
			
			var listunit:SStructureUnit;
			listunit = new SVehicleCar();
			unit.push(listunit);
			
		}
		
	}
	
}