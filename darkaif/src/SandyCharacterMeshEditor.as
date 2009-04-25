package  
{
	//{
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
	 * Information:Character animsetion parts build.
	 * 
	 * This will be control by idhash incase the id mistach the code functions.
	 * 
	 */
	
	public class SandyCharacterMeshEditor extends Sprite
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
		//}
		
		public function SandyCharacterMeshEditor() 
		{
			//{ SCENE
			camera = new Camera3D(640, 480);
			camera.far = 1000;
			camera.near = 0;
			camera.y = 50;
			
			var root:Group = group;
			//this means this sprite class that was created
			scene = new Scene3D( "scene", this, camera, root );
			addEventListener( Event.ENTER_FRAME, enterFrameHandler );
			//}
			
			var box:Box = new Box('box');
			group.addChild(box);
			createfileplanel();
		}
		
		//character dropbox panel main
		public function createfileplanel():void {
			dropbox_character.clearlist();
			dropbox_character.addlist( { name:'Char load', id:'characterload' } );
			dropbox_character.addlist( { name:'Char list', id:'characterlist' } );
			dropbox_character.addlist( { name:'Char create', id:'charactercreate' } );
			dropbox_character.addlist( { name:'Anim Mesh', id:'animationmesh' } );
			addChild(dropbox_character);
			
			
			dropbox_character.addEventListener(DropBoxEvent.SELECT, selectcharacterfile);
			
			function selectcharacterfile(event:DropBoxEvent):void {
				trace(dropbox_character._idname);
				if (dropbox_character._idname == 'characterload') {
					querycharacterload();
				}
				if (dropbox_character._idname == 'characterlist') {
					dialogbox_characterlist();
				}
				if (dropbox_character._idname == 'charactercreate') {
					charactercreateclass();
				}
				if (dropbox_character._idname == 'animationmesh') {
					QueryMeshList();
				}
			}
		}
		
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
		
		public function dialogboxcharacterloadclose(event:PanelEvent):void {
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
					//trace('added..');
					sanimset.name = charxml.character.animationset.mesh[animlistno].name;
					sanimset.idhash = charxml.character.animationset.mesh[animlistno].idhash;
					schar.meshs.push(sanimset);
				}
				var bcharfound:Boolean = false;
				for (var charno:int = 0; charno < character.length; charno++) {
					if (character[charno].name == charxml.character.name) {
						bcharfound = true;
					}
				}
				if (!bcharfound) {
					character.push(schar);
				}
			}
			//trace(schar.name);
		}
		
		//load chacterlist
		public function dialogbox_characterlist():void {
			var panel:Sprite = new Sprite();
			
			var dropbox_characterlist:DropBoxList = new DropBoxList();
			dropbox_characterlist.clearlist();
			for (var charno:int = 0; charno < character.length ;charno++ ) {
				dropbox_characterlist.addlist({name:character[charno].name,id:character[charno].idhash});
			}
			
			var buttonload:Button = new Button('Load');
			buttonload.x = 16;
			buttonload.y = 16;
			buttonload.addEventListener(MouseEvent.CLICK, selectchar);
			
			function selectchar(event:Event):void {
				//dropbox_characterlist._idname
				for (var charlistno:int = 0; charlistno < character.length ;charlistno++ ) {
					if (character[charlistno].idhash == dropbox_characterlist._idname) {
						dialogbox_charactercreate(character[charlistno]);
					}
				}
			}
			
			panel.addChild(buttonload);
			panel.addChild(dropbox_characterlist);
			dialogboxcharacterlist.content(panel);
			dialogboxcharacterlist.addEventListener(PanelEvent.CLOSE, removedialogboxcharacterlist);
			
			addChild(dialogboxcharacterlist);
		}
		
		public function removedialogboxcharacterlist(event:PanelEvent):void {
			removeChild(dialogboxcharacterlist);
		}
		
		public function charactercreateclass():void {
			var buildcharacter:SCharacter = new SCharacter();
			dialogbox_charactercreate(buildcharacter);
			character.push(buildcharacter);
		}
		
		//query mesh list
		public function QueryMeshList():void {
			//var varialbes:URLVariables = new URLVariables();
			var request:URLRequest = new URLRequest()
			request.method = URLRequestMethod.POST;
			request.url = siteaccess + objecturl;
			var loader:URLLoader = new URLLoader();
			loader.load(request);
			loader.addEventListener(Event.COMPLETE, loadanimmesh);
			function loadanimmesh(event:Event):void {
				trace(event.target.data);
				objectlistxml = new XML(event.target.data);
				dialogbox_animmesh();
			}
		}
		
		//LOAD ANIM MESH
		public function dialogbox_animmesh():void {
			var panel:Sprite = new Sprite();
			var dropboxlist_animmesh:DropBoxList = new DropBoxList();
			
			dropboxlist_animmesh.clearlist();
			for (var objmeshno:int = 0; objmeshno < objectlistxml.file.length() ; objmeshno++ ) {
				if(objectlistxml.file[objmeshno].type == '.md2'){
					dropboxlist_animmesh.addlist( { name:objectlistxml.file[objmeshno].name, id:objectlistxml.file[objmeshno].idobject } );
				}
			}
			
			panel.addChild(dropboxlist_animmesh);
			dialogboxanimmesh.content(panel);
			dialogboxanimmesh.addEventListener(PanelEvent.CLOSE,dialogboxanimmeshclose);
			addChild(dialogboxanimmesh);
		}
		
		public function dialogboxanimmeshclose(event:PanelEvent):void {
			removeChild(dialogboxanimmesh)
		}
		
		//Create or EDIT CHARACTER
		public function dialogbox_charactercreate(char:SCharacter):void {
			dialogboxcharactercreate._pheight = 128;
			dialogboxcharactercreate._pwidth = 256;
			var panel:Sprite = new Sprite();
			var editpanel:Sprite = new Sprite();
			var textfiledname:TextField = new TextField();
			
			textfiledname.text = char.name;
			textfiledname.height = 16;
			textfiledname.border = true;
			textfiledname.type = TextFieldType.INPUT;
			
			
			var buttonsavecharset:Button = new Button('Char Save');
			buttonsavecharset.x = 108;
			buttonsavecharset.addEventListener(MouseEvent.CLICK, savecharset);
			function savecharset(event:Event):void {
				//char
				trace(char.charactersetsavexml());
				var charobj:URLVariables = new URLVariables();
				charobj.name = char.name;
				charobj.idhash = char.idhash;
				//charobj.idhash = 'fgdflkg';
				charobj.animdata = char.charactersetsavexml();
				charobj.action = 'save';
				var request:URLRequest = new URLRequest();
				request.url = siteaccess + characterurl;
				request.data = charobj;
				request.method = URLRequestMethod.POST;
				var loader:URLLoader = new URLLoader();
				loader.load(request);
				loader.addEventListener(Event.COMPLETE, savemeshobj);
				
				function savemeshobj(event:Event):void {
					trace(event.target.data);
					var objectxml:XML = new XML(event.target.data);
					
					if(objectxml.message == 'save'){
						var idobject:String = objectxml.idhash;
						if(idobject.length){//check id idhash is there to assign
							char.idhash = objectxml.idhash;
						}
					}
					//dialogbox_animmesh();
				}
				
			}
			
			var buttonloadcharset:Button = new Button('Char Load');
			buttonloadcharset.x = 172;
			buttonloadcharset.addEventListener(MouseEvent.CLICK, loadcharset);
			function loadcharset(event:Event):void {
				
			}
			
			textfiledname.addEventListener(KeyboardEvent.KEY_DOWN, enterinputcharname);
			function enterinputcharname(event:KeyboardEvent):void {
				if (event.keyCode == 13) {
					char.name = textfiledname.text 
				}
			}
			
			
			var dropboxlistanimmesh:DropBoxList = new DropBoxList();
			dropboxlistanimmesh.y = 14 * 2;
			
			dropboxlistanimmesh.clearlist();
			for (var animsetno:int = 0; animsetno < char.meshs.length; animsetno++ ) {
				dropboxlistanimmesh.addlist( {name:char.meshs[animsetno].name,id:char.meshs[animsetno].idhash} );
			}
			
			var butonreloadset:Button = new Button('Reload');
			butonreloadset.x = 108;
			butonreloadset.y = 14 * 2;
			butonreloadset.addEventListener(MouseEvent.CLICK, reloadanimset);
			
			function reloadanimset(event:Event):void {
				//char.meshs.length
				dropboxlistanimmesh.clearlist();
				for (var charanimsetno:int = 0; charanimsetno < char.meshs.length  ;charanimsetno++ ) {
					dropboxlistanimmesh.addlist( {name:char.meshs[charanimsetno].name,id:char.meshs[charanimsetno].idhash} );
				}
			}
			
			var buttonedit:Button = new Button('Edit');
			buttonedit.x = 152;
			buttonedit.y = 14 * 2;
			buttonedit.addEventListener(MouseEvent.CLICK, animsetedit);
			function animsetedit(event:Event):void {
				//dropboxlistanimmesh._idname
				for (var meshanimsetno:int = 0; meshanimsetno < char.meshs.length  ; meshanimsetno++ ) {
					if (char.meshs[meshanimsetno].idhash == dropboxlistanimmesh._idname) {
						animationsetbuild(char.meshs[meshanimsetno]);
					}
				}
			}
			
			var buttoncreate:Button = new Button('Create');
			buttoncreate.x = 184;
			buttoncreate.y = 14 * 2;
			buttoncreate.addEventListener(MouseEvent.CLICK,createanimset);
			function createanimset(event:Event):void {
				var sanimset:SAnimationSet = new SAnimationSet();
				animationsetbuild(sanimset);
				char.meshs.push(sanimset);
			}
			
			
			panel.addChild(buttonsavecharset);
			panel.addChild(buttonloadcharset);
			panel.addChild(butonreloadset);
			panel.addChild(buttonedit);
			panel.addChild(buttoncreate);
			
			//ANIMATION SET EDIT CLASS VECTOR
			function animationsetbuild(animset:SAnimationSet):void {
				cleareditpanel();
				var dropboxlistanimset:DropBoxList = new DropBoxList();
				dropboxlistanimset.x = 14*0;
				dropboxlistanimset.y = 14 * 3;
				dropboxlistanimset.clearlist();
				
				dropboxlistanimset.clearlist();
				for (var objmeshno:int = 0; objmeshno < objectlistxml.file.length() ; objmeshno++ ) {
					if(objectlistxml.file[objmeshno].type == '.md2'){
						dropboxlistanimset.addlist( { name:objectlistxml.file[objmeshno].name, id:objectlistxml.file[objmeshno].idobject } );
					}
				}
				
				var buttonsetset:Button = new Button('SET');
				buttonsetset.x = 108;
				buttonsetset.y = 14 * 3;
				buttonsetset.addEventListener(MouseEvent.CLICK, setanimmesh);
				function setanimmesh(event:Event):void {
					animset.name = dropboxlistanimset._textname
					animset.idhash = dropboxlistanimset._idname;
				}
				
				var buttondeleteset:Button = new Button('DELETE');
				buttondeleteset.x = 153;
				buttondeleteset.y = 14 * 3;
				buttondeleteset.addEventListener(MouseEvent.CLICK, delanimmesh);
				function delanimmesh(event:Event):void {
					//animset
					for (var animsetno:int = 0; animsetno < char.meshs.length ;animsetno++ ) {
						if (char.meshs[animsetno] == animset) {
							char.meshs.splice(animsetno, 1);
						}
					}
				}
				
				
				editpanel.addChild(buttondeleteset);
				editpanel.addChild(buttonsetset);
				editpanel.addChild(dropboxlistanimset);
			}
			
			
			//clear image sprtie
			function cleareditpanel():void {
				while (editpanel.numChildren) {
					for (var editno:int = 0; editno < editpanel.numChildren;editno++ ) {
						editpanel.removeChildAt(editno);
					}
				}
			}
			
			
			panel.addChild(editpanel)
			panel.addChild(dropboxlistanimmesh);
			panel.addChild(textfiledname);
			
			dialogboxcharactercreate.content(panel);
			dialogboxcharactercreate.addEventListener(PanelEvent.CLOSE,removedialogboxcharactercreate);
			addChild(dialogboxcharactercreate);
		}
		
		public function removedialogboxcharactercreate(event:PanelEvent):void {
			removeChild(dialogboxcharactercreate);
		}
		
		private function enterFrameHandler( event:Event) : void {
			scene.render();
		}
		
	}
	
}