package darknet.engine.sandy.entity 
{
	import darknet.core.collision.CollisionBox;
	import darknet.core.geometry.Point3D;
	import sandy.core.scenegraph.Shape3D;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class SMesh extends SEntity{
		public var mesh:Shape3D = null;
		public var spawnposition:Point3D = new Point3D();
		public var spawnrotation:Point3D = new Point3D();
		public var exttype:String;// = '.ase';
		public var filename:String;// = '';
		public var filedir:String;// = '';
		public var texture:Vector.<STexture> = new Vector.<STexture>();
		
		public function SMesh() {
			//rotate.x
		}
		
		public function update():void {
			if (mesh != null){
				mesh.x = x;
				mesh.y = y;
				mesh.z = z;
				
				mesh.rotateX = rotation.x % 360;
				mesh.rotateY = rotation.y % 360;
				mesh.rotateZ = rotation.z % 360;
				//trace(rotate.x+"[:]"+mesh.rotateX+"[:]"+mesh.rotateY+"[:]"+mesh.rotateZ);
			}
		}
		
		public function setposition(px:Number,py:Number,pz:Number):void {
			spawnposition.x = px;
			spawnposition.y = py;
			spawnposition.z = pz;
			
			x = px;
			y = py;
			z = pz;
			
			mesh.x = px;
			mesh.y = py;
			mesh.z = pz;
			//trace('set position:' + x + ':' + y + ':' + z);
		}
		
		public function setrotation(px:Number, py:Number, pz:Number):void {
			spawnrotation.x = px;
			spawnrotation.y = py;
			spawnrotation.z = pz;
			
			rotation.x = px;
			rotation.y = py;
			rotation.z = pz;
			
			//mesh.rotateX = px;
			//mesh.rotateY = py;
			//mesh.rotateZ = pz;
		}
		
		//save object data all proporties.
		public function objectxml():XML {
			var objectxml:XML = <mesh/>;
			var meshid:XML = <idobject />;
			meshid.appendChild(idhash);
			objectxml.appendChild(meshid);
			var meshname:XML = <name />;
			meshname.appendChild(name);
			objectxml.appendChild(meshname);
			
			var meshext:XML = <typeext/>;
			meshext.appendChild(exttype);
			//trace(exttype+":EXT");
			objectxml.appendChild(meshext);
			
			var meshfiledir:XML = <localdir/>;
			//meshfiledir.appendChild(filedir);
			meshfiledir.appendChild(filedir);
			objectxml.appendChild(meshfiledir);
			
			//texture
			var meshmat:XML = <mat/>;
			for (var textureno:int = 0;textureno < texture.length ;textureno++ ){
				var meshtext:XML = <tex/>;
				
				var texmatid:XML = <matid/>;
				texmatid.appendChild(texture[textureno].matid);
				meshtext.appendChild(texmatid);
				
				var texname:XML = <name/>;
				texname.appendChild(texture[textureno].name);
				meshtext.appendChild(texname);
				
				var texidhash:XML = <idhash/>;
				texidhash.appendChild(texture[textureno].idhash);
				meshtext.appendChild(texidhash);
				
				var texfiledir:XML = <filedir/>;
				texfiledir.appendChild(texture[textureno].filedir);
				meshtext.appendChild(texfiledir);
				
				meshmat.appendChild(meshtext);
			}
			objectxml.appendChild(meshmat);
			//collision
			var meshcollision:XML = <collision/>;
			
			var meshbox:XML = <box/>;
			for (var boxno:int = 0; boxno < collison.box.length; boxno++) {
				//scale
				var meshscale:XML = <scale/>;
				meshscale.appendChild(collison.box[boxno].scale);
				meshbox.appendChild(meshscale);
				var meshscalex:XML = <scalex/>;
				meshscalex.appendChild(collison.box[boxno].scalex)
				meshbox.appendChild(meshscalex);
				var meshscaley:XML = <scaley/>;
				meshscaley.appendChild(collison.box[boxno].scaley)
				meshbox.appendChild(meshscaley);
				var meshscalez:XML = <scalez/>;
				meshscalez.appendChild(collison.box[boxno].scalez)
				meshbox.appendChild(meshscalez);
			
				//box size
				var meshheight:XML = <height/>;
				meshheight.appendChild(collison.box[boxno].height)
				meshbox.appendChild(meshheight);
				var meshlength:XML = <length/>;
				meshlength.appendChild(collison.box[boxno].length)
				meshbox.appendChild(meshlength);
				var meshwidth:XML = <width/>;
				meshwidth.appendChild(collison.box[boxno].width)
				meshbox.appendChild(meshwidth);
				//position
				var meshposition:XML = <position/>;
				var meshposx:XML = <x/>;
				meshposx.appendChild(collison.box[boxno].x)
				meshposition.appendChild(meshposx);
				var meshposy:XML = <y/>;
				meshposy.appendChild(collison.box[boxno].y)
				meshposition.appendChild(meshposy);
				var meshposz:XML = <z/>;
				meshposz.appendChild(collison.box[boxno].z)
				meshposition.appendChild(meshposz);
				meshbox.appendChild(meshposition);
				//rotation
				var meshrotation:XML = <rotation/>;
				var meshrotx:XML = <x/>;
				meshrotx.appendChild(collison.box[boxno].rotation.x);
				meshrotation.appendChild(meshrotx);
				var meshroty:XML = <y/>;
				meshroty.appendChild(collison.box[boxno].rotation.y);
				meshrotation.appendChild(meshroty);
				var meshrotz:XML = <z/>;
				meshrotz.appendChild(collison.box[boxno].rotation.z);
				meshrotation.appendChild(meshrotz);
				meshbox.appendChild(meshrotation);
				
				meshcollision.appendChild(meshbox)
			}
			
			objectxml.appendChild(meshcollision);
			
			trace(objectxml);
			return objectxml;
		}
		
		public function objxmlconvertdata(objxml:XML):void {
			//objxml
			//objxml.
			
			exttype = objxml.typeext;
			trace("exttype:" + exttype);
			filedir = objxml.localdir;
			//TEXTURE
			for (var matno:int = 0; matno < objxml.mat.tex.length() ;matno++ ) {
				var tex:STexture = new STexture();
				tex.matid = objxml.mat.tex[matno].matid;
				tex.name = objxml.mat.tex[matno].name;
				tex.idhash = objxml.mat.tex[matno].idhash;
				tex.filedir = objxml.mat.tex[matno].filedir;
				var strname:String = tex.idhash;
				if (strname.length) {//make sure there is strname id else null class
					texture.push(tex);
					trace('added tex.');
				}
			}
			
			//COLLISION BOX
			for (var boxno:int = 0; boxno < objxml.collision.box.length();boxno++ ){
				var cbox:CollisionBox = new CollisionBox();
				cbox.scale = objxml.collision.box[boxno].scale;
				cbox.scalex = objxml.collision.box[boxno].scalex;
				cbox.scaley = objxml.collision.box[boxno].scaley;
				cbox.scalez = objxml.collision.box[boxno].scalez;
				
				cbox.height = objxml.collision.box[boxno].height;
				cbox.length = objxml.collision.box[boxno].length;
				cbox.width = objxml.collision.box[boxno].width;
				
				cbox.x = objxml.collision.box[boxno].position.x;
				cbox.y = objxml.collision.box[boxno].position.y;
				cbox.z = objxml.collision.box[boxno].position.z;
				
				cbox.rotation.x = objxml.collision.box[boxno].rotation.x;
				cbox.rotation.y = objxml.collision.box[boxno].rotation.y;
				cbox.rotation.z = objxml.collision.box[boxno].rotation.z;
				//cbox
				var strnamebox:String = objxml.collision.box[boxno].scale;
				var bcboxfound:Boolean = false;
				for (var ccboxno:int = 0;ccboxno < collison.box.length ; ccboxno++) {
					if (collison.box[ccboxno] == cbox) {
						trace('COLLISION FOUND!');
						bcboxfound = true;
						break;
					}
				}
				
				if ((strnamebox.length >0)){
					trace('added box');
					if((!bcboxfound) ){
						collison.box.push(cbox);
					}
				}
				
			}
		}
		
		
		//this function is for map object save location
		public function objectmapxml():XML {
			var objectxml:XML = <mesh/>;
			
			var meshid:XML = <idobject />;
			meshid.appendChild(idhash);
			objectxml.appendChild(meshid);
			
			var meshname:XML = <name />;
			meshname.appendChild(name);
			objectxml.appendChild(meshname);
			
			var position:XML = <position />;
			var posx:XML = <x/>;
			posx.appendChild(x);
			var posy:XML = <y/>;
			posy.appendChild(y);
			var posz:XML = <z/>;
			posz.appendChild(z);
			position.appendChild(posx);
			position.appendChild(posy);
			position.appendChild(posz);
			objectxml.appendChild(position);
			var rotation:XML = <rotation />;
			var rotx:XML = <x/>;
			var roty:XML = <y/>;
			var rotz:XML = <z/>;
			rotx.appendChild(mesh.rotateX);
			roty.appendChild(mesh.rotateY);
			rotz.appendChild(mesh.rotateZ);
			rotation.appendChild(rotx);
			rotation.appendChild(roty);
			rotation.appendChild(rotz);
			objectxml.appendChild(rotation);
			var offset:XML = <offset/>;
			var offsetx:XML = <x/>;
			offsetx.appendChild(0);
			var offsety:XML = <y/>;
			offsety.appendChild(0);
			var offsetz:XML = <z/>;
			offsetz.appendChild(0);
			offset.appendChild(offsetx);
			offset.appendChild(offsety);
			offset.appendChild(offsetz);
			objectxml.appendChild(offset);
			//trace(objectxml);
			return objectxml;
		}
		
	}
	
}