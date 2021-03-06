package  gearunits.models{
	import away3d.core.base.Face;
	import away3d.core.base.Mesh;
	import away3d.core.base.UV;
	import away3d.core.base.Vertex;
	import away3d.core.math.Number3D;
	import away3d.core.utils.Init;
	import flash.geom.Matrix3D;
	import flash.geom.Vector3D;

	public class AMeshBaseTurret extends Mesh {
		private var ve:Array;
		private var fa:Array;
		
		private var vertexframe:Array = new Array();//default frame
		private var bone:Array = new Array();
		private var boneg:Array = new Array();
		private var bonev:Array = new Array();
		private var parentbone:Array = new Array();

		public function AMeshBaseTurret(init:Object = null) {
			super( init );
			init = Init.parse(init);
			ve = [];
			v(8.000000,-0.800000,8.000000);
			v(8.000000,-0.800000,-8.000000);
			v(-8.000001,-0.800000,-7.999998);
			v(-7.999996,-0.800000,8.000003);
			v(8.000004,0.800000,7.999996);
			v(7.999995,0.800000,-8.000005);
			v(-8.000003,0.800000,-7.999997);
			v(-7.999999,0.800000,8.000000);
			v(-2.160000,5.720000,4.200000);
			v(-2.160001,5.720000,-10.199998);
			v(2.159999,5.720000,-10.200005);
			v(2.160001,5.720000,4.199997);
			v(-2.159999,4.280000,4.200003);
			v(-2.160000,4.280000,-10.199999);
			v(2.160000,4.280000,-10.200001);
			v(2.160000,4.280000,4.200000);

			f(15,14,13,0.501376,0.949037,0.500000,0.500413,0.634587,0.500000,0.000000,0.000000,-1.000000);
			f(15,13,12,0.501376,0.949037,0.634587,0.500000,0.635963,0.948624,0.000000,-0.000000,-1.000000);
			f(11,8,9,0.637340,0.500000,0.771927,0.500413,0.770551,0.949037,-0.000000,0.000000,1.000000);
			f(11,9,10,0.637340,0.500000,0.770551,0.949037,0.635964,0.948624,0.000000,-0.000000,1.000000);
			f(15,11,14,0.402385,0.500138,0.447247,0.500000,0.403761,0.948762,1.000000,0.000000,-0.000001);
			f(11,10,14,0.447247,0.500000,0.448624,0.948624,0.403761,0.948762,1.000000,-0.000000,0.000001);
			f(14,10,13,0.357110,0.500138,0.401972,0.500000,0.357523,0.634725,-0.000000,-1.000000,-0.000003);
			f(10,9,13,0.401972,0.500000,0.402385,0.634587,0.357523,0.634725,-0.000002,-1.000000,0.000001);
			f(13,9,8,0.000000,0.500138,0.044862,0.500000,0.046239,0.948624,-1.000000,0.000000,-0.000000);
			f(13,8,12,0.000000,0.500138,0.046239,0.948624,0.001376,0.948762,-1.000000,0.000000,-0.000001);
			f(11,15,12,0.091514,0.634587,0.046652,0.634725,0.046239,0.500138,0.000001,1.000000,0.000002);
			f(11,12,8,0.091514,0.634587,0.046239,0.500138,0.091101,0.500000,0.000001,1.000000,0.000002);
			f(4,0,7,0.926056,0.998471,0.876209,0.998624,0.924527,0.500000,0.000000,1.000000,0.000002);
			f(0,3,7,0.876209,0.998624,0.874680,0.500153,0.924527,0.500000,0.000000,1.000000,0.000002);
			f(2,6,7,0.773456,0.500000,0.823303,0.500153,0.821774,0.998624,-1.000000,0.000000,-0.000001);
			f(2,7,3,0.773456,0.500000,0.821774,0.998624,0.771927,0.998471,-1.000000,0.000000,-0.000002);
			f(1,5,2,0.824833,0.500000,0.874680,0.500153,0.823303,0.998471,-0.000000,-1.000000,-0.000003);
			f(5,6,2,0.874680,0.500153,0.873150,0.998624,0.823303,0.998471,-0.000000,-1.000000,0.000001);
			f(0,4,1,0.448624,0.500153,0.498471,0.500000,0.450153,0.998624,1.000000,0.000000,-0.000002);
			f(4,5,1,0.498471,0.500000,0.500000,0.998471,0.450153,0.998624,1.000000,-0.000001,0.000003);
			f(4,7,5,0.501529,0.000000,1.000000,0.001529,0.500000,0.498471,-0.000000,-0.000000,1.000000);
			f(7,6,5,1.000000,0.001529,0.998471,0.500000,0.500000,0.498471,0.000000,-0.000000,1.000000);
			f(0,1,2,0.001529,0.500000,0.000000,0.001529,0.498471,0.000000,0.000000,0.000000,-1.000000);
			f(0,2,3,0.001529,0.500000,0.498471,0.000000,0.500000,0.498471,0.000000,-0.000000,-1.000000);

			this.x = 0.000000;
			this.y = 0.000000;
			this.z = 0.000000;

			this.rotationX = 0.000000;
			this.rotationY = 0.000000;
			this.rotationZ = 0.000000;

			this.scaleX = 1.000000;

			this.scaleY = 1.000000;

			this.scaleZ = 1.000000;
			
			//this code is for reset points
			for (var vertexno:int = 0; vertexno < vertices.length; vertexno++ ) {
				//this code needs to be independent point it will be hard to guess angle and reset position
				vertexframe.push(new Number3D(vertices[vertexno].x,vertices[vertexno].y,vertices[vertexno].z));
			}
			
			buildbone();
			buildweight();
			bonebranch();
			
			boneg = bone;
			
		}
		public function v(x:Number, y:Number, z:Number):void {
			ve.push(new Vertex(x, y, z));
		}

		public function f(vertexIndex1:int, vertexIndex2:int, vertexIndex3:int, uv00:Number, uv01:Number, uv10:Number, uv11:Number, uv20:Number, uv21:Number, normalx:Number, normaly:Number, normalz:Number):void {
			var face:Face = new Face( ve[vertexIndex1], ve[vertexIndex2], ve[vertexIndex3], null, new UV(uv00, uv01), new UV(uv10, uv11), new UV(uv20, uv21) );
			addFace(face);
		}

		public function f2(vertexIndex1:int, vertexIndex2:int, vertexIndex3:int):void {
			addFace( new Face(ve[vertexIndex1], ve[vertexIndex2], ve[vertexIndex3]) );
		}
		
		
		//=========================================================================================
		// CUSTOM VERTEX BONE SYSTEM
		//=========================================================================================
		//{
		
		/*
		top mesh of aVertex point
		-6
		-7
		-8
		-9
		-10
		-11
		-no 12
		 */
		
		 //bone1 = base
		 //bone2 = topbase
		public function _bone(bones:*):void {
			//trace('==============');
			/*
			 Need to create a simple format.
			 Clone vertex
			 
			 parent bone effect all point of the child
			 */
			if (bones['name']) {
				//this will render the point base on bone rotation and position for looking for correct angle.
				var vertexf:Array = new Array();
				var bonematrix:Array = new Array();//this deal with caluate bone effect on child
				
				//setting check supoort only one bone at the time
				//set bone rotation
				for (var boneindex:int = 0; boneindex < bone.length;boneindex++ ) {
					if (bone[boneindex].parent == bones['name']) {
						if (bones['rotx']) {
							bone[boneindex].rotx = bones['rotx'];
						}
						if (bones['roty']) {
							bone[boneindex].roty = bones['roty'];
						}
						if (bones['rotz']) {
							bone[boneindex].rotz = bones['rotz'];
						}
					}
				}
				
				//clone bone for bone matrix build
				for (var bm:int = 0; bm < bone.length ;bm++ ) {
					bonematrix.push( { parent:bone[bm].parent,  child:bone[bm].child, x:bone[bm].x, y:bone[bm].y, z:bone[bm].z, rotx:bone[bm].rotx, roty:bone[bm].roty, rotz:bone[bm].rotz } );
					//trace(bone[bm].rotx+':'+'');
				}
				
				for (var bonepm:int = 0; bonepm < bonematrix.length; bonepm++ ) { //bone loop in order
					var bpivotpoint:Vector3D = new Vector3D(bonematrix[bonep].x, bonematrix[bonep].y, bonematrix[bonep].z);
					var bp:Array = new Array();//bone id
					bonem(bp, bonematrix[bonepm].parent);//bone id from parent
					//trace('PARENT BONES:' +bonematrix[bonepm].parent +':' + bp.length);
					
					for (var bmc:int = 0; bmc < bonematrix.length;bmc++) {
						for (var p:int = 0; p < bp.length;p++ ) {
							if (bonematrix[bmc].parent == bp[p] ) {//if parent matches the name from parent child branch
								var bmatrix:Matrix3D = new Matrix3D();
								var bpoint:Vector3D = new Vector3D(bonematrix[bmc].x, bonematrix[bmc].y, bonematrix[bmc].z);
								
								bmatrix.appendRotation(bonematrix[bonep].rotx, new Vector3D(1, 0, 0));
								bmatrix.appendRotation(bonematrix[bonep].roty, new Vector3D(0, 1, 0));
								bmatrix.appendRotation(bonematrix[bonep].rotz, new Vector3D(0, 0, 1));
								
								bonematrix[bmc].x = bmatrix.position.x;
								bonematrix[bmc].y = bmatrix.position.y;
								bonematrix[bmc].z = bmatrix.position.z;
								break;
							}
						}
					}
				}
				
				//trace(bonematrix);
				/*
				for (var bl:int = 0; bl < bonematrix.length;bl++ ) {
					trace('['+bonematrix[bl].x +':' + bonematrix[bl].y +':' + bonematrix[bl].z +']');
				}
				*/
				
				boneg = bonematrix;//return array bone that made some changes.
				
				//clone vertex point for matrix build
				for (var vc:int = 0; vc < vertexframe.length;vc++ ) {
					vertexf.push(new Number3D(vertexframe[vc].x,vertexframe[vc].y,vertexframe[vc].z));
				}
				
				//need to work on parent point effect on child
				//move the bone assign vertex point
				//vertexf got to caluate matrix code
				for (var bonep:int = 0; bonep < bone.length; bonep++ ){ //bone loop in order
					var pivotpoint:Vector3D = new Vector3D(bonematrix[bonep].x, bonematrix[bonep].y, bonematrix[bonep].z);
					var matrix:Matrix3D = new Matrix3D();
					//point weight
					for (var weightno:int = 0; weightno < bonev.length ; weightno++ ) {
						if (bone[bonep].parent == bonev[weightno].boneid) {//if bone id matches bone vertex id
							//trace('found....update point...');
							
							matrix.position = new Vector3D(vertexf[weightno].x, vertexf[weightno].y, vertexf[weightno].z);
							matrix.appendTranslation(bonematrix[bonep].x, bonematrix[bonep].y, bonematrix[bonep].z);
							matrix.appendRotation(bone[bonep].rotx * bonev[weightno].weight, new Vector3D(1, 0, 0));
							matrix.appendRotation(bone[bonep].roty * bonev[weightno].weight, new Vector3D(0, 1, 0));
							matrix.appendRotation(bone[bonep].rotz * bonev[weightno].weight, new Vector3D(0, 0, 1));
							matrix.appendTranslation(-bonematrix[bonep].x, -bonematrix[bonep].y, -bonematrix[bonep].z);
							
							vertexf[bonev[weightno].vertexid].x = matrix.position.x;
							vertexf[bonev[weightno].vertexid].y = matrix.position.y;
							vertexf[bonev[weightno].vertexid].z = matrix.position.z;
							//add vertex point to parent
						}
					}
					var vp:Array = new Array();//vertex id//format id = vertexid
					parentbranch(vp, bone[bonep].parent);
					//trace('points' + vp.length);
					//pivotpoint = new Point3D(bonematrix[bonep].x, bonematrix[bonep].y, bonematrix[bonep].z);
					//vertex id and weight set to 1 that branch off child parent
					for (var vpno:int = 0; vpno < vp.length ; vpno++ ) {
						//trace('point:'+vp[vpno]);
						//trace('found....update point...');
						matrix.position = new Vector3D(vertexf[vp[vpno]].x, vertexf[vp[vpno]].y, vertexf[vp[vpno]].z)
						matrix.appendTranslation(bonematrix[bonep].x, bonematrix[bonep].y, bonematrix[bonep].z);
						matrix.appendRotation(bone[bonep].rotx, new Vector3D(1, 0, 0));
						matrix.appendRotation(bone[bonep].roty, new Vector3D(0, 1, 0));
						matrix.appendRotation(bone[bonep].rotz, new Vector3D(0, 0, 1));
						matrix.appendTranslation(-bonematrix[bonep].x, -bonematrix[bonep].y, -bonematrix[bonep].z);
						
						vertexf[vp[vpno]].x = matrix.position.x;
						vertexf[vp[vpno]].y = matrix.position.y;
						vertexf[vp[vpno]].z = matrix.position.z;
						//add vertex point to parent
					}
				}
				
				//place point from different parent and child rotation
				//this will apply all the vertex points
				for (var vertexset:int = 0;vertexset < vertexf.length;vertexset++ ) {
					vertices[vertexset].x = vertexf[vertexset].x;
					vertices[vertexset].y = vertexf[vertexset].y;
					vertices[vertexset].z = vertexf[vertexset].z;
				}
			}
			
			function parentbranch(pv:Array, parentname:String):void {
				//countindex++;
				/*
				//for(parentbone)
				//parent
				//vp.push(vextexid)
				//check id if match add or skip
				//check bone if branch off else return face id vertex
				*/
				for (var pbn:int = 0; pbn < parentbone.length;pbn++ ) {//current bone index in loop
					if (parentbone[pbn].parent == parentname) {
						//trace('parent..');
						for (var pbc:int = 0; pbc < parentbone[pbn].child.length ; pbc++ ) {//parent child loop from parent
							//trace('child..');
							//trace(parentbone[pbn].child[pbc]);//bone name
							//looping matching vertex id
							for (var weightno:int = 0; weightno < bonev.length ; weightno++ ) {
								if (parentbone[pbn].child[pbc] == bonev[weightno].boneid) {
									var bvid:Boolean = false;
									//weight[weightno].vertexid;
									//vertex id if match for loop check
									for (var vidno:int = 0; vidno < pv.length;vidno++ ) {
										if (pv[vidno] == bonev[weightno].vertexid) {
											bvid = true;
											break;
										}
									}
									if (!bvid) {
										pv.push(bonev[weightno].vertexid);
									}
								}
							}
							//loop branch off code will repeat if has child
							parentbranch(pv,parentbone[pbn].child[pbc]);//loop parentbranch
						}
					}
				}
			}
			
			//parent id loop for multi matrix of bones branch
			function bonem(bonea:Array, parentname:String):void {
				for (var pbn:int = 0; pbn < parentbone.length;pbn++ ) {
					if (parentbone[pbn].parent == parentname) {//if parent bone matches 
					//trace('child'+parentbone[pbn].child.length);
						for (var pbc:int = 0; pbc < parentbone[pbn].child.length ; pbc++ ) {//parent child loop from parent
							var bbonem:Boolean = false;
							for ( var ba:int = 0; ba < bonea.length; ba++ ) {
								if (bonea[ba] == parentbone[pbn].child[pbc]) {
									bbonem = true;
									break;
								}
							}
							if (!bbonem) {
								bonea.push(parentbone[pbn].child[pbc]);
							}
							bonem(bonea,parentbone[pbn].child[pbc]);
						}
					}
				}
			}
		}
		
		//This for rebuild bone branch when the export from 3d model program that has to translate back different way
		public function bonebranch():void {
			//set up parent bone to branch off
			for (var bp:int = 0; bp < bone.length; bp++ ) {
				parentbone.push( { parent:bone[bp].parent, child:Array} );
			}
			
			for (var bc:int = 0; bc < parentbone.length; bc++ ) {
				//parentbone.push(bone[bc].parent);
				//parent build in order is a must
				//trace(parentbone[bc].parent);
				parentbone[bc].child = new Array();
				for (var bpc:int = 0; bpc < bone.length; bpc++) {
					//if parent have child add them
					if (parentbone[bc].parent == bone[bpc].child) {
						parentbone[bc].child.push(bone[bpc].parent);
					}
				}
				//trace('Parent:'+parentbone[bc].parent+' Number childs:'+parentbone[bc].child.length);
			}
		}
		
		//bone
		//name,parent, child, position, rotation, scale
		public function buildbone():void {
			bone.push( { parent:'bone1',  child:null, x:0, y:0, z:0, rotx:0, roty:0, rotz:0 } );
			bone.push( { parent:'bone2',  child:'bone1', x:0, y:3, z:0, rotx:0, roty:0, rotz:0 } );
			//bone.push( { parent:'bone3',  child:'bone1', x:0, y:5, z:0, rotx:0, roty:0, rotz:0 } );
			//bone.push( { parent:'bone4',  child:'bone1', x:0, y:5, z:0, rotx:0, roty:0, rotz:0 } );
		}
		
		//weight
		//aVertex id, weight, bone id
		public function buildweight():void {
			//base
			bonev.push( { vertexid:0, weight:1, boneid:'bone2' } );
			bonev.push( { vertexid:1, weight:1, boneid:'bone2' } );
			bonev.push( { vertexid:2, weight:1, boneid:'bone2' } );
			bonev.push( { vertexid:3, weight:1, boneid:'bone2' } );
			bonev.push( { vertexid:4, weight:1, boneid:'bone2' } );
			bonev.push( { vertexid:5, weight:1, boneid:'bone2' } );
			bonev.push( { vertexid:6, weight:1, boneid:'bone2' } );
			bonev.push( { vertexid:7, weight:1, boneid:'bone2' } );
			//top base
			
			bonev.push( { vertexid:8, weight:1, boneid:'bone1' } );
			bonev.push( { vertexid:9, weight:1, boneid:'bone1' } );
			bonev.push( { vertexid:10, weight:1, boneid:'bone1' } );
			bonev.push( { vertexid:11, weight:1, boneid:'bone1' } );
			bonev.push( { vertexid:12, weight:1, boneid:'bone1' } );
			bonev.push( { vertexid:13, weight:1, boneid:'bone1' } );
			bonev.push( { vertexid:14, weight:1, boneid:'bone1' } );
			bonev.push( { vertexid:15, weight:1, boneid:'bone1' } );
		}
		//list bone and other settings
		public function bonelist():Array {
			return boneg;
		}
		
		//return rotate of x,y,z of name bone
		public function bonerotation(namebone:String):Number3D {
			var brotate:Number3D = new Number3D();
			for (var boneno:int = 0; boneno < bone.length ;boneno++ ) {
				if (bone[boneno].parent == namebone) {
					brotate.x = bone[boneno].rotx;
					brotate.y = bone[boneno].roty;
					brotate.z = bone[boneno].rotz;
					break;
				}
			}
			return brotate;
		}
		//}

	}
}