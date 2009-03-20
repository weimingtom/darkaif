package programs
{
	//{ packages
	import darkaif.core.node.PointNode;
	import flash.display.Sprite;
	import flash.events.*;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.display.*; 
	import flash.events.*;
	import flash.text.TextField;
	import flash.ui.*;
	import flash.utils.Timer;
	import flash.system.*;
	
	import sandy.core.Scene3D;
	import sandy.core.data.*;
	import sandy.core.scenegraph.*;
	import sandy.materials.*;
	import sandy.materials.attributes.*;
	import sandy.primitive.*;
	import sandy.parser.*;
	import sandy.util.*;
	import sandy.events.*;
	import sandy.view.*;
	//}
	
	/**
	 * ...
	 * @author Darknet
	 * Copy Rights (c) http://darkaif.googlecode.com
	 * 
	 * sandy and collision bound box
	 * Information path build for AI PATH
	 * 
	 */
	
	public class SandyPath3D extends Sprite
	{
		//{
		public var scene:Scene3D;
		public var camera:Camera3D;
		public var g:Group = new Group("myGroup");
		public var objectarry:Array = new Array();
		public var pointnode:PointNode = new PointNode();
		//}
		
		public function SandyPath3D() {
			camera = new Camera3D( 300, 300 );
			//camera.z = -400;
			camera.y = -200;
			camera.lookAt(0, 0, 0);
			var root:Group = createScene();
			scene = new Scene3D( "scene", this, camera, root );
			addEventListener( Event.ENTER_FRAME, enterFrameHandler );  
			
		}
		
		public function createScene():Group {
			var createobject:Shape3D;
			var materialAttr:MaterialAttributes = new MaterialAttributes(new LightAttributes( true, 0.2 ) );
			var material:Material = new ColorMaterial( 0xE0F87E, 0.9, materialAttr);
			var app:Appearance = new Appearance( material);
			
			//object data for creating
			objectarry.push( { name:'player', x: 0, y:0, z: -64, height:16, width:16, length:8, color:0x008000 } );
			pointnode.setstart(0,0,-64);
			//objectarry.push({  name:'vehicle_test0', x:0, y:0, z:92, height:16, width:16, length:16 , color:0xadff2f });//light green
			//objectarry.push({  name:'vehicle_test0', x:0, y:-32, z:0, height:256, width:256, length:1 , color:0xadff2f });//light green
			//objectarry.push({  name:'npc_test1', x:0, y:0, z:-64, height:16, width:16, length:16, color:0xffff00 });//yellow
			objectarry.push( {  name:'monster', x: 0, y:0, z:64, height:16, width:16, length:8, color:0xff0000 } );//red
			pointnode.setend(64,0,128);
			//objectarry.push( {  name:'building_test3', x: -64, y:0, z:0, height:16, width:16, length:16, color:0x808080 } );//gray
			objectarry.push( {  name:'building_test1', x: 32, y:0, z:0, height:16, width:16, length:1, color:0x808080 } );//gray
			objectarry.push( {  name:'building_test2', x: 16, y:0, z:0, height:16, width:16, length:1, color:0x808080 } );//gray
			objectarry.push( {  name:'building_test3', x: 0, y:0, z:0, height:16, width:16, length:1, color:0x808080 } );//gray
			objectarry.push( {  name:'building_test4', x: -16, y:0, z:0, height:16, width:16, length:1, color:0x808080 } );//gray
			objectarry.push( {  name:'building_test5', x: -32, y:0, z:0, height:16, width:16, length:1, color:0x808080 } );//gray
			//objectarry.push( {  name:'building_test6', x: -48, y:0, z:0, height:16, width:16, length:1, color:0x808080 } );//gray
			//objectarry.push({  name:'building_test7', x:-64, y:0, z:0, height:16, width:16, length:1, color:0x808080 });//gray
			//objectarry.push({  name:'building_test8', x:-80, y:0, z:0, height:16, width:16, length:1, color:0x808080 });//gray
			
			for (var o:int = 0; o < objectarry.length; o++){
				//FlashConnect.trace(objectarry[o].name);
				createobject = new Box(objectarry[o].name, objectarry[o].height, objectarry[o].width, objectarry[o].length);
				createobject.useSingleContainer = true;
				createobject.enableBackFaceCulling = true;
				createobject.x = objectarry[o].x;
				createobject.y = objectarry[o].y;
				createobject.z = objectarry[o].z;
				material = new ColorMaterial( objectarry[o].color, 0.9, materialAttr);
				material.lightingEnable = true;
				app = new Appearance( material);
				
				createobject.useSingleContainer = false;
				createobject.enableBackFaceCulling = false;
				createobject.enableClipping = true;
				createobject.appearance = app;
				
				g.addChild(createobject);
			}
			
			//pointnode.update();
			return g;
		}
		
		public function enterFrameHandler( event : Event ) : void {
			scene.render();
			pointnode.update();
		}
		
	}
	
}