package  {
	//{
	import flash.geom.Point;
	import sandy.core.data.Matrix4;
	import sandy.core.data.Point3D;
	import sandy.math.Matrix4Math;
	import sandy.primitive.Primitive3D;
	import sandy.core.scenegraph.Geometry3D;
	import sandy.core.scenegraph.Shape3D;
	//}
	/*
	 * Information: This is bone and skin test for skeletion build.
	 */

	public class BoneTest extends Shape3D implements Primitive3D {
		private var l:Geometry3D;
		
		private var vertexframe:Array = new Array();
		public var bone:Array = new Array();
		public var weight:Array = new Array();
		public var parentbone:Array = new Array();

		private function f(v1:Number,v2:Number,v3:Number,uv00:Number,uv01:Number,uv10:Number,uv11:Number,uv20:Number,uv21:Number,normX:Number,normY:Number,normZ:Number):void {
			var uv1:Number = l.getNextUVCoordID();
			var uv2:Number = uv1 + 1;
			var uv3:Number = uv2 + 1;

			l.setUVCoords(uv1,uv00,1-uv01);
			l.setUVCoords(uv2,uv10,1-uv11);
			l.setUVCoords(uv3,uv20,1-uv21);

			l.setFaceVertexIds(l.getNextFaceID(), v1,v2,v3);
			l.setFaceUVCoordsIds(l.getNextFaceUVCoordID(), uv1,uv2,uv3);
			l.setFaceNormal(l.getNextFaceNormalID(), normX,normZ,normY);
		}

		private function f4(v1:Number,v2:Number,v3:Number,v4:Number,uv00:Number,uv01:Number,uv10:Number,uv11:Number,uv20:Number,uv21:Number,uv30:Number,uv31:Number,normX:Number,normY:Number,normZ:Number):void {
			var uv1:Number = l.getNextUVCoordID();
			var uv2:Number = uv1 + 1;
			var uv3:Number = uv2 + 1;
			var uv4:Number = uv3 + 1;

			l.setUVCoords(uv1,uv00,1-uv01);
			l.setUVCoords(uv2,uv10,1-uv11);
			l.setUVCoords(uv3,uv20,1-uv21);
			l.setUVCoords(uv4,uv30,1-uv31);

			l.setFaceVertexIds(l.getNextFaceID(),v1,v2,v3,v4);
			l.setFaceUVCoordsIds(l.getNextFaceUVCoordID(),uv1,uv2,uv3,uv4);
			l.setFaceNormal(l.getNextFaceNormalID(),normX,normZ,normY);
		}

		private function f2(v1:Number,v2:Number,v3:Number):void {
			l.setFaceVertexIds(l.getNextFaceID(), v1,v2,v3);
		}

		private function v(vx:Number,vy:Number,vz:Number):void {
			l.setVertex(l.getNextVertexID(),vx,vz,vy);
		}

		public function BoneTest( p_Name:String=null ) {
			super( p_Name );
			geometry = generate();
			
			changed = true;
			//this code is for reset points
			for (var vertexno:int = 0; vertexno < geometry.aVertex.length; vertexno++ ) {
				//this code needs to be independent point it will be hard to guess angle and reset position
				vertexframe.push(new Point3D(geometry.aVertex[vertexno].x,geometry.aVertex[vertexno].y,geometry.aVertex[vertexno].z));
			}
			
			buildbone();
			buildweight();
			bonebranch();
			
		}

		public function generate(... arguments):Geometry3D {
			l = new Geometry3D();
			v(1.000000,-0.000000,-1.000000);
			v(-1.000000,-1.000000,-1.000000);
			v(-1.000000,1.000000,-1.000000);
			v(0.999999,-0.000000,1.000000);
			v(-1.000000,-1.000000,1.000000);
			v(-1.000000,1.000000,1.000000);
			v(-1.000000,1.000000,6.000000);
			v(-1.000000,-1.000000,6.000000);
			v(0.999999,-0.000000,6.000000);
			v(-1.000000,1.000000,2.000000);
			v(-1.000000,-1.000000,2.000000);
			v(1.000000,-0.000000,2.000000);

			f(0,1,2,0.527536,0.972881,0.527435,0.709162,0.738451,0.814568,0.000000,-0.000000,-1.000000);
			f(3,5,4,0.738552,0.736281,0.949467,0.894594,0.738451,1.000000,-0.000000,0.000000,1.000000);
			f4(0,3,4,1,0.265165,0.473286,0.501042,0.472562,0.501851,0.736280,0.265974,0.737003,0.447213,-0.894427,0.000000);
			f4(1,4,5,2,0.501851,0.708438,0.502574,0.472562,0.738451,0.473286,0.737727,0.709162,-1.000000,0.000000,-0.000000);
			f4(3,0,2,5,0.235876,0.737003,0.000000,0.736280,0.000809,0.472562,0.236686,0.473286,0.447214,0.894427,0.000000);
			f4(8,11,9,6,0.265165,0.000809,0.263718,0.472562,0.000000,0.471753,0.001447,0.000000,0.447214,0.894427,0.000000);
			f4(10,7,6,9,0.530330,0.471753,0.531778,0.000000,0.767654,0.000724,0.766207,0.472476,-1.000000,0.000000,-0.000000);
			f4(11,8,7,10,0.528883,0.000000,0.530330,0.471753,0.266612,0.472562,0.265165,0.000809,0.447213,-0.894427,0.000000);
			f(8,6,7,0.767755,0.208757,0.978670,0.367070,0.767654,0.472476,-0.000000,0.000000,1.000000);
			f(11,10,9,0.738552,0.736281,0.738451,0.472562,0.949467,0.577968,0.000000,-0.000000,-1.000000);

			this.x = 0.000000;
			this.y = 0.000000;
			this.z = 0.000000;

			this.rotateX = 0.000000;
			this.rotateY = 0.000000;
			this.rotateZ = 0.000000;

			this.scaleX = 1.000000;
			this.scaleY = 1.000000;
			this.scaleZ = 1.000000;
			return (l);
		}
		
		public function testpoint(rotate:Number):void {
			
			for (var a:int = 6; a < 11+1; a++ ) {
				var matrix:Matrix4 = new Matrix4();
				matrix.axisRotationWithReference(new Point3D(0, 1, 0), new Point3D(0, 0, 10),rotate);
				//var point:Point3D = new Point3D(geometry.aVertex[a].x,geometry.aVertex[a].y,geometry.aVertex[a].z);
				var point:Point3D = new Point3D(vertexframe[a].x,vertexframe[a].y,vertexframe[a].z);
				
				point = Matrix4Math.transform(matrix, point);
				geometry.aVertex[a].x = point.x;
				geometry.aVertex[a].y = point.y;
				geometry.aVertex[a].z = point.z;
			}
			changed = true;
		}
		
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
			/*
			 Need to create a simple format.
			 Clone vertex
			 
			 parent bone effect all point of the child
			 */
			if (bones['name']) {
				//this will render the point base on bone rotation and position for looking for correct angle.
				var vertexf:Array = new Array();
				for (var vc:int = 0; vc < vertexframe.length;vc++ ) {
					vertexf.push(new Point3D(vertexframe[vc].x,vertexframe[vc].y,vertexframe[vc].z));
				}
				
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
				
				//need to work on parent point effect on child
				//move the bone assign vertex point
				//vertexf got to caluate matrix code
				for (var bonep:int = 0; bonep < bone.length; bonep++ ) {
					var pivotpoint:Point3D = new Point3D(bone[bonep].x,bone[bonep].y,bone[bonep].z);
					for (var weightno:int = 0; weightno < weight.length ; weightno++ ) {
						if (bone[bonep].parent == weight[weightno].boneid) {
							var vp:Array = new Array();//vertex id
							//trace('found....update point...');
							var matrix:Matrix4 = new Matrix4();
							var point:Point3D = new Point3D(vertexf[weightno].x, vertexf[weightno].y, vertexf[weightno].z);
							
							matrix.axisRotationWithReference(new Point3D(1, 0, 0), pivotpoint, bone[bonep].rotx*weight[weightno].weight);
							trace(bone[bonep].x);
							point = Matrix4Math.transform(matrix, point);
							matrix.axisRotationWithReference(new Point3D(0, 1, 0),pivotpoint, bone[bonep].roty*weight[weightno].weight);
							point = Matrix4Math.transform(matrix, point);
							matrix.axisRotationWithReference(new Point3D(0, 0, 1),pivotpoint, bone[bonep].rotz*weight[weightno].weight);
							point = Matrix4Math.transform(matrix, point);
							vertexf[weight[weightno].vertexid].x = point.x;
							vertexf[weight[weightno].vertexid].y = point.y;
							vertexf[weight[weightno].vertexid].z = point.z;
							
							
						}
					}
				}
				
				//place point from different parent and child rotation
				//this will apply all the vertex points
				for (var vertexset:int = 0;vertexset < vertexf.length;vertexset++ ) {
					geometry.aVertex[vertexset].x = vertexf[vertexset].x;
					geometry.aVertex[vertexset].y = vertexf[vertexset].y;
					geometry.aVertex[vertexset].z = vertexf[vertexset].z;
				}
				
				changed = true;
				
				//set vertex from all bone code
			}
			
			function parentbranch(parent:Array,parentname:String):void {
				//parent
				//vp.push(vextexid)
				//check id if match add or skip
				//check bone if branch off else return face id vertex
				
				
				
			}
			
			
		}
		
		
		
		//This for rebuild bone branch when the export from 3d model program that has to translate back
		private function bonebranch():void {
			//set up parent bone to branch off
			for (var bp:int = 0; bp < bone.length; bp++ ) {
				parentbone.push( { parent:bone[bp].parent, child:Array} );
			}
			
			for (var bc:int = 0; bc < parentbone.length; bc++ ) {
				//parentbone.push(bone[bc].parent);
				//parent build in order is a must
				trace(parentbone[bc].parent);
				parentbone[bc].child = new Array();
				for (var bpc:int = 0; bpc < bone.length; bpc++) {
					//if parent have child add them
					if (parentbone[bc].parent == bone[bpc].child) {
						parentbone[bc].child.push(bone[bpc].parent);
					}
				}
				trace('Parent:'+parentbone[bc].parent+' Number childs:'+parentbone[bc].child.length);
			}
		}
		
		//bone
		//name,parent, child, position, rotation,
		private function buildbone():void {
			bone.push( { parent:'bone1',  child:null, x:0, y:0, z:0, rotx:0, roty:0, rotz:0 } );
			bone.push( { parent:'bone2',  child:'bone1', x:0, y:5, z:0, rotx:0, roty:0, rotz:0 } );
			//bone.push( { parent:'bone3',  child:'bone1', x:0, y:5, z:0, rotx:0, roty:0, rotz:0 } );
			//bone.push( { parent:'bone4',  child:'bone1', x:0, y:5, z:0, rotx:0, roty:0, rotz:0 } );
		}
		//weight
		//aVertex id, weight, bone id
		private function buildweight():void {
			//base
			weight.push( { vertexid:0, weight:1, boneid:'bone1' } );
			weight.push( { vertexid:1, weight:1, boneid:'bone1' } );
			weight.push( { vertexid:2, weight:1, boneid:'bone1' } );
			weight.push( { vertexid:3, weight:1, boneid:'bone1' } );
			weight.push( { vertexid:4, weight:1, boneid:'bone1' } );
			weight.push( { vertexid:5, weight:1, boneid:'bone1' } );
			//top base
			weight.push( { vertexid:6, weight:1, boneid:'bone2' } );
			weight.push( { vertexid:7, weight:1, boneid:'bone2' } );
			weight.push( { vertexid:8, weight:1, boneid:'bone2' } );
			weight.push( { vertexid:9, weight:1, boneid:'bone2' } );
			weight.push( { vertexid:10, weight:1, boneid:'bone2' } );
			weight.push( { vertexid:11, weight:1, boneid:'bone2' } );
		}
		//list bone and other settings
		public function bonelist():Array {
			return bone;
		}
		//return rotate of x,y,z
		public function bonerotation(namebone:String):Point3D {
			var brotate:Point3D = new Point3D();
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
		
	}
}