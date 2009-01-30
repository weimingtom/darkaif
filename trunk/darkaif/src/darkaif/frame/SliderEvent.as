﻿package darkaif.frame 
{
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	*/
    import flash.events.Event;

    public class SliderEvent extends Event{
        // events
        public static const CHANGE:String = "change";
       
        protected var percentage:Number;
        /**
         * Read-Only
         */
        public function get percent():Number{
            return percentage;
        }
       
        /**
         * Constructor
         */
        public function SliderEvent( type:String, percent:Number ){
            super( type );
            percentage = percent;
        }
    }
	
}