package  
{
	
	//{
	import darknet.core.display.Button;
	import darknet.core.display.DialogBox;
	import darknet.core.display.DropBoxList;
	import darknet.core.display.NumericUpDown;
	import darknet.core.event.NumericUpDownEvent;
	import darknet.engine.sandy.entity.SActionFrame;
	import darknet.engine.sandy.entity.SAnimationSet;
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
	 * Information: This is simple as can be for animation control part.
	 * It create frame index to min to max frame time line.
	 */
	
	public class SandyCharacterAnimationSetEditor extends Sprite
	{
		
		//{
		public var scene:Scene3D;
		public var camera:Camera3D;
		public var group:Group = new Group('group');
		
		public var siteaccess:String = 'http://localhost/darkaif/htdocs/'; //need full address
		//public var siteaccess:String = ''; //need full address
		public var objecturl:String = 'scripts/datafiles.php';
		public var objectlistxml:XML;
		
		public var player:SPlayer = new SPlayer();
		
		public var dialogbox_meshanimation:DialogBox = new DialogBox();
		public var dropboxlist_mesh:DropBoxList = new DropBoxList();
		public var buttonload:Button = new Button('LOAD');
		public var buttonanimset:Button = new Button('Anim Set');
		
		public var keycode:Array = new Array();
		
		
		//}
		
		public function SandyCharacterAnimationSetEditor() {
			
			camera = new Camera3D(640, 480);
			camera.far = 1000;
			camera.near = 0;
			camera.y = 50;
			
			var box:Box = new Box('box');
			group.addChild(box);
			var root:Group = group;
			//this means this sprite class that was created
			scene = new Scene3D( "scene", this, camera, root );
			addEventListener( Event.ENTER_FRAME, enterFrameHandler );
			addChild(buttonanimset);
			buttonload.x = 128;
			buttonload.addEventListener(MouseEvent.CLICK,loadobject);
			addChild(dropboxlist_mesh);
			addChild(buttonload);
			querymeshlist();
			buttonanimset.y = 14;
			buttonanimset.addEventListener(MouseEvent.CLICK, dialogbox_meshanimset);
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, addKey, false, 0, true);
			stage.addEventListener(KeyboardEvent.KEY_UP, removeKey, false, 0, true);
		}
		
		public function loadobject(event:Event = null):void {
			//trace(dropboxlist_mesh.getidname());
			if (dropboxlist_mesh._idname != 'null') {
				loadmeshid(dropboxlist_mesh._idname);
			}
		}
		
		//
		private function enterFrameHandler( event:Event) : void {
			scene.render();
			player.update();
		}
		
		public function loadmeshid(strid:String):void {
			var queue:LoaderQueue = new LoaderQueue();
			
			queue.add(strid, new URLRequest((siteaccess + objecturl + '?file=' + strid)), "BIN" );
			queue.addEventListener(SandyEvent.QUEUE_COMPLETE,loaddatafile);
			queue.start();
			
			function loaddatafile():void {
				//name, file, scale
				var animmd2:MD2  = new MD2(String(strid), queue.data[strid], 1 );
				var AnimSet:SAnimationSet = new SAnimationSet();
				AnimSet.mesh = animmd2;
				AnimSet.idhash = strid;
				player.meshs.push(AnimSet);
				group.addChild(animmd2);
			}
		}
		
		//this is not full proof plan but it will clean up the scene
		public function cleanscene():void {
			var mesh:Array = group.children;
			while(mesh.length){
				for (var objectno:int = 0; objectno < mesh.length; objectno++) {
					if(mesh[objectno].name != camera.name){
						group.removeChildByName(mesh[objectno].name);
					}
				}
				if (mesh.length <= 1) {
					break;
				}
			}
		}
		
		public function querymeshlist():void {
			var request:URLRequest = new URLRequest();
			request.url = siteaccess + objecturl;
			var load:URLLoader = new URLLoader();
			load.load(request);
			load.addEventListener(Event.COMPLETE, loaddata);
			
			function loaddata(event:Event):void {
				//trace(event.target.data);
				var objxml:XML = new XML(event.target.data);
				if (objxml.file.length() >= 0) {
					objectlistxml = new XML(event.target.data);
					buildmeshlist();
				}
				//meshdata.objxmlconvertdata(objxml);
				//objectlistxml = new XML(event.target.data);
				//meshdataload();
			}	
		}
		
		public function buildmeshlist():void {
			//objectlistxml
			//dropboxlist_mesh
			dropboxlist_mesh.clearlist();
			for (var meshlistno:int = 0; meshlistno < objectlistxml.file.length(); meshlistno++ ) {
				if (objectlistxml.file[meshlistno].type == '.md2') {
					dropboxlist_mesh.addlist({name:objectlistxml.file[meshlistno].name,id:objectlistxml.file[meshlistno].idobject});
				}
			}
		}
		
		public function dialogbox_meshanimset(event:Event):void {
			dialogbox_meshanimation._pwidth = 220;
			dialogbox_meshanimation._pheight = 102;
			var panelsprite:Sprite = new Sprite();
			var editsprite:Sprite = new Sprite();
			//MESH LIST
			var dropboxlistmeshset:DropBoxList = new DropBoxList();
			dropboxlistmeshset.clearlist();
			for (var meshlistno:int = 0; meshlistno < player.meshs.length; meshlistno++) {
				dropboxlistmeshset.addlist( { name:player.meshs[meshlistno].idhash,id:player.meshs[meshlistno].idhash} );
			}
			dropboxlistmeshset.x = 56;
			dropboxlistmeshset.addEventListener(DropBoxEvent.SELECT, setanimlist);
			function setanimlist(event:DropBoxEvent):void {
				//dropboxlistmeshset._idname;
				for (var animlistno:int = 0; animlistno < player.meshs.length; animlistno++) {
					if (player.meshs[animlistno].idhash == dropboxlistmeshset._idname) {
						trace('animset...');
						animlist(player.meshs[animlistno].actionframe);
					}
				}
			}
			
			function animlist(actionlist:Vector.<SActionFrame>):void {
				var animationset:DropBoxList = new DropBoxList();
				animationset.clearlist();
				for (var animsetno:int = 0; animsetno < actionlist.length; animsetno++ ) {
					animationset.addlist({name:actionlist[animsetno].framename,id:animsetno});
				}
			
				//animationset
				animationset.x = 14;
				animationset.y = 14;
				var buttonloadset:Button = new Button('LOAD SET');
				//buttonloadset.x = 162;
				buttonloadset.addEventListener(MouseEvent.CLICK, loadanimationset);
				
				function loadanimationset(event:Event):void {
					var variables:URLVariables = new URLVariables();
					variables.file = player.meshs[0].idhash;
					trace(player.meshs[0].savexmldata());
					variables.action = 'loadanimdata';
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
						loadlistanimset(dataxml);
					}
				}
				
				function loadlistanimset(xmlset:XML):void {
					for (var animno:int = 0; animno < xmlset.action.length(); animno++) {
						var setanimation:SActionFrame = new SActionFrame();
						setanimation.framename = xmlset.action[animno].name;
						setanimation.min = xmlset.action[animno].framemin;
						setanimation.max = xmlset.action[animno].framemax;
						setanimation.speed = xmlset.action[animno].speed;
						setanimation.attackstart = xmlset.action[animno].attackstart;
						setanimation.attackend = xmlset.action[animno].attackend;
						//trace(xmlset.action[animno].name);
						//this code make sure it does over lap it or override it
						var matchanimsetfound:Boolean = false;
						for (var frameno:int = 0; frameno < player.meshs[0].actionframe.length ;frameno++ ) {
							if (player.meshs[0].actionframe[frameno].framename == setanimation.framename) {
								matchanimsetfound = true;
							}
						}
						if(!matchanimsetfound){
							player.meshs[0].actionframe.push(setanimation);
						}
						trace('building...');
					}
					//player.meshs[0].actionframe.push();
				}
			
				//SAVE FILE ANIMATION DATA MESH
				var buttonsaveset:Button = new Button('SAVE SET');
				buttonsaveset.x = 162;
				buttonsaveset.addEventListener(MouseEvent.CLICK, saveanimationset);
				function saveanimationset(event:Event):void {
					var variables:URLVariables = new URLVariables();
					variables.file = player.meshs[0].idhash;
					trace(player.meshs[0].idhash);
					variables.animdata = player.meshs[0].savexmldata();
					trace(player.meshs[0].savexmldata());
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
			
				var buttonedit:Button = new Button('EDIT');
				buttonedit.x = 128;
				buttonedit.y = 14;
			
				var buttoncreate:Button = new Button('CREATE');
				buttoncreate.x = 160;
				buttoncreate.y = 14;
				buttoncreate.addEventListener(MouseEvent.CLICK, createanimset);
				buttonedit.addEventListener(MouseEvent.CLICK, selectanimationset);
				
				function selectanimationset(event:Event):void {
					//animationset._idname
					for (var animsetno:int = 0; animsetno < player.meshs[0].actionframe.length; animsetno++ ) {
						if (String(animsetno) == animationset._idname) {
							dialogbox_animationset(player.meshs[0].actionframe[animsetno]);
							break;
						}
					}
				}
				
				function createanimset(event:Event):void {
					var animset:SActionFrame = new SActionFrame();
					dialogbox_animationset(animset);
					player.meshs[0].actionframe.push(animset);
				}
			
				//var numminvalue:NumericUpDown = new NumericUpDown();
				//edit function
				function dialogbox_animationset(actionset:SActionFrame):void {
					cleaneditpanel();
					var textframename:TextField = new TextField();
					textframename.border = true;
					textframename.text = actionset.framename;
					textframename.type = TextFieldType.INPUT;
					textframename.height = 14;
					textframename.x = 14;
					textframename.y = 14 * 3;
					var numminvalue:NumericUpDown = new NumericUpDown();
					numminvalue.x =14;
					numminvalue.y = 14 * 4;
					numminvalue.valuenumber = actionset.min;
					var nummaxvalue:NumericUpDown = new NumericUpDown();
					nummaxvalue.x = 14;
					nummaxvalue.y = 14*5;				
					nummaxvalue.valuenumber = actionset.max;
					var buttondelanimset:Button = new Button('Delete');
					buttondelanimset.x = 14*10;
					buttondelanimset.y = 14 * 3;
					var buttonplayanim:Button = new Button('Play');
					buttonplayanim.x = 14 * 10;
					buttonplayanim.y = 14 * 4;
					
					//PLAY ANIMATION
					buttonplayanim.addEventListener(MouseEvent.CLICK, playanimationset);
					function playanimationset(event:Event):void {
						player.framemin = actionset.min;
						player.framemax = actionset.max;
					}
				
					//DELETE CLASS ARRAY MATCH
					buttondelanimset.addEventListener(MouseEvent.CLICK, delanimationset);
					function delanimationset(event:Event):void {
						for (var animsetno:int = 0; animsetno < player.meshs[0].actionframe.length ; animsetno++ ) {
							if (actionset == player.meshs[0].actionframe[animsetno]) {
								player.meshs[0].actionframe.splice(animsetno, 1);
								break;
							}
						}
					}
					
					//ENTER KEY TEXT
					textframename.addEventListener(KeyboardEvent.KEY_DOWN, settextactionname)
					function settextactionname(event:KeyboardEvent):void {
						if (event.keyCode == 13) {
							actionset.framename = String(textframename.text);
						}
					}
					
					//MIN VALUE
					numminvalue.addEventListener(NumericUpDownEvent.VALUE, frameminset);
					function frameminset(event:NumericUpDownEvent):void {
						actionset.min = numminvalue.valuenumber;
					}
					
					//MAX VALUE
					nummaxvalue.addEventListener(NumericUpDownEvent.VALUE, framemaxset);
					function framemaxset(event:NumericUpDownEvent):void {
						actionset.max = nummaxvalue.valuenumber;
					}
				
					editsprite.addChild(textframename);
					editsprite.addChild(buttonplayanim);
					editsprite.addChild(numminvalue);
					editsprite.addChild(nummaxvalue);
					//editsprite.addChild(buttonclose);
					editsprite.addChild(buttondelanimset);
				}
				
				panelsprite.addChild(buttonloadset);
				panelsprite.addChild(buttonsaveset);
				panelsprite.addChild(buttonedit);
				panelsprite.addChild(buttoncreate);
				panelsprite.addChild(animationset);
			}
			
			
			var buttonclose:Button = new Button('Close');
			buttonclose.x = 14*10;
			buttonclose.y = 14 * 5;
			buttonclose.addEventListener(MouseEvent.CLICK, dialogbox_meshanimsetclose);
			
			//clean sprite
			function cleaneditpanel():void {
				while (editsprite.numChildren) {
					for (var imageno:int = 0; imageno < editsprite.numChildren;imageno++ ) {
						editsprite.removeChildAt(imageno);
					}
				}
			}
			
			panelsprite.addChild(buttonclose);
			panelsprite.addChild(editsprite);
			panelsprite.addChild(dropboxlistmeshset);
			dialogbox_meshanimation.content(panelsprite);
			addChild(dialogbox_meshanimation);
		}
		
		public function dialogbox_meshanimsetclose(event:Event):void {
			removeChild(dialogbox_meshanimation);
		}
		
		public function controls():void {
			//for () {
				
			///}
		}
		
		public function addKey(e:KeyboardEvent):void {
			keycode[e.keyCode] = true;
		}
		
		public function removeKey(e:KeyboardEvent):void {
			keycode[e.keyCode] = false;
		}
		
	}
	
}