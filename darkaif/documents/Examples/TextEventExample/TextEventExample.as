/**
* ...
* @author Darknet
* Copy Rights (c) http://darkaif.googlecode.com
*/
package {
    import flash.display.Sprite;
    import flash.text.TextField;
    import flash.text.TextFieldType;
    import flash.text.TextFieldAutoSize;
    import flash.events.TextEvent;
    import flash.events.TextEvent;
    import flash.net.URLRequest;
    import flash.net.navigateToURL;
    
    public class TextEventExample extends Sprite {
        private const DOMAIN_1_URL:String = "http://www.[yourDomain].com";
        private const DOMAIN_2_URL:String = "http://www.[yourDomain].com";
        private var linkTxt:TextField;
        private var textInputTxt:TextField;
        
        public function TextEventExample() {
            init();
            draw();
        }
        
        private function init():void {
            linkTxt = new TextField();
            linkTxt.addEventListener(TextEvent.LINK, linkHandler);
            linkTxt.height = 60;
            linkTxt.autoSize = TextFieldAutoSize.LEFT;            
            linkTxt.multiline = true;
                
            textInputTxt = new TextField();
            textInputTxt.addEventListener(TextEvent.TEXT_INPUT, textInputHandler);
            textInputTxt.type = TextFieldType.INPUT;
            textInputTxt.background = true;
            textInputTxt.border = true;
            textInputTxt.height = 20;            
        }
        
        private function draw():void {
            addChild(linkTxt);
            linkTxt.htmlText += createLink(DOMAIN_1_URL, "Click to go to first domain");
            linkTxt.htmlText += "<br />";
            linkTxt.htmlText += createLink(DOMAIN_2_URL, "Click to go to second domain");

            addChild(textInputTxt);
            textInputTxt.y = linkTxt.height;
            textInputTxt.text = "type here";
        }
        
        private function createLink(url:String, text:String):String {
            var link:String = "";
            link += "<font color='#0000FF'>";
            link += "<u>";
            link += "<b>";
            link += "<a href='event:" + url + "'>" + text + "</a>";
            link += "</b>";
            link += "</u>";
            link += "</font>";
            return link;
        }
        
        private function linkHandler(e:TextEvent):void {
            var request:URLRequest = new URLRequest(e.text);
            navigateToURL(request);
        }
        
        private function textInputHandler(e:TextEvent):void {
            trace(">> ============================");
            trace(">> e.text: " + e.text);
            trace(">> textInputTxt.text: " + textInputTxt.text);
        }
    }
}