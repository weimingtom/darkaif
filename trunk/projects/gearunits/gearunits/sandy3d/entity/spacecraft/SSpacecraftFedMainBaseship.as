package gearunits.sandy3d.entity.spacecraft 
{
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
	public class SSpacecraftFedMainBaseship extends SSpaceship
	{
		public static const NAME:String = 'AStructureUnit';
		public function SSpacecraftFedMainBaseship() 
		{
			unittype.push({name:'deployablespaceship',bdeploy:false}); //this will control ship lanuch
			mesh = new MeshSpacecraftFedCarrier();
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