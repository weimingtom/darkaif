package gearunits.entity.spacecraft 
{
	import gearunits.models.MeshSpacecraftFedBaseCamp;
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
	public class SpacecraftFedBaseship extends Spaceship
	{
		
		public function SpacecraftFedBaseship() 
		{
			unittype.push({name:'deployablespaceship',bdeploy:false}); //this will control ship lanuch
			mesh = new MeshSpacecraftFedBaseCamp();
			movespeed = 2;
			
			var materialAttr:MaterialAttributes = new MaterialAttributes(
			new LineAttributes( 0.5, 0x2111BB, 0.4 ),
			new LightAttributes( true, 0.1)
			);
			//var material:Material = new ColorMaterial(0xadff2f,1,materialAttr);
			var material:Material = new ColorMaterial(0x00bea0,1,materialAttr);
			var appearance:Appearance = new Appearance(material);
			mesh.appearance = appearance;
			mesh.rotateY = angle;
		}
		
	}
	
}