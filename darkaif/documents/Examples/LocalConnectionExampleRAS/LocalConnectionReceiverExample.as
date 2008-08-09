/**
* ...
* @author Default
* @version 0.1
* it works
* http://livedocs.adobe.com/flex/2/langref/flash/net/LocalConnection.html
*/

/** 
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/

// Code in LocalConnectionReceiverExample.as
package {
    import flash.display.Sprite;
    import flash.net.LocalConnection;
    import flash.text.TextField;
	import org.flashdevelop.utils.FlashConnect;

    public class LocalConnectionReceiverExample extends Sprite {
        private var conn:LocalConnection;
        private var output:TextField;
        
        public function LocalConnectionReceiverExample()     {
            buildUI();
            
            conn = new LocalConnection();
            conn.client = this;
            try {
                conn.connect("myConnection");
            } catch (error:ArgumentError) {
                FlashConnect.trace("Can't connect...the connection name is already being used by another SWF");
            }
        }
        
        public function lcHandler(msg:String):void {
            output.appendText(msg + "\n");
        }
        
        private function buildUI():void {
            output = new TextField();
            output.background = true;
            output.border = true;
            output.wordWrap = true;
            addChild(output);
        }
    }
}