package gearunits.sandy3d.entity.spacecraft 
{
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import gearunits.models.SMeshSpacecraftFedFighter;
	import sandy.materials.Appearance;
	import sandy.materials.attributes.LightAttributes;
	import sandy.materials.attributes.LineAttributes;
	import sandy.materials.attributes.MaterialAttributes;
	import sandy.materials.BitmapMaterial;
	import sandy.materials.ColorMaterial;
	import sandy.materials.Material;
	/**
	 * ...
	 * @author Darknet
	 */
	public class SSpacecraftFedFighter extends SSpaceshipFighter
	{
		[Embed(source = "../../../models/textures/SpacecraftFedFighter01.png")]
		private var textskin:Class;
		public var BitTextSkin:Bitmap = new textskin();
		
		
		public var MatTextOut:BitmapMaterial = new BitmapMaterial(BitTextSkin.bitmapData);
		//public var MatTextOver:ColorMaterial = new ColorMaterial(0xFFFFFF,0.5);
		public var MatTextOver:ColorMaterial = new ColorMaterial(0xFFFF00,1);
		//public var MatTextSelected:ColorMaterial = new ColorMaterial(0xFFFFFF, 0.2);
		public var MatTextSelected:ColorMaterial = new ColorMaterial(0xFFF000, 1);
		//public var TexCom = new CompositeMaterial();
		public var TexAppOver:Appearance = new Appearance(MatTextOver);
		public var TexAppOut:Appearance = new Appearance(MatTextOut);
		public var TexAppSelected:Appearance = new Appearance(MatTextSelected);
		//public var TexAppOut:Appearance = new Appearance(MatTextOut);
		//public var TexAppSelected:Appearance = new Appearance(MatTextSelected);
		
		public static const NAME:String = 'AStructureUnit';
		
		public function SSpacecraftFedFighter() 
		{
			name = 'FedFighter';
			classtype = 'SpacecraftFedFighter';
			
			
			mesh = new SMeshSpacecraftFedFighter();
			mesh.enableInteractivity = true;
			mesh.addEventListener(MouseEvent.MOUSE_OVER, UnitObject_Over);
			mesh.addEventListener(MouseEvent.MOUSE_OUT, UnitObject_Out);
			movespeed = 2;
			spawntime = 100;
			/*
			var materialAttr:MaterialAttributes = new MaterialAttributes(
			new LineAttributes( 0.5, 0x2111BB, 0.4 ),
			new LightAttributes( true, 0.1)
			);
			//var material:Material = new ColorMaterial(0xadff2f,1,materialAttr);
			
			var material:Material = new ColorMaterial(0x00bea0,1,materialAttr);
			var appearance:Appearance = new Appearance(material);
			*/
			//TexApp.frontMaterial = MatTextOut;
			mesh.appearance = TexAppOut;
			//mesh.appearance = appearance;
			mesh.rotateY = angle;
		}
		
		//SELECT OBJECT / HIGH LIGHT
		public function UnitObject_Over(event:Event):void {
			//TexCom.addMaterial(MatTextOut);
			//TexCom.addMaterial(MatTextOver);
			//TexCom.removeMaterial(MatTextSelected);
			//mesh.material = TexCom;
			//TexApp.frontMaterial = MatTextOver
			//TexApp = new Appearance(MatTextOver);
			mesh.appearance = TexAppOver;
		}
		
		public function UnitObject_Out(event:Event = null):void {
			//TexCom.removeMaterial(MatTextOver);
			//if (bselected == false) {
			TexAppOut.frontMaterial = MatTextOut;
				mesh.appearance = TexAppOut;
			//}else {
				//UnitObject_Selected();
			//}
		}
		public function UnitObject_Selected(event:Event = null):void {
			//TexCom.removeMaterial(MatTextOver);
			//TexCom.addMaterial(MatTextOut);
			//TexCom.addMaterial(MatTextSelected);
			//mesh.material = Tex_Out;
			//TexApp.frontMaterial = MatTextSelected;
			//TexApp = new Appearance(MatTextSelected);
			mesh.appearance = TexAppSelected;
		}
	}
}