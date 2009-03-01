/**
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package programs
{
   import flash.display.Sprite; 
   import flash.events.*;
   import sandy.core.Scene3D;
   import sandy.core.data.*;
   import sandy.core.scenegraph.*;
   import sandy.materials.*;
   import sandy.materials.attributes.*;
   import sandy.primitive.*;
   import sandy.parser.*;
   import org.flashdevelop.utils.FlashConnect;
	
	/**
	* ...
	* @author Darknet
	* 
	* Modfied version on sandy engine
	* 
	*/
	public class LoadMeshASE2 extends Sprite 
	{
		private var scene:Scene3D;
		private var camera:Camera3D;
		private var pot:Shape3D;
		public function LoadMeshASE2() 
		{
			var parser:IParser = Parser.create("data/models/Cube32TwoTex.ase",Parser.ASE );
		
			parser.addEventListener( ParserEvent.FAIL, onError );
			parser.addEventListener( ParserEvent.INIT, createScene );
			parser.parse();
			parser.addEventListener(ParserEvent.PROGRESS, onProgress );
			
			function onProgress( pEvt:ParserEvent):void {
				trace( pEvt.percent,'% loaded...' );
			}
		}
		
		private function onError( pEvt:ParserEvent ):void
		{
			//trace("there is an error il loading you stuff");
		}
	  
	  
		// Create the scene graph based on the root Group of the scene
		private function createScene(p_eEvent:ParserEvent ):void
		{
			camera = new Camera3D( 300, 300 );
			camera.y = 30;
			camera.z = -200;
		 
			// Create the root Group
			var g:Group = Group( p_eEvent.group);
		 
			pot = g.children[0] as Shape3D;
			
			//pot.geometry.
			
			for (var Edge:int; Edge < pot.geometry.aEdges.length; Edge++  ) {
				//trace(String(pot.geometry.aEdges[Edge]));
			}
			
			//for (var FEdge:int; FEdge < pot.geometry.aFaceEdges.length; FEdge++  ) {
			//	trace(String(pot.geometry.aFaceEdges[FEdge]));
			//}
			
			//for (var FacesNormal:int; FacesNormal < pot.geometry.aFacesNormals.length; FacesNormal++  ) {
			//	trace(String(pot.geometry.aFacesNormals[FacesNormal]));
			//}
			
			//for (var vertex:int; vertex < pot.geometry.aVertex.length; vertex++  ) {
			//	trace(String(pot.geometry.aVertex[FacesNormal]));
			//}
			
			//for (var VertexNormal:int; VertexNormal < pot.geometry.aVertexNormals.length; VertexNormal++  ) {
			//	trace(String(pot.geometry.aVertexNormals[VertexNormal]));
			//}
			
			/*
			for (var Edgen:int; Edgen < pot.geometry.aFacesNormals.length; Edgen++  ) {
				trace(String(pot.geometry.aFacesNormals[Edgen]));
			}
			
			for (var Edgev:int; Edgev < pot.geometry.aVertexNormals.length; Edgev++  ) {
				trace(String(pot.geometry.aVertexNormals[Edgev]));
			}
			*/
			//for (var Edgev:int; Edgev < pot.geometry.aFacesNormals.length; Edgev++  ) {
			//	trace(String(pot.geometry.aVertex [Edgev]));
			//}

			

			for (var p:int; p < pot.aPolygons.length; p++  )
			{/*
				if (1 == pot.aMaterails[p]) // if material id is different assign it
				{
					var material:Material = new ColorMaterial( 0xFFCC33 );
					material.lightingEnable = true;
					var app:Appearance = new Appearance( material );
					pot.aPolygons[p].appearance = app;
				}
				FlashConnect.trace(pot.geometry.aFacesVertexID[p]);
			*/
			}

		 
			scene = new Scene3D( "scene", this, camera, g );
		 
			// Listen to the heart beat and render the scene
			addEventListener( Event.ENTER_FRAME, enterFrameHandler ); 
		}

		// The Event.ENTER_FRAME event handler tells the world to render
		private function enterFrameHandler( event : Event ) : void
		{
			pot.pan +=3;
			scene.render();
		}
		
	}
}