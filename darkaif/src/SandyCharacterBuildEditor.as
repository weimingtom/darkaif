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
		public var dialogboxcharactermesh:DialogBox = new DialogBox();
		//public var dialogboxcharactercreate:DialogBox = new DialogBox();
		//public var dialogboxanimmesh:DialogBox = new DialogBox();
		public var dropbox_character:DropBoxList = new DropBoxList();
		public var character:Vector.<SCharacter> = new Vector.<SCharacter>();
		public var animationmesh:Vector.<SAnimationSet> = new Vector.<SAnimationSet>();
		
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
					createchar();
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
				
				if (dropbox_characteranimationmenu._idname == 'animationlist') {
					characteranimationmeshlist();
				}
			}
			dropbox_characteranimationmenu.x = 128;
			addChild(dropbox_charactermenu);
			addChild(dropbox_characteranimationmenu);
		}
		
		//{ CHARACTER LIST
		public function createchar():void {
			var schar:SCharacter = new SCharacter();
			dialogbox_character(schar);
			character.push(schar);
			
		}
		
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
			//box collision
			for (var charboxno:int = 0; charboxno < charxml.character.collision.box.length(); charboxno++ ) {
				var sbox:CollisionBox = new CollisionBox();
				sbox.xmlconvertvar(charxml.character.collision.box[charboxno]);
				schar.collison.box.push(sbox);
			}
			
			//charxml.character.name;
			//Character animation mesh set
			for (var animlistno:int = 0;  animlistno <  charxml.character.animationset.mesh.length(); animlistno++) {
				var sanimset:SAnimationSet = new SAnimationSet();
				var strname:String = charxml.character.animationset.mesh[animlistno].name;
				if (strname.length) {
					trace('added..');
					sanimset.name = charxml.character.animationset.mesh[animlistno].name;
					sanimset.idhash = charxml.character.animationset.mesh[animlistno].idhash;
					//action frame index set
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
		
		//DIALOGBOX CHARACTER EDIT DATA
		public function dialogbox_character(scharacter:SCharacter):void {
			var format:TextFormat = defaulttextformat();
			var panel:Sprite = new Sprite();
			var editpanel:Sprite = new Sprite();
			editpanel.y = 30;
			var textobjectname:TextField = new TextField();
			textobjectname.text = scharacter.name;
			textobjectname.setTextFormat(format);
			
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
				var buttonmeshload:Button = new Button('Load Mesh');
				var buttonmeshsave:Button = new Button('Save Mesh');
				buttonmeshsave.x = 62;
				buttonmeshsave.addEventListener(MouseEvent.CLICK, meshsave);
				function meshsave(event:Event):void {
					var variables:URLVariables = new URLVariables();
					variables.name = scharacter.name;
					variables.action = 'savemeshdata';
					variables.meshdata = scharacter.characterboxsavexml();
					var request:URLRequest = new URLRequest();
					request.data = variables;
					request.url = siteaccess + characterurl;
					request.method = URLRequestMethod.POST;
					var load:URLLoader = new URLLoader();
					load.load(request);
					load.addEventListener(Event.COMPLETE, loaddata);
					
					function loaddata(event:Event):void {
						trace(event.target.data);
					}	
				}
				
				var buttonanimmeshsave:Button = new Button('Save AnimMeshSet');
				buttonanimmeshsave.y = 14;
				buttonanimmeshsave.x = 62;
				buttonanimmeshsave.addEventListener(MouseEvent.CLICK, animmeshsave);
				function animmeshsave(event:Event):void {
					var variables:URLVariables = new URLVariables();
					variables.name = scharacter.name;
					variables.idhash = scharacter.idhash;
					variables.action = 'save';
					variables.animdata = scharacter.charactersetsavexml();
					var request:URLRequest = new URLRequest();
					request.data = variables;
					request.url = siteaccess + characterurl;
					request.method = URLRequestMethod.POST;
					var load:URLLoader = new URLLoader();
					load.load(request);
					load.addEventListener(Event.COMPLETE, loaddata);
					
					function loaddata(event:Event):void {
						trace(event.target.data);
					}	
				}
				
				editpanel.addChild(buttonmeshload);
				editpanel.addChild(buttonmeshsave);
				editpanel.addChild(buttonanimmeshsave);
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
					
					//{ ADJUST VALUES
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
					//} ADJUST VALUES
					
					var buttondelete:Button = new Button('Delete');
					buttondelete.y = 14 * 8;
					buttondelete.addEventListener(MouseEvent.CLICK, deletebox);
					function deletebox(event:Event):void {
						for (var charboxno:int = 0; charboxno < scharacter.collison.box.length; charboxno++) {
							if (collision == scharacter.collison.box[charboxno]) {
								scharacter.collison.box.splice(charboxno, 1);
								dropbox_collision.clearlist();
								for (var cboxno:int = 0; cboxno <scharacter.collison.box.length ;cboxno++ ) {
									dropbox_collision.addlist({name:cboxno,id:cboxno});
								}
								cleancollisionpanel();
							}
						}
					}
					
					collisionpanel.addChild(buttondelete);
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
				var meshpanel:Sprite = new Sprite();
				var dropbox_animationmeshsetlist:DropBoxList = new DropBoxList();
				
				dropbox_animationmeshsetlist.clearlist();
				for (var animmeshsetno:int = 0; animmeshsetno < scharacter.meshs.length; animmeshsetno++) {
					dropbox_animationmeshsetlist.addlist({name:scharacter.meshs[animmeshsetno].name,id:scharacter.meshs[animmeshsetno].idhash});
				}
				
				var buttonedit:Button = new Button('Edit');
				buttonedit.x = 108;
				buttonedit.addEventListener(MouseEvent.CLICK, selectedmeshset);
				function selectedmeshset(event:Event):void {
					//dropbox_animationmeshsetlist._idname
					for (var animsetno:int = 0; animsetno < scharacter.meshs.length;animsetno++ ) {
						if (dropbox_animationmeshsetlist._idname == scharacter.meshs[animsetno].idhash) {
							animationmeshset(scharacter.meshs[animsetno]);
						}
					}
				}
				var buttoncreate:Button = new Button('Create');
				buttoncreate.x = 142;
				buttoncreate.addEventListener(MouseEvent.CLICK, createanimationset);
				function createanimationset(event:Event):void {
					var sanimset:SAnimationSet = new SAnimationSet();
					animationmeshset(sanimset);
					scharacter.meshs.push(sanimset);
				}
				
				function animationmeshset(sanimationset:SAnimationSet):void {
					
					var textmeshname:TextField = new TextField();
					textmeshname.text = sanimationset.name;
					textmeshname.setTextFormat(format);
					textmeshname.y = 14 * 1;
					
					var dropbox_meshset:DropBoxList = new DropBoxList();
					dropbox_meshset.y = 14 * 2;
					dropbox_meshset.clearlist();
					for (var animmeshsetno:int = 0; animmeshsetno < animationmesh.length; animmeshsetno++) {
						dropbox_meshset.addlist({name:animationmesh[animmeshsetno].name,id:animationmesh[animmeshsetno].idhash});
					}
					
					var buttonset:Button = new Button('Set Mesh');
					buttonset.x = 108;
					buttonset.y = 14 * 2;
					buttonset.addEventListener(MouseEvent.CLICK, setmesh);
					function setmesh(event:Event):void {
						for (var charanimsetno:int = 0; charanimsetno < scharacter.meshs.length;charanimsetno++ ) {
							if (sanimationset == scharacter.meshs[charanimsetno]) {
								scharacter.meshs.splice(charanimsetno, 1);
								break;
							}
						}
						
						for (var animmeshno:int = 0; animmeshno < animationmesh.length; animmeshno++) {
							if (animationmesh[animmeshno].idhash == dropbox_meshset._idname) {
								scharacter.meshs.push(animationmesh[animmeshno]);
								textmeshname.text = animationmesh[animmeshno].name;
							}
						}
					}
					
					var buttondelete:Button = new Button('Delete');
					buttondelete.y = 14 * 5;
					buttondelete.addEventListener(MouseEvent.CLICK, deletemesh);
					function deletemesh(event:Event):void {
						for (var charanimsetno:int = 0; charanimsetno < scharacter.meshs.length;charanimsetno++ ) {
							if (sanimationset == scharacter.meshs[charanimsetno]) {
								scharacter.meshs.splice(charanimsetno, 1);
								cleaneditpanel();
								break;
							}
						}
					}
					
					meshpanel.addChild(textmeshname);
					meshpanel.addChild(buttonset);
					meshpanel.addChild(buttondelete);
					meshpanel.addChild(dropbox_meshset);
					
				}
				
				editpanel.addChild(meshpanel);
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
			}	
		}
		
		//ANIMATION MESH LIST/DIALOG BOX
		public function buildanimationmeshlist(objectlistxml:XML):void {
			var panel:Sprite = new Sprite();
			dropboxlist_animationmesh.x = 14;
			dropboxlist_animationmesh.y = 14;
			dropboxlist_animationmesh.clearlist();
			for (var meshlistno:int = 0; meshlistno < objectlistxml.file.length(); meshlistno++ ) {
				if (objectlistxml.file[meshlistno].type == '.md2') {
					dropboxlist_animationmesh.addlist( { name:objectlistxml.file[meshlistno].name, id:objectlistxml.file[meshlistno].idobject } );
					trace('md2 animation:' + objectlistxml.file[meshlistno].name);
				}
			}
			
			var buttonload:Button = new Button('Load');
			buttonload.x = 14;
			buttonload.y = 30;
			buttonload.addEventListener(MouseEvent.CLICK, selectedanimmesh);
			function selectedanimmesh(event:Event):void {
				dialogboxcharactermeshclose();
				characteranimationmeshload(dropboxlist_animationmesh._idname);
			}
			
			var buttoncancel:Button = new Button('Cancel');
			buttoncancel.x = 60;
			buttoncancel.y = 30;
			
			buttoncancel.addEventListener(MouseEvent.CLICK, dialogboxclickclose);
			function dialogboxclickclose(event:Event):void {
				dialogboxcharactermeshclose();
			}
			
			dialogboxcharactermesh.addEventListener(PanelEvent.CLOSE, dialogboxcharactermeshclose);
			panel.addChild(buttonload);
			panel.addChild(buttoncancel);
			panel.addChild(dropboxlist_animationmesh);
			dialogboxcharactermesh.content(panel);
			addChild(dialogboxcharactermesh);
		}
		
		public function dialogboxcharactermeshclose(event:PanelEvent = null):void {
			dialogboxcharactermesh.removeEventListener(PanelEvent.CLOSE, dialogboxcharactermeshclose);
			removeChild(dialogboxcharactermesh);
		}
		
		public function characteranimationmeshload(strname:String):void {
			trace('loading...' + strname+ ":"+objectlistxml.file.length());
			var sanimset:SAnimationSet = new SAnimationSet();
			for (var charno:int = 0; charno < objectlistxml.file.length(); charno++) {
				if (strname == objectlistxml.file[charno].idobject) {
					sanimset.name = objectlistxml.file[charno].name;
					trace('found name.....');
					break;
				}
			}
			
			var variables:URLVariables = new URLVariables();
			variables.file = strname;
			variables.action = 'loadanimdata';
			var request:URLRequest = new URLRequest()
			request.data = variables;
			request.method = URLRequestMethod.POST;
			request.url = siteaccess + objecturl;
			var loader:URLLoader = new URLLoader();
			loader.load(request);
			loader.addEventListener(Event.COMPLETE, loadanimmesh);
			function loadanimmesh(event:Event):void {
				trace(event.target.data);
				loadlistanimset(new XML(event.target.data));
			}
			//ANIMATION DATA
			function loadlistanimset(xmlset:XML):void {
				for (var animno:int = 0; animno < xmlset.action.length(); animno++) {
					var setanimation:SActionFrame = new SActionFrame();
					setanimation.readxmldata(xmlset.action[animno]);
					sanimset.actionframe.push(setanimation);
				}
				//trace("LEN AS:" + sanimset.actionframe.length);
				loadanimationmeshdata();
			}
			
			function loadanimationmeshdata():void{
				var queue:LoaderQueue = new LoaderQueue();
				queue.add(strname, new URLRequest((siteaccess + objecturl + '?file=' + strname)), "BIN" );
				queue.addEventListener(SandyEvent.QUEUE_COMPLETE,loaddatafile);
				queue.start();
				function loaddatafile():void {
					sanimset.mesh = new MD2(String(strname), queue.data[strname], 1 );
					sanimset.idhash = strname;
					animationmesh.push(sanimset);
					characteranimationmesh(sanimset);
					group.addChild(sanimset.mesh);
				}
			}
		}
		
		public function characteranimationmeshlist():void {
			var panel:Sprite = new Sprite();
			dropboxlist_animationmesh.x = 14;
			dropboxlist_animationmesh.y = 14;
			dropboxlist_animationmesh.clearlist();
			for (var meshlistno:int = 0; meshlistno < animationmesh.length; meshlistno++ ) {
				dropboxlist_animationmesh.addlist( { name:animationmesh[meshlistno].name, id:animationmesh[meshlistno].idhash } );
			}
			
			var buttonload:Button = new Button('Load');
			buttonload.x = 14;
			buttonload.y = 30;
			buttonload.addEventListener(MouseEvent.CLICK, selectmesh);
			function selectmesh(event:Event):void {
				for (var animationmeshno:int = 0 ; animationmeshno < animationmesh.length;animationmeshno++) {
					if (animationmesh[animationmeshno].idhash == dropboxlist_animationmesh._idname) {
						dialogboxcharactermeshclose();
						characteranimationmesh(animationmesh[animationmeshno]);
						break;
					}
				}
			}
			var buttoncancel:Button = new Button('Cancel');
			buttoncancel.x = 60;
			buttoncancel.y = 30;
			buttoncancel.addEventListener(MouseEvent.CLICK, dialogbox_closebutton);
			function dialogbox_closebutton(event:MouseEvent):void {
				dialogboxcharactermeshclose();
			}
			
			dialogboxcharactermesh.addEventListener(PanelEvent.CLOSE, dialogboxcharactermeshclose);
			panel.addChild(buttonload);
			panel.addChild(buttoncancel);
			panel.addChild(dropboxlist_animationmesh);
			dialogboxcharactermesh.content(panel);
			addChild(dialogboxcharactermesh);
		}
		
		public function characteranimationmesh(sanimset:SAnimationSet):void {
			var format:TextFormat = defaulttextformat();
			var panel:Sprite = new Sprite();
			var editpanel:Sprite = new Sprite();
			editpanel.y = 30;
			var dropbox_actionsetlist:DropBoxList = new DropBoxList();
			dropbox_actionsetlist.clearlist();
			for (var actionsetno:int = 0; actionsetno < sanimset.actionframe.length;actionsetno++ ) {
				dropbox_actionsetlist.addlist({name:sanimset.actionframe[actionsetno].framename,id:actionsetno});
			}
			dropbox_actionsetlist.x = 14;
			dropbox_actionsetlist.y = 14;
			
			var textmeshname:TextField = new TextField();
			textmeshname.text = sanimset.name;
			//textmeshname.border = true;
			textmeshname.height = 16;
			textmeshname.setTextFormat(format);
			
			
			var buttonsaveactions:Button = new Button('Save Actions');
			buttonsaveactions.x = 128;
			buttonsaveactions.addEventListener(MouseEvent.CLICK, saveactionframe);
			function saveactionframe(event:Event):void {
				var variables:URLVariables = new URLVariables();
				variables.file = sanimset.idhash;
				trace(sanimset.idhash);
				variables.animdata = sanimset.savexmldata();
				trace(sanimset.savexmldata());
				variables.action = 'saveanimdata';
				var request:URLRequest = new URLRequest();
				request.url = siteaccess + objecturl;
				request.data = variables;
				request.method = URLRequestMethod.POST;
				var loader:URLLoader = new URLLoader();
				loader.load(request);
				loader.addEventListener(Event.COMPLETE, checkactionphp);
					
				function checkactionphp(event:Event):void {
					var dataxml:XML = new XML(event.target.data);
					trace(dataxml);
				}
			}
			
			var buttonedit:Button = new Button('Edit');
			buttonedit.addEventListener(MouseEvent.CLICK, selectactionframe);
			function selectactionframe(event:Event):void {
				for (var actionno:int = 0; actionno < sanimset.actionframe.length;actionno++ ) {
					if (String(actionno) == dropbox_actionsetlist._idname ) {
						acttionframe(sanimset.actionframe[actionno]);
					}
				}
			}
			buttonedit.x = 120;
			buttonedit.y = 14;
			
			var buttoncreate:Button = new Button('Create');
			buttoncreate.x = 151;
			buttoncreate.y = 14;
			buttoncreate.addEventListener(MouseEvent.CLICK, createactionframe);
			function createactionframe(event:Event):void {
				var sactionframe:SActionFrame = new SActionFrame();
				acttionframe(sactionframe);
				sanimset.actionframe.push(sactionframe);
				
			}
			
			function acttionframe(sactionset:SActionFrame):void {
				cleareditplanel();
				
				var buttondelete:Button = new Button('Delete');
				buttondelete.y = 14 * 4;
				buttondelete.addEventListener(MouseEvent.CLICK,deleteactionframe);
				function deleteactionframe(event:Event):void {
					for (var actionsetno:int = 0; actionsetno < sanimset.actionframe.length;actionsetno++ ) {
						if(sanimset.actionframe[actionsetno] == sactionset){
							sanimset.actionframe.splice(actionsetno, 1);
							cleareditplanel();
							//clean up array for dropbox
							dropbox_actionsetlist.clearlist();
							for (var actionsno:int = 0; actionsno < sanimset.actionframe.length;actionsno++ ) {
								dropbox_actionsetlist.addlist({name:sanimset.actionframe[actionsno].framename,id:actionsetno});
							}
							break;
						}
					}
				}
				
				var textactionname:TextField = new TextField();
				textactionname.text = sactionset.framename;
				textactionname.border = true;
				textactionname.height = 16;
				textactionname.setTextFormat(format);
				textactionname.type = TextFieldType.INPUT;
				textactionname.addEventListener(KeyboardEvent.KEY_DOWN, entersetname);
				function entersetname(event:KeyboardEvent):void {
					if (event.keyCode == 13) {
						//trace('enter');
						sactionset.framename = textactionname.text
					}
					
				}
				//{ TEXT
				var textframemin:TextField = new TextField();
				textframemin.text = 'Min';
				textframemin.selectable = false;
				textframemin.height = 14;
				textframemin.setTextFormat(format);
				textframemin.y = 14 * 1;
				
				var textframemax:TextField = new TextField();
				textframemax.text = 'Max';
				textframemax.selectable = false;
				textframemax.height = 14;
				textframemax.setTextFormat(format);
				textframemax.y = 14 * 2;
				var textspeed:TextField = new TextField();
				textspeed.text = 'Speed';
				textspeed.selectable = false;
				textspeed.height = 14;
				textspeed.setTextFormat(format);
				textspeed.y = 14 * 3;
				//}
				
				//{NUM
				var numactionframemin:NumericUpDown = new NumericUpDown();
				numactionframemin.x = 60;
				numactionframemin.y = 14 * 1;
				numactionframemin.valuenumber = sactionset.min;
				numactionframemin.addEventListener(NumericUpDownEvent.VALUE, framemin);
				numactionframemin.addEventListener(NumericUpDownEvent.ENTER, framemin);
				function framemin(event:NumericUpDownEvent):void {
					sactionset.min = numactionframemin.valuenumber;
				}
				var numactionframemax:NumericUpDown = new NumericUpDown();
				numactionframemax.x = 60;
				numactionframemax.y = 14 * 2;
				numactionframemax.valuenumber = sactionset.max;
				numactionframemax.addEventListener(NumericUpDownEvent.VALUE, framemax);
				numactionframemax.addEventListener(NumericUpDownEvent.ENTER, framemax);
				function framemax(event:NumericUpDownEvent):void {
					sactionset.max = numactionframemax.valuenumber;
				}
				var numactionframespeed:NumericUpDown = new NumericUpDown();
				numactionframespeed.x = 60;
				numactionframespeed.y = 14 * 3;
				numactionframespeed.valuenumber = sactionset.speed;
				numactionframespeed.addEventListener(NumericUpDownEvent.VALUE, framespeed);
				numactionframespeed.addEventListener(NumericUpDownEvent.ENTER, framespeed);
				function framespeed(event:NumericUpDownEvent):void {
					sactionset.speed = numactionframespeed.valuenumber;
				}
				//}
				
				editpanel.addChild(textframemin);
				editpanel.addChild(textframemax);
				editpanel.addChild(buttondelete);
				editpanel.addChild(textspeed);
				
				editpanel.addChild(numactionframemin);
				editpanel.addChild(numactionframemax);
				editpanel.addChild(numactionframespeed);
				
				editpanel.addChild(textactionname);
			}
			
			function cleareditplanel():void {
				while (editpanel.numChildren) {
					for (var editno:int = 0; editno < editpanel.numChildren;editno++ ) {
						editpanel.removeChildAt(editno);
					}
				}
			}
			
			panel.addChild(editpanel);
			panel.addChild(textmeshname);
			panel.addChild(buttonsaveactions);
			panel.addChild(buttonedit);
			panel.addChild(buttoncreate);
			panel.addChild(dropbox_actionsetlist);
			dialogboxcharactermesh.addEventListener(PanelEvent.CLOSE, dialogboxcharactermeshclose);
			dialogboxcharactermesh.content(panel);
			addChild(dialogboxcharactermesh);
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