package  
{
	//{
	import adobe.utils.CustomActions;
	import darknet.core.collision.CollisionBox;
	import darknet.core.display.Button;
	import darknet.core.display.DialogBox;
	import darknet.core.display.DropBoxList;
	import darknet.core.display.NumericUpDown;
	import darknet.core.event.NumericUpDownEvent;
	import darknet.core.event.PanelEvent;
	import darknet.engine.sandy.entity.SActionFrame;
	import darknet.engine.sandy.entity.SAnimationSet;
	import darknet.engine.sandy.entity.SCharacter;
	import darknet.engine.sandy.entity.SPlayer;
	import darknet.core.event.DropBoxEvent;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	import sandy.core.Scene3D;
	import sandy.core.scenegraph.Camera3D;
	import sandy.core.scenegraph.Group;
	import sandy.primitive.Box;
	import sandy.primitive.MD2;
	import sandy.util.LoaderQueue;
	import sandy.events.SandyEvent;
	//}
	
	/**
	 * ...
	 * @author Darknet
	 * 
	 * Information: goal is to build the basic frame build for character build 
	 * on player, monster, and npc and others.
	 * 
	 * character
	 *  -collision
	 *  -Meshs
	 *   -action set
	 * 
	 */
	[SWF(width="640", height="480", backgroundColor="#FFFFFF", frameRate="30")]
	public class SandyCharacterBuildEditor extends Sprite
	{
		//{
		//{ sandy engine
		public var scene:Scene3D;
		public var camera:Camera3D;
		public var group:Group = new Group('group');
		//}
		
		public var siteaccess:String = 'http://localhost/darkaif/htdocs/'; //need full address
		//public var siteaccess:String = ''; //need full address
		public var objecturl:String = 'scripts/datafiles.php';
		public var objectlistxml:XML;
		public var characterdatalist:XML;
		
		public var characterurl:String = 'scripts/characterobject.php';
		public var dialogboxcharacterload:DialogBox = new DialogBox();
		public var dialogboxcharacterlist:DialogBox = new DialogBox();
		public var dialogboxcharactercreate:DialogBox = new DialogBox();
		public var dialogboxanimmesh:DialogBox = new DialogBox();
		public var dropbox_character:DropBoxList = new DropBoxList();
		public var character:Vector.<SCharacter> = new Vector.<SCharacter>();
		
		public var dropbox_charactermenu:DropBoxList = new DropBoxList();
		public var dropbox_characteranimationmenu:DropBoxList = new DropBoxList();
		
		public var dropboxlist_animationmesh:DropBoxList = new DropBoxList();
		
		//}
		
		public function SandyCharacterBuildEditor() 
		{
			//{ SCENE
			camera = new Camera3D(640, 480);
			camera.far = 1000;
			camera.near = 0;
			//camera.y = 50;
			
			var root:Group = group;
			//this means this sprite class that was created
			scene = new Scene3D( "scene", this, camera, root );
			addEventListener( Event.ENTER_FRAME, enterFrameHandler );
			//}
			
			var box:Box = new Box('box');
			group.addChild(box);
			
			createfilemenu();
		}
		
		private function enterFrameHandler(event:Event) : void {
			scene.render();
		}
		
		public function createfilemenu():void {
			dropbox_charactermenu.clearlist();
			dropbox_charactermenu.addlist( { name:'Char Load', id:'characterload' } );
			dropbox_charactermenu.addlist( { name:'Char List', id:'characterlist' } );
			dropbox_charactermenu.addlist( { name:'Char Create', id:'charactercreate' } );
			
			dropbox_charactermenu.addEventListener(DropBoxEvent.SELECT, selectedchar);
			function selectedchar(event:DropBoxEvent):void {
				if (dropbox_charactermenu._idname == 'characterload') {
					querycharacterload();
				}
				if (dropbox_charactermenu._idname == 'characterlist') {
					dialogbox_characterlist();
				}
				if (dropbox_charactermenu._idname == 'charactercreate') {
					querycharacterload();
				}
				
			}
			
			dropbox_characteranimationmenu.clearlist();
			dropbox_characteranimationmenu.addlist( { name:'Anim Load', id:'animationload' } );
			dropbox_characteranimationmenu.addlist( { name:'Anim List', id:'animationlist' } );
			dropbox_characteranimationmenu.addEventListener(DropBoxEvent.SELECT, selectedcharanimation);
			function selectedcharanimation(event:DropBoxEvent):void {
				if (dropbox_characteranimationmenu._idname == 'animationload') {
					queryanimationmeshlist();
				}
			}
			dropbox_characteranimationmenu.x = 128;
			addChild(dropbox_charactermenu);
			addChild(dropbox_characteranimationmenu);
		}
		
		//{ CHARACTER LIST
		//CHARCTER QUERY LIST
		public function querycharacterload():void {
			//var variables:URLVariables = new URLVariables();
			//variables.action = 'list';
			var request:URLRequest = new URLRequest()
			//request.data = variables;
			//request.method = URLRequestMethod.POST;
			request.url = siteaccess + characterurl;
			var loader:URLLoader = new URLLoader();
			loader.load(request);
			loader.addEventListener(Event.COMPLETE, loadanimmesh);
			function loadanimmesh(event:Event):void {
				trace(event.target.data);
				characterdatalist = new XML(event.target.data);
				dialogbox_characterload();
			}
		}
		
		//DIALOGBOX SELECT CHARACTER TO LOAD
		public function dialogbox_characterload():void {
			var panel:Sprite = new Sprite();
			
			var dropboxlistcharacterlist:DropBoxList = new DropBoxList();
			//characterdatalist
			dropboxlistcharacterlist.clearlist();
			for (var charlistno:int = 0; charlistno < characterdatalist.character.length();charlistno++ ) {
				dropboxlistcharacterlist.addlist({name:characterdatalist.character[charlistno].name,id:characterdatalist.character[charlistno].idhash});
			}
			
			var buttonload:Button = new Button('Load');
			buttonload.x = 14;
			buttonload.y = 14 * 2;
			buttonload.addEventListener(MouseEvent.CLICK, loadcharanimset);
			function loadcharanimset(event:Event):void {
				var charid:String = dropboxlistcharacterlist._idname;
				var variables:URLVariables = new URLVariables();
				variables.idhash = charid;
				variables.action = 'load';
				
				var request:URLRequest = new URLRequest()
				request.data = variables;
				request.method = URLRequestMethod.POST;
				request.url = siteaccess + characterurl;
				var loader:URLLoader = new URLLoader();
				loader.load(request);
				loader.addEventListener(Event.COMPLETE, loadanimmesh);
				function loadanimmesh(event:Event):void {
					trace(event.target.data);
					//objectlistxml = new XML(event.target.data);
					loadchartolist(new XML(event.target.data));
				}
			}
			
			panel.addChild(buttonload);
			panel.addChild(dropboxlistcharacterlist);
			dialogboxcharacterload.content(panel);
			dialogboxcharacterload.addEventListener(PanelEvent.CLOSE, dialogboxcharacterloadclose);
			addChild(dialogboxcharacterload);
		}
		
		//CLOSE PANEL EVENT OR FUNCTION
		public function dialogboxcharacterloadclose(event:PanelEvent = null):void {
			removeChild(dialogboxcharacterload);
		}
		
		//load and added to char list to edit or not
		public function loadchartolist(charxml:XML):void {
			var schar:SCharacter = new SCharacter();
			schar.name = charxml.character.name;
			//charxml.character.name;
			for (var animlistno:int = 0;  animlistno <  charxml.character.animationset.mesh.length(); animlistno++) {
				var sanimset:SAnimationSet = new SAnimationSet();
				var strname:String = charxml.character.animationset.mesh[animlistno].name;
				if (strname.length) {
					trace('added..');
					sanimset.name = charxml.character.animationset.mesh[animlistno].name;
					sanimset.idhash = charxml.character.animationset.mesh[animlistno].idhash;
					for (var actionsetno:int = 0; actionsetno <charxml.character.animationset.mesh[animlistno].actionset.action.length();actionsetno++ ) {
						var saction:SActionFrame = new SActionFrame();
						saction.readxmldata(charxml.character.animationset.mesh[animlistno].actionset.action[actionsetno]);
						sanimset.actionframe.push(saction);
					}
					schar.meshs.push(sanimset);
				}
				var bcharfound:Boolean = false;
				for (var charno:int = 0; charno < character.length; charno++) {
					if (character[charno].name == charxml.character.name) {
						bcharfound = true;
					}
				}
				if (!bcharfound) {
					dialogboxcharacterloadclose();
					dialogbox_character(schar);
					character.push(schar);
					trace('It adding char....!');
				}
			}
			//trace(schar.name);
		}
		
		//DIALOGBOX CHARACTER LIST
		public function dialogbox_characterlist():void {
			var panel:Sprite = new Sprite();
			
			var dropbox_characterlist:DropBoxList = new DropBoxList();
			dropbox_characterlist.x = 14;
			dropbox_characterlist.y = 14;
			
			dropbox_characterlist.clearlist();
			
			for (var characterno:int = 0; characterno < character.length;characterno++ ) {
				dropbox_characterlist.addlist({name:character[characterno].name,id:character[characterno].idhash});
			}
			
			var buttonload:Button = new Button('Load');
			buttonload.x = 14;
			buttonload.y = 30;
			buttonload.addEventListener(MouseEvent.CLICK, selectcharacterid)
			
			function selectcharacterid(event:Event):void {
				for (var charno:int = 0; charno < character.length; charno++ ) {
					if (dropbox_characterlist._idname == character[charno].idhash) {
						dialogboxcharacterloadclose();
						dialogbox_character(character[charno]);
						break;
					}
				}
			}
			
			var buttoncancel:Button = new Button('Cancel');
			buttoncancel.x = 64;
			buttoncancel.y = 30;
			buttoncancel.addEventListener(MouseEvent.CLICK, dialogboxcharacterclickclose);
			function dialogboxcharacterclickclose(event:Event):void {
				dialogboxcharacterloadclose();
			}
			
			panel.addChild(buttonload);
			panel.addChild(buttoncancel);
			panel.addChild(dropbox_characterlist);
			dialogboxcharacterload.content(panel);
			dialogboxcharacterload.addEventListener(PanelEvent.CLOSE, dialogboxcharacterloadclose);
			addChild(dialogboxcharacterload);
		}
		
		//DiALOGBOX CHARACTER EDIT DATA
		public function dialogbox_character(scharacter:SCharacter):void {
			var format:TextFormat = defaulttextformat();
			var panel:Sprite = new Sprite();
			var editpanel:Sprite = new Sprite();
			editpanel.y = 30;
			var textobjectname:TextField = new TextField();
			textobjectname.text = scharacter.name;
			
			var dropbox_meshdata:DropBoxList = new DropBoxList();
			dropbox_meshdata.y = 14;
			dropbox_meshdata.clearlist();
			dropbox_meshdata.addlist( { name:'Data Mesh', id:'datamesh' } );
			dropbox_meshdata.addlist( { name:'Collision', id:'collision' } );
			dropbox_meshdata.addlist( { name:'Anim Set', id:'animationset' } );
			
			//var textboxheight:TextField = new TextField();
			//textboxheight.text = 'Height';
			//textboxheight.selectable
			
			dropbox_meshdata.addEventListener(DropBoxEvent.SELECT, selectmeshdata);
			function selectmeshdata(event:DropBoxEvent):void {
				if (dropbox_meshdata._idname == 'datamesh') {
					datameshpanel();
				}
				if (dropbox_meshdata._idname == 'collision') {
					collisionpanel();
				}
				if (dropbox_meshdata._idname == 'animationset') {
					animationmeshpanel();
				}
			}
			
			function datameshpanel():void {
				cleaneditpanel();
				var buttonload:Button = new Button('Load');
				editpanel.addChild(buttonload);
			}
			
			function collisionpanel():void {
				cleaneditpanel();
				var collisionpanel:Sprite = new Sprite();
				collisionpanel.y = 14;
				var buttonedit:Button = new Button('Edit');
				buttonedit.x = 108;
				var buttoncreate:Button = new Button('Create');
				buttoncreate.x = 142;
				buttoncreate.addEventListener(MouseEvent.CLICK, creatcollisionbox);
				function creatcollisionbox(event:Event):void {
					var collision:CollisionBox = new CollisionBox();
					scollision(collision);
					scharacter.collison.box.push(collision);
				}
				
				
				var dropbox_collision:DropBoxList = new DropBoxList();
				dropbox_collision.clearlist();
				for (var collisionboxno:int = 0; collisionboxno <scharacter.collison.box.length ;collisionboxno++ ) {
					dropbox_collision.addlist({name:collisionboxno,id:collisionboxno});
				}
				
				buttonedit.addEventListener(MouseEvent.CLICK, selectcollisionbox);
				function selectcollisionbox(event:Event):void {
					for (var boxno:int = 0; boxno < scharacter.collison.box.length;boxno++ ) {
						if (dropbox_collision._idname == String(boxno)) {
							scollision(scharacter.collison.box[boxno]);
							break;
						}
					}
				}
				
				
				function scollision(collision:CollisionBox):void {
					cleancollisionpanel();
					//{ TEXT FIELD
					var textboxheight:TextField = new TextField();
					textboxheight.text = 'Height:';
					textboxheight.selectable = false;
					textboxheight.height = 14;
					textboxheight.y = 14 * 0;
					textboxheight.setTextFormat(format);
					var textboxlength:TextField = new TextField();
					textboxlength.text = 'Length:';
					textboxlength.selectable = false;
					textboxlength.height = 14;
					textboxlength.y = 14 * 1;
					textboxlength.setTextFormat(format);
					var textboxwidth:TextField = new TextField();
					textboxwidth.text = 'Width:';
					textboxwidth.selectable = false;
					textboxwidth.height = 14;
					textboxwidth.y = 14 * 2;
					textboxwidth.setTextFormat(format);
					
					var textboxposx:TextField = new TextField();
					textboxposx.text = 'posx:';
					textboxposx.selectable = false;
					textboxposx.height = 14;
					textboxposx.y = 14 * 4;
					textboxposx.setTextFormat(format);
					var textboxposy:TextField = new TextField();
					textboxposy.text = 'posy:';
					textboxposy.selectable = false;
					textboxposy.height = 14;
					textboxposy.y = 14 * 5;
					textboxposy.setTextFormat(format);
					var textboxposz:TextField = new TextField();
					textboxposz.text = 'posz:';
					textboxposz.selectable = false;
					textboxposz.height = 14;
					textboxposz.y = 14 * 6;
					textboxposz.setTextFormat(format);
					//} TEXT FIELD
					
					var numboxheight:NumericUpDown = new NumericUpDown();
					numboxheight.x = 40;
					numboxheight.y = 14 * 0;
					numboxheight.valuenumber = collision.height;
					numboxheight.addEventListener(NumericUpDownEvent.VALUE, numboxheightchange);
					numboxheight.addEventListener(NumericUpDownEvent.ENTER, numboxheightchange);
					function numboxheightchange(event:Event):void {
						collision.height = numboxheight.valuenumber;
					}
					
					var numboxlength:NumericUpDown = new NumericUpDown();
					numboxlength.x = 40;
					numboxlength.y = 14 * 1;
					numboxlength.valuenumber = collision.length;
					numboxlength.addEventListener(NumericUpDownEvent.VALUE, numboxlengthchange);
					numboxlength.addEventListener(NumericUpDownEvent.ENTER, numboxlengthchange);
					function numboxlengthchange(event:Event):void {
						collision.length = numboxlength.valuenumber;
					}
					
					var numboxwidth:NumericUpDown = new NumericUpDown();
					numboxwidth.x = 40;
					numboxwidth.y = 14 * 2;
					numboxwidth.valuenumber = collision.width;
					numboxwidth.addEventListener(NumericUpDownEvent.VALUE, numboxwidthchange);
					numboxwidth.addEventListener(NumericUpDownEvent.ENTER, numboxwidthchange);
					function numboxwidthchange(event:Event):void {
						collision.width = numboxwidth.valuenumber;
					}
					
					var numboxposx:NumericUpDown = new NumericUpDown();
					numboxposx.x = 40;
					numboxposx.y = 14 * 4;
					numboxposx.valuenumber = collision.x;
					numboxposx.addEventListener(NumericUpDownEvent.VALUE, numboxposxchange);
					numboxposx.addEventListener(NumericUpDownEvent.ENTER, numboxposxchange);
					function numboxposxchange(event:Event):void {
						collision.x = numboxposx.valuenumber;
					}
					var numboxposy:NumericUpDown = new NumericUpDown();
					numboxposy.x = 40;
					numboxposy.y = 14 * 5;
					numboxposy.valuenumber = collision.y;
					numboxposy.addEventListener(NumericUpDownEvent.VALUE, numboxposychange);
					numboxposy.addEventListener(NumericUpDownEvent.ENTER, numboxposychange);
					function numboxposychange(event:Event):void {
						collision.y = numboxposy.valuenumber;
					}
					var numboxposz:NumericUpDown = new NumericUpDown();
					numboxposz.x = 40;
					numboxposz.y = 14 * 6;
					numboxposz.valuenumber = collision.z;
					numboxposz.addEventListener(NumericUpDownEvent.VALUE, numboxposzchange);
					numboxposz.addEventListener(NumericUpDownEvent.ENTER, numboxposzchange);
					function numboxposzchange(event:Event):void {
						collision.z = numboxposz.valuenumber;
					}
					
					collisionpanel.addChild(textboxheight);
					collisionpanel.addChild(textboxlength);
					collisionpanel.addChild(textboxwidth);
					collisionpanel.addChild(textboxposx);
					collisionpanel.addChild(textboxposy);
					collisionpanel.addChild(textboxposz);
					collisionpanel.addChild(numboxheight);
					collisionpanel.addChild(numboxlength);
					collisionpanel.addChild(numboxwidth);
					collisionpanel.addChild(numboxposx);
					collisionpanel.addChild(numboxposy);
					collisionpanel.addChild(numboxposz);
				}
				
				function cleancollisionpanel():void {
					while (collisionpanel.numChildren) {
						for (var spriteno:int = 0; spriteno < collisionpanel.numChildren; spriteno++) {
							collisionpanel.removeChildAt(spriteno);
						}
					}
				}
				
				
				
				editpanel.addChild(collisionpanel);
				editpanel.addChild(buttonedit);
				editpanel.addChild(buttoncreate);
				editpanel.addChild(dropbox_collision);
			}
			
			function animationmeshpanel():void {
				cleaneditpanel();
				var dropbox_animationmeshsetlist:DropBoxList = new DropBoxList();
				
				dropbox_animationmeshsetlist.clearlist();
				for (var animmeshsetno:int = 0; animmeshsetno < scharacter.meshs.length; animmeshsetno++) {
					dropbox_animationmeshsetlist.addlist({name:scharacter.meshs[animmeshsetno].name,id:scharacter.meshs[animmeshsetno].idhash});
				}
				
				var buttonedit:Button = new Button('Edit');
				var buttoncreate:Button = new Button('Create');
				
				
				editpanel.addChild(buttonedit);
				editpanel.addChild(buttoncreate);
				editpanel.addChild(dropbox_animationmeshsetlist);
			}
			
			
			//clear data from sprite
			function cleaneditpanel():void {
				while (editpanel.numChildren) {
					for (var spriteno:int = 0; spriteno < editpanel.numChildren; spriteno++) {
						editpanel.removeChildAt(spriteno);
					}
				}
			}
			
			panel.addChild(textobjectname);
			panel.addChild(editpanel);
			panel.addChild(dropbox_meshdata);
			
			dialogboxcharacterload.content(panel);
			dialogboxcharacterload.addEventListener(PanelEvent.CLOSE, dialogboxcharacterloadclose);
			addChild(dialogboxcharacterload);
		}
		
		
		//} CHARACTER LIST
		
		//{ ANIMATION MESH
		//QUERY ANIMATION LIST
		public function queryanimationmeshlist():void {
			var request:URLRequest = new URLRequest();
			request.url = siteaccess + objecturl;
			var load:URLLoader = new URLLoader();
			load.load(request);
			load.addEventListener(Event.COMPLETE, loaddata);
			
			function loaddata(event:Event):void {
				trace(event.target.data);
				var objxml:XML = new XML(event.target.data);
				if (objxml.file.length() >= 0) {
					objectlistxml = new XML(event.target.data);
					buildanimationmeshlist(new XML(objectlistxml));
				}
				//meshdata.objxmlconvertdata(objxml);
				//objectlistxml = new XML(event.target.data);
				//meshdataload();
			}	
		}
		
		//ANIMATION MESH LIST
		public function buildanimationmeshlist(objectlistxml:XML):void {
			//objectlistxml
			//dropboxlist_mesh
			dropboxlist_animationmesh.clearlist();
			for (var meshlistno:int = 0; meshlistno < objectlistxml.file.length(); meshlistno++ ) {
				if (objectlistxml.file[meshlistno].type == '.md2') {
					dropboxlist_animationmesh.addlist( { name:objectlistxml.file[meshlistno].name, id:objectlistxml.file[meshlistno].idobject } );
					trace('md2 animation:' + objectlistxml.file[meshlistno].name);
				}
			}
		}
		
		//} ANIMATION MESH
		
		//FORMAT TEXT DEFAULT
		public function defaulttextformat():TextFormat {
			var format:TextFormat = new TextFormat();
			format.size = 10;
			format.font = "OCR A Extended";
			//format.color = 0xF5F5F5;
			return format;
		}
	}
	
}