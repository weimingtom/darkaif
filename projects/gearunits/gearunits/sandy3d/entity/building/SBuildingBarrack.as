package gearunits.sandy3d.entity.building 
{
	import gearunits.models.SMeshBuildingBarrack;
	import gearunits.sandy3d.entity.SEntityPoint3D;
	import gearunits.sandy3d.entity.infantry.*;
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
	public class SBuildingBarrack extends SBuilding
	{
		//[Embed(source = "../../../system/icon/barracks_rts_icon32.jpg")]
		//private var buildingimage:Class;
		
		public function SBuildingBarrack() 
		{
			//buildingicon = new buildingimage();
			name = 'Barracks';
			mesh = new SMeshBuildingBarrack();
			var materialAttr:MaterialAttributes = new MaterialAttributes( 
				new LineAttributes( 0.5, 0x2111BB, 0.4 ),
				new LightAttributes( true, 0.1)
			);
			var material:Material = new ColorMaterial(0x999999,1,materialAttr);
			//material.lightingEnable = true;
			var appearance:Appearance = new Appearance(material);
			mesh.appearance = appearance;
			var listunit:SStructureUnit;
			
			listunit = new SSoldier();
			unit.push(listunit);
			
			listunit = new SEngineer();
			unit.push(listunit);
			
			
			var ep3d:SEntityPoint3D;
			ep3d = new SEntityPoint3D();
			ep3d.z = -32;
			entitypoint.push(ep3d);
			
		}
		
	}
	
}