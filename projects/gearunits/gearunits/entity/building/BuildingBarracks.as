package gearunits.entity.building 
{
	import gearunits.entity.EntityPoint3D;
	import gearunits.entity.infantry.*;
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
	public class BuildingBarracks extends Building
	{
		//[Embed(source = "../../../system/icon/barracks_rts_icon32.jpg")]
		//private var buildingimage:Class;
		
		public function BuildingBarracks() 
		{
			//buildingicon = new buildingimage();
			name = 'Barracks';
			mesh = new MeshBarracks();
			var materialAttr:MaterialAttributes = new MaterialAttributes( 
				new LineAttributes( 0.5, 0x2111BB, 0.4 ),
				new LightAttributes( true, 0.1)
			);
			var material:Material = new ColorMaterial(0x999999,1,materialAttr);
			//material.lightingEnable = true;
			var appearance:Appearance = new Appearance(material);
			mesh.appearance = appearance;
			var listunit:StructureUnit;
			
			listunit = new Soldier();
			unit.push(listunit);
			
			listunit = new Engineer();
			unit.push(listunit);
			
			
			var ep3d:EntityPoint3D;
			ep3d = new EntityPoint3D();
			ep3d.z = -32;
			entitypoint.push(ep3d);
			
		}
		
	}
	
}