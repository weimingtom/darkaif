package darkaif.frame 
{
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	*/
    import flash.display.Sprite;
    import flash.events.MouseEvent;
    import flash.geom.Rectangle;

    /**
     * Represents the base functionality for Sliders.
     *
     * Broadcasts 1 event:
     * -SliderEvent.CHANGE
     */
    public class Slider extends Sprite
    {
        // elements
		public var b_height:int = 100;//Control the height background
		public var b_width:int = 10;
		public var f_height:int = 15;//handle bar
		public var f_width:int = 10;
        protected var track:Sprite;
        protected var marker:Sprite;
       
        // percentage
        protected var percentage:Number = 0;
        /**
         * The percent is represented as a value between 0 and 1.
         */
        public function get percent():Number { return percentage; }
        /**
         * The percent is represented as a value between 0 and 1.
         */
        public function set percent( p:Number ):void {
            percentage = Math.min( 1, Math.max( 0, p ) );
            marker.y = percentage * (track.height - marker.height);
            dispatchEvent( new SliderEvent( SliderEvent.CHANGE, percentage ) );
        }
       
        /**
         * Constructor
         */
        public function Slider(){
            createElements();
        }
       
        // ends the sliding session
        protected function stopSliding( e:MouseEvent ):void{
            marker.stopDrag();
            stage.removeEventListener( MouseEvent.MOUSE_MOVE, updatePercent );
            stage.removeEventListener( MouseEvent.MOUSE_UP, stopSliding );
        }
		
        // updates the data to reflect the visuals
        protected function updatePercent( e:MouseEvent ):void{
            e.updateAfterEvent();
            percentage = marker.y / (track.height - marker.height);
            dispatchEvent( new SliderEvent( SliderEvent.CHANGE, percentage ) );
        }
		
        //  Executed when the marker is pressed by the user.
        protected function markerPress( e:MouseEvent ):void {
            marker.startDrag( false, new Rectangle( 0, 0, 0, track.height - marker.height ) );
            stage.addEventListener( MouseEvent.MOUSE_MOVE, updatePercent );
            stage.addEventListener( MouseEvent.MOUSE_UP, stopSliding );
        }
       
        /**
         * Creates and initializes the marker/track elements.
         */
        protected function createElements():void{
            track = new Sprite();
            marker = new Sprite();
			//background color
            track.graphics.beginFill( 0xCCCCCC, 1 );
            track.graphics.drawRect(0, 0, b_width, b_height);
            track.graphics.endFill();
			//foreground color
            marker.graphics.beginFill( 0x333333, 1 );
            marker.graphics.drawRect(0, 0, f_width, f_height);
            marker.graphics.endFill();
           
            marker.addEventListener( MouseEvent.MOUSE_DOWN, markerPress );
           
            addChild( track );
            addChild( marker );
        }
		
		public function set B_height(set_height:int):void {
			this.b_height = set_height;
			//clear the grahpic up and redraw image to update the new variable
			removeChild(track); //this is from createElements()
            removeChild(marker); //this is from createElements()
			createElements();
		}
    }
	
}