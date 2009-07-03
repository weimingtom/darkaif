package gearunits.entity.spacecraft
{
	import gearunits.entity.EntityPoint3D;
	import gearunits.models.MeshSpacecraftFedCarrier;
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
	public class SpacecraftFedCarrier extends Carriers
	{
		
		public function SpacecraftFedCarrier() 
		{
			name = 'FedCarrier';
			classtype = 'SpacecraftFedCarrier';
			unittype.push({name:'deployablespaceship',bdeploy:false}); //this will control ship lanuch
			mesh = new MeshSpacecraftFedCarrier();
			movespeed = 2;
			spawntime = 100;
			
			var materialAttr:MaterialAttributes = new MaterialAttributes(
			new LineAttributes( 0.5, 0x2111BB, 0.4 ),
			new LightAttributes( true, 0.1)
			);
			//var material:Material = new ColorMaterial(0xadff2f,1,materialAttr);
			var material:Material = new ColorMaterial(0x00bea0,1,materialAttr);
			var appearance:Appearance = new Appearance(material);
			//mesh.appearance = appearance;
			//mesh.rotateY = angle;
			
			var ep3d:EntityPoint3D;
			ep3d = new EntityPoint3D();
			ep3d.z = 160;
			entitypoint.push(ep3d);
			
			
		}
		/*
		override public function update():void 
		{
			super.update();
			//trace('hello');
			mesh.rotateY = -angle;
		}
		*/
	}
	
}