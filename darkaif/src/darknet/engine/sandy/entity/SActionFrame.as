package darknet.engine.sandy.entity 
{
	import darknet.core.animation.ActionFrame;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class SActionFrame extends ActionFrame
	{
		
		public function SActionFrame() 
		{
			
		}
		
		public function savexmldata():XML {
			//object holder
			var actionxml:XML = <action/>;
			//object name
			var actionframename:XML = < name/>;
			actionframename.appendChild(framename);
			trace(framename);
			actionxml.appendChild(actionframename);
			//object min frame
			var framemin:XML = <framemin/>;
			framemin.appendChild(min);
			actionxml.appendChild(framemin);
			//object max
			var framemax:XML = <framemax/>;
			framemax.appendChild(max);
			actionxml.appendChild(framemax);
			//object speed
			var actionspeed:XML = <speed/>;
			actionspeed.appendChild(speed);
			actionxml.appendChild(actionspeed);
			//object  attackstart
			var actionattackstart:XML = <attackstart/>;
			actionattackstart.appendChild(attackstart);
			actionxml.appendChild(actionattackstart);
			//object attackend
			var actionattackend:XML = <attackend/>;
			actionattackend.appendChild(attackend);
			actionxml.appendChild(actionattackend);
			return actionxml;
		}
		
		public function readxmldata(xmlobject:XML):void {
			/*
			<action>
			<name>asdsad</name>
			<framemin>0</framemin>
			<framemax>2</framemax>
			<speed>0</speed>
			<attackstart>-1</attackstart>
			<attackend>-1</attackend>
			</action>
			*/
			
			framename = xmlobject.name;
			min = xmlobject.framemin;
			max = xmlobject.framemax;
			speed = xmlobject.speed;
			attackstart = xmlobject.attackstart;
			attackend = xmlobject.attackend;
		}
	}
	
}