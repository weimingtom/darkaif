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

// Code in LocalConnectionSenderExample.as
package {
    import flash.display.Sprite;
    import flash.events.MouseEvent;
    import flash.net.LocalConnection;
    import flash.text.TextField;
    import flash.text.TextFieldType;
    import flash.events.StatusEvent;
    import flash.text.TextFieldAutoSize;
	import org.flashdevelop.utils.FlashConnect;

    public class LocalConnectionSenderExample extends Sprite {
        private var conn:LocalConnection;
        
        // UI elements
        private var messageLabel:TextField;
        private var message:TextField;
        private var sendBtn:Sprite;
		
        
        public function LocalConnectionSenderExample() {
            buildUI();
            sendBtn.addEventListener(MouseEvent.CLICK, sendMessage);
            conn = new LocalConnection();
            conn.addEventListener(StatusEvent.STATUS, onStatus);
        }
        
        private function sendMessage(event:MouseEvent):void {
            conn.send("myConnection", "lcHandler", message.text);
        }
        
        private function onStatus(event:StatusEvent):void {
            switch (event.level) {
                case "status":
                    FlashConnect.trace("LocalConnection.send() succeeded");
                    break;
                case "error":
                    FlashConnect.trace("LocalConnection.send() failed");
                    break;
            }
        }
        
        private function buildUI():void {
            const hPadding:uint = 5;
            // messageLabel
            messageLabel = new TextField();
            messageLabel.x = 10;
            messageLabel.y = 10;
            messageLabel.text = "Text to send:";
            messageLabel.autoSize = TextFieldAutoSize.LEFT;
            addChild(messageLabel);
            
            // message
            message = new TextField();
            message.x = messageLabel.x + messageLabel.width + hPadding;
            message.y = 10;
            message.width = 120;
            message.height = 20;
            message.background = true;
            message.border = true;
            message.type = TextFieldType.INPUT;
            addChild(message);
            
            // sendBtn
            sendBtn = new Sprite();
            sendBtn.x = message.x + message.width + hPadding;
            sendBtn.y = 10;
            var sendLbl:TextField = new TextField();
            sendLbl.x = 1 + hPadding;
            sendLbl.y = 1;
            sendLbl.selectable = false;
            sendLbl.autoSize = TextFieldAutoSize.LEFT;
            sendLbl.text = "Send";
            sendBtn.addChild(sendLbl);
            sendBtn.graphics.lineStyle(1);
            sendBtn.graphics.beginFill(0xcccccc);
            sendBtn.graphics.drawRoundRect(0, 0, (sendLbl.width + 2 + hPadding + hPadding), (sendLbl.height + 2), 5, 5);
            sendBtn.graphics.endFill();
            addChild(sendBtn);
        }
    }
}