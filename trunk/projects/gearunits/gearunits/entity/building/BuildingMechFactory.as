package gearunits.entity.building 
{
	import gearunits.entity.vehicle.VehicleCar;
	import gearunits.models.MeshMechFactory;
	import gearunits.entity.StructureUnit;
	import gearunits.models.MeshBarracks;
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
	public class BuildingMechFactory extends Building
	{
		public function BuildingMechFactory() 
		{
			name = 'Mech Factory';
			//objecttype = '';
			mesh = new MeshMechFactory();
			
			var materialAttr:MaterialAttributes = new MaterialAttributes( 
				new LineAttributes( 0.5, 0x2111BB, 0.4 ),
				new LightAttributes( true, 0.1)
			);
			var material:Material = new ColorMaterial(0x999999,1,materialAttr);
			var appearance:Appearance = new Appearance(material);
			mesh.appearance = appearance;
			
			
			var listunit:StructureUnit;
			listunit = new VehicleCar();
			unit.push(listunit);
			
		}
		
	}
	
}